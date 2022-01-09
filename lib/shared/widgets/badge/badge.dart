import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';

class Badge extends StatelessWidget {
  final String? urlIcon;
  final String? type;
  final Color? color;
  const Badge({Key? key, this.urlIcon, this.type, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 5.6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5.6),
            child: SvgPicture.asset(
              urlIcon!,
              height: 15,
              width: 13.88,
              color: Colors.white,
            ),
          ),
          Text(
            type!,
            style: TextStyles.badgeTypePokemon,
          ),
        ],
      ),
    );
  }
}
