import 'package:clean_todo/core/errors/failures.dart';

sealed class Either<L extends Failure, R> {
  const Either();
}

final class Left<L extends Failure, R> extends Either<L, R> {
  final L failure;

  const Left(this.failure);
}

final class Right<L extends Failure, R> extends Either<L, R> {
  final R value;
  const Right(this.value);
}
