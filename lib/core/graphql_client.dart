
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/cache/Hive_helper.dart';

class LoggingLink extends Link {
  LoggingLink() : super();

  @override
  Stream<Response> request(Request operation, [NextLink? forward]) {
    log("Requesting GraphQL: ${operation.operation.operationName}");
    log("Request Key: ${operation.toString()}");
    if (operation.variables.isNotEmpty) {
      log("Variables: ${operation.variables}");
    }

    if (forward != null) {
      return forward(operation).map((response) {
        log("Response: ${response.data}");
        if (response.errors != null) {
          log("Errors: ${response.errors}");
        }
        return response;
      });
    } else {
      return const Stream.empty();
    }
  }
}

@singleton
class GraphQLService {
  final GraphQLClient client;

  GraphQLService._(this.client);

  factory GraphQLService() {
    final HttpLink httpLink =
        HttpLink('https://accurate.accuratess.com:8001/graphql');

    final AuthLink authLink = AuthLink(
      getToken: () async {
        String? token = await HiveHelper.getBearerToken();
        log("////////////////////////////////////////////// $token");
        return token != null ? "Bearer $token" : null;
      },
    );

    final LoggingLink loggingLink = LoggingLink();

    final GraphQLCache cache = GraphQLCache();

    final Link link = authLink.concat(loggingLink).concat(httpLink);

    return GraphQLService._(
      GraphQLClient(
        cache: cache,
        defaultPolicies: DefaultPolicies(
          query: Policies.safe(
            FetchPolicy.cacheAndNetwork,
            ErrorPolicy.none,
            CacheRereadPolicy.mergeOptimistic,
          ),
        ),
        link: link,
      ),
    );
  }

  Future<QueryResult> performMutation(String mutation,
      {Map<String, dynamic>? variables}) async {
    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: variables ?? {},
    );

    return await client.mutate(options);
  }
}
