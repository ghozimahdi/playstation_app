import 'dart:async';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:ps5_99/app_router.dart';
import 'package:ps5_99/common/app_locale.dart';
import 'package:ps5_99/design_system/themes.dart';
import 'package:ps5_99/injection.dart';

Future<void> mainCommon(String env) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();

  await dotenv.load();
  configureInjection(env);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if (env == Environment.prod) {
    runZonedGuarded(
      () async {
        runApp(
          EasyLocalization(
            supportedLocales: AppLocale.values.map((e) => e.toLocale).toList(),
            path: 'assets/translations',
            fallbackLocale: AppLocale.indonesian.toLocale,
            child: MyApp(),
          ),
        );
      },
      (error, stack) async {},
    );
  } else {
    runApp(
      EasyLocalization(
        supportedLocales: AppLocale.values.map((e) => e.toLocale).toList(),
        path: 'assets/translations',
        fallbackLocale: AppLocale.indonesian.toLocale,
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: ScreenUtilInit(
        // ignore: avoid_redundant_argument_values
        designSize: ScreenUtil.defaultSize,
        child: MaterialApp.router(
          routerConfig: _appRouter.config(
            navigatorObservers: () => [
              ChuckerFlutter.navigatorObserver,
            ],
          ),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: child,
              ),
            );
          },
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: ThemeMode.light,
          theme: lightTheme,
        ),
      ),
    );
  }
}
