import 'package:pokedex/models/language.dart';

class Genera {
  Genera({
    required this.genus,
    required this.language,
  });
  late final String genus;
  late final Language language;

  Genera.fromJson(Map<String, dynamic> json) {
    genus = json['genus'];
    language = Language.fromJson(json['language']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['genus'] = genus;
    _data['language'] = language.toJson();
    return _data;
  }
}
