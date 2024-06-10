import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:ps5_99/common/app_locale.dart';

@GenerateNiceMocks([MockSpec<BuildContext>()])
void main() {
  group('AppLocale', () {
    test('toLocale returns correct locale', () {
      expect(AppLocale.english.toLocale, const Locale('en', 'US'));
      expect(AppLocale.indonesian.toLocale, const Locale('id', 'ID'));
    });

    test('toLanguageTag returns correct language tag', () {
      expect(AppLocale.english.toLanguageTag, 'en-US');
      expect(AppLocale.indonesian.toLanguageTag, 'id-ID');
    });
  });
}
