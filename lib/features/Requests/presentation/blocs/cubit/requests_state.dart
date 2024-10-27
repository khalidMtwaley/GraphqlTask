part of 'requests_cubit.dart';

@immutable
sealed class RequestsState {}

final class RequestsInitial extends RequestsState {}

class SaveCustomerRequestLoading extends RequestsState {}

class SaveCustomerRequestSuccess extends RequestsState {
  final SaveCustomerRequest RequestDeatails;

  SaveCustomerRequestSuccess(this.RequestDeatails);
}

class SaveCustomerRequestFailed extends RequestsState {
  final String message;

  SaveCustomerRequestFailed(this.message);
}

class CancelCustomerRequestLoading extends RequestsState {}

class CancelCustomerRequestSuccess extends RequestsState {
  final UpdateCustomerRequestStatus Request;

  CancelCustomerRequestSuccess(this.Request);
}

class CancelCustomerRequestFailed extends RequestsState {
  final String message;

  CancelCustomerRequestFailed(this.message);
}

class GetAllRequestsLoading extends RequestsState {
  final bool isLoadMore;
  GetAllRequestsLoading({this.isLoadMore = false});
}

class GetAllRequestsSuccess extends RequestsState {
  final bool hasMore;

  final List <RequestModel >allRequests;

  GetAllRequestsSuccess(this.allRequests, {this.hasMore = true});
}

class GetAllRequestsFailed extends RequestsState {
  final String message;

  GetAllRequestsFailed(this.message);
}
class UpdateCustomerRequestLoading extends RequestsState {}
class UpdateCustomerRequestSuccess extends RequestsState {
  final SaveCustomerRequest Request;

  UpdateCustomerRequestSuccess(this.Request);
}
class UpdateCustomerRequestFailed extends RequestsState {
  final String message;

  UpdateCustomerRequestFailed(this.message);
}
