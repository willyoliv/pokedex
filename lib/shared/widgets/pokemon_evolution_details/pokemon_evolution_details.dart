import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/widgets/line_evolution/line_evolution.dart';
import 'package:provider/provider.dart';

class PokemonEvolutionDetails extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonEvolutionDetails({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pokemonProvide = Provider.of<ProviderPokemons>(context, listen: true);
    Pokemon? pokemonInitial;
    Pokemon? pokemonFirstEvolution;
    Pokemon? pokemonFinalEvolution;
    int? levelFirstEvolution = 0;
    int? levelFinalEvolution = 0;
    String firstForm = pokemon.details.evolutionChain.chain.species.name;
    // print(firstForm);
    if (firstForm != pokemon.name) {
      firstForm = firstForm;
      pokemonInitial = pokemonProvide.getByName(firstForm);
      // print(pokemonInitial.name);
    } else {
      pokemonInitial = pokemon;
    }
    if (pokemon.details.evolutionChain.chain.evolvesTo.isNotEmpty) {
      String secondForm =
          pokemon.details.evolutionChain.chain.evolvesTo[0].species.name;
      levelFirstEvolution = pokemon.details.evolutionChain.chain.evolvesTo[0]
          .evolutionDetails[0].minLevel;
      if (secondForm != pokemon.name) {
        secondForm = secondForm;
        pokemonFirstEvolution = pokemonProvide.getByName(secondForm);
      } else {
        pokemonFirstEvolution = pokemon;
      }
      if (pokemon
          .details.evolutionChain.chain.evolvesTo[0].evolvesTo.isNotEmpty) {
        String finalForm = pokemon.details.evolutionChain.chain.evolvesTo[0]
            .evolvesTo[0].species.name;
        levelFinalEvolution = pokemon.details.evolutionChain.chain.evolvesTo[0]
            .evolvesTo[0].evolutionDetails[0].minLevel;
        if (finalForm != pokemon.name) {
          finalForm = finalForm;
          pokemonFinalEvolution = pokemonProvide.getByName(finalForm);
        } else {
          pokemonFinalEvolution = pokemon;
        }
      }
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evolution Chart',
            style: TextStyle(
              color: AppColors.badges[pokemon.types[0].type.name],
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          if (pokemon.details.evolutionChain.chain.evolvesTo.isEmpty)
            Text(
              "Pokemon has no evolution!",
              style: TextStyles.text,
            ),
          if (pokemonFirstEvolution != null)
            LineEvolution(
              pokemon: pokemonInitial,
              pokemonEvolution: pokemonFirstEvolution,
              level: levelFirstEvolution,
            ),
          const SizedBox(
            height: 30,
          ),
          if (pokemonFinalEvolution != null)
            LineEvolution(
              pokemon: pokemonFirstEvolution!,
              pokemonEvolution: pokemonFinalEvolution,
              level: levelFinalEvolution,
            ),
        ],
      ),
    );
  }
}
