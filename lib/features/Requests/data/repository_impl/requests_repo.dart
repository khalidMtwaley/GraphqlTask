import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/features/Requests/data/models/requests_response/requests_data_source.dart';
import 'package:task/features/Requests/data/models/requests_response/requests_response.dart';
import 'package:task/features/Requests/data/models/requests_response/save_customer_request.dart';

abstract class RequestsRepo {
  Future<Either<Failure, SaveCustomerRequest>> saveCustomerRequest(String ?date, String? payeeName, String ?notes, String ?deliveryTypeCode, String? typeCode);
}

@Singleton(as: RequestsRepo)
class RequestsRepoImpl implements RequestsRepo {
  final RequestsDataSource _requestsDataSource;

  RequestsRepoImpl(this._requestsDataSource);

  @override
  Future<Either<Failure, SaveCustomerRequest>> saveCustomerRequest(
      String? date, String? payeeName, String? notes, String? deliveryTypeCode, String? typeCode) async {
    try {
      final saveCustomerRequestResponse = await _requestsDataSource.saveCustomerRequest(date, payeeName, notes, deliveryTypeCode, typeCode);
      return Right(saveCustomerRequestResponse);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}