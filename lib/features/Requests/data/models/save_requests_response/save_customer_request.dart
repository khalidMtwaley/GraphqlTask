
class SaveCustomerRequest {
  int? id;


  SaveCustomerRequest({
    this.id,

  });

  factory SaveCustomerRequest.fromJson(Map<String, dynamic> json) {
    return SaveCustomerRequest(
      id: json['id'] as int?,

    );
  }


}

