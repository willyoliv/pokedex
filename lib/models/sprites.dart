class Sprites {
  Sprites({
    required this.frontDefault,
  });
  late final String frontDefault;

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['front_default'] = frontDefault;
    return _data;
  }
}
