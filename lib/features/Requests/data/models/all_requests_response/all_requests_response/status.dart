class Status {
  String? name;
  String? code;

  Status({this.name, this.code});

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        name: json['name'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
      };
}
