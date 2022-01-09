import 'abilities.dart';
import 'pokemon_details.dart';
import 'species.dart';
import 'sprites.dart';
import 'stats.dart';
import 'types.dart';

class Pokemon {
  Pokemon({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.locationAreaEncounters,
    required this.name,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });
  late final List<Abilities> abilities;
  late final int baseExperience;
  late final int height;
  late final int id;
  late final String locationAreaEncounters;
  late final String name;
  late final Species species;
  late final Sprites sprites;
  late final List<Stats> stats;
  late final List<Types> types;
  late final int weight;
  late final PokemonDetails details;

  Pokemon.fromJson(Map<String, dynamic> json) {
    abilities =
        List.from(json['abilities']).map((e) => Abilities.fromJson(e)).toList();
    baseExperience = json['base_experience'];
    height = json['height'];
    id = json['id'];
    locationAreaEncounters = json['location_area_encounters'];
    name = json['name']; // .split("-")[0]
    species = Species.fromJson(json['species']);
    sprites = Sprites.fromJson(json['sprites']);
    stats = List.from(json['stats']).map((e) => Stats.fromJson(e)).toList();
    types = List.from(json['types']).map((e) => Types.fromJson(e)).toList();
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['abilities'] = abilities.map((e) => e.toJson()).toList();
    _data['base_experience'] = baseExperience;
    _data['height'] = height;
    _data['id'] = id;
    _data['location_area_encounters'] = locationAreaEncounters;
    _data['name'] = name;
    _data['species'] = species.toJson();
    _data['sprites'] = sprites.toJson();
    _data['stats'] = stats.map((e) => e.toJson()).toList();
    _data['types'] = types.map((e) => e.toJson()).toList();
    _data['weight'] = weight;
    return _data;
  }

  int getSumBaseStat() {
    int total = 0;
    for (var stat in stats) {
      total += stat.baseStat;
    }
    return total;
  }

  String capitalize(String word) {
    if (word.isEmpty) {
      return word;
    }

    return word[0].toUpperCase() + word.substring(1);
  }

  String getId() {
    String id = this.id.toString();
    if (id.length == 1) {
      id = "00" + id;
    } else if (id.length == 2) {
      id = "0" + id;
    }
    return "#" + id;
  }
}

class PokemonEvoluationLevel {}
