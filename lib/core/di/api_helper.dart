// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:task/core/cache/Hive_helper.dart';

// @module
// abstract class ApiHelper {
//   @lazySingleton
//   HiveHelper get hiveHelper => HiveHelper();

//   @lazySingleton
//   Dio get dio {
//     final dio = Dio(
//       BaseOptions(
//         // baseUrl: APIConstants.baseURL,
//         receiveDataWhenStatusError: true,
//       ),
//     );

//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         error: true,
//         compact: true,
//         maxWidth: 90,
//         enabled: kDebugMode,
//         filter: (options, args) {
//           // Don't print requests with URIs containing '/posts'
//           if (options.path.contains('/posts')) {
//             return false;
//           }
//           // Don't print responses with Uint8List data
//           return !args.isResponse || !args.hasUint8ListData;
//         },
//       ),
//     );

//     // Interceptor for adding headers and logging additional information
//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           // Retrieve token and language code using HiveHelper
//           final token = await HiveHelper.getBearerToken();
//           final languageCode = await HiveHelper.getLanguageCode();

//           // Add Accept-Language header
//           options.headers['Accept-Language'] = languageCode;
//           log('Language Code: $languageCode');

//           // Add Authorization token if available
//           if (token != null) {
//             // options.headers[APIConstants.BearerTokenKey] = "Bearer $token";
//             log('Authorization Token: $token');
//           }

//           // Log request URL and headers
//           log('Request URL: ${options.uri.toString()}');
//           log('Request Headers: ${options.headers.toString()}');

//           return handler.next(options);
//         },
//         onResponse: (response, handler) {
//           // Check for 302 status code to log the redirect URL
//           if (response.statusCode == 302) {
//             final redirectUrl = response.headers.value('location');
//             log('Received 302 Redirect to: $redirectUrl');
//           }

//           return handler.next(response);
//         },
//         onError: (DioError e, handler) {
//           // Log detailed error information
//           log('DioError: ${e.message}');
//           if (e.response != null) {
//             log('Error Response Data: ${e.response?.data}');
//             log('Error Response Headers: ${e.response?.headers}');
//           }
//           return handler.next(e);
//         },
//       ),
//     );

//     // Disable automatic redirects to handle them manually for debugging
//     dio.options.followRedirects = false;
//     dio.options.validateStatus = (status) {
//       return status != null &&
//           status < 500; // Accept all status codes less than 500
//     };

//     return dio;
//   }
// }
