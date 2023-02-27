import 'package:flutter/foundation.dart';

import 'logger.dart';

class ErrorHandler {
  static void init() {
    FlutterError.onError = _recordFlutterError;
    PlatformDispatcher.instance.onError = (error, stack) {
      recordError(error, stack);
      return true;
    };
    logger.i('ErrorHandler initialized');
  }

  static Future<void> recordError(Object error, StackTrace stackTrace) async {
    logger.e(
      error.toString(),
      error,
      stackTrace,
    );
    // TODO add firebase report
  }

  static Future<void> _recordFlutterError(FlutterErrorDetails error) async {
    FlutterError.presentError(error);
    final asString = error.exceptionAsString();
    logger.e(
      asString,
      error.exception,
      error.stack,
    );
    // TODO add firebase report
  }

  const ErrorHandler._();
}
