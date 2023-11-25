
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpUtils {
  static Uri getParsedUrl(String host, String path) {
    return Uri.parse('$host$path');
  }

  static dynamic getResponse(http.Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
      case HttpStatus.noContent:
        return _getSuccessResponse(response);

      case HttpStatus.internalServerError:
      case HttpStatus.serviceUnavailable:
      case HttpStatus.badGateway:
      case HttpStatus.badRequest:
      default:
        final decodedResponse = json.decode(response.body);
        throw HttpException(
          "Error Occurred: $decodedResponse",
        );
    }
  }

  static dynamic _getSuccessResponse(http.Response response) {
    Map<String, dynamic> responseJson = <String, dynamic>{};
    if (response.body.isNotEmpty == true) {
      final jsonResponseBody = json.decode(response.body);
      if (jsonResponseBody is Map<String, dynamic>) {
        responseJson.addAll(json.decode(response.body));
      } else {
        return jsonResponseBody;
      }
    }
    return responseJson;
  }
}
