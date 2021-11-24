import 'params.dart';

class Method {
  int? id;
  String? name;
  Params? params;

  Method({this.id, this.name, this.params});

  @override
  String toString() => 'Method(id: $id, name: $name, params: $params)';

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        id: json['id'] as int?,
        name: json['name'] as String?,
        params: json['params'] == null
            ? null
            : Params.fromJson(json['params'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'params': params?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Method &&
        other.id == id &&
        other.name == name &&
        other.params == params;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ params.hashCode;
}
