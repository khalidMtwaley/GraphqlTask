import 'package:injectable/injectable.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/graphql_client/graphql_client.dart';
import 'package:task/features/Requests/data/models/all_requests_response/all_requests_response/list_customer_requests.dart';
import 'package:task/features/Requests/data/models/all_requests_response/all_requests_response/request_model.dart';
import 'package:task/features/Requests/data/models/cancel_request_response/cancel_request_response/update_customer_request_status.dart';
import 'package:task/features/Requests/data/models/save_requests_response/save_customer_request.dart';

abstract class RequestsDataSource {
  Future<SaveCustomerRequest> saveCustomerRequest(
    int ?bankId,
    String ?accountNumber,

      String? date,
      String? payeeName,
      String? notes,
      String? deliveryTypeCode,
      String? typeCode);
  Future<SaveCustomerRequest> updateCustomerRequest(
      int? id,
      String? date,
      String? payeeName,
      String? notes,
      String? deliveryTypeCode,
      String? typeCode);
  Future<UpdateCustomerRequestStatus> cancelCustomerRequest(
      int? id, String? status);
  Future<List<RequestModel>> getAllRequests(int? page, String? codeType);
}

@Singleton(as: RequestsDataSource)
class RequestsDataSourceImpl implements RequestsDataSource {
  final GraphQLService _graphQLService;

  RequestsDataSourceImpl(this._graphQLService);

  @override
  Future<SaveCustomerRequest> saveCustomerRequest(
    int ?bankId,
    String ?accountNumber,
      String? date,
      String? payeeName,
      String? notes,
      String? deliveryTypeCode,
      String? typeCode) async {
    const String saveCustomerRequestMutation = """
      mutation SaveCustomerRequest(\$input: CustomerRequestInput!) {
        saveCustomerRequest(input: \$input) {  
  
          id
         }
         }
    """;

    final variables = {
      'input': {
        'paymentBankId': bankId??null,
        'paymentAccountNumber': accountNumber??null,
        'date': date,
        'payeeName': payeeName,
        'notes': notes,
        'deliveryTypeCode': deliveryTypeCode,
        'typeCode': typeCode,
      }
    };

    try {
      final result = await _graphQLService
          .performMutation(saveCustomerRequestMutation, variables: variables);

      if (result.hasException) {
        final exception = result.exception;
        final errorMessage = exception?.graphqlErrors.isNotEmpty == true
            ? exception!.graphqlErrors.first.message
            : exception?.linkException?.toString();
        throw ('GraphQL error: $errorMessage');
      }

      return SaveCustomerRequest.fromJson(result.data!['saveCustomerRequest']);
    } on AppException catch (e) {
      throw (e.toString());
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<UpdateCustomerRequestStatus> cancelCustomerRequest(
      int? id, String? status) async {
    const String cancelCustomerRequestMutation = """
      mutation UpdateCustomerRequestStatus(\$input: UpdateCustomerRequestStatusInput!) {
        updateCustomerRequestStatus(input: \$input) {
          id
        }
      }
    """;

    final variables = {
      'input': {
        'id': id,
        'statusCode': status,
      }
    };

    try {
      final result = await _graphQLService
          .performMutation(cancelCustomerRequestMutation, variables: variables);

      if (result.hasException) {
        final exception = result.exception;
        final errorMessage = exception?.graphqlErrors.isNotEmpty == true
            ? exception!.graphqlErrors.first.message
            : exception?.linkException?.toString();
        throw ('GraphQL error: $errorMessage');
      }

      return UpdateCustomerRequestStatus.fromJson(
          result.data!['updateCustomerRequestStatus']);
    } on AppException catch (e) {
      throw (e.toString());
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<List<RequestModel>> getAllRequests(int? page, String? codeType) async {
    const String listCustomerRequestsQuery = """
      query ListCustomerRequests(\$input: ListCustomerRequestFilterInput!, \$first: Int!, \$page: Int) {
        listCustomerRequests(input: \$input, first: \$first, page: \$page) {
          data {
            id
            payeeName
            date
            notes
            createdAt
            type {
              name
              code
            }
            deliveryType {
              name
              code
            }
            status {
              name
              code
            }
          }
        }
      }
    """;

    final variables = {
      'input': {
        'typeCode': codeType,
      },
      'first': 15,
      'page': page,
    };

    try {
      final result = await _graphQLService
          .performQuery(listCustomerRequestsQuery, variables: variables);

      if (result.hasException) {
        final exception = result.exception;
        final errorMessage = exception?.graphqlErrors.isNotEmpty == true
            ? exception!.graphqlErrors.first.message
            : exception?.linkException?.toString();
        throw ('GraphQL error: $errorMessage');
      }

      final data =
          result.data!['listCustomerRequests']['data'] as List<dynamic>;
      return data
          .map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on AppException catch (e) {
      throw (e.toString());
    } catch (e) {
      throw (e.toString());
    }
  }
  
  @override
  Future<SaveCustomerRequest> updateCustomerRequest(int? id, String? date, String? payeeName, String? notes, String? deliveryTypeCode, String? typeCode)async {
   const String updateCustomerRequestMutation = """
      mutation SaveCustomerRequest(\$input: CustomerRequestInput!) {
        saveCustomerRequest(input: \$input) {  
  
          id
         }
         }
    """;

    final variables = {
      'input': {
        "id": id,
        'date': date,
        'payeeName': payeeName,
        'notes': notes,
        'deliveryTypeCode': deliveryTypeCode,
        'typeCode': typeCode,
      }
    };

    try {
      final result = await _graphQLService
          .performMutation(updateCustomerRequestMutation, variables: variables);

      if (result.hasException) {
        final exception = result.exception;
        final errorMessage = exception?.graphqlErrors.isNotEmpty == true
            ? exception!.graphqlErrors.first.message
            : exception?.linkException?.toString();
        throw ('GraphQL error: $errorMessage');
      }

      return SaveCustomerRequest.fromJson(result.data!['saveCustomerRequest']);
    } on AppException catch (e) {
      throw (e.toString());
    } catch (e) {
      throw (e.toString());
    }
  }
}
