class Status {
  String? code;

  Status({this.code});

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
      };
}
