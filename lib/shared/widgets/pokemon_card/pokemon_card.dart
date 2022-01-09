import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/icons/app_icons.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/widgets/badge/badge.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _pokemonProvider = Provider.of<ProviderPokemons>(context, listen: true);
    return GestureDetector(
      onTap: () {
        _pokemonProvider.setPokemon(pokemon);
        Navigator.pushNamed(context, '/pokemon_details');
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 17,
          left: 40,
          right: 40,
          bottom: 17,
        ),
        height: 115,
        width: 334,
        decoration: BoxDecoration(
          color: AppColors.cardBackground[pokemon.types[0].type.name]!,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                width: 294,
                height: 95,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground[pokemon.types[0].type.name]!,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadows[pokemon.types[0].type.name]!,
                      offset: const Offset(0.0, 10.0),
                      blurRadius: 20,
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                pokemon.getId(),
                style: TextStyles.pokemonNumber,
              ),
            ),
            Positioned(
              top: 34,
              left: 20,
              child: Text(
                pokemon.capitalize(pokemon.name),
                style: TextStyles.pokemonName,
              ),
            ),
            Positioned(
              top: 70,
              left: 20,
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
            Positioned(
              top: -15,
              right: -15,
              bottom: -15,
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
                child: Image.asset(
                  'assets/patterns/pokeball.png',
                  width: 145,
                  height: 145,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: -15,
              right: -15,
              child: CachedNetworkImage(
                imageUrl: pokemon.sprites.frontDefault,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 170,
                height: 170,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 90,
              top: 5,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      AppColors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: SvgPicture.asset(
                  'assets/patterns/6x3.svg',
                  width: 74,
                  height: 32,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
