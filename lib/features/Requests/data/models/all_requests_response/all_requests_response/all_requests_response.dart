import 'data.dart';

class AllRequestsResponse {
  Allrequests? data;

  AllRequestsResponse({this.data});

  factory AllRequestsResponse.fromJson(Map<String, dynamic> json) {
    return AllRequestsResponse(
      data: json['data'] == null
          ? null
          : Allrequests.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
