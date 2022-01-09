/* class Evolutions {
  Evolutions({
    required this.chain,
  });
  late final Chain chain;

  Evolutions.fromJson(Map<String, dynamic> json) {
    chain = Chain.fromJson(json['chain']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['chain'] = chain.toJson();
    return _data;
  }
} */

class Chain {
  Chain({
    required this.evolvesTo,
    required this.species,
  });
  late final List<EvolvesTo> evolvesTo;
  late final Species species;

  Chain.fromJson(Map<String, dynamic> json) {
    evolvesTo = List.from(json['evolves_to'])
        .map((e) => EvolvesTo.fromJson(e))
        .toList();
    species = Species.fromJson(json['species']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['evolves_to'] = evolvesTo.map((e) => e.toJson()).toList();
    _data['species'] = species.toJson();
    return _data;
  }
}

class EvolvesTo {
  EvolvesTo({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.species,
  });
  late final List<EvolutionDetails> evolutionDetails;
  late final List<EvolvesTo> evolvesTo;
  late final Species species;

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    evolutionDetails = List.from(json['evolution_details'])
        .map((e) => EvolutionDetails.fromJson(e))
        .toList();
    evolvesTo = List.from(json['evolves_to'])
        .map((e) => EvolvesTo.fromJson(e))
        .toList();
    species = Species.fromJson(json['species']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['evolution_details'] =
        evolutionDetails.map((e) => e.toJson()).toList();
    _data['evolves_to'] = evolvesTo.map((e) => e.toJson()).toList();
    _data['species'] = species.toJson();
    return _data;
  }
}

class EvolutionDetails {
  EvolutionDetails({
    required this.minLevel,
  });
  late final int? minLevel;

  EvolutionDetails.fromJson(Map<String, dynamic> json) {
    minLevel = json['min_level'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['min_level'] = minLevel;
    return _data;
  }
}

class Species {
  Species({
    required this.name,
  });
  late final String name;

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}
