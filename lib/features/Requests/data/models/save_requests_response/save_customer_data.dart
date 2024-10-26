import 'save_customer_request.dart';

class Data {
  SaveCustomerRequest? saveCustomerRequest;

  Data({this.saveCustomerRequest});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        saveCustomerRequest: json['saveCustomerRequest'] == null
            ? null
            : SaveCustomerRequest.fromJson(
                json['saveCustomerRequest'] as Map<String, dynamic>),
      );


}
