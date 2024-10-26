import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/features/Requests/data/models/all_requests_response/all_requests_response/list_customer_requests.dart';
import 'package:task/features/Requests/data/models/all_requests_response/all_requests_response/request_model.dart';
import 'package:task/features/Requests/data/models/cancel_request_response/cancel_request_response/update_customer_request_status.dart';
import 'package:task/features/Requests/data/data_source/requests_data_source.dart';
import 'package:task/features/Requests/data/models/save_requests_response/requests_response.dart';
import 'package:task/features/Requests/data/models/save_requests_response/save_customer_request.dart';

abstract class RequestsRepo {
  Future <Either<Failure,List <RequestModel>>>getAllRequests(int? page, String? codeType);
  Future<Either<Failure, SaveCustomerRequest>> saveCustomerRequest(
      String? date,
      String? payeeName,
      String? notes,
      String? deliveryTypeCode,
      String? typeCode);
  Future<Either<Failure, SaveCustomerRequest>> updateCustomerRequest(
    int? id,
      String? date,
      String? payeeName,
      String? notes,
      String? deliveryTypeCode,
      String? typeCode);

  Future<Either<Failure, UpdateCustomerRequestStatus>> cancelCustomerRequest(
      int? id, String? status);
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
  Future<Either<Failure, UpdateCustomerRequestStatus>> cancelCustomerRequest(
      int? id, String? status) async {
    try {
      final cancelCustomerRequestResponse =
          await _requestsDataSource.cancelCustomerRequest(id, status);
      return Right(cancelCustomerRequestResponse);
    } on AppException catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future  <Either<Failure, List <RequestModel>>>getAllRequests(int? page, String? codeType)async {
    try {
      final allRequestsResponse =await _requestsDataSource.getAllRequests(page,  codeType);
      return Right(allRequestsResponse);
    } on AppException catch (e) {
      return Left(Failure(e.toString()));
    }
    }
    
      @override
      Future<Either<Failure, SaveCustomerRequest>> updateCustomerRequest(int? id, String? date, String? payeeName, String? notes, String? deliveryTypeCode, String? typeCode)async {
      try {
      final UpdateCustomerRequestResponse =
          await _requestsDataSource.updateCustomerRequest(
            id,
              date, payeeName, notes, deliveryTypeCode, typeCode);
      return Right(UpdateCustomerRequestResponse);
    } on AppException catch (e) {
      return Left(Failure(e.toString()));
    }
      }
  }

