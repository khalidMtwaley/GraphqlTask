class DeliveryType {
  String? name;

  DeliveryType({this.name});

  factory DeliveryType.fromJson(Map<String, dynamic> json) => DeliveryType(
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
