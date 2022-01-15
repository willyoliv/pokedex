import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/utils/enum_states.dart';
import 'package:pokedex/shared/widgets/modal_filter/modal_filter.dart';
import 'package:pokedex/shared/widgets/modal_generation/modal_generation.dart';
import 'package:pokedex/shared/widgets/modal_sort/modal_sort.dart';
import 'package:pokedex/shared/widgets/pokemon_card/pokemon_card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _providerPokemons;
  final _textInputFocus = FocusNode();
  final _textInputController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _providerPokemons = Provider.of<ProviderPokemons>(context, listen: false);
    _providerPokemons.start();
  }

  Widget _getWidgetByState(States state) {
    switch (state) {
      case States.start:
        return Container();
      case States.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case States.error:
        return const Center(
          child: Text('Could not load data at this time!'),
        );
      case States.success:
        return _providerPokemons.pokemons.isNotEmpty
            ? ShaderMask(
                shaderCallback: (Rect rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.white,
                      Colors.transparent,
                    ],
                    stops: [
                      0.0,
                      0.02,
                    ],
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstOut,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: _providerPokemons.pokemons.length,
                  itemBuilder: (context, index) {
                    return PokemonCard(
                        pokemon: _providerPokemons.pokemons[index]);
                  },
                ),
              )
            : Container(
                child: Text(
                  "No Pokemon Found!",
                  style: TextStyles.text,
                ),
              );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    _providerPokemons = Provider.of<ProviderPokemons>(context, listen: true);
    States state = _providerPokemons.getState;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 207,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: -200,
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              AppColors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.9481),
                            ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          'assets/patterns/pokeball.svg',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(right: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return const ModalGeneration();
                                  },
                                );
                              },
                              icon: SvgPicture.asset(
                                  'assets/icons/generation.svg'),
                              splashRadius: 22,
                              iconSize: 20,
                            ),
                            IconButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return const ModalSort();
                                  },
                                );
                              },
                              icon: SvgPicture.asset('assets/icons/sort.svg'),
                              splashRadius: 22,
                            ),
                            IconButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return const ModalFilter();
                                  },
                                );
                              },
                              icon: SvgPicture.asset('assets/icons/filter.svg'),
                              splashRadius: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 95,
                      left: 40,
                      child: SizedBox(
                        height: 40.0,
                        child: Text(
                          "Pokédex",
                          style: TextStyles.title,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 40,
                      child: SizedBox(
                        height: 40.0,
                        child: Text(
                          'Search for Pokémon by name or using the\nNational Pokédex number.',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  left: 40,
                  right: 40,
                ),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _textInputFocus.hasFocus
                      ? AppColors.backgroundPressedInput
                      : AppColors.backgroundDefaultInput,
                ),
                child: TextFormField(
                  style: TextStyles.text,
                  cursorColor: AppColors.textGrey,
                  controller: _textInputController,
                  focusNode: _textInputFocus,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.textGrey,
                      size: 20,
                    ),
                    suffixIcon: _textInputController.text.isNotEmpty
                        ? Material(
                            color: _textInputFocus.hasFocus
                                ? AppColors.backgroundPressedInput
                                : AppColors.backgroundDefaultInput,
                            child: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: AppColors.textGrey,
                                  size: 20,
                                ),
                                onPressed: () {
                                  _textInputController.text = "";
                                  _textInputFocus.unfocus();
                                  _providerPokemons.resetSearchByName();
                                },
                                splashRadius: 18),
                          )
                        : null,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(bottom: 21, top: 20),
                    hintText: "What Pokémon are you looking for?",
                  ),
                  onChanged: (value) {
                    _providerPokemons.searchByName(value);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: _getWidgetByState(state),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
