import 'package:clean_todo/core/errors/failures.dart';

sealed class Either<L extends Failure, R> {
  const Either();

  fold(Function(Failure) left, Function(R) right) {
    if (this is Left) {
      return left((this as Left).failure);
    } else if (this is Right) {
      return right((this as Right).value);
    }
  }
}

final class Left<L extends Failure, R> extends Either<L, R> {
  final L failure;

  const Left(this.failure);
}

final class Right<L extends Failure, R> extends Either<L, R> {
  final R value;
  const Right(this.value);
}
