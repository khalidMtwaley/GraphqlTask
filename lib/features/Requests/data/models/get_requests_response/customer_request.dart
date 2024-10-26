import 'status.dart';

class CustomerRequest {
  Status? status;

  CustomerRequest({this.status});

  factory CustomerRequest.fromJson(Map<String, dynamic> json) {
    return CustomerRequest(
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status?.toJson(),
      };
}
