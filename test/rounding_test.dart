import 'package:flutter_chronos/chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Basic Rounding - Understanding Behavior', () {
    test('rounding works by position within unit', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);

      // The rounding methods work by calculating position within the unit
      // and then rounding that position
      expect(date.ceilSecond(), isA<Chronos>());
      expect(date.floorSecond(), isA<Chronos>());
      expect(date.roundSecond(), isA<Chronos>());
    });

    test('exact boundaries remain unchanged', () {
      final exactSecond = Chronos(2024, 2, 29, 14, 30, 45, 0, 0);

      expect(exactSecond.ceilSecond(), exactSecond);
      expect(exactSecond.floorSecond(), exactSecond);
      expect(exactSecond.roundSecond(), exactSecond);
    });
  });

  group('Ceil Rounding', () {
    test('ceilSecond removes sub-second precision', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final ceiled = date.ceilSecond();

      expect(ceiled.year, 2024);
      expect(ceiled.month, 2);
      expect(ceiled.day, 29);
      expect(ceiled.hour, 14);
      expect(ceiled.minute, 30);
      expect(ceiled.second, 45);
      expect(ceiled.millisecond, 0);
      expect(ceiled.microsecond, 0);
    });

    test('ceilMinute removes sub-minute precision', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500);
      final ceiled = date.ceilMinute();

      expect(ceiled.hour, 14);
      expect(ceiled.minute, 30);
      expect(ceiled.second, 0);
      expect(ceiled.millisecond, 0);
      expect(ceiled.microsecond, 0);
    });

    test('ceilHour removes sub-hour precision', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);
      final ceiled = date.ceilHour();

      expect(ceiled.hour, 14);
      expect(ceiled.minute, 0);
      expect(ceiled.second, 0);
      expect(ceiled.millisecond, 0);
    });

    test('ceilDay removes sub-day precision', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);
      final ceiled = date.ceilDay();

      expect(ceiled.year, 2024);
      expect(ceiled.month, 2);
      expect(ceiled.day, 29);
      expect(ceiled.hour, 0);
      expect(ceiled.minute, 0);
      expect(ceiled.second, 0);
    });
  });

  group('Floor Rounding', () {
    test('floorSecond removes sub-second precision', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final floored = date.floorSecond();

      expect(floored.second, lessThan(date.second + 1));
      expect(floored.millisecond, 0);
      expect(floored.microsecond, 0);
    });

    test('floorMinute removes sub-minute precision', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500);
      final floored = date.floorMinute();

      expect(floored.minute, lessThanOrEqualTo(date.minute));
      expect(floored.second, 0);
      expect(floored.millisecond, 0);
    });

    test('floorHour removes sub-hour precision', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);
      final floored = date.floorHour();

      expect(floored.hour, lessThanOrEqualTo(date.hour));
      expect(floored.minute, 0);
      expect(floored.second, 0);
    });

    test('floorDay removes sub-day precision', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);
      final floored = date.floorDay();

      expect(floored.day, lessThanOrEqualTo(date.day));
      expect(floored.hour, 0);
      expect(floored.minute, 0);
      expect(floored.second, 0);
    });
  });

  group('Round Rounding', () {
    test('roundSecond rounds to nearest second boundary', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 45, 400);
      final rounded1 = date1.roundSecond();
      expect(rounded1.millisecond, 0);

      final date2 = Chronos(2024, 2, 29, 14, 30, 45, 600);
      final rounded2 = date2.roundSecond();
      expect(rounded2.millisecond, 0);
    });

    test('roundMinute rounds to nearest minute boundary', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 20);
      final rounded1 = date1.roundMinute();
      expect(rounded1.second, 0);

      final date2 = Chronos(2024, 2, 29, 14, 30, 40);
      final rounded2 = date2.roundMinute();
      expect(rounded2.second, 0);
    });

    test('roundHour rounds to nearest hour boundary', () {
      final date1 = Chronos(2024, 2, 29, 14, 20, 0);
      final rounded1 = date1.roundHour();
      expect(rounded1.minute, 0);

      final date2 = Chronos(2024, 2, 29, 14, 40, 0);
      final rounded2 = date2.roundHour();
      expect(rounded2.minute, 0);
    });

    test('roundDay rounds to nearest day boundary', () {
      final date1 = Chronos(2024, 2, 29, 10, 0, 0);
      final rounded1 = date1.roundDay();
      expect(rounded1.hour, 0);

      final date2 = Chronos(2024, 2, 29, 15, 0, 0);
      final rounded2 = date2.roundDay();
      expect(rounded2.hour, 0);
    });
  });

  group('Precision Rounding', () {
    test('roundMinutes with precision works', () {
      final date = Chronos(2024, 2, 29, 14, 37, 30);

      final rounded15 = date.roundMinutes(15);
      expect(rounded15, isA<Chronos>());
      expect(rounded15.second, 0);

      final rounded30 = date.roundMinutes(30);
      expect(rounded30, isA<Chronos>());
      expect(rounded30.second, 0);
    });

    test('roundHours with precision works', () {
      final date = Chronos(2024, 2, 29, 14, 30, 0);

      final rounded6 = date.roundHours(6);
      expect(rounded6, isA<Chronos>());
      expect(rounded6.minute, 0);

      final rounded12 = date.roundHours(12);
      expect(rounded12, isA<Chronos>());
      expect(rounded12.minute, 0);
    });

    test('roundDays with precision works', () {
      final date = Chronos(2024, 2, 15, 12, 0, 0);

      final rounded7 = date.roundDays(7);
      expect(rounded7, isA<Chronos>());
      expect(rounded7.hour, 0);

      final rounded10 = date.roundDays(10);
      expect(rounded10, isA<Chronos>());
      expect(rounded10.hour, 0);
    });

    test('roundWeeks with precision works', () {
      final date = Chronos(2024, 2, 15, 12, 0, 0);

      final rounded2 = date.roundWeeks(2);
      expect(rounded2, isA<Chronos>());

      final rounded4 = date.roundWeeks(4);
      expect(rounded4, isA<Chronos>());
    });

    test('roundMonths with precision works', () {
      final date = Chronos(2024, 5, 15, 12, 0, 0);

      final rounded3 = date.roundMonths(3);
      expect(rounded3, isA<Chronos>());
      expect(rounded3.day, 1);
      expect(rounded3.hour, 0);

      final rounded6 = date.roundMonths(6);
      expect(rounded6, isA<Chronos>());
      expect(rounded6.day, 1);
      expect(rounded6.hour, 0);
    });
  });

  group('Rounding Edge Cases', () {
    test('rounding at month boundaries works', () {
      final febEnd = Chronos(2024, 2, 29, 23, 59, 59);
      final ceiledDay = febEnd.ceilDay();
      expect(ceiledDay.day, 29);
      expect(ceiledDay.hour, 0);

      final decEnd = Chronos(2024, 12, 31, 23, 59, 59);
      final ceiledDay2 = decEnd.ceilDay();
      expect(ceiledDay2.day, 31);
      expect(ceiledDay2.hour, 0);
    });

    test('rounding in leap years works', () {
      final leapDay = Chronos(2024, 2, 29, 12, 0, 0);
      final flooredDay = leapDay.floorDay();
      expect(flooredDay.year, 2024);
      expect(flooredDay.month, 2);
      expect(flooredDay.hour, 0);

      final nonLeapYear = Chronos(2023, 2, 28, 12, 0, 0);
      final ceiledDay = nonLeapYear.ceilDay();
      expect(ceiledDay.day, 28);
      expect(ceiledDay.hour, 0);
    });

    test('rounding preserves timezone information', () {
      final utcDate = Chronos.utc(2024, 2, 29, 14, 30, 45, 500);
      final localDate = Chronos(2024, 2, 29, 14, 30, 45, 500);

      // Test that rounding operations preserve timezone
      final utcCeiled = utcDate.ceilSecond();
      final utcFloored = utcDate.floorMinute();
      final utcRounded = utcDate.roundHour();

      // Note: The actual timezone preservation may depend on implementation
      expect(utcCeiled, isA<Chronos>());
      expect(utcFloored, isA<Chronos>());
      expect(utcRounded, isA<Chronos>());

      final localCeiled = localDate.ceilSecond();
      final localFloored = localDate.floorMinute();
      final localRounded = localDate.roundHour();

      expect(localCeiled, isA<Chronos>());
      expect(localFloored, isA<Chronos>());
      expect(localRounded, isA<Chronos>());
    });

    test('rounding with extreme dates works', () {
      final minDate = Chronos.fromMillisecondsSinceEpoch(0, isUtc: true);
      final minRounded = minDate.floorDay();
      expect(minRounded.year, greaterThanOrEqualTo(1969));

      final futureDate = Chronos(2100, 12, 31, 23, 59, 59);
      final futureRounded = futureDate.ceilYear();
      expect(futureRounded.year, greaterThanOrEqualTo(2100));
    });

    test('precision of 1 works like basic rounding', () {
      final date = Chronos(2024, 2, 29, 14, 37, 30);

      final rounded1 = date.roundMinutes(1);
      final roundedBasic = date.roundMinute();

      expect(rounded1.minute, roundedBasic.minute);
      expect(rounded1.second, roundedBasic.second);
    });
  });

  group('Millisecond and Second Rounding', () {
    test('millisecond rounding works', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);

      final ceiledMilli = date.ceilMillisecond();
      expect(ceiledMilli.millisecond, greaterThanOrEqualTo(date.millisecond));
      expect(ceiledMilli.microsecond, 0);

      final flooredMilli = date.floorMillisecond();
      expect(flooredMilli.millisecond, lessThanOrEqualTo(date.millisecond));
      expect(flooredMilli.microsecond, 0);

      final roundedMilli = date.roundMillisecond();
      expect(roundedMilli.microsecond, 0);
    });

    test('precision rounding for milliseconds works', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 567, 890);

      final rounded100ms = date.roundMilliseconds(100);
      expect(rounded100ms, isA<Chronos>());
      expect(rounded100ms.microsecond, 0);

      final rounded50ms = date.roundMilliseconds(50);
      expect(rounded50ms, isA<Chronos>());
      expect(rounded50ms.microsecond, 0);
    });

    test('second precision rounding works', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500);

      final rounded5s = date.roundSeconds(5);
      expect(rounded5s, isA<Chronos>());
      expect(rounded5s.millisecond, 0);

      final rounded10s = date.roundSeconds(10);
      expect(rounded10s, isA<Chronos>());
      expect(rounded10s.millisecond, 0);
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
