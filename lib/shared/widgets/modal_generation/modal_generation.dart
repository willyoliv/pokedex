import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:provider/provider.dart';

class ModalGeneration extends StatefulWidget {
  const ModalGeneration({Key? key}) : super(key: key);

  @override
  State<ModalGeneration> createState() => _ModalGenerationState();
}

class _ModalGenerationState extends State<ModalGeneration> {
  List<String> _choices = [];
  final _pokemonsImages = [
    [
      "assets/generations/generation1/001.png",
      "assets/generations/generation1/004.png",
      "assets/generations/generation1/007.png"
    ],
    [
      "assets/generations/generation2/152.png",
      "assets/generations/generation2/155.png",
      "assets/generations/generation2/158.png"
    ],
    [
      "assets/generations/generation3/252.png",
      "assets/generations/generation3/255.png",
      "assets/generations/generation3/258.png"
    ],
    [
      "assets/generations/generation4/387.png",
      "assets/generations/generation4/390.png",
      "assets/generations/generation4/393.png"
    ],
    [
      "assets/generations/generation5/495.png",
      "assets/generations/generation5/498.png",
      "assets/generations/generation5/501.png"
    ],
    [
      "assets/generations/generation6/650.png",
      "assets/generations/generation6/653.png",
      "assets/generations/generation6/656.png"
    ],
    [
      "assets/generations/generation7/722.png",
      "assets/generations/generation7/725.png",
      "assets/generations/generation7/728.png"
    ],
    [
      "assets/generations/generation8/810.png",
      "assets/generations/generation8/813.png",
      "assets/generations/generation8/816.png"
    ]
  ];
  late int _choiceIndex;
  var _provider;

  @override
  void initState() {
    super.initState();
    _choices = [
      "Generation I",
      "Generation II",
      "Generation III",
      "Generation IV",
      "Generation V",
      "Generation VI",
      "Generation VII",
      "Generation VIII"
    ];
    _provider = Provider.of<ProviderPokemons>(context, listen: false);
    _choiceIndex = _provider.getCurrentGenerationIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.8,
          minChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.only(top: 30, left: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return false;
                },
                child: ListView(
                  controller: scrollController,
                  children: [
                    Text(
                      "Generations",
                      style: TextStyles.titleModal,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 40),
                      child: Text(
                        "Use search for generations to explore your Pokémon!",
                        style: TextStyles.text,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 40, bottom: 50),
                      height: 570,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          mainAxisExtent: 129,
                        ),
                        itemCount: _choices.length,
                        itemBuilder: (context, index) {
                          return ChoiceChip(
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            label: SizedBox(
                              width: 160,
                              height: 129,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: 10,
                                    left: 15,
                                    child: ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(
                                          colors: [
                                            AppColors.grey.withOpacity(0.0),
                                            AppColors.white.withOpacity(0.4),
                                          ],
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                        ).createShader(bounds);
                                      },
                                      child: SvgPicture.asset(
                                        "assets/patterns/6x3.svg",
                                        width: 80,
                                        height: 35,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(_pokemonsImages[index][0],
                                            height: 40, width: 40),
                                        Image.asset(_pokemonsImages[index][1],
                                            height: 40, width: 40),
                                        Image.asset(_pokemonsImages[index][2],
                                            height: 40, width: 40),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 70,
                                    left: 55,
                                    child: ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(
                                                colors: [
                                              Colors.white.withOpacity(0.1),
                                              Colors.white.withOpacity(0),
                                            ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                transform:
                                                    const GradientRotation(
                                                        2.35619))
                                            .createShader(bounds);
                                      },
                                      child: Image.asset(
                                        'assets/patterns/pokeball.png',
                                        width: 110,
                                        height: 110,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 19,
                                    child: Text(_choices[index]),
                                  ),
                                ],
                              ),
                            ),
                            selected: _choiceIndex == index,
                            selectedColor: AppColors.badges['psychic'],
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  _choiceIndex = index;
                                  _provider.applyGenerationFilter(_choiceIndex);
                                } else {
                                  _choiceIndex = -1;
                                  _provider.applyGenerationFilter(_choiceIndex);
                                }
                                // Navigator.of(context).pop();
                              });
                            },
                            backgroundColor: AppColors.backgroundDefaultInput,
                            labelPadding: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(0),
                            labelStyle: _choiceIndex == index
                                ? TextStyles.applyButton
                                : TextStyles.text,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
