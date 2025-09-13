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
      final localDateTime = DateTime(2024, 2, 29, 14, 30, 45);
      final localChronos = localDateTime.toChronos();

      expect(localChronos.isUtc, false);
      expect(localChronos.timeZoneOffset, localDateTime.timeZoneOffset);

      final utcDateTime = DateTime.utc(2024, 2, 29, 14, 30, 45);
      final utcChronos = utcDateTime.toChronos();

      expect(utcChronos.isUtc, true);
      expect(utcChronos.timeZoneOffset, Duration.zero);
    });

    test('conversion preserves precision', () {
      final dateTime = DateTime(2024, 2, 29, 14, 30, 45, 999, 999);
      final chronos = dateTime.toChronos();

      expect(chronos.millisecond, 999);
      expect(chronos.microsecond, 999);
      expect(chronos.millisecondsSinceEpoch, dateTime.millisecondsSinceEpoch);
      expect(chronos.microsecondsSinceEpoch, dateTime.microsecondsSinceEpoch);

      final simpleDatetime = DateTime(2024, 2, 29);
      final simpleChronos = simpleDatetime.toChronos();

      expect(simpleChronos.millisecond, 0);
      expect(simpleChronos.microsecond, 0);
    });
  });

  group('Type Casting Edge Cases', () {
    test('extreme date values', () {
      final minDateTime = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
      final minChronos = minDateTime.toChronos();

      expect(minChronos.year, 1970);
      expect(minChronos.month, 1);
      expect(minChronos.day, 1);
      expect(minChronos.isUtc, true);

      final leapDate = DateTime(2024, 2, 29, 12, 0, 0);
      final leapChronos = leapDate.toChronos();

      expect(leapChronos.year, 2024);
      expect(leapChronos.month, 2);
      expect(leapChronos.day, 29);

      final yearEnd = DateTime(2023, 12, 31, 23, 59, 59, 999, 999);
      final yearEndChronos = yearEnd.toChronos();

      expect(yearEndChronos.year, 2023);
      expect(yearEndChronos.month, 12);
      expect(yearEndChronos.day, 31);
    });

    test('UTC vs local conversion', () {
      final timestamp = 1709211045000;

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

      expect(utcChronos.millisecondsSinceEpoch, timestamp);
      expect(localChronos.millisecondsSinceEpoch, timestamp);
      expect(utcChronos.isUtc, true);
      expect(localChronos.isUtc, false);

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

      expect(chronos, isA<DateTime>());
      expect(chronos, isA<Chronos>());

      final dateTime = chronos as DateTime;
      expect(dateTime.year, 2024);
      expect(dateTime.month, 2);
      expect(dateTime.day, 29);
    });

    test('DateTime methods work on Chronos', () {
      final chronos = Chronos(2024, 2, 29, 14, 30, 45);

      final tomorrow = chronos.add(Duration(days: 1));
      expect(tomorrow, isA<DateTime>());
      expect(tomorrow.day, 1);
      expect(tomorrow.month, 3);

      final yesterday = chronos.subtract(Duration(days: 1));
      expect(yesterday.day, 28);

      final other = Chronos(2024, 2, 28);
      expect(chronos.isAfter(other), true);
      expect(chronos.isBefore(other), false);
      expect(chronos.isAtSameMomentAs(chronos), true);
    });

    test('type checking and casting', () {
      final dateTime = DateTime(2024, 2, 29, 14, 30, 45);
      final chronos = dateTime.toChronos();

      expect(dateTime is Chronos, false);

      expect(chronos.runtimeType.toString(), 'Chronos');

      final backToDateTime = chronos as DateTime;
      final backToChronos = backToDateTime.toChronos();

      expect(backToChronos.isAtSameMomentAs(chronos), true);
      expect(backToChronos.year, chronos.year);
      expect(backToChronos.month, chronos.month);
      expect(backToChronos.day, chronos.day);
    });

    test('Chronos static methods return Chronos type', () {
      final parsed = Chronos.parse('2024-02-29T14:30:45');
      expect(parsed, isA<Chronos>());

      final tryParsed = Chronos.tryParse('2024-02-29T14:30:45');
      expect(tryParsed, isA<Chronos?>());
      expect(tryParsed, isNotNull);

      final fromDateTime = Chronos.fromDateTime(DateTime.now());
      expect(fromDateTime, isA<Chronos>());

      final fromTimestamp = Chronos.fromTimestamp(1709211045);
      expect(fromTimestamp, isA<Chronos>());

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

      final utc = chronos.toUtc();
      expect(utc, isA<Chronos>());
      expect(utc.isUtc, true);

      final local = utc.toLocal();
      expect(local, isA<Chronos>());
      expect(local.isUtc, false);

      final copied = chronos.copyWith(year: 2028);
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

      expect(chronos1 == chronos2, true);
      expect(chronos1 == chronos3, false);

      expect(chronos1.hashCode, chronos2.hashCode);
      expect(chronos1.hashCode == chronos3.hashCode, false);

      expect(chronos1.isAtSameMomentAs(dateTime), true);
    });
  });
}
