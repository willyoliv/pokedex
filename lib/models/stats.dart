import 'stat.dart';

class Stats {
  Stats({
    required this.baseStat,
    required this.stat,
  });
  late final int baseStat;
  late final Stat stat;

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    stat = Stat.fromJson(json['stat']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['base_stat'] = baseStat;
    _data['stat'] = stat.toJson();
    return _data;
  }

  int getMaxValueBaseStat(String name) {
    int max = 0;
    double nature = 1.1;
    int ev = 252 ~/ 4;
    int iv = 31;
    int level = 100;
    if (name == "hp") {
      max = baseStat * 2 + iv + ev + level + 10;
    } else {
      double maxAux = (baseStat * 2 + iv + ev + 5) * 1.1;
      max = maxAux.floor();
    }
    return max;
  }

  int getMinValueBaseStat(String name) {
    int min = 0;
    double nature = 1.1;
    int level = 100;
    if (name == "hp") {
      min = baseStat * 2 + level + 10;
    } else {
      double maxAux = (baseStat * 2 + 5) * 0.9;
      min = maxAux.floor();
    }
    return min;
  }
}
