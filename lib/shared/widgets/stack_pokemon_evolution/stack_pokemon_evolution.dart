import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';

class StackPokemonEvolution extends StatelessWidget {
  final Pokemon pokemon;
  const StackPokemonEvolution({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133,
      width: 100,
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Stack(
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      AppColors.white.withOpacity(0.5),
                      AppColors.whiteSecondary.withOpacity(0.9481),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: SvgPicture.asset(
                  'assets/patterns/pokeball.svg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: pokemon.sprites.frontDefault,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 33,
            child: Column(
              children: [
                Text(
                  pokemon.getId(),
                  style: TextStyles.additionalText,
                ),
                FittedBox(
                  child: Text(
                    pokemon.capitalize(pokemon.name),
                    style: TextStyles.subtitles,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
