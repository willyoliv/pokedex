import 'package:flutter/material.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/icons/app_icons.dart';
import 'package:pokedex/shared/theme/icons/app_icons_weight.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/widgets/icon_button_type/icon_button_type.dart';
import 'package:provider/provider.dart';

class ModalFilter extends StatefulWidget {
  const ModalFilter({Key? key}) : super(key: key);

  @override
  State<ModalFilter> createState() => _ModalFilterState();
}

class _ModalFilterState extends State<ModalFilter>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late RangeValues _currentRangeValues;
  var _currentRangeValueMin;
  var _currentRangeValueMax;
  late double _quantityOfPokemons;
  var _filterByType;
  var _filterByWeaknesses;
  var _filterByHeights;
  var _filterByWeights;
  var _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<ProviderPokemons>(context, listen: false);
    _filterByType = Map<String, bool>.from(_provider.getFilterType);
    _filterByWeaknesses = Map<String, bool>.from(_provider.getFilterWeaknesses);
    _filterByHeights = Map<String, bool>.from(_provider.getFilterHeights);
    _filterByWeights = Map<String, bool>.from(_provider.getFilterWeights);
    _quantityOfPokemons = _provider.getSyzeFullListOfPokemons.toDouble();
    _currentRangeValueMin = _provider.getCurrentRangeValueMin;
    _currentRangeValueMax = _provider.getCurrentRangeValueMax;
    _currentRangeValues =
        RangeValues(_currentRangeValueMin, _currentRangeValueMax);
  }

  void toggleType(String type, bool value) {
    _filterByType[type] = value;
  }

  void toggleWeaknesses(String type, bool value) {
    _filterByWeaknesses[type] = value;
  }

  void toggleHeights(String height, bool value) {
    _filterByHeights[height] = value;
  }

  void toggleWeights(String weight, bool value) {
    _filterByWeights[weight] = value;
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
          maxChildSize: 0.9,
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
                      "Filters",
                      style: TextStyles.titleModal,
                    ),
                    Text(
                      "Use advanced search to explore Pokémon by type, weakness, height and more!",
                      style: TextStyles.text,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Types",
                      style: TextStyles.subtitles,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: AppColors.badges.length,
                        itemBuilder: (context, index) {
                          String type = AppColors.badges.keys.elementAt(index);
                          return IconButtonType(
                            keyFilter: type,
                            urlImage: AppIcons.appIcons[type]!,
                            color: AppColors.badges[type]!,
                            shadow: AppColors.shadows[type]!,
                            togglePressed: toggleType,
                            pressed: _filterByType[type],
                          );
                        },
                      ),
                    ),
                    Text(
                      "Weaknesses",
                      style: TextStyles.subtitles,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: AppColors.badges.length,
                        itemBuilder: (context, index) {
                          String type = AppColors.badges.keys.elementAt(index);
                          return IconButtonType(
                            keyFilter: type,
                            urlImage: AppIcons.appIcons[type]!,
                            color: AppColors.badges[type]!,
                            shadow: AppColors.shadows[type]!,
                            togglePressed: toggleWeaknesses,
                            pressed: _filterByWeaknesses[type],
                          );
                        },
                      ),
                    ),
                    Text(
                      "Heights",
                      style: TextStyles.subtitles,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: AppColors.height.length,
                        itemBuilder: (context, index) {
                          String height =
                              AppColors.height.keys.elementAt(index);
                          return IconButtonType(
                            keyFilter: height,
                            urlImage: AppIcons.appIcons[height]!,
                            color: AppColors.height[height]!,
                            shadow: AppColors.shadowHeight[height]!,
                            togglePressed: toggleHeights,
                            pressed: _filterByHeights[height],
                          );
                        },
                      ),
                    ),
                    Text(
                      "Weights",
                      style: TextStyles.subtitles,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: AppColors.weight.length,
                        itemBuilder: (context, index) {
                          String weight =
                              AppColors.weight.keys.elementAt(index);
                          return IconButtonType(
                            keyFilter: weight,
                            urlImage: AppIconsWeight.appIconsWeight[weight]!,
                            color: AppColors.weight[weight]!,
                            shadow: AppColors.shadowWeight[weight]!,
                            togglePressed: toggleWeights,
                            pressed: _filterByWeights[weight],
                          );
                        },
                      ),
                    ),
                    Text(
                      "Number Range",
                      style: TextStyles.subtitles,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15) +
                          const EdgeInsets.only(right: 20),
                      child: RangeSlider(
                        values: _currentRangeValues,
                        max: _quantityOfPokemons,
                        min: 1,
                        divisions: _provider.getSyzeFullListOfPokemons,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 50) +
                          const EdgeInsets.only(right: 40),
                      child: Row(children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              "Reset",
                              style: TextStyles.text,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.backgroundDefaultInput,
                              elevation: 0,
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 21,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              _provider.resetFilter();
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              "Apply",
                              style: TextStyles.applyButton,
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 21,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              _currentRangeValueMin =
                                  _currentRangeValues.start.round();
                              _currentRangeValueMax =
                                  _currentRangeValues.end.round();
                              _provider.applyFilter(
                                _filterByType,
                                _filterByWeaknesses,
                                _filterByHeights,
                                _filterByWeights,
                                _currentRangeValueMin,
                                _currentRangeValueMax,
                              );

                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ]),
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
