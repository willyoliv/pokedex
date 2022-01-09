import 'evolutions.dart';

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });
  late final String url;
  late final Chain chain;

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
  }
}
