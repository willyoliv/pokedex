import 'package:flutter/material.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/utils/enum_pages_details.dart';
import 'package:pokedex/shared/widgets/pokeball_image/pokeball_image.dart';

class CustomSliverHeaderMenu extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Function setStatePage;
  final StatePageDetails statePage;
  final Color color;

  const CustomSliverHeaderMenu({
    required this.expandedHeight,
    required this.setStatePage,
    required this.statePage,
    required this.color,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: color,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          if (statePage == StatePageDetails.about)
            const Positioned(
              top: 0,
              left: 19,
              child: PokeballImage(),
            ),
          Positioned(
            left: 37,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                setStatePage(StatePageDetails.about);
              },
              child: Text(
                "About",
                style: statePage == StatePageDetails.about
                    ? TextStyles.textButtonSelected
                    : TextStyles.textButton,
              ),
            ),
          ),
          if (statePage == StatePageDetails.stats)
            const Positioned(
              top: 0,
              left: 143,
              right: 143,
              child: PokeballImage(),
            ),
          Positioned(
            left: 157,
            right: 157,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                setStatePage(StatePageDetails.stats);
              },
              child: Text(
                "Stats",
                style: statePage == StatePageDetails.stats
                    ? TextStyles.textButtonSelected
                    : TextStyles.textButton,
              ),
            ),
          ),
          if (statePage == StatePageDetails.evoluvion)
            const Positioned(
              top: 0,
              right: 19,
              child: PokeballImage(),
            ),
          Positioned(
            right: 30,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                setStatePage(StatePageDetails.evoluvion);
              },
              child: Text(
                "Evoluvion",
                style: statePage == StatePageDetails.evoluvion
                    ? TextStyles.textButtonSelected
                    : TextStyles.textButton,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
