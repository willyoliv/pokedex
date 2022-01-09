import 'double_damage_from.dart';
import 'half_damage_from.dart';

class DamageRelations {
  DamageRelations({
    required this.doubleDamageFrom,
    required this.halfDamageFrom,
  });
  late final List<DoubleDamageFrom> doubleDamageFrom;
  late final List<HalfDamageFrom> halfDamageFrom;

  DamageRelations.fromJson(Map<String, dynamic> json) {
    doubleDamageFrom = List.from(json['double_damage_from'])
        .map((e) => DoubleDamageFrom.fromJson(e))
        .toList();
    halfDamageFrom = List.from(json['half_damage_from'])
        .map((e) => HalfDamageFrom.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['double_damage_from'] =
        doubleDamageFrom.map((e) => e.toJson()).toList();
    _data['half_damage_from'] = halfDamageFrom.map((e) => e.toJson()).toList();
    return _data;
  }
}
