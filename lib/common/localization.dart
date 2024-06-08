import 'package:easy_localization/easy_localization.dart';
import 'package:ps5_99/generated/codegen_loader.g.dart';

// ignore: camel_case_types
typedef cw = LocaleKeys;

extension LocaleKeysExt on String {
  String get t => tr(this);
}
