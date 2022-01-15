import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/widgets/stack_pokemon_evolution/stack_pokemon_evolution.dart';

class LineEvolution extends StatelessWidget {
  final Pokemon pokemon;
  final Pokemon pokemonEvolution;
  final int? level;
  const LineEvolution(
      {Key? key,
      required this.pokemon,
      required this.pokemonEvolution,
      this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StackPokemonEvolution(pokemon: pokemon),
        Container(
          margin: const EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
          ),
          width: 52,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 7.78),
                child: SvgPicture.asset(
                  "./assets/icons/front.svg",
                  height: 19.48,
                  width: 30,
                  color: AppColors.icon,
                ),
              ),
              FittedBox(
                child: Text(
                  // "(level ${pokemon.details.evolutionChain.chain.evolvesTo[0].evolutionDetails[0].minLevel})",
                  "(Level ${level ?? "??"})",
                  style: TextStyles.pokemonEvoluationLevel,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        StackPokemonEvolution(pokemon: pokemonEvolution)
      ],
    );
  }
}
