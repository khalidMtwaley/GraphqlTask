import 'list_customer_requests.dart';


class Allrequests {
  ListCustomerRequests? listCustomerRequests;

  Allrequests({this.listCustomerRequests});

  factory Allrequests.fromJson(Map<String, dynamic> json) => Allrequests(
        listCustomerRequests: json['listCustomerRequests'] == null
            ? null
            : ListCustomerRequests.fromJson(
                json['listCustomerRequests'] as Map<String, dynamic>),
      );
}
