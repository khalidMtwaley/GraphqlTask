import 'delivery_type.dart';
import 'status.dart';
import 'type.dart';

class SaveCustomerRequest {
  int? id;
  String? date;
  Status? status;
  String? payeeName;
  Type? type;
  DeliveryType? deliveryType;
  String? notes;

  SaveCustomerRequest({
    this.id,
    this.date,
    this.status,
    this.payeeName,
    this.type,
    this.deliveryType,
    this.notes,
  });

  factory SaveCustomerRequest.fromJson(Map<String, dynamic> json) {
    return SaveCustomerRequest(
      id: json['id'] as int?,
      date: json['date'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      payeeName: json['payeeName'] as String?,
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      deliveryType: json['deliveryType'] == null
          ? null
          : DeliveryType.fromJson(json['deliveryType'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'status': status?.toJson(),
        'payeeName': payeeName,
        'type': type?.toJson(),
        'deliveryType': deliveryType?.toJson(),
        'notes': notes,
      };
}
