import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:ps5_99/common/failure.dart';

typedef Result<T> = Either<Failure, T>;

Future<Result<R>> runCatching<R>(
  Future<R> Function() doWork,
) async {
  try {
    final result = await doWork();
    return right(result);
  } catch (e, stackTrace) {
    if (kDebugMode) {
      print('Exception: $e');
      print('Stack trace: $stackTrace');
    }

    final failure = await Failure.fromException(e);
    return left(failure);
  }
}
