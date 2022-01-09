import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/egg_groups.dart';
import 'package:pokedex/models/flavor_text_entreis.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/stats.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/widgets/item_data_pokedex/item_data_pokedex.dart';

class PokemonAboutDetails extends StatelessWidget {
  final Pokemon pokemon;
  final bool enableScroll;
  final ScrollController controller;

  const PokemonAboutDetails({
    Key? key,
    required this.pokemon,
    required this.enableScroll,
    required this.controller,
  }) : super(key: key);

  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  String capitalizeWords(String ability) {
    var textAux = ability.split("-");
    String textResult = capitalize(textAux[0]);
    if (textAux.length > 1) {
      textResult += " " + capitalize(textAux[1]);
    }
    return textResult;
  }

  String evYield(List<Stats> listStats) {
    int betterStat = listStats[0].baseStat;
    String nameStat = listStats[0].stat.name;
    for (int i = 1; i < listStats.length; i++) {
      if (listStats[i].baseStat > betterStat) {
        betterStat = listStats[i].baseStat;
        nameStat = listStats[i].stat.name;
      }
    }
    return capitalizeWords(nameStat);
  }

  String eggGroups(List<EggGroups> eggGroups) {
    String eggGroup = "";

    if (eggGroups.isNotEmpty) {
      eggGroup += capitalize(eggGroups[0].name);
    }

    if (eggGroups.length > 1) {
      eggGroup += "," + capitalize(eggGroups[1].name);
    }

    return eggGroup;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      physics: !enableScroll ? const NeverScrollableScrollPhysics() : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pokemon.details.flavorTextEntries[8].language.name == "en"
                ? pokemon.details.flavorTextEntries[8].flavorText
                : getFlavorText(pokemon.details.flavorTextEntries),
            style: TextStyles.text,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Pokédex Data',
            style: TextStyle(
              color: AppColors.badges[pokemon.types[0].type.name],
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          ItemDataPokedex(
            label: "Species",
            information: pokemon.details.genera[7].genus,
          ),
          ItemDataPokedex(
            label: "Height",
            information: "${pokemon.height / 10}m",
          ),
          ItemDataPokedex(
            label: "Weight",
            information: "${pokemon.weight / 10}kg",
          ),
          ItemDataPokedex(
            label: "Abilities",
            abilities: pokemon.abilities,
          ),
          ItemDataPokedex(
            label: "Weakness",
            weakness: pokemon.details.damageRelations[0].doubleDamageFrom,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Training',
            style: TextStyle(
              color: AppColors.badges[pokemon.types[0].type.name],
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          ItemDataPokedex(
            label: "EV Yield",
            information: "1 " + evYield(pokemon.stats),
          ),
          ItemDataPokedex(
            label: "Catch Rate",
            information: "${pokemon.details.captureRate}",
            additionalInformation: "(5.9% with PokéBall, full HP)",
          ),
          ItemDataPokedex(
            label: "Base Friendship",
            information: "${pokemon.details.baseHappiness}",
          ),
          ItemDataPokedex(
            label: "Base Exp",
            information: "${pokemon.baseExperience}",
          ),
          ItemDataPokedex(
            label: "Growth Rate",
            information: capitalizeWords(pokemon.details.growthRate.name),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Breeding',
            style: TextStyle(
              color: AppColors.badges[pokemon.types[0].type.name],
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const ItemDataPokedex(
            label: "Gender",
            genderText: "teste",
          ),
          ItemDataPokedex(
            label: "Egg Grounps",
            information: eggGroups(pokemon.details.eggGroups),
          ),
          const ItemDataPokedex(
            label: "Egg Cycles",
            information: "??",
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  String getFlavorText(List<FlavorTextEntries> flavorTextEntries) {
    for (var item in flavorTextEntries) {
      if (item.language.name == "en") {
        return item.flavorText;
      }
    }
    return "";
  }
}
