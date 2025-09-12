import 'package:flutter_chronos/chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Same Unit Comparisons', () {
    test('isSameYear method', () {
      final date1 = Chronos(2023, 6, 15, 10, 30);
      final date2 = Chronos(2023, 12, 25, 14, 45);
      final date3 = Chronos(2024, 1, 1);

      expect(date1.isSameYear(date2), true);
      expect(date1.isSameYear(date3), false);

      // Test with null (compares with current year)
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
      try {
        final currentYear = Chronos.now().year; // Returns 2025
        final thisYear = Chronos(currentYear, 6, 15); // 2025-06-15
        expect(thisYear.isSameYear(), true);
      } finally {
        ChronosConfig().resetFakeNow();
      }
    });

    test('isSameIsoYear method', () {
      final date1 = Chronos(2023, 1, 2); // ISO year 2023
      final date2 = Chronos(2023, 12, 31); // ISO year 2023
      final date3 = Chronos(2024, 1, 1); // ISO year 2024

      expect(date1.isSameIsoYear(date2), true);
      expect(date1.isSameIsoYear(date3), false);
    });

    test('isSameMonth method', () {
      final date1 = Chronos(2023, 6, 15, 10, 30);
      final date2 = Chronos(2023, 6, 25, 14, 45);
      final date3 = Chronos(2023, 7, 15);

      expect(date1.isSameMonth(date2), true);
      expect(date1.isSameMonth(date3), false);
    });

    test('isSameWeek method', () {
      final monday = Chronos(2023, 12, 25); // Monday
      final wednesday = Chronos(2023, 12, 27); // Wednesday (same week)
      final nextMonday = Chronos(2024, 1, 1); // Next Monday (different week)

      expect(monday.isSameWeek(wednesday), true);
      expect(monday.isSameWeek(nextMonday), false);
    });

    test('isSameIsoWeek method', () {
      final monday = Chronos(2023, 12, 25); // Monday
      final sunday = Chronos(2023, 12, 31); // Sunday (same ISO week)
      final nextMonday = Chronos(2024, 1, 1); // Next Monday (different ISO week)

      expect(monday.isSameIsoWeek(sunday), true);
      expect(monday.isSameIsoWeek(nextMonday), false);
    });

    test('isSameDay method', () {
      final date1 = Chronos(2023, 12, 25, 10, 30);
      final date2 = Chronos(2023, 12, 25, 14, 45);
      final date3 = Chronos(2023, 12, 26);

      expect(date1.isSameDay(date2), true);
      expect(date1.isSameDay(date3), false);
    });

    test('isSameHour method', () {
      final date1 = Chronos(2023, 12, 25, 14, 30, 15);
      final date2 = Chronos(2023, 12, 25, 14, 45, 30);
      final date3 = Chronos(2023, 12, 25, 15, 30);

      expect(date1.isSameHour(date2), true);
      expect(date1.isSameHour(date3), false);
    });

    test('isSameMinute method', () {
      final date1 = Chronos(2023, 12, 25, 14, 30, 15);
      final date2 = Chronos(2023, 12, 25, 14, 30, 45);
      final date3 = Chronos(2023, 12, 25, 14, 31, 15);

      expect(date1.isSameMinute(date2), true);
      expect(date1.isSameMinute(date3), false);
    });

    test('isSameSecond method', () {
      final date1 = Chronos(2023, 12, 25, 14, 30, 45, 100);
      final date2 = Chronos(2023, 12, 25, 14, 30, 45, 500);
      final date3 = Chronos(2023, 12, 25, 14, 30, 46);

      expect(date1.isSameSecond(date2), true);
      expect(date1.isSameSecond(date3), false);
    });

    test('isSameMillisecond method', () {
      final date1 = Chronos(2023, 12, 25, 14, 30, 45, 500, 100);
      final date2 = Chronos(2023, 12, 25, 14, 30, 45, 500, 900);
      final date3 = Chronos(2023, 12, 25, 14, 30, 45, 501);

      expect(date1.isSameMillisecond(date2), true);
      expect(date1.isSameMillisecond(date3), false);
    });

    test('isSameMicrosecond method', () {
      final date1 = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);
      final date2 = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);
      final date3 = Chronos(2023, 12, 25, 14, 30, 45, 500, 751);

      expect(date1.isSameMicrosecond(date2), true);
      expect(date1.isSameMicrosecond(date3), false);
    });

    test('isSameQuarter method', () {
      final q1Date1 = Chronos(2023, 1, 15);
      final q1Date2 = Chronos(2023, 3, 31);
      final q2Date = Chronos(2023, 4, 1);

      expect(q1Date1.isSameQuarter(q1Date2), true);
      expect(q1Date1.isSameQuarter(q2Date), false);
    });

    test('isSameDecade method', () {
      // Decade calculation: (year - 1) ~/ 10 + 1
      // Let's test with years we know are in different decades
      final date1 = Chronos(2021, 1, 1); // decade 203: (2021-1) ~/ 10 + 1 = 2020 ~/ 10 + 1 = 202 + 1 = 203
      final date2 = Chronos(2025, 12, 31); // decade 203: (2025-1) ~/ 10 + 1 = 2024 ~/ 10 + 1 = 202 + 1 = 203
      final date3 = Chronos(2031, 1, 1); // decade 204: (2031-1) ~/ 10 + 1 = 2030 ~/ 10 + 1 = 203 + 1 = 204

      expect(date1.isSameDecade(date2), true);
      expect(date1.isSameDecade(date3), false);
    });

    test('isSameCentury method', () {
      final date1 = Chronos(2001, 1, 1);
      final date2 = Chronos(2100, 12, 31);
      final date3 = Chronos(2101, 1, 1);

      expect(date1.isSameCentury(date2), true);
      expect(date1.isSameCentury(date3), false);
    });

    test('isSameMillennium method', () {
      final date1 = Chronos(2000, 1, 1);
      final date2 = Chronos(2100, 12, 31);
      final date3 = Chronos(1999, 1, 1);

      expect(date1.isSameMillennium(date2), false);
      expect(date1.isSameMillennium(date3), true);
    });
  });

  group('Current Time Comparisons', () {
    setUp(() {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
    });

    tearDown(() {
      ChronosConfig().resetFakeNow();
    });

    test('isCurrentYear property', () {
      final now = Chronos.now();
      final thisYear = Chronos(now.year, 6, 15);
      final lastYear = Chronos(now.year - 1, 6, 15);

      expect(thisYear.isCurrentYear, true);
      expect(lastYear.isCurrentYear, false);
    });

    test('isCurrentIsoYear property', () {
      final now = Chronos.now();
      final thisIsoYear = Chronos(now.isoYear, 6, 15);
      final lastIsoYear = Chronos(now.isoYear - 1, 6, 15);

      expect(thisIsoYear.isCurrentIsoYear, true);
      expect(lastIsoYear.isCurrentIsoYear, false);
    });

    test('isCurrentMonth property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00
      final thisMonth = Chronos(now.year, now.month, 15); // 2025-01-15
      final lastMonth = now.subMonth(); // 2024-12-15 10:30:00

      expect(thisMonth.isCurrentMonth, true);
      expect(lastMonth.isCurrentMonth, false);
    });

    test('isCurrentWeek property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00
      final thisWeek = now; // 2025-01-15 10:30:00
      final lastWeek = now.subWeek(); // 2025-01-08 10:30:00

      expect(thisWeek.isCurrentWeek, true);
      expect(lastWeek.isCurrentWeek, false);
    });

    test('isCurrentIsoWeek property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00
      final thisIsoWeek = now; // 2025-01-15 10:30:00
      final lastIsoWeek = now.subIsoWeek(); // 2025-01-08 10:30:00

      expect(thisIsoWeek.isCurrentIsoWeek, true);
      expect(lastIsoWeek.isCurrentIsoWeek, false);
    });

    test('isCurrentDay property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00
      final today = Chronos(now.year, now.month, now.day, 12, 0); // 2025-01-15 12:00:00
      final yesterday = now.subDay(); // 2025-01-14 10:30:00

      expect(today.isCurrentDay, true);
      expect(yesterday.isCurrentDay, false);
    });

    test('isCurrentHour property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00
      final thisHour = Chronos(now.year, now.month, now.day, now.hour, 30); // 2025-01-15 10:30:00
      final lastHour = now.subHour(); // 2025-01-15 09:30:00

      expect(thisHour.isCurrentHour, true);
      expect(lastHour.isCurrentHour, false);
    });

    test('isCurrentMinute property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00
      final thisMinute = Chronos(now.year, now.month, now.day, now.hour, now.minute, 30); // 2025-01-15 10:30:30
      final lastMinute = now.subMinute(); // 2025-01-15 10:29:00

      expect(thisMinute.isCurrentMinute, true);
      expect(lastMinute.isCurrentMinute, false);
    });

    test('isCurrentSecond property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00
      final thisSecond = Chronos(now.year, now.month, now.day, now.hour, now.minute, now.second, 500); // 2025-01-15 10:30:00.500
      final lastSecond = now.subSecond(); // 2025-01-15 10:29:59

      expect(thisSecond.isCurrentSecond, true);
      expect(lastSecond.isCurrentSecond, false);
    });

    test('isCurrentQuarter property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00 (Q1)
      final thisQuarter = now; // 2025-01-15 10:30:00 (Q1)
      final lastQuarter = now.subQuarter(); // 2024-10-15 10:30:00 (Q4)

      expect(thisQuarter.isCurrentQuarter, true);
      expect(lastQuarter.isCurrentQuarter, false);
    });

    test('isCurrentDecade property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00 (2020s decade)
      final thisDecade = now; // 2025-01-15 10:30:00 (2020s decade)
      final lastDecade = now.subDecade(); // 2015-01-15 10:30:00 (2010s decade)

      expect(thisDecade.isCurrentDecade, true);
      expect(lastDecade.isCurrentDecade, false);
    });

    test('isCurrentCentury property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00 (21st century)
      final thisCentury = now; // 2025-01-15 10:30:00 (21st century)
      final lastCentury = now.subCentury(); // 1925-01-15 10:30:00 (20th century)

      expect(thisCentury.isCurrentCentury, true);
      expect(lastCentury.isCurrentCentury, false);
    });

    test('isCurrentMillennium property', () {
      final now = Chronos.now(); // Returns fake time: 2025-01-15 10:30:00 (3rd millennium)
      final thisMillennium = now; // 2025-01-15 10:30:00 (3rd millennium)
      final lastMillennium = now.subMillennium(); // 1025-01-15 10:30:00 (2nd millennium)

      expect(thisMillennium.isCurrentMillennium, true);
      expect(lastMillennium.isCurrentMillennium, false);
    });
  });

  group('Next Time Unit Checks', () {
    setUp(() {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
    });

    tearDown(() {
      ChronosConfig().resetFakeNow();
    });

    test('isNextYear property', () {
      final now = Chronos.now();
      final nextYear = now.addYear();
      final thisYear = now;

      expect(nextYear.isNextYear, true);
      expect(thisYear.isNextYear, false);
    });

    test('isNextMonth property', () {
      final now = Chronos.now();
      final nextMonth = now.addMonth();
      final thisMonth = now;

      expect(nextMonth.isNextMonth, true);
      expect(thisMonth.isNextMonth, false);
    });

    test('isNextWeek property', () {
      final now = Chronos.now();
      final nextWeek = now.addWeek();
      final thisWeek = now;

      expect(nextWeek.isNextWeek, true);
      expect(thisWeek.isNextWeek, false);
    });

    test('isNextDay property', () {
      final now = Chronos.now();
      final tomorrow = now.addDay();
      final today = now;

      expect(tomorrow.isNextDay, true);
      expect(today.isNextDay, false);
    });

    test('isNextHour property', () {
      final now = Chronos.now();
      final nextHour = now.addHour();
      final thisHour = now;

      expect(nextHour.isNextHour, true);
      expect(thisHour.isNextHour, false);
    });

    test('isNextQuarter property', () {
      final now = Chronos.now();
      final nextQuarter = now.addQuarter();
      final thisQuarter = now;

      expect(nextQuarter.isNextQuarter, true);
      expect(thisQuarter.isNextQuarter, false);
    });

    test('isNextDecade property', () {
      final now = Chronos.now();
      final nextDecade = now.addDecade();
      final thisDecade = now;

      expect(nextDecade.isNextDecade, true);
      expect(thisDecade.isNextDecade, false);
    });
  });

  group('Previous Time Unit Checks', () {
    setUp(() {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
    });

    tearDown(() {
      ChronosConfig().resetFakeNow();
    });

    test('isLastYear property', () {
      final now = Chronos.now();
      final lastYear = now.subYear();
      final thisYear = now;

      expect(lastYear.isLastYear, true);
      expect(thisYear.isLastYear, false);
    });

    test('isLastMonth property', () {
      final now = Chronos.now();
      final lastMonth = now.subMonth();
      final thisMonth = now;

      expect(lastMonth.isLastMonth, true);
      expect(thisMonth.isLastMonth, false);
    });

    test('isLastWeek property', () {
      final now = Chronos.now();
      final lastWeek = now.subWeek();
      final thisWeek = now;

      expect(lastWeek.isLastWeek, true);
      expect(thisWeek.isLastWeek, false);
    });

    test('isLastDay property', () {
      final now = Chronos.now();
      final yesterday = now.subDay();
      final today = now;

      expect(yesterday.isLastDay, true);
      expect(today.isLastDay, false);
    });

    test('isLastHour property', () {
      final now = Chronos.now();
      final lastHour = now.subHour();
      final thisHour = now;

      expect(lastHour.isLastHour, true);
      expect(thisHour.isLastHour, false);
    });

    test('isLastQuarter property', () {
      final now = Chronos.now();
      final lastQuarter = now.subQuarter();
      final thisQuarter = now;

      expect(lastQuarter.isLastQuarter, true);
      expect(thisQuarter.isLastQuarter, false);
    });

    test('isLastDecade property', () {
      final now = Chronos.now();
      final lastDecade = now.subDecade();
      final thisDecade = now;

      expect(lastDecade.isLastDecade, true);
      expect(thisDecade.isLastDecade, false);
    });
  });

  group('Range Comparisons', () {
    test('isBetween method', () {
      final start = Chronos(2023, 6, 1);
      final middle = Chronos(2023, 6, 15);
      final end = Chronos(2023, 6, 30);
      final outside = Chronos(2023, 7, 1);

      // Test inclusive range (default)
      expect(middle.isBetween(start, end), true);
      expect(start.isBetween(start, end), true);
      expect(end.isBetween(start, end), true);
      expect(outside.isBetween(start, end), false);

      // Test exclusive range
      expect(middle.isBetween(start, end, equal: false), true);
      expect(start.isBetween(start, end, equal: false), false);
      expect(end.isBetween(start, end, equal: false), false);
      expect(outside.isBetween(start, end, equal: false), false);
    });

    test('isBirthday method', () {
      final birthday = Chronos(1990, 6, 15);
      final sameBirthday = Chronos(2023, 6, 15); // Same month and day, different year
      final differentDay = Chronos(2023, 6, 16);
      final differentMonth = Chronos(2023, 7, 15);

      expect(birthday.isBirthday(sameBirthday), true);
      expect(birthday.isBirthday(differentDay), false);
      expect(birthday.isBirthday(differentMonth), false);
    });
  });

  group('Timezone and DST Comparisons', () {
    test('isDst property', () {
      final chronos = Chronos(2023, 7, 15); // Summer date
      expect(chronos.isDst, isA<bool>()); // Keep this as isA<bool>() since DST depends on system timezone
    });

    test('isLocal property', () {
      final localChronos = Chronos(2023, 12, 25);
      final utcChronos = Chronos.utc(2023, 12, 25);

      expect(localChronos.isLocal, true);
      expect(utcChronos.isLocal, false);
    });
  });

  group('Day of Week Comparisons', () {
    test('day of week properties', () {
      final sunday = Chronos(2023, 12, 31); // Sunday
      final monday = Chronos(2023, 12, 25); // Monday
      final tuesday = Chronos(2023, 12, 26); // Tuesday
      final wednesday = Chronos(2023, 12, 27); // Wednesday
      final thursday = Chronos(2023, 12, 28); // Thursday
      final friday = Chronos(2023, 12, 29); // Friday
      final saturday = Chronos(2023, 12, 30); // Saturday

      expect(sunday.isSunday, true);
      expect(monday.isMonday, true);
      expect(tuesday.isTuesday, true);
      expect(wednesday.isWednesday, true);
      expect(thursday.isThursday, true);
      expect(friday.isFriday, true);
      expect(saturday.isSaturday, true);

      // Test negative cases
      expect(sunday.isMonday, false);
      expect(monday.isTuesday, false);
    });

    test('weekday and weekend properties', () {
      final monday = Chronos(2023, 12, 25); // Monday
      final friday = Chronos(2023, 12, 29); // Friday
      final saturday = Chronos(2023, 12, 30); // Saturday
      final sunday = Chronos(2023, 12, 31); // Sunday

      expect(monday.isWeekday, true);
      expect(friday.isWeekday, true);
      expect(saturday.isWeekday, false);
      expect(sunday.isWeekday, false);

      expect(monday.isWeekend, false);
      expect(friday.isWeekend, false);
      expect(saturday.isWeekend, true);
      expect(sunday.isWeekend, true);
    });
  });

  group('Time Relation Comparisons', () {
    test('yesterday, today, tomorrow properties', () {
      final yesterday = Chronos.yesterday();
      final today = Chronos.today();
      final tomorrow = Chronos.tomorrow();

      expect(yesterday.isYesterday, true);
      expect(today.isToday, true);
      expect(tomorrow.isTomorrow, true);

      expect(yesterday.isToday, false);
      expect(today.isTomorrow, false);
      expect(tomorrow.isYesterday, false);
    });

    test('future and past properties', () {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
      try {
        final now = Chronos.now();
        final future = now.addYear();
        final past = now.subYear();

        expect(future.isFuture, true);
        expect(past.isPast, true);
        expect(future.isPast, false);
        expect(past.isFuture, false);

        // Test nowOrFuture and nowOrPast
        expect(future.isNowOrFuture, true);
        expect(past.isNowOrPast, true);
        expect(future.isNowOrPast, false);
        expect(past.isNowOrFuture, false);
      } finally {
        ChronosConfig().resetFakeNow();
      }
    });
  });

  group('Year Type Comparisons', () {
    test('isLeapYear property', () {
      final leapYear = Chronos(2024, 1, 1); // 2024 is a leap year
      final nonLeapYear = Chronos(2023, 1, 1); // 2023 is not a leap year
      final centuryLeapYear = Chronos(2000, 1, 1); // 2000 is a leap year (divisible by 400)
      final centuryNonLeapYear = Chronos(1900, 1, 1); // 1900 is not a leap year

      expect(leapYear.isLeapYear, true);
      expect(nonLeapYear.isLeapYear, false);
      expect(centuryLeapYear.isLeapYear, true);
      expect(centuryNonLeapYear.isLeapYear, false);
    });

    test('isLongYear property', () {
      expect(Chronos(2015, 1, 1).isLongYear, true);
      expect(Chronos(2016, 1, 1).isLongYear, false);
    });

    test('isLongIsoYear property', () {
      expect(Chronos(2015, 1, 1).isLongIsoYear, true);
      expect(Chronos(2016, 1, 1).isLongIsoYear, true);
      expect(Chronos(2016, 1, 3).isLongIsoYear, true);
      expect(Chronos(2016, 1, 4).isLongIsoYear, false);
      expect(Chronos(2019, 12, 29).isLongIsoYear, false);
      expect(Chronos(2019, 12, 30).isLongIsoYear, true);
    });
  });

  group('Generic Unit Comparisons', () {
    test('isSameUnit method', () {
      final date1 = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);
      final date2 = Chronos(2023, 12, 25, 16, 45, 30, 200, 100);
      final date3 = Chronos(2023, 12, 26, 14, 30, 45, 500, 750);

      // Same day, different times
      expect(date1.isSameUnit(TimeUnit.day, date2), true);
      expect(date1.isSameUnit(TimeUnit.hour, date2), false);

      // Different days
      expect(date1.isSameUnit(TimeUnit.day, date3), false);

      // Same exact time
      expect(date1.isSameUnit(TimeUnit.microsecond, date1), true);
    });

    test('isCurrentUnit method', () {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
      try {
        final now = Chronos.now();

        expect(now.isCurrentUnit(TimeUnit.year), true);
        expect(now.isCurrentUnit(TimeUnit.month), true);
        expect(now.isCurrentUnit(TimeUnit.day), true);

        final lastYear = now.subYear();
        expect(lastYear.isCurrentUnit(TimeUnit.year), false);
      } finally {
        ChronosConfig().resetFakeNow();
      }
    });

    test('isNextUnit method', () {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
      try {
        final now = Chronos.now();
        final nextYear = now.addYear();
        final nextMonth = now.addMonth();

        expect(nextYear.isNextUnit(TimeUnit.year), true);
        expect(nextMonth.isNextUnit(TimeUnit.month), true);
        expect(now.isNextUnit(TimeUnit.year), false);
      } finally {
        ChronosConfig().resetFakeNow();
      }
    });

    test('isLastUnit method', () {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 15, 10, 30, 0));
      try {
        final now = Chronos.now();
        final lastYear = now.subYear();
        final lastMonth = now.subMonth();

        expect(lastYear.isLastUnit(TimeUnit.year), true);
        expect(lastMonth.isLastUnit(TimeUnit.month), true);
        expect(now.isLastUnit(TimeUnit.year), false);
      } finally {
        ChronosConfig().resetFakeNow();
      }
    });
  });

  group('Edge Cases', () {
    test('UTC vs Local comparisons', () {
      final localTime = Chronos(2023, 12, 25, 12, 0, 0);
      final utcTime = Chronos.utc(2023, 12, 25, 12, 0, 0);

      // Same moment in time but different timezone representations
      expect(localTime.isSameYear(utcTime), true);
      expect(localTime.isSameMonth(utcTime), true);
      expect(localTime.isSameDay(utcTime), true);

      // But they might not be the same hour due to timezone offset
      expect(localTime.isLocal, true);
      expect(utcTime.isLocal, false);
    });

    test('boundary conditions', () {
      final endOfYear = Chronos(2023, 12, 31, 23, 59, 59, 999, 999);
      final startOfNextYear = Chronos(2024, 1, 1, 0, 0, 0, 0, 0);

      expect(endOfYear.isSameYear(startOfNextYear), false);
      expect(endOfYear.isSameMonth(startOfNextYear), false);
      expect(endOfYear.isSameDay(startOfNextYear), false);

      // But they should be consecutive
      final nextMicrosecond = endOfYear.addMicrosecond();
      expect(nextMicrosecond.year, startOfNextYear.year);
      expect(nextMicrosecond.month, startOfNextYear.month);
      expect(nextMicrosecond.day, startOfNextYear.day);
    });

    test('leap year February comparisons', () {
      final leapFeb29 = Chronos(2024, 2, 29);
      final nonLeapFeb28 = Chronos(2023, 2, 28);

      expect(leapFeb29.isLeapYear, true);
      expect(nonLeapFeb28.isLeapYear, false);

      expect(leapFeb29.isSameMonth(nonLeapFeb28), false); // Different years

      final leapFeb28 = Chronos(2024, 2, 28);
      expect(leapFeb29.isSameMonth(leapFeb28), true);
      expect(leapFeb29.isSameDay(leapFeb28), false);
    });
  });
}
