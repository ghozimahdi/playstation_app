import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

extension DateTimeExtensions on DateTime {
  String formatWithLocale(BuildContext context) {
    return DateFormat(
      'd MMMM yyyy',
      Localizations.localeOf(context).toString(),
    ).format(this);
  }
}
