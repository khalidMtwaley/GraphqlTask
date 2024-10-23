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