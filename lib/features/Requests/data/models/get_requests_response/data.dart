import 'customer_request.dart';

class Data {
  CustomerRequest? customerRequest;

  Data({this.customerRequest});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        customerRequest: json['customerRequest'] == null
            ? null
            : CustomerRequest.fromJson(
                json['customerRequest'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'customerRequest': customerRequest?.toJson(),
      };
}
