import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:task/core/cache/Hive_helper.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/graphql_client.dart';
import 'package:task/features/Auth/data/models/login_response/login.dart';

abstract class AuthDataSource {
  Future<Login> login(String? username, String? password);
}

@Singleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final GraphQLService _graphQLService;

  AuthDataSourceImpl(this._graphQLService);

  @override
  Future<Login> login(String? username, String? password) async {
    const String loginMutation = """
      mutation Login(\$input: LoginInput!) {
        login(input: \$input) {
          token
          user {
            username
          }
        }
      }
    """;

    final variables = {
      'input': {
        'username': username,
        'password': password,
      }
    };

    try {
      final result = await _graphQLService.performMutation(loginMutation,
          variables: variables);

      if (result.hasException) {
        if (result.exception!.linkException != null) {
          throw ('Network error: ${result.exception!.linkException.toString()}');
        } else if (result.exception!.graphqlErrors.isNotEmpty) {
          final errorMessage = result.exception!.graphqlErrors.first.message;
          throw ('GraphQL error: $errorMessage');
        }
        throw (result.exception.toString());
      }

      final token = result.data!['login']['token'];
      await HiveHelper.saveBearerToken(token);
      return Login.fromJson(result.data!['login']);
    } on AppException catch (e) {
      throw (e.toString());
    } catch (e) {
      throw (e.toString());
    }
  }
}
