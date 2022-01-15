import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/theme/text/text_styles.dart';
import 'package:pokedex/shared/widgets/line_evolution/line_evolution.dart';
import 'package:provider/provider.dart';

class PokemonEvolutionDetails extends StatelessWidget {
  final Pokemon pokemon;
  final bool enableScroll;
  final ScrollController controller;
  const PokemonEvolutionDetails({
    Key? key,
    required this.pokemon,
    required this.enableScroll,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pokemonProvide = Provider.of<ProviderPokemons>(context, listen: true);
    Pokemon? pokemonInitial;
    List<Widget> pokemonsFirstEvolutions = [];
    List<Widget> pokemonsFinalEvolutions = [];
    Pokemon? pokemonFirstEvolution;
    Pokemon? pokemonFinalEvolution;
    int? levelFirstEvolution = 0;
    int? levelFinalEvolution = 0;
    String firstForm = pokemon.details.evolutionChain.chain.species.name;
    if (firstForm != pokemon.name) {
      firstForm = firstForm;
      pokemonInitial = pokemonProvide.getByName(firstForm);
    } else {
      pokemonInitial = pokemon;
    }
    if (pokemon.details.evolutionChain.chain.evolvesTo.isNotEmpty) {
      for (var pokemonItem in pokemon.details.evolutionChain.chain.evolvesTo) {
        String secondForm = pokemonItem.species.name;

        if (secondForm != pokemon.name) {
          Pokemon pokemonAux = pokemonProvide.getByName(secondForm);
          int? level = pokemonItem.evolutionDetails[0].minLevel;
          pokemonsFirstEvolutions.add(
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: LineEvolution(
                pokemon: pokemonInitial,
                pokemonEvolution: pokemonAux,
                level: level,
              ),
            ),
          );
          if (pokemon.details.evolutionChain.chain.evolvesTo.length == 1) {
            levelFirstEvolution = pokemonItem.evolutionDetails[0].minLevel;
            pokemonFirstEvolution = pokemon;
          }
        } else {
          levelFirstEvolution = pokemonItem.evolutionDetails[0].minLevel;
          pokemonFirstEvolution = pokemon;
        }
      }

      if (pokemon
          .details.evolutionChain.chain.evolvesTo[0].evolvesTo.isNotEmpty) {
        for (var item
            in pokemon.details.evolutionChain.chain.evolvesTo[0].evolvesTo) {
          String finalForm = item.species.name;
          if (finalForm != pokemon.name) {
            Pokemon pokemonAux = pokemonProvide.getByName(finalForm);
            int? level = item.evolutionDetails[0].minLevel;
            pokemonsFinalEvolutions.add(
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: LineEvolution(
                  pokemon: pokemonFirstEvolution!,
                  pokemonEvolution: pokemonAux,
                  level: level,
                ),
              ),
            );
          } else {
            levelFinalEvolution = item.evolutionDetails[0].minLevel;
            pokemonFinalEvolution = pokemon;
          }
        }
      }
    }

    return SingleChildScrollView(
      controller: controller,
      physics: !enableScroll ? const NeverScrollableScrollPhysics() : null,
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
          if (pokemonFirstEvolution == null) ...pokemonsFirstEvolutions,
          if (pokemonFirstEvolution != null)
            LineEvolution(
              pokemon: pokemonInitial,
              pokemonEvolution: pokemonFirstEvolution,
              level: levelFirstEvolution,
            ),
          const SizedBox(
            height: 30,
          ),
          if (pokemonFinalEvolution == null) ...pokemonsFinalEvolutions,
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
