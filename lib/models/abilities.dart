import 'ability.dart';

class Abilities {
  Abilities({
    required this.ability,
  });
  late final Ability ability;

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = Ability.fromJson(json['ability']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ability'] = ability.toJson();
    return _data;
  }
}
