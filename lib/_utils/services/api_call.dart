import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../constants/app_constants.dart';
import '../constants/enums.dart';
import '../entities/api_response.dart';

class ApiCall<T> {
  Future<APIResponse<T>> handleApi({
    required String endpoint,
    Map<String, String>? headers,
    Object? body,
    Uri? fullUri,
    ApiCallType callType = ApiCallType.GET,
    required Future<Either<Failure, T>> Function(Map responseBody)
        handleSuccess,
    Future<Either<Failure, T>> Function(Map responseBody)? handleError,
  }) async {
    if (isConnected) {
      headers ??= {
        "Content-Type": "application/json",
      };

      try {
        late http.Response response;
        final uri = fullUri ??
            Uri.parse(
                "${envConfig.apiBaseUrl}/$endpoint?api_key=${envConfig.apiKey}&language=${envConfig.language}");

        if (body != null) {
          body = jsonEncode(body);
        }

        if (callType == ApiCallType.GET) {
          response = await http.get(
            uri,
            headers: headers,
          );
        }
        if (callType == ApiCallType.POST) {
          response = await http.post(
            uri,
            headers: headers,
            body: body,
          );
        }
        if (callType == ApiCallType.PUT) {
          response = await http.put(
            uri,
            headers: headers,
            body: body,
          );
        }
        if (callType == ApiCallType.DELETE) {
          response = await http.delete(
            uri,
            headers: headers,
            body: body,
          );
        }

        final responseBody = jsonDecode(response.body) as Map;

        log("response($endpoint): $responseBody");

        if (response.statusCode == 200) {
          final result = await handleSuccess(responseBody);
          return result;
        } else {
          if (handleError != null) {
            return handleError(responseBody);
          } else {
            return left(Failure(
              code: response.statusCode,
              response: "Some error occurred!",
            ));
          }
        }
      } on SocketException catch (_) {
        return left(Failure(
          code: 601,
          response: "No intrnet connection. Please try again!",
        ));
      } catch (e) {
        return left(Failure(code: 601, response: e.toString()));
      }
    } else {
      return left(Failure(
        code: 601,
        response: "No intrnet connection. Please try again!",
      ));
    }
  }
}
