import 'package:injectable/injectable.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/graphql_client.dart';
import 'package:task/features/Requests/data/models/requests_response/requests_response.dart';
import 'package:task/features/Requests/data/models/requests_response/save_customer_request.dart';

abstract class RequestsDataSource {
  Future<SaveCustomerRequest> saveCustomerRequest(String? date, String? payeeName,
      String? notes, String? deliveryTypeCode, String? typeCode);
}

@Singleton(as: RequestsDataSource)
class RequestsDataSourceImpl implements RequestsDataSource {
  final GraphQLService _graphQLService;

  RequestsDataSourceImpl(this._graphQLService);
  @override
  Future<SaveCustomerRequest> saveCustomerRequest(String? date, String? payeeName,
      String? notes, String? deliveryTypeCode, String? typeCode) async {
    const String saveCustomerRequestMutation = """
      mutation SaveCustomerRequest(\$input: CustomerRequestInput!) {
  saveCustomerRequest(input: \$input) {  
  date
  id
  status {
    name
  }
  payeeName
  type {
    name
  }
  deliveryType {
    name
  }
 
  notes
    payeeName
    date
  }
}
    """;

    final variables = {
      'input': {
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
        if (result.exception!.linkException != null) {
          throw ('Network error: ${result.exception!.linkException.toString()}');
        } else if (result.exception!.graphqlErrors.isNotEmpty) {
          final errorMessage = result.exception!.graphqlErrors.first.message;
          throw ('GraphQL error: $errorMessage');
        }
        throw (result.exception.toString());
      }

      return SaveCustomerRequest.fromJson(result.data!['saveCustomerRequest']);
    } on AppException catch (e) {
      throw (e.toString());
    } catch (e) {
      throw (e.toString());
    }
  }
}
