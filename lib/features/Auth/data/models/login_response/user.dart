class User {
  String? username;

  User({this.username});

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
      };
}
