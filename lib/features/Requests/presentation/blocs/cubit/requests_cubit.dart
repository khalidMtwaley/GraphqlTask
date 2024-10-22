import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
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
}
