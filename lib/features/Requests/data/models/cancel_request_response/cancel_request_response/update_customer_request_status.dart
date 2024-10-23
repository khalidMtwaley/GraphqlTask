class UpdateCustomerRequestStatus {
  int? id;

  UpdateCustomerRequestStatus({this.id});

  factory UpdateCustomerRequestStatus.fromJson(Map<String, dynamic> json) {
    return UpdateCustomerRequestStatus(
      id: json['id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
