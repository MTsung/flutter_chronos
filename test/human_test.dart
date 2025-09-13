import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_chronos/flutter_chronos.dart';

void main() {
  group('ChronosHuman', () {
    test('diffForHumans returns human-readable string', () {
      final now = Chronos.now();
      final pastDate = now.subHours(2);
      final futureDate = now.addDays(1);

      final pastResult = pastDate.diffForHumans();
      final futureResult = futureDate.diffForHumans(allowFromNow: true);

      expect(pastResult, contains('ago'));
      expect(futureResult, contains('from now'));
    });

    test('diffForHumans works with different locales', () {
      final now = Chronos.now();
      final pastDate = now.subHours(2);

      final englishResult = pastDate.diffForHumans(locale: 'en');
      final spanishResult = pastDate.diffForHumans(locale: 'es');
      final frenchResult = pastDate.diffForHumans(locale: 'fr');

      expect(englishResult, contains('ago'));
      expect(spanishResult, contains('hace'));
      expect(frenchResult, contains('il y a'));
    });

    test('diffForHumans works with short locales', () {
      final now = Chronos.now();
      final pastDate = now.subHours(2);

      final shortResult = pastDate.diffForHumans(locale: 'en_short');

      expect(shortResult, isNotEmpty);
      expect(shortResult.length, lessThan(10));
    });

    test('diffForHumans with custom clock', () {
      final baseTime = Chronos(2024, 3, 15, 12, 0, 0);
      final testTime = baseTime.subHours(3);

      final result = testTime.diffForHumans(clock: baseTime);

      expect(result, contains('3'));
      expect(result, contains('ago'));
    });

    test('diffForHumans handles various time units', () {
      final now = Chronos.now();

      final minutesAgo = now.subMinutes(30);
      final hoursAgo = now.subHours(5);
      final daysAgo = now.subDays(3);

      expect(minutesAgo.diffForHumans(), contains('minutes'));
      expect(hoursAgo.diffForHumans(), contains('hours'));
      expect(daysAgo.diffForHumans(), contains('days'));
    });
  });
}
