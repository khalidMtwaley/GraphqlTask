import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/features/Auth/data/data_sources/auth_data_source.dart';
import 'package:task/features/Auth/data/models/login_response/login.dart';

abstract class AuthRepo {
  Future<Either<Failure, Login>> login(String? username, String? password);
}

@Singleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepoImpl(this._authDataSource);

  @override
  Future<Either<Failure, Login>> login(
      String? username, String? password) async {
    try {
      final loginResponse = await _authDataSource.login(username, password);
      return Right(loginResponse);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
