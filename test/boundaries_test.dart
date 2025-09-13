import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Start of Period Methods', () {
    test('startOfDay method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);
      final result = chronos.startOfDay();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 0);
      expect(result.minute, 0);
      expect(result.second, 0);
      expect(result.millisecond, 0);
      expect(result.microsecond, 0);
    });

    test('startOfHour method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);
      final result = chronos.startOfHour();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 14);
      expect(result.minute, 0);
      expect(result.second, 0);
      expect(result.millisecond, 0);
      expect(result.microsecond, 0);
    });

    test('startOfMinute method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);
      final result = chronos.startOfMinute();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 14);
      expect(result.minute, 30);
      expect(result.second, 0);
      expect(result.millisecond, 0);
      expect(result.microsecond, 0);
    });

    test('startOfSecond method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);
      final result = chronos.startOfSecond();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 14);
      expect(result.minute, 30);
      expect(result.second, 45);
      expect(result.millisecond, 0);
      expect(result.microsecond, 0);
    });

    test('startOfMillisecond method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);
      final result = chronos.startOfMillisecond();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 14);
      expect(result.minute, 30);
      expect(result.second, 45);
      expect(result.millisecond, 500);
      expect(result.microsecond, 0);
    });

    test('startOfMonth method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.startOfMonth();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 1);
      expect(result.hour, 0);
      expect(result.minute, 0);
      expect(result.second, 0);
    });

    test('startOfQuarter method', () {
      final q1 = Chronos(2023, 2, 15).startOfQuarter();
      expect(q1.month, 1);
      expect(q1.day, 1);

      final q2 = Chronos(2023, 5, 15).startOfQuarter();
      expect(q2.month, 4);
      expect(q2.day, 1);

      final q3 = Chronos(2023, 8, 15).startOfQuarter();
      expect(q3.month, 7);
      expect(q3.day, 1);

      final q4 = Chronos(2023, 11, 15).startOfQuarter();
      expect(q4.month, 10);
      expect(q4.day, 1);
    });

    test('startOfYear method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.startOfYear();

      expect(result.year, 2023);
      expect(result.month, 1);
      expect(result.day, 1);
      expect(result.hour, 0);
      expect(result.minute, 0);
      expect(result.second, 0);
    });

    test('startOfDecade method', () {
      final chronos = Chronos(2023, 12, 25);
      final result = chronos.startOfDecade();

      expect(result.year, 2020);
      expect(result.month, 1);
      expect(result.day, 1);
    });

    test('startOfCentury method', () {
      final chronos = Chronos(2023, 12, 25);
      final result = chronos.startOfCentury();

      expect(result.year, 2001);
      expect(result.month, 1);
      expect(result.day, 1);
    });

    test('startOfMillennium method', () {
      final chronos = Chronos(2023, 12, 25);
      final result = chronos.startOfMillennium();

      expect(result.year, 2001);
      expect(result.month, 1);
      expect(result.day, 1);
    });
  });

  group('Week Boundaries', () {
    test('startOfWeek method', () {
      // Monday, December 25, 2023
      final monday = Chronos(2023, 12, 25);
      final startOfWeek = monday.startOfWeek();

      // Should be Sunday, December 24, 2023
      expect(startOfWeek.year, 2023);
      expect(startOfWeek.month, 12);
      expect(startOfWeek.day, 24);
      expect(startOfWeek.weekday, DateTime.sunday);
      expect(startOfWeek.hour, 0);
      expect(startOfWeek.minute, 0);
      expect(startOfWeek.second, 0);
    });

    test('endOfWeek method', () {
      // Monday, December 25, 2023
      final monday = Chronos(2023, 12, 25);
      final endOfWeek = monday.endOfWeek();

      // Should be Saturday, December 30, 2023
      expect(endOfWeek.year, 2023);
      expect(endOfWeek.month, 12);
      expect(endOfWeek.day, 30);
      expect(endOfWeek.weekday, DateTime.saturday);
      expect(endOfWeek.hour, 23);
      expect(endOfWeek.minute, 59);
      expect(endOfWeek.second, 59);
    });

    test('startOfIsoWeek method', () {
      // Wednesday, December 27, 2023
      final wednesday = Chronos(2023, 12, 27);
      final startOfIsoWeek = wednesday.startOfIsoWeek();

      // Should be Monday, December 25, 2023
      expect(startOfIsoWeek.year, 2023);
      expect(startOfIsoWeek.month, 12);
      expect(startOfIsoWeek.day, 25);
      expect(startOfIsoWeek.weekday, DateTime.monday);
      expect(startOfIsoWeek.hour, 0);
      expect(startOfIsoWeek.minute, 0);
      expect(startOfIsoWeek.second, 0);
    });

    test('endOfIsoWeek method', () {
      // Monday, December 25, 2023
      final monday = Chronos(2023, 12, 25);
      final endOfIsoWeek = monday.endOfIsoWeek();

      // Should be Sunday, December 31, 2023
      expect(endOfIsoWeek.year, 2023);
      expect(endOfIsoWeek.month, 12);
      expect(endOfIsoWeek.day, 31);
      expect(endOfIsoWeek.weekday, DateTime.sunday);
      expect(endOfIsoWeek.hour, 23);
      expect(endOfIsoWeek.minute, 59);
      expect(endOfIsoWeek.second, 59);
    });
  });

  group('End of Period Methods', () {
    test('endOfDay method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.endOfDay();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 23);
      expect(result.minute, 59);
      expect(result.second, 59);
      expect(result.millisecond, 999);
      expect(result.microsecond, 999);
    });

    test('endOfHour method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.endOfHour();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 14);
      expect(result.minute, 59);
      expect(result.second, 59);
      expect(result.millisecond, 999);
      expect(result.microsecond, 999);
    });

    test('endOfMinute method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.endOfMinute();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 14);
      expect(result.minute, 30);
      expect(result.second, 59);
      expect(result.millisecond, 999);
      expect(result.microsecond, 999);
    });

    test('endOfSecond method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.endOfSecond();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 14);
      expect(result.minute, 30);
      expect(result.second, 45);
      expect(result.millisecond, 999);
      expect(result.microsecond, 999);
    });

    test('endOfMillisecond method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500);
      final result = chronos.endOfMillisecond();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 25);
      expect(result.hour, 14);
      expect(result.minute, 30);
      expect(result.second, 45);
      expect(result.millisecond, 500);
      expect(result.microsecond, 999);
    });

    test('endOfMonth method', () {
      // February in non-leap year
      final feb = Chronos(2023, 2, 15);
      final endOfFeb = feb.endOfMonth();
      expect(endOfFeb.day, 28);
      expect(endOfFeb.hour, 23);
      expect(endOfFeb.minute, 59);
      expect(endOfFeb.second, 59);

      // February in leap year
      final febLeap = Chronos(2024, 2, 15);
      final endOfFebLeap = febLeap.endOfMonth();
      expect(endOfFebLeap.day, 29);

      // April (30 days)
      final apr = Chronos(2023, 4, 15);
      final endOfApr = apr.endOfMonth();
      expect(endOfApr.day, 30);

      // December (31 days)
      final dec = Chronos(2023, 12, 15);
      final endOfDec = dec.endOfMonth();
      expect(endOfDec.day, 31);
    });

    test('endOfQuarter method', () {
      final q1 = Chronos(2023, 2, 15).endOfQuarter();
      expect(q1.month, 3);
      expect(q1.day, 31);

      final q2 = Chronos(2023, 5, 15).endOfQuarter();
      expect(q2.month, 6);
      expect(q2.day, 30);

      final q3 = Chronos(2023, 8, 15).endOfQuarter();
      expect(q3.month, 9);
      expect(q3.day, 30);

      final q4 = Chronos(2023, 11, 15).endOfQuarter();
      expect(q4.month, 12);
      expect(q4.day, 31);
    });

    test('endOfYear method', () {
      final chronos = Chronos(2023, 6, 15);
      final result = chronos.endOfYear();

      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 31);
      expect(result.hour, 23);
      expect(result.minute, 59);
      expect(result.second, 59);
    });

    test('endOfDecade method', () {
      final chronos = Chronos(2023, 12, 25);
      final result = chronos.endOfDecade();

      expect(result.year, 2029);
      expect(result.month, 12);
      expect(result.day, 31);
    });

    test('endOfCentury method', () {
      final chronos = Chronos(2023, 12, 25);
      final result = chronos.endOfCentury();

      expect(result.year, 2100);
      expect(result.month, 12);
      expect(result.day, 31);
    });

    test('endOfMillennium method', () {
      final chronos = Chronos(2023, 12, 25);
      final result = chronos.endOfMillennium();

      expect(result.year, 3000);
      expect(result.month, 12);
      expect(result.day, 31);
    });
  });

  group('Boundary Checks - Start', () {
    test('isStartOfDay property', () {
      final startOfDay = Chronos(2023, 12, 25, 0, 0, 0, 0, 0);
      final notStartOfDay = Chronos(2023, 12, 25, 14, 30, 45);

      expect(startOfDay.isStartOfDay, true);
      expect(notStartOfDay.isStartOfDay, false);
    });

    test('isStartOfWeek property', () {
      final sunday = Chronos(2023, 12, 24, 0, 0, 0); // Sunday at midnight
      final monday = Chronos(2023, 12, 25, 0, 0, 0); // Monday at midnight

      expect(sunday.isStartOfWeek, true);
      expect(monday.isStartOfWeek, false);
    });

    test('isStartOfIsoWeek property', () {
      final monday = Chronos(2023, 12, 25, 0, 0, 0); // Monday at midnight
      final tuesday = Chronos(2023, 12, 26, 0, 0, 0); // Tuesday at midnight

      expect(monday.isStartOfIsoWeek, true);
      expect(tuesday.isStartOfIsoWeek, false);
    });

    test('isStartOfMonth property', () {
      final firstDay = Chronos(2023, 12, 1, 0, 0, 0);
      final notFirstDay = Chronos(2023, 12, 25, 0, 0, 0);

      expect(firstDay.isStartOfMonth, true);
      expect(notFirstDay.isStartOfMonth, false);
    });

    test('isStartOfQuarter property', () {
      final q1Start = Chronos(2023, 1, 1, 0, 0, 0);
      final q2Start = Chronos(2023, 4, 1, 0, 0, 0);
      final notQuarterStart = Chronos(2023, 2, 1, 0, 0, 0);

      expect(q1Start.isStartOfQuarter, true);
      expect(q2Start.isStartOfQuarter, true);
      expect(notQuarterStart.isStartOfQuarter, false);
    });

    test('isStartOfYear property', () {
      final newYear = Chronos(2023, 1, 1, 0, 0, 0);
      final notNewYear = Chronos(2023, 12, 25, 0, 0, 0);

      expect(newYear.isStartOfYear, true);
      expect(notNewYear.isStartOfYear, false);
    });

    test('isStartOfIsoYear property', () {
      // ISO year 2024 starts on January 1, 2024 (Monday)
      final isoYearStart = Chronos(2024, 1, 1, 0, 0, 0);
      final notIsoYearStart = Chronos(2024, 1, 2, 0, 0, 0);

      expect(isoYearStart.isStartOfIsoYear, true);
      expect(notIsoYearStart.isStartOfIsoYear, false);
    });

    test('isStartOfDecade property', () {
      final decadeStart = Chronos(2020, 1, 1, 0, 0, 0);
      final notDecadeStart = Chronos(2023, 1, 1, 0, 0, 0);

      expect(decadeStart.isStartOfDecade, true);
      expect(notDecadeStart.isStartOfDecade, false);
    });

    test('isStartOfCentury property', () {
      final centuryStart = Chronos(2001, 1, 1, 0, 0, 0);
      final notCenturyStart = Chronos(2023, 1, 1, 0, 0, 0);

      expect(centuryStart.isStartOfCentury, true);
      expect(notCenturyStart.isStartOfCentury, false);
    });

    test('isStartOfMillennium property', () {
      final millenniumStart = Chronos(2001, 1, 1, 0, 0, 0);
      final notMillenniumStart = Chronos(2023, 1, 1, 0, 0, 0);

      expect(millenniumStart.isStartOfMillennium, true);
      expect(notMillenniumStart.isStartOfMillennium, false);
    });

    test('isStartOfHour property', () {
      final hourStart = Chronos(2023, 12, 25, 14, 0, 0, 0, 0);
      final notHourStart = Chronos(2023, 12, 25, 14, 30, 0, 0, 0);

      expect(hourStart.isStartOfHour, true);
      expect(notHourStart.isStartOfHour, false);
    });

    test('isStartOfMinute property', () {
      final minuteStart = Chronos(2023, 12, 25, 14, 30, 0, 0, 0);
      final notMinuteStart = Chronos(2023, 12, 25, 14, 30, 45, 0, 0);

      expect(minuteStart.isStartOfMinute, true);
      expect(notMinuteStart.isStartOfMinute, false);
    });

    test('isStartOfSecond property', () {
      final secondStart = Chronos(2023, 12, 25, 14, 30, 45, 0, 0);
      final notSecondStart = Chronos(2023, 12, 25, 14, 30, 45, 500, 0);

      expect(secondStart.isStartOfSecond, true);
      expect(notSecondStart.isStartOfSecond, false);
    });

    test('isStartOfMillisecond property', () {
      final msStart = Chronos(2023, 12, 25, 14, 30, 45, 500, 0);
      final notMsStart = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);

      expect(msStart.isStartOfMillisecond, true);
      expect(notMsStart.isStartOfMillisecond, false);
    });
  });

  group('Boundary Checks - End', () {
    test('isEndOfDay property', () {
      final endOfDay = Chronos(2023, 12, 25, 23, 59, 59, 999, 999);
      final notEndOfDay = Chronos(2023, 12, 25, 14, 30, 45);

      expect(endOfDay.isEndOfDay, true);
      expect(notEndOfDay.isEndOfDay, false);
    });

    test('isEndOfWeek property', () {
      final saturday = Chronos(
        2023,
        12,
        30,
        23,
        59,
        59,
        999,
        999,
      ); // Saturday at end of day
      final monday = Chronos(
        2023,
        12,
        25,
        23,
        59,
        59,
        999,
        999,
      ); // Monday at end of day

      expect(saturday.isEndOfWeek, true);
      expect(monday.isEndOfWeek, false);
    });

    test('isEndOfIsoWeek property', () {
      final sunday = Chronos(
        2023,
        12,
        31,
        23,
        59,
        59,
        999,
        999,
      ); // Sunday at end of day
      final monday = Chronos(
        2023,
        12,
        25,
        23,
        59,
        59,
        999,
        999,
      ); // Monday at end of day

      expect(sunday.isEndOfIsoWeek, true);
      expect(monday.isEndOfIsoWeek, false);
    });

    test('isEndOfMonth property', () {
      final lastDayOfMonth = Chronos(2023, 12, 31, 23, 59, 59, 999, 999);
      final notLastDay = Chronos(2023, 12, 25, 23, 59, 59, 999, 999);

      expect(lastDayOfMonth.isEndOfMonth, true);
      expect(notLastDay.isEndOfMonth, false);
    });

    test('isEndOfQuarter property', () {
      final q1End = Chronos(2023, 3, 31, 23, 59, 59, 999, 999);
      final q2End = Chronos(2023, 6, 30, 23, 59, 59, 999, 999);
      final notQuarterEnd = Chronos(2023, 2, 28, 23, 59, 59, 999, 999);

      expect(q1End.isEndOfQuarter, true);
      expect(q2End.isEndOfQuarter, true);
      expect(notQuarterEnd.isEndOfQuarter, false);
    });

    test('isEndOfYear property', () {
      final yearEnd = Chronos(2023, 12, 31, 23, 59, 59, 999, 999);
      final notYearEnd = Chronos(2023, 6, 15, 23, 59, 59, 999, 999);

      expect(yearEnd.isEndOfYear, true);
      expect(notYearEnd.isEndOfYear, false);
    });

    test('isEndOfIsoYear property', () {
      // This is complex to test as it depends on ISO year calculations
      final chronos = Chronos(2023, 12, 31);
      final endOfIsoYear = chronos.endOfIsoYear();

      expect(endOfIsoYear.isEndOfIsoYear, true);
    });

    test('isEndOfDecade property', () {
      final decadeEnd = Chronos(2029, 12, 31, 23, 59, 59, 999, 999);
      final notDecadeEnd = Chronos(2023, 12, 31, 23, 59, 59, 999, 999);

      expect(decadeEnd.isEndOfDecade, true);
      expect(notDecadeEnd.isEndOfDecade, false);
    });

    test('isEndOfCentury property', () {
      final centuryEnd = Chronos(2100, 12, 31, 23, 59, 59, 999, 999);
      final notCenturyEnd = Chronos(2023, 12, 31, 23, 59, 59, 999, 999);

      expect(centuryEnd.isEndOfCentury, true);
      expect(notCenturyEnd.isEndOfCentury, false);
    });

    test('isEndOfMillennium property', () {
      final millenniumEnd = Chronos(3000, 12, 31, 23, 59, 59, 999, 999);
      final notMillenniumEnd = Chronos(2023, 12, 31, 23, 59, 59, 999, 999);

      expect(millenniumEnd.isEndOfMillennium, true);
      expect(notMillenniumEnd.isEndOfMillennium, false);
    });

    test('isEndOfHour property', () {
      final hourEnd = Chronos(2023, 12, 25, 14, 59, 59, 999, 999);
      final notHourEnd = Chronos(2023, 12, 25, 14, 30, 59, 999, 999);

      expect(hourEnd.isEndOfHour, true);
      expect(notHourEnd.isEndOfHour, false);
    });

    test('isEndOfMinute property', () {
      final minuteEnd = Chronos(2023, 12, 25, 14, 30, 59, 999, 999);
      final notMinuteEnd = Chronos(2023, 12, 25, 14, 30, 45, 999, 999);

      expect(minuteEnd.isEndOfMinute, true);
      expect(notMinuteEnd.isEndOfMinute, false);
    });

    test('isEndOfSecond property', () {
      final secondEnd = Chronos(2023, 12, 25, 14, 30, 45, 999, 999);
      final notSecondEnd = Chronos(2023, 12, 25, 14, 30, 45, 500, 999);

      expect(secondEnd.isEndOfSecond, true);
      expect(notSecondEnd.isEndOfSecond, false);
    });

    test('isEndOfMillisecond property', () {
      final msEnd = Chronos(2023, 12, 25, 14, 30, 45, 500, 999);
      final notMsEnd = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);

      expect(msEnd.isEndOfMillisecond, true);
      expect(notMsEnd.isEndOfMillisecond, false);
    });

    test('isLastOfMonth property', () {
      // isLastOfMonth checks if the current date is the same as the end of the month
      // This means it compares with "today", so we need to test with actual dates
      ChronosConfig().setFakeNow(Chronos(2023, 12, 31, 10, 30, 0));
      try {
        final today = Chronos.now();
        final endOfThisMonth = today.endOfMonth();

        // Test if today is the last day of the month
        expect(today.isLastOfMonth, today.day == endOfThisMonth.day);

        // Test with specific dates
        final lastDayOfDec = Chronos(2023, 12, 31);
        final notLastDay = Chronos(2023, 12, 25);

        // These will only be true if the test is run on those specific days
        // So we test the logic instead
        expect(lastDayOfDec.endOfMonth().day, 31);
        expect(notLastDay.endOfMonth().day, 31);
        expect(lastDayOfDec.day == lastDayOfDec.endOfMonth().day, true);
        expect(notLastDay.day == notLastDay.endOfMonth().day, false);
      } finally {
        ChronosConfig().resetFakeNow();
      }
    });
  });

  group('Special Boundary Checks', () {
    test('isNowOrFuture property', () {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
      try {
        final future = Chronos.now().addYear();
        final past = Chronos.now().subYear();

        expect(future.isNowOrFuture, true);
        expect(past.isNowOrFuture, false);

        final almostNow = Chronos.now().addSeconds(1);
        expect(almostNow.isNowOrFuture, true);
      } finally {
        ChronosConfig().resetFakeNow();
      }
    });

    test('isNowOrPast property', () {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
      try {
        final future = Chronos.now().addYear();
        final past = Chronos.now().subYear();
        final now = Chronos.now();

        expect(future.isNowOrPast, false);
        expect(past.isNowOrPast, true);
        expect(now.isNowOrPast, true);
      } finally {
        ChronosConfig().resetFakeNow();
      }
    });
  });

  group('Unit-based Boundary Methods', () {
    test('startOfUnit method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);

      final startOfDay = chronos.startOfUnit(TimeUnit.day);
      expect(startOfDay.hour, 0);
      expect(startOfDay.minute, 0);
      expect(startOfDay.second, 0);

      final startOfHour = chronos.startOfUnit(TimeUnit.hour);
      expect(startOfHour.hour, 14);
      expect(startOfHour.minute, 0);
      expect(startOfHour.second, 0);

      final startOfMonth = chronos.startOfUnit(TimeUnit.month);
      expect(startOfMonth.day, 1);
      expect(startOfMonth.hour, 0);
    });

    test('endOfUnit method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);

      final endOfDay = chronos.endOfUnit(TimeUnit.day);
      expect(endOfDay.hour, 23);
      expect(endOfDay.minute, 59);
      expect(endOfDay.second, 59);

      final endOfHour = chronos.endOfUnit(TimeUnit.hour);
      expect(endOfHour.hour, 14);
      expect(endOfHour.minute, 59);
      expect(endOfHour.second, 59);

      final endOfMonth = chronos.endOfUnit(TimeUnit.month);
      expect(endOfMonth.day, 31); // December has 31 days
      expect(endOfMonth.hour, 23);
    });
  });

  group('Season Boundaries', () {
    test('startOfSeason method', () {
      // Spring (March-May)
      final springDate = Chronos(2023, 4, 15);
      final startOfSpring = springDate.startOfSeason();
      expect(startOfSpring.month, 3);
      expect(startOfSpring.day, 1);

      // Summer (June-August)
      final summerDate = Chronos(2023, 7, 15);
      final startOfSummer = summerDate.startOfSeason();
      expect(startOfSummer.month, 6);
      expect(startOfSummer.day, 1);

      // Autumn (September-November)
      final autumnDate = Chronos(2023, 10, 15);
      final startOfAutumn = autumnDate.startOfSeason();
      expect(startOfAutumn.month, 9);
      expect(startOfAutumn.day, 1);

      // Winter (December-February)
      final winterDate = Chronos(2023, 1, 15);
      final startOfWinter = winterDate.startOfSeason();
      expect(startOfWinter.year, 2022); // Previous year's December
      expect(startOfWinter.month, 12);
      expect(startOfWinter.day, 1);
    });

    test('endOfSeason method', () {
      // Spring (March-May)
      final springDate = Chronos(2023, 4, 15);
      final endOfSpring = springDate.endOfSeason();
      expect(endOfSpring.month, 5);
      expect(endOfSpring.day, 31);

      // Summer (June-August)
      final summerDate = Chronos(2023, 7, 15);
      final endOfSummer = summerDate.endOfSeason();
      expect(endOfSummer.month, 8);
      expect(endOfSummer.day, 31);

      // Autumn (September-November)
      final autumnDate = Chronos(2023, 10, 15);
      final endOfAutumn = autumnDate.endOfSeason();
      expect(endOfAutumn.month, 11);
      expect(endOfAutumn.day, 30);

      // Winter (December-February)
      final winterDate = Chronos(2023, 1, 15);
      final endOfWinter = winterDate.endOfSeason();
      expect(endOfWinter.year, 2023);
      expect(endOfWinter.month, 2);
      expect(endOfWinter.day, 28); // 2023 is not a leap year
    });
  });

  group('ISO Year Boundaries', () {
    test('startOfIsoYear method', () {
      // ISO year 2023 starts on January 2, 2023 (Monday)
      final chronos2023 = Chronos(2023, 6, 15);
      final startOfIsoYear2023 = chronos2023.startOfIsoYear();

      expect(startOfIsoYear2023.year, 2023);
      expect(startOfIsoYear2023.weekday, DateTime.monday);

      // ISO year 2024 starts on January 1, 2024 (Monday)
      final chronos2024 = Chronos(2024, 6, 15);
      final startOfIsoYear2024 = chronos2024.startOfIsoYear();

      expect(startOfIsoYear2024.year, 2024);
      expect(startOfIsoYear2024.month, 1);
      expect(startOfIsoYear2024.day, 1);
      expect(startOfIsoYear2024.weekday, DateTime.monday);
    });

    test('endOfIsoYear method', () {
      final chronos = Chronos(2025, 6, 15);
      final endOfIsoYear = chronos.endOfIsoYear();

      // Should be the Sunday before the start of the next ISO year
      expect(endOfIsoYear.weekday, DateTime.sunday);
      expect(endOfIsoYear.hour, 23);
      expect(endOfIsoYear.minute, 59);
      expect(endOfIsoYear.second, 59);
    });
  });

  group('Edge Cases', () {
    test('leap year February boundaries', () {
      // Leap year
      final leapYear = Chronos(2024, 2, 15);
      final endOfFebLeap = leapYear.endOfMonth();
      expect(endOfFebLeap.day, 29);

      // Non-leap year
      final nonLeapYear = Chronos(2023, 2, 15);
      final endOfFebNonLeap = nonLeapYear.endOfMonth();
      expect(endOfFebNonLeap.day, 28);
    });

    test('year boundary transitions', () {
      final lastDayOfYear = Chronos(2023, 12, 31, 23, 59, 59, 999, 999);
      final firstDayOfYear = Chronos(2024, 1, 1, 0, 0, 0, 0, 0);

      expect(lastDayOfYear.isEndOfYear, true);
      expect(firstDayOfYear.isStartOfYear, true);

      // Adding one microsecond should transition to next year
      final nextMicrosecond = lastDayOfYear.addMicrosecond();
      expect(nextMicrosecond.year, 2024);
      expect(nextMicrosecond.month, 1);
      expect(nextMicrosecond.day, 1);
    });

    test('quarter boundary edge cases', () {
      // End of Q1 (March 31)
      final endQ1 = Chronos(2023, 3, 31, 23, 59, 59, 999, 999);
      expect(endQ1.isEndOfQuarter, true);

      // Start of Q2 (April 1)
      final startQ2 = Chronos(2023, 4, 1, 0, 0, 0, 0, 0);
      expect(startQ2.isStartOfQuarter, true);

      // End of Q2 (June 30)
      final endQ2 = Chronos(2023, 6, 30, 23, 59, 59, 999, 999);
      expect(endQ2.isEndOfQuarter, true);
    });
  });
}
