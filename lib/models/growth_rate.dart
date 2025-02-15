class GrowthRate {
  GrowthRate({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  GrowthRate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}
