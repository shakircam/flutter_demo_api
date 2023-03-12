import 'dart:async';

import 'package:get/get.dart';

import '../../network/exceptions/api_exception.dart';
import '../../network/exceptions/app_exception.dart';
import '../../network/exceptions/json_format_exception.dart';
import '../../network/exceptions/network_exception.dart';
import '../../network/exceptions/not_found_exception.dart';
import '../../network/exceptions/service_unavailable_exception.dart';
import '../../network/exceptions/unauthorize_exception.dart';

class BaseController extends GetxController{

  // ignore: long-parameter-list
  dynamic callDataService<T>(
      Future<T> future, {
        Function(Exception exception)? onError,
        Function(T response)? onSuccess,
        Function? onStart,
        Function? onComplete,
      }) async {
    Exception? _exception;

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
     //show message
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      // show error message
    } on TimeoutException catch (exception) {
      _exception = exception;
      //
    } on NetworkException catch (exception) {
      _exception = exception;
      //
    } on JsonFormatException catch (exception) {
      _exception = exception;
     //
    } on NotFoundException catch (exception) {
      _exception = exception;
      //
    } on ApiException catch (exception) {
      _exception = exception;
    } on AppException catch (exception) {
      _exception = exception;
      //
    } catch (error) {
      _exception = AppException(message: "$error");
    }

    if (onError != null) onError(_exception);

  }
}