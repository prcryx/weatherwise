import 'package:http/http.dart' as http;

import '../../../constants/api_constant.dart';
import 'http_utils.dart';


class HttpClient {
  final String apiPath;
  Map<String, String> header;
  late http.Client _client;

  HttpClient()
      : _client = http.Client(),
        apiPath = ApiConstants.apiPath,
        header = {
          ApiConstants.contentType: ApiConstants.jsonContentType,
        };

  dynamic get(
    String path, {
    Map<String, String> overrideHeader = const {},
  }) async {
    final requestHeader = {
      ...header,
      ...overrideHeader,
      // ...getRequestIdHeader()
    };
    final response = await _client.get(
      HttpUtils.getParsedUrl(apiPath, path),
      headers: requestHeader,
    );
    return HttpUtils.getResponse(response);
  }
}
