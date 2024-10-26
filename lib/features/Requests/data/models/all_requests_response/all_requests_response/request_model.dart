import 'delivery_type.dart';
import 'status.dart';
import 'type.dart';


class RequestModel {
  String? payeeName;
  Type? type;
  DeliveryType? deliveryType;
  Status? status;
  String? date;
  String? notes;
  int? id;
  String? createdAt;

  RequestModel({
    this.payeeName,
    this.type,
    this.deliveryType,
    this.status,
    this.date,
    this.notes,
    this.id,
    this.createdAt,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        payeeName: json['payeeName'] as String?,
        type: json['type'] == null
            ? null
            : Type.fromJson(json['type'] as Map<String, dynamic>),
        deliveryType: json['deliveryType'] == null
            ? null
            : DeliveryType.fromJson(
                json['deliveryType'] as Map<String, dynamic>),
        status: json['status'] == null
            ? null
            : Status.fromJson(json['status'] as Map<String, dynamic>),
        date: json['date'] as String?,
        notes: json['notes'] as String?,
        id: json['id'] as int?,
        createdAt: json['createdAt'] as String?,
      );
}
