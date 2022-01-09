import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/icons/app_icons.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/widgets/badge_details/badge_details.dart';
import 'package:pokedex/shared/widgets/item_stats/item_stats.dart';

class PokemonStatsDetails extends StatelessWidget {
  final Pokemon pokemon;
  final bool enableScroll;
  final ScrollController controller;

  const PokemonStatsDetails({
    Key? key,
    required this.pokemon,
    required this.enableScroll,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map mapTypesPokemon = pokemon.details.getTypesDefenses();
    return SingleChildScrollView(
      controller: controller,
      physics: !enableScroll ? const NeverScrollableScrollPhysics() : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Base Stats',
            style: TextStyle(
              color: AppColors.badges[pokemon.types[0].type.name],
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 204,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pokemon.stats.length,
                itemBuilder: (context, index) {
                  return ItemStats(
                    stats: pokemon.stats[index],
                    color: AppColors.badges[pokemon.types[0].type.name]!,
                  );
                }),
          ),
          Container(
            height: 19,
            width: 334,
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Container(
                  height: 14,
                  width: 44,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    "Total",
                    style: TextStyles.labelDetails,
                  ),
                ),
                Container(
                  height: 19,
                  width: 33,
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 10),
                  child: Text("${pokemon.getSumBaseStat()}",
                      style: TextStyles.totalStats),
                ),
                Container(
                  height: 4,
                  width: 129,
                  margin: const EdgeInsets.only(left: 4, right: 14),
                ),
                Container(
                  height: 19,
                  width: 29,
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    "Min",
                    style: TextStyles.labelDetails,
                  ),
                ),
                Container(
                  height: 19,
                  width: 29,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Max",
                    style: TextStyles.labelDetails,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'The ranges shown on the right are for a level 100 Pokémon.'
              'Maximum values are based on a beneficial nature, 252 EVs, 31 IVs;'
              'minimum values are based on a hindering nature, 0 EVs, 0 IVs.',
              style: TextStyles.additionalText,
            ),
          ),
          Text(
            'Types Defenses',
            style: TextStyle(
              color: AppColors.badges[pokemon.types[0].type.name],
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "The effectiveness of each type on ${pokemon.capitalize(pokemon.name)}.",
              style: TextStyles.text,
            ),
          ),
          Container(
            height: 128,
            margin: const EdgeInsets.only(bottom: 100),
            alignment: Alignment.centerLeft,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
                mainAxisSpacing: 20,
                mainAxisExtent: 54,
              ),
              itemCount: mapTypesPokemon.length,
              itemBuilder: (context, index) {
                String key = mapTypesPokemon.keys.elementAt(index);
                String value = mapTypesPokemon.values.elementAt(index);
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BadgeDetails(
                      urlIcon: AppIcons.appIcons[key]!,
                      color: AppColors.badges[key]!,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      child: Text(
                        value,
                        style: TextStyles.text,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
