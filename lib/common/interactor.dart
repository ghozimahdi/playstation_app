import 'package:ps5_99/common/result.dart';

abstract class Interactor<P, R> {
  Future<Result<R>> call(P params) async {
    return runCatching(() => doWork(params));
  }

  Future<R> doWork(P params);
}
