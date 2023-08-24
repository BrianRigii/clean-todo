import 'package:clean_todo/core/configs/logger.dart';
import 'package:clean_todo/core/errors/exceptions.dart';

abstract class Failure {}

class InvalidFormatFailure extends Failure {
  final FormatException formatException;

  InvalidFormatFailure(this.formatException);
}

class ServerFailure extends Failure {
  final ServerException? serverException;
  final String message;

  ServerFailure({this.serverException, required this.message});
}

class UnexpectedFailure extends Failure {
  final String message;
  final Exception exception;
  final StackTrace stackTrace;

  UnexpectedFailure(this.message,
      {required this.exception, required this.stackTrace}) {
    logger.e(message, error: exception, stackTrace: stackTrace);
  }
}
