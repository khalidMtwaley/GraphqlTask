import 'request_model.dart';

class ListCustomerRequests {
  List<RequestModel>? data;

  ListCustomerRequests({this.data});

  factory ListCustomerRequests.fromJson(Map<String, dynamic> json) {
    return ListCustomerRequests(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
