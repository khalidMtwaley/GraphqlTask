import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:task/features/Requests/data/models/all_requests_response/all_requests_response/list_customer_requests.dart';
import 'package:task/features/Requests/data/models/all_requests_response/all_requests_response/request_model.dart';
import 'package:task/features/Requests/data/models/cancel_request_response/cancel_request_response/update_customer_request_status.dart';
import 'package:task/features/Requests/data/models/save_requests_response/requests_response.dart';
import 'package:task/features/Requests/data/models/save_requests_response/save_customer_request.dart';
import 'package:task/features/Requests/data/repository_impl/requests_repo.dart';

part 'requests_state.dart';

@injectable
class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit(this._requestsRepo) : super(RequestsInitial());
  final RequestsRepo _requestsRepo;
  int currentPage = 1;
  bool hasMore = true;
  bool isLoadingMore = false;
  List<RequestModel> allRequests = [];



  Future<void> getAllRequests({
    String? codeType,
    bool isLoadMore = false,
  }) async {
    if (isLoadMore && (!hasMore || isLoadingMore)) return;

    if (isLoadMore) {
      isLoadingMore = true;
    } else {
      emit(GetAllRequestsLoading());
    }

    final response = await _requestsRepo.getAllRequests(currentPage, codeType);
    response.fold(
      (failure) => emit(GetAllRequestsFailed(failure.message)),
      (requests) {
        // نفس القيمه  في الداتا سورس
        if (requests.length < 15) {  
          hasMore = false;
        } else {
          currentPage++; 
        }

        allRequests.addAll(requests);
        emit(GetAllRequestsSuccess(allRequests, hasMore: hasMore));
        isLoadingMore = false;
      },
    );
  }

  // Future<void> saveCustomerRequest(

  //     {
  //       String? date,
  //     String? payeeName,
  //     String? notes,
  //     String? deliveryTypeCode,
  //     String? typeCode}) async {
  //   emit(SaveCustomerRequestLoading());
  //   final response = await _requestsRepo.saveCustomerRequest(

  //     date, payeeName, notes, deliveryTypeCode, typeCode);
  //   response.fold(
  //     (faluire) => emit(SaveCustomerRequestFailed(faluire.message)),
  //     (requestt) {
  //       emit(SaveCustomerRequestSuccess(requestt));
  //     },
  //   );
  // }
    Future<void> saveCustomerRequest({
    String? date,
    String? payeeName,
    String? notes,
    String? deliveryTypeCode,
    String? typeCode,
  }) async {
    emit(SaveCustomerRequestLoading());
    final response = await _requestsRepo.saveCustomerRequest(
        date, payeeName, notes, deliveryTypeCode, typeCode);
    response.fold(
      (failure) => emit(SaveCustomerRequestFailed(failure.message)),
      (request) => emit(SaveCustomerRequestSuccess(request)),
    );
  }

  Future<void> cancelCustomerRequest({int? id, String? status}) async {
    emit(CancelCustomerRequestLoading());
    final response = await _requestsRepo.cancelCustomerRequest(id, status);
    response.fold(
      (faluire) => emit(CancelCustomerRequestFailed(faluire.message)),
      (request) {
        emit(CancelCustomerRequestSuccess(request));
      },
    );
  }
  // Future<void> updateCustomerRequest(
  //     {int? id,
  //       String? date,
  //       String? payeeName,
  //       String? notes,
  //       String? deliveryTypeCode,
  //       String? typeCode}) async {
  //   emit(UpdateCustomerRequestLoading());
  //   final response = await _requestsRepo.updateCustomerRequest(
  //       id, date, payeeName, notes, deliveryTypeCode, typeCode);
  //   response.fold(
  //         (faluire) => emit(UpdateCustomerRequestFailed(faluire.message)),
  //         (request) {
  //       emit(UpdateCustomerRequestSuccess(request));
  //     },
  //   );
  // }

  Future<void> updateCustomerRequest({
    int? id,
    String? date,
    String? payeeName,
    String? notes,
    String? deliveryTypeCode,
    String? typeCode,
  }) async {
    emit(UpdateCustomerRequestLoading());
    final response = await _requestsRepo.updateCustomerRequest(
        id, date, payeeName, notes, deliveryTypeCode, typeCode);
    response.fold(
      (failure) => emit(UpdateCustomerRequestFailed(failure.message)),
      (request) => emit(UpdateCustomerRequestSuccess(request)),
    );
  }
}
