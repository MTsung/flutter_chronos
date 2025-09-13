import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Basic Rounding - Understanding Behavior', () {
    test('Rounding', () {
      final testDate = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);

      expect(
        testDate.floorMilliseconds(5).toDateTimeString(),
        '2024-03-15 14:30:45',
      );
      expect(
        testDate.floorSeconds(5).toDateTimeString(),
        '2024-03-15 14:30:45',
      );
      expect(
        testDate.floorMinutes(5).toDateTimeString(),
        '2024-03-15 14:30:00',
      );
      expect(testDate.floorHours(5).toDateTimeString(), '2024-03-15 10:00:00');
      expect(testDate.floorDays(5).toDateTimeString(), '2024-03-11 00:00:00');
      expect(testDate.floorWeeks(5).toDateTimeString(), '2024-03-01 00:00:00');
      expect(testDate.floorMonths(5).toDateTimeString(), '2024-01-01 00:00:00');
      expect(
        testDate.floorQuarters(5).toDateTimeString(),
        '2024-01-01 00:00:00',
      );
      expect(testDate.floorYears(5).toDateTimeString(), '2021-01-01 00:00:00');
      expect(
        testDate.floorDecades(5).toDateTimeString(),
        '2001-01-01 00:00:00',
      );
      expect(
        testDate.floorCenturies(5).toDateTimeString(),
        '2001-01-01 00:00:00',
      );
      expect(
        testDate.floorMillennia(5).toDateTimeString(),
        '0001-01-01 00:00:00',
      );
      expect(
        testDate.ceilMilliseconds(5).toDateTimeString(),
        '2024-03-15 14:30:45',
      );
      expect(testDate.ceilSeconds(5).toDateTimeString(), '2024-03-15 14:30:50');
      expect(testDate.ceilMinutes(5).toDateTimeString(), '2024-03-15 14:35:00');
      expect(testDate.ceilHours(5).toDateTimeString(), '2024-03-15 15:00:00');
      expect(testDate.ceilDays(5).toDateTimeString(), '2024-03-16 00:00:00');
      expect(testDate.ceilWeeks(5).toDateTimeString(), '2024-04-05 00:00:00');
      expect(testDate.ceilMonths(5).toDateTimeString(), '2024-06-01 00:00:00');
      expect(
        testDate.ceilQuarters(5).toDateTimeString(),
        '2025-04-01 00:00:00',
      );
      expect(testDate.ceilYears(5).toDateTimeString(), '2026-01-01 00:00:00');
      expect(testDate.ceilDecades(5).toDateTimeString(), '2051-01-01 00:00:00');
      expect(
        testDate.ceilCenturies(5).toDateTimeString(),
        '2501-01-01 00:00:00',
      );
      expect(
        testDate.ceilMillennia(5).toDateTimeString(),
        '5001-01-01 00:00:00',
      );
      expect(
        testDate.roundMilliseconds(5).toDateTimeString(),
        '2024-03-15 14:30:45',
      );
      expect(
        testDate.roundSeconds(5).toDateTimeString(),
        '2024-03-15 14:30:45',
      );
      expect(
        testDate.roundMinutes(5).toDateTimeString(),
        '2024-03-15 14:30:00',
      );
      expect(testDate.roundHours(5).toDateTimeString(), '2024-03-15 15:00:00');
      expect(testDate.roundDays(5).toDateTimeString(), '2024-03-16 00:00:00');
      expect(testDate.roundWeeks(5).toDateTimeString(), '2024-03-01 00:00:00');
      expect(testDate.roundMonths(5).toDateTimeString(), '2024-01-01 00:00:00');
      expect(
        testDate.roundQuarters(5).toDateTimeString(),
        '2024-01-01 00:00:00',
      );
      expect(testDate.roundYears(5).toDateTimeString(), '2026-01-01 00:00:00');
      expect(
        testDate.roundDecades(5).toDateTimeString(),
        '2001-01-01 00:00:00',
      );
      expect(
        testDate.roundCenturies(5).toDateTimeString(),
        '2001-01-01 00:00:00',
      );
      expect(
        testDate.roundMillennia(5).toDateTimeString(),
        '0001-01-01 00:00:00',
      );

      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).ceilMinutes(5),
        Chronos(2023, 12, 25, 14, 35),
      );
      expect(
        Chronos(2023, 12, 25, 14, 29, 45, 500, 750).ceilMinutes(5),
        Chronos(2023, 12, 25, 14, 30),
      );
    });
  });

  group('Return Type Verification', () {
    test('all rounding methods return Chronos instances', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);

      expect(date.ceilSecond(), isA<Chronos>());
      expect(date.ceilMinute(), isA<Chronos>());
      expect(date.ceilHour(), isA<Chronos>());
      expect(date.ceilDay(), isA<Chronos>());
      expect(date.ceilWeek(), isA<Chronos>());
      expect(date.ceilMonth(), isA<Chronos>());
      expect(date.ceilYear(), isA<Chronos>());

      expect(date.floorSecond(), isA<Chronos>());
      expect(date.floorMinute(), isA<Chronos>());
      expect(date.floorHour(), isA<Chronos>());
      expect(date.floorDay(), isA<Chronos>());
      expect(date.floorWeek(), isA<Chronos>());
      expect(date.floorMonth(), isA<Chronos>());
      expect(date.floorYear(), isA<Chronos>());

      expect(date.roundSecond(), isA<Chronos>());
      expect(date.roundMinute(), isA<Chronos>());
      expect(date.roundHour(), isA<Chronos>());
      expect(date.roundDay(), isA<Chronos>());
      expect(date.roundWeek(), isA<Chronos>());
      expect(date.roundMonth(), isA<Chronos>());
      expect(date.roundYear(), isA<Chronos>());
    });

    test('precision rounding methods return Chronos instances', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);

      expect(date.roundSeconds(5), isA<Chronos>());
      expect(date.roundMinutes(15), isA<Chronos>());
      expect(date.roundHours(6), isA<Chronos>());
      expect(date.roundDays(7), isA<Chronos>());
      expect(date.roundWeeks(2), isA<Chronos>());
      expect(date.roundMonths(3), isA<Chronos>());
      expect(date.roundYears(5), isA<Chronos>());
    });
  });
}
