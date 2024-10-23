import 'data.dart';
import 'extensions.dart';

class CancelRequestResponse {
  Data? data;
  Extensions? extensions;

  CancelRequestResponse({this.data, this.extensions});

  factory CancelRequestResponse.fromJson(Map<String, dynamic> json) {
    return CancelRequestResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      extensions: json['extensions'] == null
          ? null
          : Extensions.fromJson(json['extensions'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'extensions': extensions?.toJson(),
      };
}
