import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Basic Differences', () {
    test('diff method', () {
      final start = Chronos(2023, 1, 1, 12, 0, 0);
      final end = Chronos(2023, 1, 1, 14, 0, 0);

      final diff = start.diff(end);
      expect(diff.inHours, -2);
      expect(diff.inMinutes, -120);

      final diffReverse = end.diff(start);
      expect(diffReverse.inHours, 2);
      expect(diffReverse.inMinutes, 120);
    });

    test('difference method', () {
      final start = Chronos(2023, 1, 1, 12, 0, 0);
      final end = Chronos(2023, 1, 1, 14, 0, 0);

      final diff = start.difference(end);
      expect(diff.inHours, -2);
      expect(diff.inMinutes, -120);
    });

    test('diffInYears method', () {
      final start = Chronos(2020, 6, 15);
      final end = Chronos(2023, 6, 15);

      expect(start.diffInYears(end), 3.0);
      expect(end.diffInYears(start), -3.0);

      final partialEnd = Chronos(2023, 12, 15);
      final partialDiff = start.diffInYears(partialEnd);
      expect(partialDiff, greaterThan(3.0));
      expect(partialDiff, lessThan(4.0));
    });

    test('diffInMonths method', () {
      final start = Chronos(2023, 1, 15);
      final end = Chronos(2023, 4, 15);

      expect(start.diffInMonths(end), 3.0);
      expect(end.diffInMonths(start), -3.0);

      final partialEnd = Chronos(2023, 4, 20);
      final partialDiff = start.diffInMonths(partialEnd);
      expect(partialDiff, greaterThan(3.0));
      expect(partialDiff, lessThan(4.0));
    });

    test('diffInWeeks method', () {
      final start = Chronos(2023, 1, 1);
      final end = Chronos(2023, 1, 15);

      expect(start.diffInWeeks(end), 2.0);
      expect(end.diffInWeeks(start), -2.0);

      final partialEnd = Chronos(2023, 1, 18);
      final partialDiff = start.diffInWeeks(partialEnd);
      expect(partialDiff, greaterThan(2.0));
      expect(partialDiff, lessThan(3.0));
    });

    test('diffInDays method', () {
      final start = Chronos(2023, 1, 1);
      final end = Chronos(2023, 1, 8);

      expect(start.diffInDays(end), 7.0);
      expect(end.diffInDays(start), -7.0);

      final partialEnd = Chronos(2023, 1, 8, 12, 0, 0);
      final partialDiff = start.diffInDays(partialEnd);
      expect(partialDiff, greaterThan(7.0));
      expect(partialDiff, lessThan(8.0));
    });

    test('diffInHours method', () {
      final start = Chronos(2023, 1, 1, 10, 0, 0);
      final end = Chronos(2023, 1, 1, 14, 0, 0);

      expect(start.diffInHours(end), 4.0);
      expect(end.diffInHours(start), -4.0);

      final partialEnd = Chronos(2023, 1, 1, 14, 30, 0);
      final partialDiff = start.diffInHours(partialEnd);
      expect(partialDiff, 4.5);
    });

    test('diffInMinutes method', () {
      final start = Chronos(2023, 1, 1, 10, 0, 0);
      final end = Chronos(2023, 1, 1, 10, 30, 0);

      expect(start.diffInMinutes(end), 30.0);
      expect(end.diffInMinutes(start), -30.0);

      final partialEnd = Chronos(2023, 1, 1, 10, 30, 30);
      final partialDiff = start.diffInMinutes(partialEnd);
      expect(partialDiff, 30.5);
    });

    test('diffInSeconds method', () {
      final start = Chronos(2023, 1, 1, 10, 0, 0);
      final end = Chronos(2023, 1, 1, 10, 0, 45);

      expect(start.diffInSeconds(end), 45.0);
      expect(end.diffInSeconds(start), -45.0);

      final partialEnd = Chronos(2023, 1, 1, 10, 0, 45, 500);
      final partialDiff = start.diffInSeconds(partialEnd);
      expect(partialDiff, 45.5);
    });

    test('diffInMilliseconds method', () {
      final start = Chronos(2023, 1, 1, 10, 0, 0, 0);
      final end = Chronos(2023, 1, 1, 10, 0, 0, 500);

      expect(start.diffInMilliseconds(end), 0.5);
      expect(end.diffInMilliseconds(start), -0.5);
    });

    test('diffInMicroseconds method', () {
      final start = Chronos(2023, 1, 1, 10, 0, 0, 0, 0);
      final end = Chronos(2023, 1, 1, 10, 0, 0, 0, 500);

      expect(start.diffInMicroseconds(end), 500.0);
      expect(end.diffInMicroseconds(start), -500.0);
    });
  });

  group('Special Differences', () {
    test('diffInQuarters method', () {
      final start = Chronos(2023, 1, 1);
      final end = Chronos(2023, 10, 1);

      expect(start.diffInQuarters(end), 3.0);
      expect(end.diffInQuarters(start), -3.0);

      final partialEnd = Chronos(2023, 11, 15);
      final partialDiff = start.diffInQuarters(partialEnd);
      expect(partialDiff, greaterThan(3.0));
      expect(partialDiff, lessThan(4.0));
    });

    test('diffInDecade method', () {
      final start = Chronos(2000, 1, 1);
      final end = Chronos(2030, 1, 1);

      expect(start.diffInDecade(end), 3.0);
      expect(end.diffInDecade(start), -3.0);

      final partialEnd = Chronos(2035, 6, 1);
      final partialDiff = start.diffInDecade(partialEnd);
      expect(partialDiff, greaterThan(3.0));
      expect(partialDiff, lessThan(4.0));
    });

    test('diffInCentury method', () {
      final start = Chronos(1900, 1, 1);
      final end = Chronos(2100, 1, 1);

      expect(start.diffInCentury(end), 2.0);
      expect(end.diffInCentury(start), -2.0);

      final partialEnd = Chronos(2150, 6, 1);
      final partialDiff = start.diffInCentury(partialEnd);
      expect(partialDiff, greaterThan(2.0));
      expect(partialDiff, lessThan(3.0));
    });

    test('diffInMillennium method', () {
      final start = Chronos(1000, 1, 1);
      final end = Chronos(3000, 1, 1);

      expect(start.diffInMillennium(end), 2.0);
      expect(end.diffInMillennium(start), -2.0);

      final partialEnd = Chronos(3500, 6, 1);
      final partialDiff = start.diffInMillennium(partialEnd);
      expect(partialDiff, greaterThan(2.0));
      expect(partialDiff, lessThan(3.0));
    });

    test('diffInWeekdays method', () {
      final monday = Chronos(2023, 12, 25);
      final friday = Chronos(2023, 12, 29);

      expect(monday.diffInWeekdays(friday), 4);
      expect(friday.diffInWeekdays(monday), -4);

      final nextMonday = Chronos(2024, 1, 1);
      final weekdayDiff = friday.diffInWeekdays(nextMonday);
      expect(weekdayDiff, 1);
    });

    test('diffInWeekend method', () {
      final friday = Chronos(2023, 12, 29);
      final monday = Chronos(2024, 1, 1);

      expect(friday.diffInWeekend(monday), 2);
      expect(monday.diffInWeekend(friday), -2);

      final tuesday = Chronos(2023, 12, 26);
      final wednesday = Chronos(2023, 12, 27);
      expect(tuesday.diffInWeekend(wednesday), 0);
    });

    test('diffInUnit method', () {
      final start = Chronos(2023, 1, 1);
      final end = Chronos(2023, 1, 8);

      expect(start.diffInUnit(TimeUnit.day, end), 7.0);
      expect(start.diffInUnit(TimeUnit.week, end), 1.0);
      expect(start.diffInUnit(TimeUnit.hour, end), 168.0);

      final yearEnd = Chronos(2024, 1, 1);
      expect(start.diffInUnit(TimeUnit.year, yearEnd), 1.0);
      expect(start.diffInUnit(TimeUnit.month, yearEnd), 12.0);
      expect(start.diffInUnit(TimeUnit.quarter, yearEnd), 4.0);
    });
  });

  group('Week Calculations', () {
    test('weekOfYear property', () {
      final jan1 = Chronos(2023, 1, 1);
      final jan8 = Chronos(2023, 1, 8);
      final dec31 = Chronos(2023, 12, 31);

      expect(jan1.weekOfYear, 1);
      expect(jan8.weekOfYear, 2);
      expect(dec31.weekOfYear, greaterThan(50));
      expect(dec31.weekOfYear, lessThanOrEqualTo(53));
    });

    test('weekOfMonth property', () {
      final chronos = Chronos(2023, 12, 25);

      expect(chronos.weekOfMonth, isA<int>());
    });

    test('isoWeek calculations', () {
      final chronos = Chronos(2023, 12, 25);

      expect(chronos.isoWeek, isA<int>());
      expect(chronos.isoWeek, greaterThan(0));
      expect(chronos.isoWeek, lessThanOrEqualTo(53));

      expect(chronos.weekOfIsoYear, isA<int>());
    });

    test('week boundaries', () {
      final monday = Chronos(2023, 12, 25);
      final sunday = Chronos(2023, 12, 31);

      expect(monday.week, isA<int>());
      expect(sunday.week, isA<int>());

      expect(monday.isoWeek, isA<int>());
      expect(sunday.isoWeek, isA<int>());
    });
  });

  group('Difference Edge Cases', () {
    test('differences across leap years', () {
      final leapYearStart = Chronos(2024, 2, 28);
      final leapYearEnd = Chronos(2024, 3, 1);
      final nonLeapYearStart = Chronos(2023, 2, 28);
      final nonLeapYearEnd = Chronos(2023, 3, 1);

      expect(leapYearStart.diffInDays(leapYearEnd), 2.0);
      expect(nonLeapYearStart.diffInDays(nonLeapYearEnd), 1.0);

      final beforeLeap = Chronos(2023, 6, 15);
      final afterLeap = Chronos(2025, 6, 15);
      expect(beforeLeap.diffInYears(afterLeap), 2.0);
    });

    test('differences across month boundaries', () {
      final jan31_2023 = Chronos(2023, 1, 31);
      final mar1_2023 = Chronos(2023, 3, 1);
      final jan31_2024 = Chronos(2024, 1, 31);
      final mar1_2024 = Chronos(2024, 3, 1);

      expect(jan31_2023.diffInDays(mar1_2023), 29.0);
      expect(jan31_2024.diffInDays(mar1_2024), 30.0);
      expect(jan31_2023.diffInMonths(mar1_2023), 1.032258064516129);
    });

    test('differences with timezone changes', () {
      final localTime = Chronos(2023, 12, 25, 12, 0, 0);
      final utcTime = Chronos.utc(2023, 12, 25, 12, 0, 0);

      final diff = localTime.diffInHours(utcTime);
      expect(diff, isA<double>());

      final utc1 = Chronos.utc(2023, 12, 25, 12, 0, 0);
      final utc2 = Chronos.utc(2023, 12, 25, 14, 0, 0);
      expect(utc1.diffInHours(utc2), 2.0);
    });

    test('negative differences', () {
      final later = Chronos(2023, 12, 25, 14, 0, 0);
      final earlier = Chronos(2023, 12, 25, 12, 0, 0);

      expect(later.diffInHours(earlier), -2.0);
      expect(later.diffInMinutes(earlier), -120.0);
      expect(later.diffInSeconds(earlier), -7200.0);

      expect(earlier.diffInHours(later), 2.0);
      expect(earlier.diffInMinutes(later), 120.0);
      expect(earlier.diffInSeconds(later), 7200.0);
    });

    test('zero differences', () {
      final time1 = Chronos(2023, 12, 25, 12, 0, 0);
      final time2 = Chronos(2023, 12, 25, 12, 0, 0);

      expect(time1.diffInYears(time2), 0.0);
      expect(time1.diffInMonths(time2), 0.0);
      expect(time1.diffInDays(time2), 0.0);
      expect(time1.diffInHours(time2), 0.0);
      expect(time1.diffInMinutes(time2), 0.0);
      expect(time1.diffInSeconds(time2), 0.0);
      expect(time1.diffInMilliseconds(time2), 0.0);
      expect(time1.diffInMicroseconds(time2), 0.0);
    });

    test('very large differences', () {
      final ancient = Chronos(1000, 1, 1);
      final future = Chronos(3000, 1, 1);

      expect(ancient.diffInYears(future), 2000.0);
      expect(ancient.diffInCentury(future), 20.0);
      expect(ancient.diffInMillennium(future), 2.0);

      final daysDiff = ancient.diffInDays(future);
      expect(daysDiff, greaterThan(700000));
    });

    test('microsecond precision', () {
      final time1 = Chronos(2023, 12, 25, 12, 0, 0, 0, 0);
      final time2 = Chronos(2023, 12, 25, 12, 0, 0, 0, 1);

      expect(time1.diffInMicroseconds(time2), 1.0);
      expect(time2.diffInMicroseconds(time1), -1.0);

      final time3 = Chronos(2023, 12, 25, 12, 0, 0, 1, 0);
      expect(time1.diffInMilliseconds(time3), 0.001);
      expect(time1.diffInMicroseconds(time3), 1000.0);
    });
  });

  group('Time Unit Position Properties', () {
    test('dayOfYear calculations', () {
      final jan1 = Chronos(2023, 1, 1);
      final feb1 = Chronos(2023, 2, 1);
      final dec31 = Chronos(2023, 12, 31);

      expect(jan1.dayOfYear, 1);
      expect(feb1.dayOfYear, 32);
      expect(dec31.dayOfYear, 365);

      final leapDec31 = Chronos(2024, 12, 31);
      expect(leapDec31.dayOfYear, 366);
    });

    test('dayOfQuarter calculations', () {
      final q1Start = Chronos(2023, 1, 1);
      final q2Start = Chronos(2023, 4, 1);
      final q3Start = Chronos(2023, 7, 1);
      final q4Start = Chronos(2023, 10, 1);

      expect(q1Start.dayOfQuarter, 1);
      expect(q2Start.dayOfQuarter, 1);
      expect(q3Start.dayOfQuarter, 1);
      expect(q4Start.dayOfQuarter, 1);

      final jan15 = Chronos(2023, 1, 15);
      expect(jan15.dayOfQuarter, 15);
    });

    test('time unit capacities', () {
      final chronos = Chronos(2023, 12, 25);

      expect(chronos.daysInWeek, 7);
      expect(chronos.hoursInDay, 24);
      expect(chronos.minutesInHour, 60);
      expect(chronos.secondsInMinute, 60);
      expect(chronos.millisecondsInSecond, 1000);
      expect(chronos.microsecondsInMillisecond, 1000);
      expect(chronos.monthsInYear, 12);
      expect(chronos.quartersInYear, 4);

      expect(chronos.daysInMonth, 31);
      expect(chronos.daysInYear, 365);

      final leapYear = Chronos(2024, 2, 15);
      expect(leapYear.daysInYear, 366);
      expect(leapYear.daysInMonth, 29);
    });
  });

  group('Time Unit Positions - Microsecond', () {
    test('microsecond positions', () {
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfMillisecond,
        750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfSecond,
        500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfMinute,
        45500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfHour,
        1845500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfDay,
        52245500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfWeek,
        138645500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfMonth,
        2125845500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfQuarter,
        7396245500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfYear,
        30983445500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfIsoYear,
        30897045500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfDecade,
        94055445500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfCentury,
        725207445500750,
      );
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfMillennium,
        725207445500750,
      );
    });
  });

  group('Time Unit Positions - Other Units', () {
    test('basic time positions', () {
      expect(
        Chronos(2023, 12, 25, 14, 30, 45, 500, 750).millisecondOfSecond,
        500,
      );
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).secondOfMinute, 45);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).minuteOfHour, 30);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).hourOfDay, 14);
    });

    test('day positions', () {
      expect(Chronos(2023, 12, 25).dayOfWeek, 1);
      expect(Chronos(2023, 12, 25).dayOfMonth, 25);
      expect(Chronos(2023, 12, 25).dayOfQuarter, 86);
      expect(Chronos(2023, 1, 1).dayOfYear, 1);
      expect(Chronos(2023, 12, 31).dayOfYear, 365);
      expect(Chronos(2023, 12, 25).dayOfIsoYear, 358);
    });

    test('week positions', () {
      expect(Chronos(2023, 12, 25).weekOfMonth, 4);
      expect(Chronos(2023, 12, 25).weekOfYear, 52);
      expect(Chronos(2023, 12, 25).weekOfIsoYear, 52);
    });

    test('month positions', () {
      expect(Chronos(2023, 1, 15).monthOfQuarter, 1);
      expect(Chronos(2023, 3, 15).monthOfQuarter, 3);
      expect(Chronos(2023, 4, 15).monthOfQuarter, 1);
      expect(Chronos(2023, 12, 25).monthOfYear, 12);
      expect(Chronos(2023, 12, 25).monthOfIsoYear, 12);
    });

    test('quarter positions', () {
      expect(Chronos(2023, 2, 15).quarterOfYear, 1);
      expect(Chronos(2023, 5, 15).quarterOfYear, 2);
      expect(Chronos(2023, 8, 15).quarterOfYear, 3);
      expect(Chronos(2023, 11, 15).quarterOfYear, 4);
      expect(Chronos(2023, 12, 25).quarterOfIsoYear, 4);
    });

    test('year positions', () {
      expect(Chronos(2021, 1, 1).yearOfDecade, 1);
      expect(Chronos(2025, 1, 1).yearOfDecade, 5);
      expect(Chronos(2023, 1, 1).yearOfCentury, 23);
      expect(Chronos(2023, 1, 1).yearOfMillennium, 23);
    });
  });

  group('Time Unit Capacities', () {
    test('basic time capacities', () {
      expect(Chronos(2023, 12, 25).microsecondsInMillisecond, 1000);
      expect(Chronos(2023, 12, 25).millisecondsInSecond, 1000);
      expect(Chronos(2023, 12, 25).secondsInMinute, 60);
      expect(Chronos(2023, 12, 25).minutesInHour, 60);
      expect(Chronos(2023, 12, 25).hoursInDay, 24);
      expect(Chronos(2023, 12, 25).daysInWeek, 7);
    });

    test('month capacities', () {
      expect(Chronos(2023, 1, 15).daysInMonth, 31);
      expect(Chronos(2023, 2, 15).daysInMonth, 28);
      expect(Chronos(2024, 2, 15).daysInMonth, 29);
      expect(Chronos(2023, 4, 15).daysInMonth, 30);
      expect(Chronos(2023, 12, 15).daysInMonth, 31);
    });

    test('larger period capacities', () {
      expect(Chronos(2023, 2, 15).daysInQuarter, 90);
      expect(Chronos(2023, 5, 15).daysInQuarter, 91);
      expect(Chronos(2023, 6, 15).daysInYear, 365);
      expect(Chronos(2024, 6, 15).daysInYear, 366);
      expect(Chronos(2023, 12, 25).weeksInMonth, 4);
      expect(Chronos(2023, 12, 25).weeksInYear, 52);
      expect(Chronos(2023, 12, 25).monthsInQuarter, 3);
      expect(Chronos(2023, 12, 25).monthsInYear, 12);
      expect(Chronos(2023, 12, 25).quartersInYear, 4);
      expect(Chronos(2023, 12, 25).yearsInDecade, 10);
      expect(Chronos(2023, 12, 25).yearsInCentury, 100);
      expect(Chronos(2023, 12, 25).yearsInMillennium, 1000);
    });
  });

  group('Edge Cases and Complex Scenarios', () {
    test('leap year February formatting', () {
      final leapFeb29 = Chronos(2024, 2, 29, 12, 0, 0);

      expect(leapFeb29.toDateString(), '2024-02-29');
      expect(leapFeb29.toFormattedDateString(), 'Feb 29, 2024');
      expect(leapFeb29.daysInMonth, 29);
    });

    test('year boundary formatting', () {
      final newYear = Chronos(2024, 1, 1, 0, 0, 0);
      final yearEnd = Chronos(2023, 12, 31, 23, 59, 59);

      expect(newYear.toDateString(), '2024-01-01');
      expect(yearEnd.toDateString(), '2023-12-31');
      expect(newYear.dayOfYear, 1);
      expect(yearEnd.dayOfYear, 365);
    });

    test('different timezone formatting', () {
      final localTime = Chronos(2023, 12, 25, 12, 0, 0);
      final utcTime = Chronos.utc(2023, 12, 25, 12, 0, 0);

      expect(localTime.toDateTimeLocalString(), '2023-12-25T12:00:00');
      expect(utcTime.toIso8601String(), '2023-12-25T12:00:00.000Z');
    });

    test('microsecond precision', () {
      final precise = Chronos(2023, 12, 25, 14, 30, 45, 123, 456);

      expect(precise.microsecondOfMillisecond, 456);
      expect(precise.millisecondOfSecond, 123);
      expect(precise.microsecondsInMillisecond, 1000);
    });

    test('quarter calculations', () {
      final q1Start = Chronos(2023, 1, 1);
      final q1End = Chronos(2023, 3, 31);
      final q2Start = Chronos(2023, 4, 1);
      final q4End = Chronos(2023, 12, 31);

      expect(q1Start.quarterOfYear, 1);
      expect(q1End.quarterOfYear, 1);
      expect(q2Start.quarterOfYear, 2);
      expect(q4End.quarterOfYear, 4);

      expect(q1Start.monthOfQuarter, 1);
      expect(q1End.monthOfQuarter, 3);
      expect(q2Start.monthOfQuarter, 1);
    });
  });
}
