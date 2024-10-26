class Status {
  String? name;

  Status({this.name});

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
