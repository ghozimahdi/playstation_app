import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

enum AppLocale {
  english,
  indonesian;

  Locale get toLocale {
    switch (this) {
      case AppLocale.english:
        return const Locale('en', 'US');
      case AppLocale.indonesian:
        return const Locale('id', 'ID');
      default:
        return const Locale('en', 'US');
    }
  }

  String get toLanguageTag {
    switch (this) {
      case AppLocale.english:
        return 'en-US';
      case AppLocale.indonesian:
        return 'id-ID';
      default:
        return 'en-US';
    }
  }

  static Future<void> setLocale(
    AppLocale appLocale,
    BuildContext context,
  ) async {
    await context.setLocale(appLocale.toLocale);
  }
}
