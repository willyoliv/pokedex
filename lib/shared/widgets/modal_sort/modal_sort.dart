import 'package:flutter/material.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:provider/provider.dart';

class ModalSort extends StatefulWidget {
  const ModalSort({Key? key}) : super(key: key);

  @override
  _ModalSortState createState() => _ModalSortState();
}

class _ModalSortState extends State<ModalSort> {
  List<String> _choices = [];
  late int _choiceIndex;
  var _provider;

  @override
  void initState() {
    super.initState();
    _choices = ["Smallest number first", "Highest number first", "A-Z", "Z-A"];
    _provider = Provider.of<ProviderPokemons>(context, listen: false);
    _choiceIndex = _provider.getCurrentSortIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.65,
          minChildSize: 0.4,
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
                      "Sort",
                      style: TextStyles.titleModal,
                    ),
                    Text(
                      "Sort Pokémons alphabetically or by National Pokédex number!",
                      style: TextStyles.text,
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 40, bottom: 50),
                      height: 320,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _choices.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: _choiceIndex == index
                                  ? BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        // ignore: prefer_const_constructors
                                        BoxShadow(
                                          color: AppColors.shadow,
                                          offset: const Offset(0.0, 10.0),
                                          blurRadius: 7,
                                          spreadRadius: 0,
                                        )
                                      ],
                                    )
                                  : null,
                              child: ChoiceChip(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                label: Container(
                                  alignment: Alignment.center,
                                  width: 334,
                                  child: Text(_choices[index]),
                                ),
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 21),
                                selected: _choiceIndex == index,
                                selectedColor: AppColors.badges['psychic'],
                                onSelected: (bool selected) {
                                  setState(() {
                                    _choiceIndex = selected ? index : 0;
                                    _provider.applySort(_choiceIndex);
                                    Navigator.of(context).pop();
                                  });
                                },
                                backgroundColor:
                                    AppColors.backgroundDefaultInput,
                                labelStyle: _choiceIndex == index
                                    ? TextStyles.applyButton
                                    : TextStyles.text,
                              ),
                            );
                          }),
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
