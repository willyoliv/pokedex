import 'type.dart';

class Types {
  Types({
    required this.type,
  });
  late final Type type;

  Types.fromJson(Map<String, dynamic> json) {
    type = Type.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type.toJson();
    return _data;
  }
}
