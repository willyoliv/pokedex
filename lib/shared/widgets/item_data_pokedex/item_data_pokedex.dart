import 'package:flutter/material.dart';
import 'package:pokedex/models/abilities.dart';
import 'package:pokedex/models/double_damage_from.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/icons/app_icons.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/widgets/badge_details/badge_details.dart';
import 'package:provider/provider.dart';

class ItemDataPokedex extends StatelessWidget {
  final String label;
  final String? information;
  final String? additionalInformation;
  final List<Abilities>? abilities;
  final List<DoubleDamageFrom>? weakness;
  final String? genderText;
  const ItemDataPokedex({
    Key? key,
    required this.label,
    this.information,
    this.abilities,
    this.weakness,
    this.additionalInformation,
    this.genderText,
  }) : super(key: key);

  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  String capitalizeAbility(String ability) {
    var abilityAux = ability.split("-");
    String abilityResult = capitalize(abilityAux[0]);
    if (abilityAux.length > 1) {
      abilityResult += " " + capitalize(abilityAux[1]);
    }
    return abilityResult + " (hidden ability)";
  }

  @override
  Widget build(BuildContext context) {
    var _pokemon =
        Provider.of<ProviderPokemons>(context, listen: false).pokemon;
    bool hasTwoTypes = _pokemon.types.length > 1;
    List<String> types = [];
    if (weakness != null) {
      for (int i = 0; i < weakness!.length; i++) {
        if (hasTwoTypes) {
          if (weakness![i].name != _pokemon.types[1].type.name) {
            types.add(weakness![i].name);
          }
        } else {
          types.add(weakness![i].name);
        }
      }
    }
    return Container(
      height: abilities != null
          ? 38
          : weakness != null
              ? 25
              : 19,
      width: 334,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(
            width: 85,
            height: 14,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(right: 10),
            child: Text(
              label,
              style: TextStyles.labelDetails,
            ),
          ),
          if (information != null)
            Container(
              height: 19,
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(style: TextStyles.text, children: [
                  TextSpan(text: information!),
                  if (additionalInformation != null)
                    TextSpan(
                        text: " " + additionalInformation!,
                        style: TextStyles.additionalText)
                ]),
              ),
            ),
          if (genderText != null)
            Container(
              height: 19,
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: "♀ 87.5%",
                  style: TextStyles.genderMale,
                  children: [
                    TextSpan(
                      text: ", ",
                      style: TextStyles.text,
                    ),
                    TextSpan(
                      text: "♂ 12.5%",
                      style: TextStyles.genderFemale,
                    ),
                  ],
                ),
              ),
            ),
          if (abilities != null)
            Container(
              height: 38,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. " + capitalize(abilities![0].ability.name),
                    style: TextStyles.text,
                  ),
                  if (abilities!.length > 1)
                    Text(
                      capitalizeAbility(abilities![1].ability.name),
                      style: TextStyles.additionalText,
                    ),
                ],
              ),
            ),
          if (weakness != null)
            Container(
              height: 25,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 217,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: types.length,
                      itemBuilder: (context, index) {
                        return BadgeDetails(
                          urlIcon: AppIcons.appIcons[types[index]]!,
                          color: AppColors.badges[types[index]]!,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
