import 'package:pokedex/models/language.dart';
import 'package:pokedex/models/version.dart';

class FlavorTextEntries {
  FlavorTextEntries({
    required this.flavorText,
    required this.language,
    required this.version,
  });
  late final String flavorText;
  late final Language language;
  late final Version version;

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = Language.fromJson(json['language']);
    version = Version.fromJson(json['version']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['flavor_text'] = flavorText;
    _data['language'] = language.toJson();
    _data['version'] = version.toJson();
    return _data;
  }
}
