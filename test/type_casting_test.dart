import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateTime to Chronos Conversion', () {
    test('toChronos extension method', () {
      final dateTime = DateTime(2024, 2, 29, 14, 30, 45, 500, 750);
      final chronos = dateTime.toChronos();

      expect(chronos, isA<Chronos>());
      expect(chronos.year, 2024);
      expect(chronos.month, 2);
      expect(chronos.day, 29);
      expect(chronos.hour, 14);
      expect(chronos.minute, 30);
      expect(chronos.second, 45);
      expect(chronos.millisecond, 500);
      expect(chronos.microsecond, 750);
    });

    test('conversion preserves timezone', () {
      // Test local timezone preservation
      final localDateTime = DateTime(2024, 2, 29, 14, 30, 45);
      final localChronos = localDateTime.toChronos();

      expect(localChronos.isUtc, false);
      expect(localChronos.timeZoneOffset, localDateTime.timeZoneOffset);

      // Test UTC timezone preservation
      final utcDateTime = DateTime.utc(2024, 2, 29, 14, 30, 45);
      final utcChronos = utcDateTime.toChronos();

      expect(utcChronos.isUtc, true);
      expect(utcChronos.timeZoneOffset, Duration.zero);
    });

    test('conversion preserves precision', () {
      // Test with maximum precision
      final dateTime = DateTime(2024, 2, 29, 14, 30, 45, 999, 999);
      final chronos = dateTime.toChronos();

      expect(chronos.millisecond, 999);
      expect(chronos.microsecond, 999);
      expect(chronos.millisecondsSinceEpoch, dateTime.millisecondsSinceEpoch);
      expect(chronos.microsecondsSinceEpoch, dateTime.microsecondsSinceEpoch);

      // Test with zero precision
      final simpleDatetime = DateTime(2024, 2, 29);
      final simpleChronos = simpleDatetime.toChronos();

      expect(simpleChronos.millisecond, 0);
      expect(simpleChronos.microsecond, 0);
    });
  });

  group('Type Casting Edge Cases', () {
    test('extreme date values', () {
      // Test minimum DateTime value
      final minDateTime = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
      final minChronos = minDateTime.toChronos();

      expect(minChronos.year, 1970);
      expect(minChronos.month, 1);
      expect(minChronos.day, 1);
      expect(minChronos.isUtc, true);

      // Test leap year date
      final leapDate = DateTime(2024, 2, 29, 12, 0, 0);
      final leapChronos = leapDate.toChronos();

      expect(leapChronos.year, 2024);
      expect(leapChronos.month, 2);
      expect(leapChronos.day, 29);

      // Test year boundaries
      final yearEnd = DateTime(2023, 12, 31, 23, 59, 59, 999, 999);
      final yearEndChronos = yearEnd.toChronos();

      expect(yearEndChronos.year, 2023);
      expect(yearEndChronos.month, 12);
      expect(yearEndChronos.day, 31);
    });

    test('UTC vs local conversion', () {
      final timestamp = 1709211045000; // Fixed timestamp

      // Create UTC and local DateTime from same timestamp
      final utcDateTime = DateTime.fromMillisecondsSinceEpoch(
        timestamp,
        isUtc: true,
      );
      final localDateTime = DateTime.fromMillisecondsSinceEpoch(
        timestamp,
        isUtc: false,
      );

      final utcChronos = utcDateTime.toChronos();
      final localChronos = localDateTime.toChronos();

      // Both should have same timestamp but different timezone flags
      expect(utcChronos.millisecondsSinceEpoch, timestamp);
      expect(localChronos.millisecondsSinceEpoch, timestamp);
      expect(utcChronos.isUtc, true);
      expect(localChronos.isUtc, false);

      // UTC and local versions should be at same moment
      expect(utcChronos.isAtSameMomentAs(localChronos), true);
    });

    test('conversion with DateTime.now()', () {
      final now = DateTime.now();
      final chronosNow = now.toChronos();

      expect(chronosNow, isA<Chronos>());
      expect(chronosNow.isAtSameMomentAs(now), true);
      expect(chronosNow.isUtc, now.isUtc);
    });
  });

  group('Integration with DateTime', () {
    test('Chronos extends DateTime properly', () {
      final chronos = Chronos(2024, 2, 29, 14, 30, 45);

      // Chronos should be instance of DateTime
      expect(chronos, isA<DateTime>());
      expect(chronos, isA<Chronos>());

      // Should be able to cast to DateTime
      final dateTime = chronos as DateTime;
      expect(dateTime.year, 2024);
      expect(dateTime.month, 2);
      expect(dateTime.day, 29);
    });

    test('DateTime methods work on Chronos', () {
      final chronos = Chronos(2024, 2, 29, 14, 30, 45);

      // Test inherited DateTime methods
      final tomorrow = chronos.add(Duration(days: 1));
      expect(tomorrow, isA<DateTime>());
      expect(tomorrow.day, 1); // March 1st
      expect(tomorrow.month, 3);

      final yesterday = chronos.subtract(Duration(days: 1));
      expect(yesterday.day, 28); // February 28th

      // Test comparison methods
      final other = Chronos(2024, 2, 28);
      expect(chronos.isAfter(other), true);
      expect(chronos.isBefore(other), false);
      expect(chronos.isAtSameMomentAs(chronos), true);
    });

    test('type checking and casting', () {
      final dateTime = DateTime(2024, 2, 29, 14, 30, 45);
      final chronos = dateTime.toChronos();

      // Type checking
      expect(dateTime is Chronos, false);

      // Runtime type checking
      expect(chronos.runtimeType.toString(), 'Chronos');

      // Casting back and forth
      final backToDateTime = chronos as DateTime;
      final backToChronos = backToDateTime.toChronos();

      expect(backToChronos.isAtSameMomentAs(chronos), true);
      expect(backToChronos.year, chronos.year);
      expect(backToChronos.month, chronos.month);
      expect(backToChronos.day, chronos.day);
    });

    test('Chronos static methods return Chronos type', () {
      // Test parse methods
      final parsed = Chronos.parse('2024-02-29T14:30:45');
      expect(parsed, isA<Chronos>());

      final tryParsed = Chronos.tryParse('2024-02-29T14:30:45');
      expect(tryParsed, isA<Chronos?>());
      expect(tryParsed, isNotNull);

      // Test factory methods
      final fromDateTime = Chronos.fromDateTime(DateTime.now());
      expect(fromDateTime, isA<Chronos>());

      final fromTimestamp = Chronos.fromTimestamp(1709211045);
      expect(fromTimestamp, isA<Chronos>());

      // Test convenience methods
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
      try {
        final now = Chronos.now();
        expect(now, isA<Chronos>());
      } finally {
        ChronosConfig().resetFakeNow();
      }

      final today = Chronos.today();
      expect(today, isA<Chronos>());

      final tomorrow = Chronos.tomorrow();
      expect(tomorrow, isA<Chronos>());

      final yesterday = Chronos.yesterday();
      expect(yesterday, isA<Chronos>());
    });

    test('Chronos methods return Chronos type', () {
      final chronos = Chronos.utc(2024, 2, 29, 14, 30, 45);

      // Test timezone conversion methods
      final utc = chronos.toUtc();
      expect(utc, isA<Chronos>());
      expect(utc.isUtc, true);

      final local = utc.toLocal();
      expect(local, isA<Chronos>());
      expect(local.isUtc, false);

      // Test copyWith method
      final copied = chronos.copyWith(year: 2028); // 2028 is also a leap year
      expect(copied, isA<Chronos>());
      expect(copied.year, 2028);
      expect(copied.month, chronos.month);
      expect(copied.day, chronos.day);
    });

    test('equality and hashCode work correctly', () {
      final dateTime = DateTime(2024, 2, 29, 14, 30, 45);
      final chronos1 = dateTime.toChronos();
      final chronos2 = Chronos(2024, 2, 29, 14, 30, 45);
      final chronos3 = Chronos(2024, 2, 28, 14, 30, 45);

      // Test equality
      expect(chronos1 == chronos2, true);
      expect(chronos1 == chronos3, false);

      // Test hashCode consistency
      expect(chronos1.hashCode, chronos2.hashCode);
      expect(chronos1.hashCode == chronos3.hashCode, false);

      // Test with DateTime comparison (should use isAtSameMomentAs)
      expect(chronos1.isAtSameMomentAs(dateTime), true);
    });
  });
}
