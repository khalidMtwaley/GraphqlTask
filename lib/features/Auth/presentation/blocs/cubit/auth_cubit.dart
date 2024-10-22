import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task/features/Auth/data/repositories_impl/auth_repo.dart';
import 'package:task/features/Auth/presentation/blocs/cubit/auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(
    this._authRepo,
  ) : super(AuthInitial());
  String? username;
  String? lat;
  String? long;
  String? adress;
  String? avatar;

  Future<void> login({String? username, String? password}) async {
    emit(LoginLoading());
    final result = await _authRepo.login(username, password);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (user) => emit(LoginSucces(user)),
    );
  }
}
