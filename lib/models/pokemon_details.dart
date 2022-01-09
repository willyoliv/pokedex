import 'package:fraction/fraction.dart';

import 'color.dart';
import 'egg_groups.dart';
import 'damage_relations.dart';
import 'evolution_chain.dart';
import 'flavor_text_entreis.dart';
import 'genera.dart';
import 'generation.dart';
import 'growth_rate.dart';

class PokemonDetails {
  PokemonDetails({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.flavorTextEntries,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.hatchCounter,
  });
  late final int baseHappiness;
  late final int captureRate;
  late final Color color;
  late final List<EggGroups> eggGroups;
  late final EvolutionChain evolutionChain;
  late final List<FlavorTextEntries> flavorTextEntries;
  late final int genderRate;
  late final List<Genera> genera;
  late final Generation generation;
  late final GrowthRate growthRate;
  late final int hatchCounter;
  late final List<DamageRelations> damageRelations = [];

  PokemonDetails.fromJson(Map<String, dynamic> json) {
    baseHappiness = json['base_happiness'];
    captureRate = json['capture_rate'];
    color = Color.fromJson(json['color']);
    eggGroups = List.from(json['egg_groups'])
        .map((e) => EggGroups.fromJson(e))
        .toList();
    evolutionChain = EvolutionChain.fromJson(json['evolution_chain']);
    flavorTextEntries = List.from(json['flavor_text_entries'])
        .map((e) => FlavorTextEntries.fromJson(e))
        .toList();
    genderRate = json['gender_rate'];
    genera = List.from(json['genera']).map((e) => Genera.fromJson(e)).toList();
    generation = Generation.fromJson(json['generation']);
    growthRate = GrowthRate.fromJson(json['growth_rate']);
    hatchCounter = json['hatch_counter'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['base_happiness'] = baseHappiness;
    _data['capture_rate'] = captureRate;
    _data['color'] = color.toJson();
    _data['egg_groups'] = eggGroups.map((e) => e.toJson()).toList();
    _data['evolution_chain'] = evolutionChain.toJson();
    _data['flavor_text_entries'] =
        flavorTextEntries.map((e) => e.toJson()).toList();
    _data['gender_rate'] = genderRate;
    _data['genera'] = genera.map((e) => e.toJson()).toList();
    _data['generation'] = generation.toJson();
    _data['growth_rate'] = growthRate.toJson();
    _data['hatch_counter'] = hatchCounter;
    return _data;
  }

  Map getTypesDefenses() {
    Map<String, String> typesPokemon = {
      'normal': "",
      'fire': "",
      'water': "",
      'electric': "",
      'grass': "",
      'ice': "",
      'fighting': "",
      'poison': "",
      'ground': "",
      'flying': "",
      'psychic': "",
      'bug': "",
      'rock': "",
      'ghost': "",
      'dragon': "",
      'dark': "",
      'steel': "",
      'fairy': "",
    };
    for (var item in damageRelations) {
      var doubleDamageFrom = item.doubleDamageFrom;
      String damageValue;
      for (var doubleDamageFromItem in doubleDamageFrom) {
        damageValue = typesPokemon[doubleDamageFromItem.name]!;
        if (damageValue == Fraction(1, 2).toStringAsGlyph()) {
          damageValue = "";
        } else {
          damageValue = "2";
        }

        typesPokemon.update(doubleDamageFromItem.name, (value) {
          return damageValue;
        });
      }

      var halfDamageFrom = item.halfDamageFrom;
      for (var halfDamageFromItem in halfDamageFrom) {
        damageValue = typesPokemon[halfDamageFromItem.name]!;
        if (damageValue == Fraction(1, 2).toStringAsGlyph()) {
          damageValue = Fraction(1, 4).toStringAsGlyph();
        } else if (damageValue == "2") {
          damageValue = "";
        } else {
          damageValue = Fraction(1, 2).toStringAsGlyph();
        }
        typesPokemon.update(halfDamageFromItem.name, (value) => damageValue);
      }
    }
    return typesPokemon;
  }
}
