import 'package:flutter/material.dart';
import 'package:pokedex/environment/environments.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/shared/utils/enum_states.dart';

class ProviderPokemons extends ChangeNotifier {
  String urlBase = Environments.BASE_API_URL;
  List<Pokemon> _pokemons = [];
  List<Pokemon> _fullListOfPokemons = [];
  List<Pokemon> _listOfPokemonsAux = [];
  PokemonRepository pokemonRepository = PokemonRepository();
  double _currentRangeValueMin = 1;
  late double _currentRangeValueMax = _fullListOfPokemons.length.toDouble();
  int _currentSortIndex = 0;
  int _currentGenerationIndex = -1;

  States _state = States.start;
  Map<String, bool> _filterByType = {
    'bug': false,
    'dark': false,
    'dragon': false,
    'electric': false,
    'fairy': false,
    'fire': false,
    'fighting': false,
    'flying': false,
    'grass': false,
    'ground': false,
    'ghost': false,
    'ice': false,
    'normal': false,
    'poison': false,
    'psychic': false,
    'rock': false,
    'steel': false,
    'water': false,
  };

  Map<String, bool> _filterByWeaknesses = {
    'bug': false,
    'dark': false,
    'dragon': false,
    'electric': false,
    'fairy': false,
    'fire': false,
    'fighting': false,
    'flying': false,
    'grass': false,
    'ground': false,
    'ghost': false,
    'ice': false,
    'normal': false,
    'poison': false,
    'psychic': false,
    'rock': false,
    'steel': false,
    'water': false,
  };

  Map<String, bool> _filterByHeights = {
    'short': false,
    'medium': false,
    'tall': false,
  };

  Map<String, bool> _filterByWeights = {
    'light': false,
    'normal': false,
    'heavy': false,
  };

  Pokemon? _pokemon;

  Pokemon get pokemon => _pokemon!;
  List<Pokemon> get pokemons => _pokemons;
  List<Pokemon> get fullListPokemons => _fullListOfPokemons;
  States get getState => _state;
  int get getSyzeFullListOfPokemons => _fullListOfPokemons.length;
  int get getCurrentSortIndex => _currentSortIndex;
  int get getCurrentGenerationIndex => _currentGenerationIndex;
  double get getCurrentRangeValueMin => _currentRangeValueMin;
  double get getCurrentRangeValueMax => _currentRangeValueMax;
  Map<String, bool> get getFilterType => _filterByType;
  Map<String, bool> get getFilterWeaknesses => _filterByWeaknesses;
  Map<String, bool> get getFilterHeights => _filterByHeights;
  Map<String, bool> get getFilterWeights => _filterByWeights;

  Future start() async {
    _state = States.loading;
    try {
      _pokemons = await pokemonRepository.getAll();
      _fullListOfPokemons = _pokemons;
      _listOfPokemonsAux = _pokemons;
      notifyListeners();
      _state = States.success;
    } catch (e) {
      _state = States.error;
    }
    notifyListeners();
  }

  void setPokemon(Pokemon pokemon) async {
    _pokemon = pokemon;
  }

  Pokemon getByName(String name) {
    Pokemon pokemon = _fullListOfPokemons
        .firstWhere((pokemon) => pokemon.name.contains(name));
    return pokemon;
  }

  void applyFilter(
      Map<String, bool> mapTypes,
      Map<String, bool> mapWeaknesses,
      Map<String, bool> mapHeights,
      Map<String, bool> mapWeights,
      int currentRangeValueMin,
      int currentRangeValueMax) {
    _currentRangeValueMin = currentRangeValueMin.toDouble();
    _currentRangeValueMax = currentRangeValueMax.toDouble();
    List<String> types = [];
    mapTypes.forEach((key, value) {
      if (value) {
        types.add(key);
      }
    });
    List<String> weaknesses = [];
    mapWeaknesses.forEach((key, value) {
      if (value) {
        weaknesses.add(key);
      }
    });
    List<String> heights = [];
    mapHeights.forEach((key, value) {
      if (value) {
        heights.add(key);
      }
    });

    List<String> weights = [];
    mapWeights.forEach((key, value) {
      if (value) {
        weights.add(key);
      }
    });

    _pokemons = _fullListOfPokemons.sublist(
        currentRangeValueMin - 1, currentRangeValueMax);
    _filterByType = mapTypes;
    if (types.isNotEmpty) {
      List<Pokemon> _filterPokemons = [];
      _filterPokemons = _pokemons.where((pokemon) {
        return types.contains(pokemon.types[0].type.name);
      }).toList();
      _pokemons = _filterPokemons;
    }

    _filterByWeaknesses = mapWeaknesses;
    if (weaknesses.isNotEmpty) {
      List<Pokemon> _filterPokemons = [];
      _filterPokemons = _pokemons.where((pokemon) {
        var listWeakness = pokemon.details.damageRelations[0].doubleDamageFrom
            .map((element) => element.name)
            .toList();
        for (var weakness in weaknesses) {
          return listWeakness.contains(weakness);
        }
        return false;
      }).toList();
      _pokemons = _filterPokemons;
    }

    _filterByHeights = mapHeights;
    if (heights.isNotEmpty) {
      List<Pokemon> _filterPokemons = [];
      _filterPokemons = _pokemons.where((pokemon) {
        double pokemonHeight = pokemon.height / 10;
        for (var height in heights) {
          switch (height) {
            case "short":
              if (pokemonHeight <= 1.5) {
                return true;
              }
              break;
            case "medium":
              if (pokemonHeight > 1.5 && pokemonHeight <= 8.7) {
                return true;
              }
              break;
            case "tall":
              if (pokemonHeight > 8.7) {
                return true;
              }
              break;
            default:
          }
        }
        return false;
      }).toList();
      _pokemons = _filterPokemons;
    }
    _filterByWeights = mapWeights;
    if (weights.isNotEmpty) {
      List<Pokemon> _filterPokemons = [];
      _filterPokemons = _pokemons.where((pokemon) {
        double pokemonWeight = pokemon.weight / 10;
        for (var weight in weights) {
          switch (weight) {
            case "light":
              if (pokemonWeight <= 9.9) {
                return true;
              }
              break;
            case "normal":
              if (pokemonWeight > 10 && pokemonWeight <= 299.9) {
                return true;
              }
              break;
            case "heavy":
              if (pokemonWeight > 299.9) {
                return true;
              }
              break;
            default:
          }
        }
        return false;
      }).toList();
      _pokemons = _filterPokemons;
      _listOfPokemonsAux = _pokemons;
    }
    applySort(_currentSortIndex);
    notifyListeners();
  }

  void applySort(int index) {
    _currentSortIndex = index;
    switch (index) {
      case 0:
        _pokemons.sort((a, b) => a.id.compareTo(b.id));
        break;
      case 1:
        _pokemons.sort((a, b) => a.id.compareTo(b.id));
        _pokemons = _pokemons.reversed.toList();
        break;
      case 2:
        _pokemons.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 3:
        _pokemons.sort((a, b) => a.name.compareTo(b.name));
        _pokemons = _pokemons.reversed.toList();
        break;
      default:
    }
    _listOfPokemonsAux = _pokemons;
    applyGenerationFilter(_currentGenerationIndex);
    notifyListeners();
  }

  void applyGenerationFilter(int index) {
    _currentGenerationIndex = index;
    switch (index) {
      case 0:
        _pokemons = _listOfPokemonsAux
            .where(
                (pokemon) => pokemon.details.generation.name == "generation-i")
            .toList();
        break;
      case 1:
        _pokemons = _listOfPokemonsAux
            .where(
                (pokemon) => pokemon.details.generation.name == "generation-ii")
            .toList();
        break;
      case 2:
        _pokemons = _listOfPokemonsAux
            .where((pokemon) =>
                pokemon.details.generation.name == "generation-iii")
            .toList();
        break;
      case 3:
        _pokemons = _listOfPokemonsAux
            .where(
                (pokemon) => pokemon.details.generation.name == "generation-iv")
            .toList();
        break;
      case 4:
        _pokemons = _listOfPokemonsAux
            .where(
                (pokemon) => pokemon.details.generation.name == "generation-v")
            .toList();
        break;
      case 5:
        _pokemons = _listOfPokemonsAux
            .where(
                (pokemon) => pokemon.details.generation.name == "generation-vi")
            .toList();
        break;
      case 6:
        _pokemons = _listOfPokemonsAux
            .where((pokemon) =>
                pokemon.details.generation.name == "generation-vii")
            .toList();
        break;
      case 7:
        _pokemons = _listOfPokemonsAux
            .where((pokemon) =>
                pokemon.details.generation.name == "generation-viii")
            .toList();
        break;
      default:
        _pokemons = _listOfPokemonsAux;
    }
    notifyListeners();
  }

  void searchByName(String name) {
    if (name.isNotEmpty) {
      _pokemons = _listOfPokemonsAux.where((pokemon) {
        return pokemon.name == name.toLowerCase();
      }).toList();
    } else {
      applyFilter(
          _filterByType,
          _filterByWeaknesses,
          _filterByHeights,
          _filterByWeights,
          _currentRangeValueMin.toInt(),
          _currentRangeValueMax.toInt());
    }

    notifyListeners();
  }

  void resetSearchByName() {
    applyFilter(
        _filterByType,
        _filterByWeaknesses,
        _filterByHeights,
        _filterByWeights,
        _currentRangeValueMin.toInt(),
        _currentRangeValueMax.toInt());
    notifyListeners();
  }

  void resetFilter() {
    _pokemons = _fullListOfPokemons;
    applySort(_currentSortIndex);
    _filterByType = {
      'bug': false,
      'dark': false,
      'dragon': false,
      'electric': false,
      'fairy': false,
      'fire': false,
      'fighting': false,
      'flying': false,
      'grass': false,
      'ground': false,
      'ghost': false,
      'ice': false,
      'normal': false,
      'poison': false,
      'psychic': false,
      'rock': false,
      'steel': false,
      'water': false,
    };

    _filterByWeaknesses = {
      'bug': false,
      'dark': false,
      'dragon': false,
      'electric': false,
      'fairy': false,
      'fire': false,
      'fighting': false,
      'flying': false,
      'grass': false,
      'ground': false,
      'ghost': false,
      'ice': false,
      'normal': false,
      'poison': false,
      'psychic': false,
      'rock': false,
      'steel': false,
      'water': false,
    };

    _filterByHeights = {
      'short': false,
      'medium': false,
      'tall': false,
    };

    _filterByWeights = {
      'light': false,
      'normal': false,
      'heavy': false,
    };

    _currentRangeValueMin = 1;
    _currentRangeValueMax = _fullListOfPokemons.length.toDouble();
    notifyListeners();
  }
}
