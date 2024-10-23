import 'update_customer_request_status.dart';

class Data {
  UpdateCustomerRequestStatus? updateCustomerRequestStatus;

  Data({this.updateCustomerRequestStatus});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        updateCustomerRequestStatus: json['updateCustomerRequestStatus'] == null
            ? null
            : UpdateCustomerRequestStatus.fromJson(
                json['updateCustomerRequestStatus'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'updateCustomerRequestStatus': updateCustomerRequestStatus?.toJson(),
      };
}
