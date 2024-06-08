import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ps5_99/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) => getIt.init(environment: env);
