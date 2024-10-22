import 'save_customer_data.dart';

class RequestsResponse {
  Data? data;

  RequestsResponse({
    this.data,
  });

  factory RequestsResponse.fromJson(Map<String, dynamic> json) {
    return RequestsResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
