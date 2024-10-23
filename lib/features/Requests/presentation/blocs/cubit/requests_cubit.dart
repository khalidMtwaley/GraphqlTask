import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:task/features/Requests/data/models/cancel_request_response/cancel_request_response/update_customer_request_status.dart';
import 'package:task/features/Requests/data/models/requests_response/requests_response.dart';
import 'package:task/features/Requests/data/models/requests_response/save_customer_request.dart';
import 'package:task/features/Requests/data/repository_impl/requests_repo.dart';

part 'requests_state.dart';

@injectable
class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit(this._requestsRepo) : super(RequestsInitial());
  final RequestsRepo _requestsRepo;
  List<SaveCustomerRequest> allRequests = [];
  Future<void> saveCustomerRequest(
      {String? date,
      String? payeeName,
      String? notes,
      String? deliveryTypeCode,
      String? typeCode}) async {
    emit(SaveCustomerRequestLoading());
    final response = await _requestsRepo.saveCustomerRequest(
        date, payeeName, notes, deliveryTypeCode, typeCode);
    response.fold(
      (faluire) => emit(SaveCustomerRequestFailed(faluire.message)),
      (requestt) {
        allRequests.add(requestt);
        emit(SaveCustomerRequestSuccess(requestt));
      },
    );
  }
  Future<void> cancelCustomerRequest({int? id, String? status}) async {
    emit(CancelCustomerRequestLoading());
    final response = await _requestsRepo.cancelCustomerRequest(id, status);
    response.fold(
      (faluire) => emit(CancelCustomerRequestFailed(faluire.message)),
      (request) {
              allRequests.removeWhere((r) => r.id == id);

        emit(CancelCustomerRequestSuccess(request));
      },
    );
  }
}
