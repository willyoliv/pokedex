import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/icons/app_icons.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/widgets/badge/badge.dart';

class CustomSliverHeader extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Pokemon pokemon;

  const CustomSliverHeader(
      {required this.expandedHeight, required this.pokemon});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: AppColors.cardBackground[pokemon.types[0].type.name],
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 47,
            child: Opacity(
              opacity: 95 * (1 - shrinkOffset / expandedHeight) < 55
                  ? 1.0
                  : appear(shrinkOffset),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  pokemon.capitalize(pokemon.name),
                  style: TextStyles.pokemonName,
                ),
              ),
            ),
          ),
          Positioned(
            top: 47,
            right: -75,
            child: Opacity(
              opacity: appear(shrinkOffset),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: SvgPicture.asset(
                  'assets/patterns/10x5.svg',
                  width: 140,
                  height: 65,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 95 * (1 - shrinkOffset / expandedHeight),
            left: 30,
            child: Opacity(
              opacity: 95 * (1 - shrinkOffset / expandedHeight) < 55
                  ? 0.0
                  : disappear(shrinkOffset),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.35),
                      Colors.white.withOpacity(0.0),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.center,
                  ).createShader(bounds);
                },
                child: SvgPicture.asset(
                  'assets/patterns/circle.svg',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 95 * (1 - shrinkOffset / expandedHeight),
            left: 30,
            child: Opacity(
              opacity: 95 * (1 - shrinkOffset / expandedHeight) < 55
                  ? 0.0
                  : disappear(shrinkOffset),
              child: CachedNetworkImage(
                imageUrl: pokemon.sprites.frontDefault,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 170,
                width: 170,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 114 * (1 - shrinkOffset / expandedHeight),
            left: 190,
            child: Opacity(
              opacity: 114 * (1 - shrinkOffset / expandedHeight) < 114
                  ? 0.0
                  : disappear(shrinkOffset),
              child: Text(
                pokemon.getId(),
                style: TextStyles.pokemonNumberDetails,
              ),
            ),
          ),
          Positioned(
            top: 133 * (1 - shrinkOffset / expandedHeight),
            left: 190,
            child: Opacity(
              opacity: 133 * (1 - shrinkOffset / expandedHeight) < 114
                  ? 0.0
                  : disappear(shrinkOffset),
              child: Text(
                pokemon.capitalize(pokemon.name),
                style: TextStyles.pokemonNameDetails,
              ),
            ),
          ),
          Positioned(
            top: 190 * (1 - shrinkOffset / expandedHeight),
            left: 190,
            child: Opacity(
              opacity: 190 * (1 - shrinkOffset / expandedHeight) < 114
                  ? 0.0
                  : disappear(shrinkOffset),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5.6),
                    child: Badge(
                      urlIcon: AppIcons.appIcons[pokemon.types[0].type.name],
                      color: AppColors.badges[pokemon.types[0].type.name],
                      type: pokemon.types[0].type.name,
                    ),
                  ),
                  if (pokemon.types.length > 1)
                    Badge(
                      urlIcon: AppIcons.appIcons[pokemon.types[1].type.name],
                      color: AppColors.badges[pokemon.types[1].type.name],
                      type: pokemon.types[1].type.name,
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 187,
            right: -75,
            child: Opacity(
              opacity: disappear(shrinkOffset),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: SvgPicture.asset(
                  'assets/patterns/10x5.svg',
                  width: 140,
                  height: 65,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 25 * (1 - shrinkOffset / expandedHeight),
            child: Opacity(
              opacity: 95 * (1 - shrinkOffset / expandedHeight) < 55
                  ? 0.0
                  : disappear(shrinkOffset),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: Text(
                  pokemon.name.toUpperCase(),
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontSize: 100,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 30,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/back.svg',
                color: AppColors.white,
              ),
              splashRadius: 18,
              iconSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 105;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  appear(double shrinkOffset) {
    return shrinkOffset / expandedHeight;
  }

  disappear(double shrinkOffset) {
    return 1 - shrinkOffset / expandedHeight;
  }
}
