import 'package:flutter/material.dart';
import 'package:pokedex/models/stats.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';

class ItemStats extends StatelessWidget {
  final Stats stats;
  final Color color;
  const ItemStats({
    Key? key,
    required this.stats,
    required this.color,
  }) : super(key: key);

  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final String nameStat;
    if (stats.stat.name == "hp") {
      nameStat = "HP";
    } else if (stats.stat.name == "special-attack") {
      nameStat = "Sp. Atk";
    } else if (stats.stat.name == "special-defense") {
      nameStat = "Sp. Def";
    } else {
      nameStat = capitalize(stats.stat.name);
    }
    final int max = stats.getMaxValueBaseStat(stats.stat.name);
    final int min = stats.getMinValueBaseStat(stats.stat.name);
    return Container(
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
              nameStat,
              style: TextStyles.labelDetails,
            ),
          ),
          Container(
            height: 19,
            width: 31,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 10),
            child: Text("${stats.baseStat}", style: TextStyles.text),
          ),
          Container(
            width: 148,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 4,
                constraints: BoxConstraints(
                  maxWidth: stats.baseStat / (max / 130),
                ),
                margin: const EdgeInsets.only(left: 4, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: color,
                ),
              ),
            ),
          ),
          Container(
            height: 19,
            width: 30,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 10),
            child: Text(
              "$min",
              style: TextStyles.text,
            ),
          ),
          Container(
            height: 19,
            width: 29,
            alignment: Alignment.centerRight,
            child: Text(
              "$max",
              style: TextStyles.text,
            ),
          ),
        ],
      ),
    );
  }
}
