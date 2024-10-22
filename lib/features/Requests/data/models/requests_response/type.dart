class Type {
  String? name;

  Type({this.name});

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
