import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/features/Requests/data/models/cancel_request_response/cancel_request_response/update_customer_request_status.dart';
import 'package:task/features/Requests/data/data_source/requests_data_source.dart';
import 'package:task/features/Requests/data/models/requests_response/requests_response.dart';
import 'package:task/features/Requests/data/models/requests_response/save_customer_request.dart';

abstract class RequestsRepo {
  Future<Either<Failure, SaveCustomerRequest>> saveCustomerRequest(
      String? date,
      String? payeeName,
      String? notes,
      String? deliveryTypeCode,
      String? typeCode);
      Future<Either<Failure, UpdateCustomerRequestStatus>>cancelCustomerRequest(int? id, String?status) ;

}

@Singleton(as: RequestsRepo)
class RequestsRepoImpl implements RequestsRepo {
  final RequestsDataSource _requestsDataSource;

  RequestsRepoImpl(this._requestsDataSource);

  @override
  Future<Either<Failure, SaveCustomerRequest>> saveCustomerRequest(
      String? date,
      String? payeeName,
      String? notes,
      String? deliveryTypeCode,
      String? typeCode) async {
    try {
      final saveCustomerRequestResponse =
          await _requestsDataSource.saveCustomerRequest(
              date, payeeName, notes, deliveryTypeCode, typeCode);
      return Right(saveCustomerRequestResponse);
    } on AppException catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, UpdateCustomerRequestStatus>> cancelCustomerRequest(int? id, String? status)async {
    try {
      final cancelCustomerRequestResponse = await _requestsDataSource.cancelCustomerRequest(id, status);
      return Right(cancelCustomerRequestResponse);
    } on AppException catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
