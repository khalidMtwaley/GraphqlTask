class DeliveryType {
  String? name;
  String? code;

  DeliveryType({this.name, this.code});

  factory DeliveryType.fromJson(Map<String, dynamic> json) => DeliveryType(
        name: json['name'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
      };
}
