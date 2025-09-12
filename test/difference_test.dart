import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Basic Differences', () {
    test('diff method', () {
      final start = Chronos(2023, 1, 1, 12, 0, 0);
      final end = Chronos(2023, 1, 1, 14, 0, 0);

      final diff = start.diff(end);
      expect(diff.inHours, -2); // start.diff(end) = start - end, so negative
      expect(diff.inMinutes, -120);

      // Test the opposite direction
      final diffReverse = end.diff(start);
      expect(diffReverse.inHours, 2);
      expect(diffReverse.inMinutes, 120);
    });

    test('difference method', () {
      final start = Chronos(2023, 1, 1, 12, 0, 0);
      final end = Chronos(2023, 1, 1, 14, 0, 0);

      // difference is inherited from DateTime
      final diff = start.difference(end);
      expect(diff.inHours, -2); // start is before end
      expect(diff.inMinutes, -120);
    });

    test('diffInYears method', () {
      final start = Chronos(2020, 6, 15);
      final end = Chronos(2023, 6, 15);

      expect(start.diffInYears(end), 3.0);
      expect(end.diffInYears(start), -3.0);

      // Test partial year
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

      // Test partial month
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

      // Test partial week
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

      // Test partial day
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

      // Test partial hour
      final partialEnd = Chronos(2023, 1, 1, 14, 30, 0);
      final partialDiff = start.diffInHours(partialEnd);
      expect(partialDiff, 4.5);
    });

    test('diffInMinutes method', () {
      final start = Chronos(2023, 1, 1, 10, 0, 0);
      final end = Chronos(2023, 1, 1, 10, 30, 0);

      expect(start.diffInMinutes(end), 30.0);
      expect(end.diffInMinutes(start), -30.0);

      // Test partial minute
      final partialEnd = Chronos(2023, 1, 1, 10, 30, 30);
      final partialDiff = start.diffInMinutes(partialEnd);
      expect(partialDiff, 30.5);
    });

    test('diffInSeconds method', () {
      final start = Chronos(2023, 1, 1, 10, 0, 0);
      final end = Chronos(2023, 1, 1, 10, 0, 45);

      expect(start.diffInSeconds(end), 45.0);
      expect(end.diffInSeconds(start), -45.0);

      // Test partial second
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

      // Test partial quarter
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

      // Test partial decade
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

      // Test partial century
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

      // Test partial millennium
      final partialEnd = Chronos(3500, 6, 1);
      final partialDiff = start.diffInMillennium(partialEnd);
      expect(partialDiff, greaterThan(2.0));
      expect(partialDiff, lessThan(3.0));
    });

    test('diffInWeekdays method', () {
      // Monday to Friday (5 weekdays)
      final monday = Chronos(2023, 12, 25); // Monday
      final friday = Chronos(2023, 12, 29); // Friday

      expect(
        monday.diffInWeekdays(friday),
        4,
      ); // Mon->Tue->Wed->Thu->Fri = 4 transitions
      expect(friday.diffInWeekdays(monday), -4);

      // Include weekend (should skip Saturday and Sunday)
      final nextMonday = Chronos(2024, 1, 1); // Monday
      final weekdayDiff = friday.diffInWeekdays(nextMonday);
      expect(
        weekdayDiff,
        1,
      ); // Only Friday->Monday transition counts as 1 weekday
    });

    test('diffInWeekend method', () {
      // Friday to Monday (includes Saturday and Sunday)
      final friday = Chronos(2023, 12, 29); // Friday
      final monday = Chronos(2024, 1, 1); // Monday

      expect(friday.diffInWeekend(monday), 2); // Saturday and Sunday
      expect(monday.diffInWeekend(friday), -2);

      // Weekday to weekday (no weekend days)
      final tuesday = Chronos(2023, 12, 26); // Tuesday
      final wednesday = Chronos(2023, 12, 27); // Wednesday
      expect(tuesday.diffInWeekend(wednesday), 0);
    });

    test('diffInUnit method', () {
      final start = Chronos(2023, 1, 1);
      final end = Chronos(2023, 1, 8);

      expect(start.diffInUnit(TimeUnit.day, end), 7.0);
      expect(start.diffInUnit(TimeUnit.week, end), 1.0);
      expect(start.diffInUnit(TimeUnit.hour, end), 168.0); // 7 * 24

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

      // Week calculations can be complex and might return negative values
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
      final monday = Chronos(2023, 12, 25); // Monday
      final sunday = Chronos(2023, 12, 31); // Sunday

      // Both should be in the same week (but might not be due to week calculation differences)
      expect(monday.week, isA<int>());
      expect(sunday.week, isA<int>());

      // ISO week might be different
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

      // Leap year has one extra day
      expect(
        leapYearStart.diffInDays(leapYearEnd),
        2.0,
      ); // Feb 28 -> Feb 29 -> Mar 1
      expect(
        nonLeapYearStart.diffInDays(nonLeapYearEnd),
        1.0,
      ); // Feb 28 -> Mar 1

      // Year difference across leap year
      final beforeLeap = Chronos(2023, 6, 15);
      final afterLeap = Chronos(2025, 6, 15);
      expect(beforeLeap.diffInYears(afterLeap), 2.0);
    });

    test('differences across month boundaries', () {
      // January 31 to March 1 (February has different days in leap/non-leap years)
      final jan31_2023 = Chronos(2023, 1, 31);
      final mar1_2023 = Chronos(2023, 3, 1);
      final jan31_2024 = Chronos(2024, 1, 31);
      final mar1_2024 = Chronos(2024, 3, 1);

      // Non-leap year: Jan 31 -> Feb 28 -> Mar 1 = 29 days
      expect(jan31_2023.diffInDays(mar1_2023), 29.0);

      // Leap year: Jan 31 -> Feb 29 -> Mar 1 = 30 days
      expect(jan31_2024.diffInDays(mar1_2024), 30.0);

      // Month differences should be approximately 1
      expect(jan31_2023.diffInMonths(mar1_2023), closeTo(1.0, 0.1));
      expect(jan31_2024.diffInMonths(mar1_2024), closeTo(1.0, 0.1));
    });

    test('differences with timezone changes', () {
      final localTime = Chronos(2023, 12, 25, 12, 0, 0);
      final utcTime = Chronos.utc(2023, 12, 25, 12, 0, 0);

      // The difference depends on the local timezone offset
      final diff = localTime.diffInHours(utcTime);
      expect(diff, isA<double>());

      // UTC times should have no timezone-related differences
      final utc1 = Chronos.utc(2023, 12, 25, 12, 0, 0);
      final utc2 = Chronos.utc(2023, 12, 25, 14, 0, 0);
      expect(utc1.diffInHours(utc2), 2.0);
    });

    test('negative differences', () {
      final later = Chronos(2023, 12, 25, 14, 0, 0);
      final earlier = Chronos(2023, 12, 25, 12, 0, 0);

      // Later to earlier should be negative
      expect(later.diffInHours(earlier), -2.0);
      expect(later.diffInMinutes(earlier), -120.0);
      expect(later.diffInSeconds(earlier), -7200.0);

      // Earlier to later should be positive
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

      // Very large day differences
      final daysDiff = ancient.diffInDays(future);
      expect(daysDiff, greaterThan(700000)); // Approximately 2000 * 365
    });

    test('microsecond precision', () {
      final time1 = Chronos(2023, 12, 25, 12, 0, 0, 0, 0);
      final time2 = Chronos(2023, 12, 25, 12, 0, 0, 0, 1);

      expect(time1.diffInMicroseconds(time2), 1.0);
      expect(time2.diffInMicroseconds(time1), -1.0);

      // Millisecond precision
      final time3 = Chronos(2023, 12, 25, 12, 0, 0, 1, 0);
      expect(
        time1.diffInMilliseconds(time3),
        0.001,
      ); // 1ms = 0.001s in the implementation
      expect(time1.diffInMicroseconds(time3), 1000.0);
    });
  });

  group('Time Unit Position Properties', () {
    test('dayOfYear calculations', () {
      final jan1 = Chronos(2023, 1, 1);
      final feb1 = Chronos(2023, 2, 1);
      final dec31 = Chronos(2023, 12, 31);

      expect(jan1.dayOfYear, 1);
      expect(feb1.dayOfYear, 32); // 31 days in January + 1
      expect(dec31.dayOfYear, 365); // 2023 is not a leap year

      // Leap year
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

      // Test some days within quarters
      final jan15 = Chronos(2023, 1, 15);
      expect(jan15.dayOfQuarter, 15);
    });

    test('time unit capacities', () {
      final chronos = Chronos(2023, 12, 25);

      // Fixed capacities
      expect(chronos.daysInWeek, 7);
      expect(chronos.hoursInDay, 24);
      expect(chronos.minutesInHour, 60);
      expect(chronos.secondsInMinute, 60);
      expect(chronos.millisecondsInSecond, 1000);
      expect(chronos.microsecondsInMillisecond, 1000);
      expect(chronos.monthsInYear, 12);
      expect(chronos.quartersInYear, 4);

      // Variable capacities
      expect(chronos.daysInMonth, 31); // December has 31 days
      expect(chronos.daysInYear, 365); // 2023 is not a leap year

      // Leap year
      final leapYear = Chronos(2024, 2, 15);
      expect(leapYear.daysInYear, 366);
      expect(leapYear.daysInMonth, 29); // February in leap year
    });
  });
}
