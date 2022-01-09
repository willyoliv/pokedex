import 'package:dio/dio.dart';
import 'package:pokedex/environment/environments.dart';
import 'package:pokedex/models/damage_relations.dart';
import 'package:pokedex/models/evolutions.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonRepository {
  final dio = Dio();
  final String url = Environments.BASE_API_URL;

  Future<List<Pokemon>> getAll() async {
    final response = await dio.get(url + 'pokemon?limit=898');
    final results = response.data['results'] as List;
    List<Pokemon> pokemons = [];
    int count = 0;
    for (var item in results) {
      count++;
      var urlConsulta = item['url'];
      final responsePokemon = await dio.get(urlConsulta);
      var pokemon = Pokemon.fromJson(responsePokemon.data);
      final responseDetails =
          await dio.get(url + 'pokemon-species/' + pokemon.id.toString());
      pokemon.details = PokemonDetails.fromJson(responseDetails.data);

      for (int i = 0; i < pokemon.types.length; i++) {
        urlConsulta = pokemon.types[i].type.url;
        final responseDamageDetails = await dio.get(urlConsulta);
        pokemon.details.damageRelations.add(DamageRelations.fromJson(
            responseDamageDetails.data['damage_relations']));
      }

      final evolutionUrl = pokemon.details.evolutionChain.url;
      final responseEvoluation = await dio.get(evolutionUrl);
      pokemon.details.evolutionChain.chain =
          Chain.fromJson(responseEvoluation.data['chain']);

      pokemons.add(pokemon);
      print(pokemon.name);
      print(count);
    }
    return pokemons;
  }
}
