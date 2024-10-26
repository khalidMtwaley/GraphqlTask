class Type {
  String? name;
  String? code;

  Type({this.name, this.code});

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: json['name'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
      };
}
