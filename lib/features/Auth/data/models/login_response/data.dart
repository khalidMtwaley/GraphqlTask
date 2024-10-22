import 'login.dart';

class Data {
  Login? login;

  Data({this.login});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        login: json['login'] == null
            ? null
            : Login.fromJson(json['login'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'login': login?.toJson(),
      };
}
