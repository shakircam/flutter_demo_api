import 'package:dio/dio.dart';

import '../core/utils/constants.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    var customHeaders = {'Accept': 'application/json'};
    customHeaders.addAll({
      'Authorization': 'Bearer ${Constants.token}'
    });
    return customHeaders;
  }
}


