import 'data.dart';
import 'extensions.dart';

class GetRequestsResponse {
  Data? data;
  Extensions? extensions;

  GetRequestsResponse({this.data, this.extensions});

  factory GetRequestsResponse.fromJson(Map<String, dynamic> json) {
    return GetRequestsResponse(
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
