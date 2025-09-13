import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Setters - Date and Time', () {
    test('setDate method', () {
      final date = Chronos(2022, 1, 1);
      final newDate = date.setDate(2023, month: 2, day: 2);
      expect(newDate.year, 2023);
      expect(newDate.month, 2);
      expect(newDate.day, 2);
    });
    test('setTime method', () {
      final date = Chronos(2022, 1, 1, 10, 20, 30);
      final newDate = date.setTime(hour: 1, minute: 2, second: 3);
      expect(newDate.hour, 1);
      expect(newDate.minute, 2);
      expect(newDate.second, 3);
    });
    test('setDateFrom method', () {
      final date1 = Chronos(2022, 1, 1);
      final date2 = Chronos(2023, 2, 2);
      final newDate = date1.setDateFrom(date2);
      expect(newDate.year, 2023);
      expect(newDate.month, 2);
      expect(newDate.day, 2);
    });
    test('setTimeFrom method', () {
      final date1 = Chronos(2022, 1, 1, 10, 20, 30);
      final date2 = Chronos(2023, 2, 2, 1, 2, 3);
      final newDate = date1.setTimeFrom(date2);
      expect(newDate.hour, 1);
      expect(newDate.minute, 2);
      expect(newDate.second, 3);
    });
    test('setYear method', () {
      final date = Chronos(2022, 1, 1);
      final newDate = date.setYear(2023);
      expect(newDate.year, 2023);

      final date1 = Chronos(2024, 2, 29);
      final newDate1 = date1.setYear(2023);
      expect(newDate1.year, 2023);
      expect(newDate1.month, 2);
      expect(newDate1.day, 28);
    });
    test('setMonth method', () {
      final date = Chronos(2022, 1, 1);
      final newDate = date.setMonth(2);
      expect(newDate.month, 2);
    });
    test('setDay method', () {
      final date = Chronos(2022, 1, 1);
      final newDate = date.setDay(2);
      expect(newDate.day, 2);
    });
    test('setHour method', () {
      final date = Chronos(2022, 1, 1, 10);
      final newDate = date.setHour(1);
      expect(newDate.hour, 1);
    });
    test('setMinute method', () {
      final date = Chronos(2022, 1, 1, 10, 20);
      final newDate = date.setMinute(2);
      expect(newDate.minute, 2);
    });
    test('setSecond method', () {
      final date = Chronos(2022, 1, 1, 10, 20, 30);
      final newDate = date.setSecond(3);
      expect(newDate.second, 3);
    });
    test('setMillisecond method', () {
      final date = Chronos(2022, 1, 1, 10, 20, 30, 40);
      final newDate = date.setMillisecond(4);
      expect(newDate.millisecond, 4);
    });
    test('setMicrosecond method', () {
      final date = Chronos(2022, 1, 1, 10, 20, 30, 40, 50);
      final newDate = date.setMicrosecond(5);
      expect(newDate.microsecond, 5);
    });
    test('setTimestamp method', () {
      final date = Chronos(2022, 1, 1);
      final newDate = date
          .setTimestamp(1672531200)
          .toUtc(); // 2023-01-01 00:00:00 UTC
      expect(newDate.year, 2023);
      expect(newDate.month, 1);
      expect(newDate.day, 1);
      expect(newDate.hour, 0);
      expect(newDate.minute, 0);
      expect(newDate.second, 0);
    });
  });

  group('Setters - Week Related', () {
    test('setWeek method', () {
      final date = Chronos(2023, 5, 15);
      final newDate = date.setWeek(10);
      expect(newDate.year, 2023);
      expect(newDate.week, 10);
    });
    test('setIsoWeek method', () {
      final date = Chronos(2023, 5, 15);
      final newDate = date.setIsoWeek(10);
      expect(newDate.year, 2023);
      expect(newDate.isoWeek, 10);
    });
    test('setDayOfWeek method', () {
      final date = Chronos(2023, 5, 15); // A Monday
      final newDate = date.setDayOfWeek(4); // Wednesday
      expect(newDate.weekday, 3);
      expect(newDate.isWednesday, isTrue);
    });
    test('setIsoDayOfWeek method', () {
      final date = Chronos(2023, 5, 15); // A Monday
      final newDate = date.setIsoDayOfWeek(3); // Wednesday
      expect(newDate.isoDayOfWeek, 3);
      expect(newDate.isWednesday, isTrue);
    });
  });

  group('Boundary Modifiers', () {
    test('startOfDay method', () {
      final date = Chronos(2022, 1, 1, 12, 34, 56);
      final startOfDay = date.startOfDay();
      expect(startOfDay.hour, 0);
      expect(startOfDay.minute, 0);
      expect(startOfDay.second, 0);
      expect(startOfDay.millisecond, 0);
      expect(startOfDay.microsecond, 0);
    });
    test('startOfWeek method', () {
      final date = Chronos(2023, 1, 4); // Wednesday
      final startOfWeek = date.startOfWeek();
      expect(startOfWeek.year, 2023);
      expect(startOfWeek.month, 1);
      expect(startOfWeek.day, 1); // Sunday
      expect(startOfWeek.hour, 0);
    });
    test('startOfMonth method', () {
      final date = Chronos(2022, 1, 15, 12);
      final startOfMonth = date.startOfMonth();
      expect(startOfMonth.year, 2022);
      expect(startOfMonth.month, 1);
      expect(startOfMonth.day, 1);
      expect(startOfMonth.hour, 0);
    });
    test('startOfYear method', () {
      final date = Chronos(2022, 6, 15, 12);
      final startOfYear = date.startOfYear();
      expect(startOfYear.year, 2022);
      expect(startOfYear.month, 1);
      expect(startOfYear.day, 1);
      expect(startOfYear.hour, 0);
    });
    test('startOfHour method', () {
      final date = Chronos(2022, 1, 1, 12, 34, 56, 789);
      final startOfHour = date.startOfHour();
      expect(startOfHour.hour, 12);
      expect(startOfHour.minute, 0);
      expect(startOfHour.second, 0);
      expect(startOfHour.millisecond, 0);
      expect(startOfHour.microsecond, 0);
    });
    test('startOfMinute method', () {
      final date = Chronos(2022, 1, 1, 12, 34, 56, 789, 123);
      final startOfMinute = date.startOfMinute();
      expect(startOfMinute.hour, 12);
      expect(startOfMinute.minute, 34);
      expect(startOfMinute.second, 0);
      expect(startOfMinute.millisecond, 0);
      expect(startOfMinute.microsecond, 0);
    });
    test('endOfDay method', () {
      final date = Chronos(2022, 1, 1, 12);
      final endOfDay = date.endOfDay();
      expect(endOfDay.hour, 23);
      expect(endOfDay.minute, 59);
      expect(endOfDay.second, 59);
      expect(endOfDay.millisecond, 999);
      expect(endOfDay.microsecond, 999);
    });
    test('endOfWeek method', () {
      final date = Chronos(2023, 1, 4); // Wednesday
      final endOfWeek = date.endOfWeek();
      expect(endOfWeek.year, 2023);
      expect(endOfWeek.month, 1);
      expect(endOfWeek.day, 7); // Saturday
      expect(endOfWeek.hour, 23);
      expect(endOfWeek.minute, 59);
    });
    test('endOfMonth method', () {
      final date1 = Chronos(2022, 1, 15);
      final endOfMonth1 = date1.endOfMonth();
      expect(endOfMonth1.year, 2022);
      expect(endOfMonth1.month, 1);
      expect(endOfMonth1.day, 31);
      expect(endOfMonth1.hour, 23);

      final date2 = Chronos(2024, 2, 10); // Leap year
      final endOfMonth2 = date2.endOfMonth();
      expect(endOfMonth2.day, 29);

      final date3 = Chronos(2023, 2, 10); // Common year
      final endOfMonth3 = date3.endOfMonth();
      expect(endOfMonth3.day, 28);
    });
    test('endOfYear method', () {
      final date = Chronos(2022, 6, 15);
      final endOfYear = date.endOfYear();
      expect(endOfYear.year, 2022);
      expect(endOfYear.month, 12);
      expect(endOfYear.day, 31);
      expect(endOfYear.hour, 23);
      expect(endOfYear.minute, 59);
    });
    test('startOfSeason method', () {
      // Spring
      final date1 = Chronos(2023, 4, 15);
      final startOfSeason1 = date1.startOfSeason();
      expect(startOfSeason1.month, 3);
      expect(startOfSeason1.day, 1);

      // Summer
      final date2 = Chronos(2023, 7, 15);
      final startOfSeason2 = date2.startOfSeason();
      expect(startOfSeason2.month, 6);
      expect(startOfSeason2.day, 1);

      // Autumn
      final date3 = Chronos(2023, 10, 15);
      final startOfSeason3 = date3.startOfSeason();
      expect(startOfSeason3.month, 9);
      expect(startOfSeason3.day, 1);

      // Winter (in December)
      final date4 = Chronos(2023, 12, 15);
      final startOfSeason4 = date4.startOfSeason();
      expect(startOfSeason4.year, 2023);
      expect(startOfSeason4.month, 12);
      expect(startOfSeason4.day, 1);

      // Winter (in January)
      final date5 = Chronos(2023, 1, 15);
      final startOfSeason5 = date5.startOfSeason();
      expect(startOfSeason5.year, 2022);
      expect(startOfSeason5.month, 12);
      expect(startOfSeason5.day, 1);
    });
    test('endOfSeason method', () {
      // Spring
      final date1 = Chronos(2023, 4, 15);
      final endOfSeason1 = date1.endOfSeason();
      expect(endOfSeason1.month, 5);
      expect(endOfSeason1.day, 31);

      // Summer
      final date2 = Chronos(2023, 7, 15);
      final endOfSeason2 = date2.endOfSeason();
      expect(endOfSeason2.month, 8);
      expect(endOfSeason2.day, 31);

      // Autumn
      final date3 = Chronos(2023, 10, 15);
      final endOfSeason3 = date3.endOfSeason();
      expect(endOfSeason3.month, 11);
      expect(endOfSeason3.day, 30);

      // Winter (from December)
      final date4 = Chronos(2023, 12, 15);
      final endOfSeason4 = date4.endOfSeason();
      expect(endOfSeason4.year, 2024);
      expect(endOfSeason4.month, 2);
      expect(endOfSeason4.day, 29); // 2024 is a leap year

      // Winter (from January)
      final date5 = Chronos(2023, 1, 15);
      final endOfSeason5 = date5.endOfSeason();
      expect(endOfSeason5.year, 2023);
      expect(endOfSeason5.month, 2);
      expect(endOfSeason5.day, 28); // 2023 is a common year
    });
    test('startOfUnit method', () {
      final date = Chronos(2023, 5, 15, 10, 30, 45);
      expect(date.startOfUnit(TimeUnit.year), date.startOfYear());
      expect(date.startOfUnit(TimeUnit.month), date.startOfMonth());
      expect(date.startOfUnit(TimeUnit.day), date.startOfDay());
      expect(date.startOfUnit(TimeUnit.hour), date.startOfHour());
    });
    test('endOfUnit method', () {
      final date = Chronos(2023, 5, 15, 10, 30, 45);
      expect(date.endOfUnit(TimeUnit.year), date.endOfYear());
      expect(date.endOfUnit(TimeUnit.month), date.endOfMonth());
      expect(date.endOfUnit(TimeUnit.day), date.endOfDay());
      expect(date.endOfUnit(TimeUnit.hour), date.endOfHour());
    });
  });

  group('Utility Modifiers', () {
    test('lerp method', () {
      final start = Chronos(2023, 1, 1);
      final end = Chronos(2023, 1, 3);
      final mid = Chronos(2023, 1, 2);

      expect(start.lerp(end, 0), start);
      expect(start.lerp(end, 1), end);
      expect(start.lerp(end, 0.5), mid);
    });
    test('mid method', () {
      final start = Chronos(2023, 1, 1);
      final end = Chronos(2023, 1, 3);
      final mid = Chronos(2023, 1, 2);

      expect(start.mid(end), mid);
    });
    test('closest method', () {
      final reference = Chronos(2023, 1, 10);
      final closer = Chronos(2023, 1, 9);
      final farther = Chronos(2023, 1, 1);

      expect(reference.closest(closer, farther), closer);
      expect(reference.closest(farther, closer), closer);
    });
    test('farthest method', () {
      final reference = Chronos(2023, 1, 10);
      final closer = Chronos(2023, 1, 9);
      final farther = Chronos(2023, 1, 1);

      expect(reference.farthest(closer, farther), farther);
      expect(reference.farthest(farther, closer), farther);
    });
    test('min method', () {
      final date1 = Chronos(2023, 1, 1);
      final date2 = Chronos(2023, 1, 15);
      final date3 = Chronos(2022, 12, 31);

      expect(date1.min(date2), date1);
      expect(date1.min(date2, [date3]), date3);
    });
    test('max method', () {
      final date1 = Chronos(2023, 1, 1);
      final date2 = Chronos(2023, 1, 15);
      final date3 = Chronos(2022, 12, 31);

      expect(date1.max(date2), date2);
      expect(date1.max(date3, [date2]), date2);
    });
  });

  group('Modifier Edge Cases', () {
    test('month end handling in setters', () {
      // Setting a day that doesn't exist in a month
      final date = Chronos(2023, 4, 1); // April has 30 days
      final newDate = date.setDay(31);
      expect(newDate.month, 5);
      expect(newDate.day, 1);

      // Setting the month on a day that doesn't exist in the target month
      final date2 = Chronos(2023, 1, 31, 23, 59, 9);
      final newDate2 = date2.setMonth(2);
      expect(newDate2.month, 2);
      expect(newDate2.day, 28);
    });
    test('leap year handling in setters', () {
      // Leap year: setting to Feb 29 should be successful
      final date1 = Chronos(2024, 2, 1);
      final newDate1 = date1.setDay(29);
      expect(newDate1.year, 2024);
      expect(newDate1.month, 2);
      expect(newDate1.day, 29);

      // Common year: setting to Feb 29 should roll over to March 1
      final date2 = Chronos(2023, 2, 1);
      final newDate2 = date2.setDay(29);
      expect(newDate2.year, 2023);
      expect(newDate2.month, 3);
      expect(newDate2.day, 1);
    });
    test('timezone preservation in modifiers', () {
      // Test with UTC
      final utcDate = Chronos.utc(2023, 1, 1);
      final modifiedUtc = utcDate.addDays(1).setYear(2024);
      expect(modifiedUtc.isUtc, isTrue);

      // Test with local time
      final localDate = Chronos(2023, 1, 1);
      final modifiedLocal = localDate.addDays(1).setYear(2024);
      expect(modifiedLocal.isUtc, isFalse);
    });
    test('invalid input handling', () {
      // Month > 12
      final date1 = Chronos(2023, 1, 1);
      final newDate1 = date1.setMonth(13);
      expect(newDate1.year, 2024);
      expect(newDate1.month, 1);

      // Day = 0
      final date2 = Chronos(2023, 1, 15);
      final newDate2 = date2.setDay(0);
      expect(newDate2.year, 2022);
      expect(newDate2.month, 12);
      expect(newDate2.day, 31);

      // Hour > 23
      final date3 = Chronos(2023, 1, 1, 10);
      final newDate3 = date3.setHour(25);
      expect(newDate3.day, 2);
      expect(newDate3.hour, 1);
    });

    group('Addition - Single Units', () {
      test('addMicrosecond method', () {
        expect(
          Chronos(2023, 1, 1, 0, 0, 0, 0, 0).addMicrosecond(),
          Chronos(2023, 1, 1, 0, 0, 0, 0, 1),
        );
        expect(
          Chronos(2023, 1, 1, 0, 0, 0, 0, 999).addMicrosecond(),
          Chronos(2023, 1, 1, 0, 0, 0, 1, 0),
        );
        expect(
          Chronos(2023, 1, 1, 0, 0, 0, 999, 999).addMicrosecond(),
          Chronos(2023, 1, 1, 0, 0, 1, 0, 0),
        );
        expect(
          Chronos(2023, 1, 1, 0, 0, 59, 999, 999).addMicrosecond(),
          Chronos(2023, 1, 1, 0, 1, 0, 0, 0),
        );
        expect(
          Chronos(2023, 1, 1, 0, 59, 59, 999, 999).addMicrosecond(),
          Chronos(2023, 1, 1, 1, 0, 0, 0, 0),
        );
        expect(
          Chronos(2023, 1, 1, 23, 59, 59, 999, 999).addMicrosecond(),
          Chronos(2023, 1, 2, 0, 0, 0, 0, 0),
        );
        expect(
          Chronos(2023, 12, 31, 23, 59, 59, 999, 999).addMicrosecond(),
          Chronos(2024, 1, 1, 0, 0, 0, 0, 0),
        );
      });

      test('addMillisecond method', () {
        expect(
          Chronos(2023, 1, 1, 0, 0, 0, 0).addMillisecond(),
          Chronos(2023, 1, 1, 0, 0, 0, 1),
        );
        expect(
          Chronos(2023, 1, 1, 0, 0, 0, 999).addMillisecond(),
          Chronos(2023, 1, 1, 0, 0, 1, 0),
        );
        expect(
          Chronos(2023, 12, 31, 23, 59, 59, 999).addMillisecond(),
          Chronos(2024, 1, 1, 0, 0, 0, 0),
        );
      });

      test('addSecond method', () {
        expect(
          Chronos(2023, 1, 1, 0, 0, 0).addSecond(),
          Chronos(2023, 1, 1, 0, 0, 1),
        );
        expect(
          Chronos(2023, 1, 1, 0, 0, 59).addSecond(),
          Chronos(2023, 1, 1, 0, 1, 0),
        );
        expect(
          Chronos(2023, 12, 31, 23, 59, 59).addSecond(),
          Chronos(2024, 1, 1, 0, 0, 0),
        );
      });

      test('addMinute method', () {
        expect(
          Chronos(2023, 1, 1, 0, 0).addMinute(),
          Chronos(2023, 1, 1, 0, 1),
        );
        expect(
          Chronos(2023, 1, 1, 0, 59).addMinute(),
          Chronos(2023, 1, 1, 1, 0),
        );
        expect(
          Chronos(2023, 12, 31, 23, 59).addMinute(),
          Chronos(2024, 1, 1, 0, 0),
        );
      });

      test('addHour method', () {
        expect(Chronos(2023, 1, 1, 0).addHour(), Chronos(2023, 1, 1, 1));
        expect(Chronos(2023, 1, 1, 23).addHour(), Chronos(2023, 1, 2, 0));
        expect(Chronos(2023, 12, 31, 23).addHour(), Chronos(2024, 1, 1, 0));
      });

      test('addDay method', () {
        expect(Chronos(2023, 1, 1).addDay(), Chronos(2023, 1, 2));
        expect(Chronos(2023, 1, 31).addDay(), Chronos(2023, 2, 1));
        expect(Chronos(2023, 12, 31).addDay(), Chronos(2024, 1, 1));
      });

      test('addWeek method', () {
        expect(Chronos(2023, 1, 1).addWeek(), Chronos(2023, 1, 8));
        expect(Chronos(2023, 12, 25).addWeek(), Chronos(2024, 1, 1));
      });

      test('addMonth method', () {
        expect(Chronos(2023, 1, 15).addMonth(), Chronos(2023, 2, 15));
        expect(Chronos(2023, 1, 31).addMonth(), Chronos(2023, 2, 28));
        expect(Chronos(2024, 1, 31).addMonth(), Chronos(2024, 2, 29));
        expect(Chronos(2023, 12, 15).addMonth(), Chronos(2024, 1, 15));
      });

      test('addYear method', () {
        expect(Chronos(2023, 1, 1).addYear(), Chronos(2024, 1, 1));
        expect(Chronos(2020, 2, 29).addYear(), Chronos(2021, 2, 28));
        expect(Chronos(2023, 12, 31).addYear(), Chronos(2024, 12, 31));
      });
    });

    group('Subtraction - Single Units', () {});

    group('Addition - Multiple Units', () {
      test('addDays method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.addDays(5);

        expect(result.day, 30);
        expect(result.month, chronos.month);
      });

      test('addWeeks method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.addWeeks(2);

        expect(result.difference(chronos).inDays, 14);
      });

      test('addMonths method', () {
        final chronos = Chronos(2023, 10, 25);
        final result = chronos.addMonths(3);

        expect(result.year, 2024);
        expect(result.month, 1);
        expect(result.day, 25);
      });

      test('addYears method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.addYears(2);

        expect(result.year, 2025);
        expect(result.month, chronos.month);
        expect(result.day, chronos.day);
      });
    });

    group('Subtraction - Multiple Units', () {
      test('subDays method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.subDays(5);

        expect(result.day, 20);
        expect(result.month, chronos.month);
      });

      test('subMonths method', () {
        final chronos = Chronos(2024, 3, 25);
        final result = chronos.subMonths(5);

        expect(result.year, 2023);
        expect(result.month, 10);
        expect(result.day, 25);
      });

      test('subYears method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.subYears(2);

        expect(result.year, 2021);
        expect(result.month, chronos.month);
        expect(result.day, chronos.day);
      });
    });

    group('Special Unit Operations', () {
      test('addQuarter method', () {
        final chronos = Chronos(2023, 3, 15); // Q1
        final result = chronos.addQuarter();

        expect(result.month, 6); // Should be in Q2
        expect(result.day, 15);
      });

      test('addQuarters method', () {
        final chronos = Chronos(2023, 3, 15); // Q1
        final result = chronos.addQuarters(2);

        expect(result.month, 9); // Should be in Q3
        expect(result.day, 15);
      });

      test('addDecade method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.addDecade();

        expect(result.year, 2033);
        expect(result.month, chronos.month);
        expect(result.day, chronos.day);
      });

      test('addCentury method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.addCentury();

        expect(result.year, 2123);
        expect(result.month, chronos.month);
        expect(result.day, chronos.day);
      });

      test('addMillennium method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.addMillennium();

        expect(result.year, 3023);
        expect(result.month, chronos.month);
        expect(result.day, chronos.day);
      });

      test('addIsoWeek method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.addIsoWeek();

        expect(result.difference(chronos).inDays, 7);
      });

      test('addIsoYear method', () {
        final chronos = Chronos(2023, 12, 25);
        final result = chronos.addIsoYear();

        expect(result.year, 2024);
      });
    });

    group('Generic Unit Operations', () {
      test('addUnit method', () {
        final chronos = Chronos(2023, 12, 25);

        final addDays = chronos.addUnit(TimeUnit.day, 5);
        expect(addDays.day, 30);

        final addMonths = chronos.addUnit(TimeUnit.month, 2);
        expect(addMonths.year, 2024);
        expect(addMonths.month, 2);

        final addYears = chronos.addUnit(TimeUnit.year, 1);
        expect(addYears.year, 2024);
      });

      test('subUnit method', () {
        final chronos = Chronos(2023, 12, 25);

        final subDays = chronos.subUnit(TimeUnit.day, 5);
        expect(subDays.day, 20);

        final subMonths = chronos.subUnit(TimeUnit.month, 2);
        expect(subMonths.month, 10);

        final subYears = chronos.subUnit(TimeUnit.year, 1);
        expect(subYears.year, 2022);
      });

      test('diffInUnit method', () {
        final chronos1 = Chronos(2023, 12, 25);
        final chronos2 = Chronos(2023, 12, 30);

        final diffInDays = chronos1.diffInUnit(TimeUnit.day, chronos2);
        expect(diffInDays, 5.0); // chronos2 is 5 days after chronos1

        final chronos3 = Chronos(2024, 2, 25);
        final diffInMonths = chronos1.diffInUnit(TimeUnit.month, chronos3);
        expect(diffInMonths, 2.0); // chronos3 is 2 months after chronos1
      });
    });

    group('Week Operations', () {
      test('nextWeekday method', () {
        expect(Chronos(2023, 12, 29).nextWeekday().isWeekday, true);
        expect(Chronos(2023, 12, 30).nextWeekday().isWeekday, true);
        expect(Chronos(2023, 12, 30).nextWeekday(), Chronos(2024, 1, 1));
      });

      test('previousWeekday method', () {
        expect(Chronos(2023, 12, 25).previousWeekday().isWeekday, true);
        expect(Chronos(2023, 12, 31).previousWeekday().isWeekday, true);
        expect(Chronos(2023, 12, 31).previousWeekday(), Chronos(2023, 12, 29));
      });

      test('nextWeekendDay method', () {
        expect(Chronos(2023, 12, 29).nextWeekendDay().isWeekend, true);
        expect(Chronos(2023, 12, 30).nextWeekendDay().isWeekend, true);
        expect(Chronos(2023, 12, 29).nextWeekendDay(), Chronos(2023, 12, 30));
      });

      test('previousWeekendDay method', () {
        expect(Chronos(2023, 12, 25).previousWeekendDay().isWeekend, true);
        expect(Chronos(2023, 12, 31).previousWeekendDay().isWeekend, true);
        expect(
          Chronos(2023, 12, 25).previousWeekendDay(),
          Chronos(2023, 12, 24),
        );
      });

      test('addWeekdays method', () {
        expect(Chronos(2023, 12, 23).addWeekdays(1), Chronos(2023, 12, 25));
        expect(Chronos(2023, 12, 25).addWeekdays(5), Chronos(2024, 1, 1));
        expect(Chronos(2023, 12, 25).addWeekdays(20), Chronos(2024, 1, 22));
      });

      test('subWeekdays method', () {
        expect(Chronos(2023, 12, 23).subWeekdays(1), Chronos(2023, 12, 22));
        expect(Chronos(2023, 12, 25).subWeekdays(5), Chronos(2023, 12, 18));
        expect(Chronos(2023, 12, 25).subWeekdays(20), Chronos(2023, 11, 27));
      });

      test('firstOfMonth method', () {
        expect(
          Chronos(2023, 1, 15).firstOfMonth(IsoDayOfWeek.monday),
          Chronos(2023, 1, 2),
        );
        expect(
          Chronos(2023, 2, 15).firstOfMonth(IsoDayOfWeek.tuesday),
          Chronos(2023, 2, 7),
        );
        expect(
          Chronos(2023, 3, 15).firstOfMonth(IsoDayOfWeek.wednesday),
          Chronos(2023, 3, 1),
        );
        expect(
          Chronos(2023, 4, 15).firstOfMonth(IsoDayOfWeek.thursday),
          Chronos(2023, 4, 6),
        );
        expect(
          Chronos(2023, 5, 15).firstOfMonth(IsoDayOfWeek.friday),
          Chronos(2023, 5, 5),
        );
        expect(
          Chronos(2023, 6, 15).firstOfMonth(IsoDayOfWeek.saturday),
          Chronos(2023, 6, 3),
        );
        expect(
          Chronos(2023, 7, 15).firstOfMonth(IsoDayOfWeek.sunday),
          Chronos(2023, 7, 2),
        );
        expect(
          Chronos(2023, 8, 15).firstOfMonth(IsoDayOfWeek.monday),
          Chronos(2023, 8, 7),
        );
        expect(
          Chronos(2023, 9, 15).firstOfMonth(IsoDayOfWeek.tuesday),
          Chronos(2023, 9, 5),
        );
        expect(
          Chronos(2023, 10, 15).firstOfMonth(IsoDayOfWeek.wednesday),
          Chronos(2023, 10, 4),
        );
        expect(
          Chronos(2023, 11, 15).firstOfMonth(IsoDayOfWeek.thursday),
          Chronos(2023, 11, 2),
        );
        expect(
          Chronos(2023, 12, 15).firstOfMonth(IsoDayOfWeek.friday),
          Chronos(2023, 12, 1),
        );
      });

      test('lastOfMonth method', () {
        expect(
          Chronos(2023, 1, 15).lastOfMonth(IsoDayOfWeek.monday),
          Chronos(2023, 1, 30),
        );
        expect(
          Chronos(2023, 2, 15).lastOfMonth(IsoDayOfWeek.tuesday),
          Chronos(2023, 2, 28),
        );
        expect(
          Chronos(2023, 3, 15).lastOfMonth(IsoDayOfWeek.wednesday),
          Chronos(2023, 3, 29),
        );
        expect(
          Chronos(2023, 4, 15).lastOfMonth(IsoDayOfWeek.thursday),
          Chronos(2023, 4, 27),
        );
        expect(
          Chronos(2023, 5, 15).lastOfMonth(IsoDayOfWeek.friday),
          Chronos(2023, 5, 26),
        );
        expect(
          Chronos(2023, 6, 15).lastOfMonth(IsoDayOfWeek.saturday),
          Chronos(2023, 6, 24),
        );
        expect(
          Chronos(2023, 7, 15).lastOfMonth(IsoDayOfWeek.sunday),
          Chronos(2023, 7, 30),
        );
        expect(
          Chronos(2023, 8, 15).lastOfMonth(IsoDayOfWeek.monday),
          Chronos(2023, 8, 28),
        );
        expect(
          Chronos(2023, 9, 15).lastOfMonth(IsoDayOfWeek.tuesday),
          Chronos(2023, 9, 26),
        );
        expect(
          Chronos(2023, 10, 15).lastOfMonth(IsoDayOfWeek.wednesday),
          Chronos(2023, 10, 25),
        );
        expect(
          Chronos(2023, 11, 15).lastOfMonth(IsoDayOfWeek.thursday),
          Chronos(2023, 11, 30),
        );
        expect(
          Chronos(2023, 12, 15).lastOfMonth(IsoDayOfWeek.friday),
          Chronos(2023, 12, 29),
        );
      });

      test('firstOfQuarter method', () {
        expect(
          Chronos(2023, 1, 15).firstOfQuarter(IsoDayOfWeek.monday),
          Chronos(2023, 1, 2),
        );
        expect(
          Chronos(2023, 2, 15).firstOfQuarter(IsoDayOfWeek.tuesday),
          Chronos(2023, 1, 3),
        );
        expect(
          Chronos(2023, 3, 15).firstOfQuarter(IsoDayOfWeek.wednesday),
          Chronos(2023, 1, 4),
        );

        expect(
          Chronos(2023, 4, 15).firstOfQuarter(IsoDayOfWeek.thursday),
          Chronos(2023, 4, 6),
        );
        expect(
          Chronos(2023, 5, 15).firstOfQuarter(IsoDayOfWeek.friday),
          Chronos(2023, 4, 7),
        );
        expect(
          Chronos(2023, 6, 15).firstOfQuarter(IsoDayOfWeek.saturday),
          Chronos(2023, 4, 1),
        );

        expect(
          Chronos(2023, 7, 15).firstOfQuarter(IsoDayOfWeek.sunday),
          Chronos(2023, 7, 2),
        );
        expect(
          Chronos(2023, 8, 15).firstOfQuarter(IsoDayOfWeek.monday),
          Chronos(2023, 7, 3),
        );
        expect(
          Chronos(2023, 9, 15).firstOfQuarter(IsoDayOfWeek.tuesday),
          Chronos(2023, 7, 4),
        );

        expect(
          Chronos(2023, 10, 15).firstOfQuarter(IsoDayOfWeek.wednesday),
          Chronos(2023, 10, 4),
        );
        expect(
          Chronos(2023, 11, 15).firstOfQuarter(IsoDayOfWeek.thursday),
          Chronos(2023, 10, 5),
        );
        expect(
          Chronos(2023, 12, 15).firstOfQuarter(IsoDayOfWeek.friday),
          Chronos(2023, 10, 6),
        );
      });

      test('lastOfYear method', () {
        expect(
          Chronos(2023, 1, 15).lastOfYear(IsoDayOfWeek.monday),
          Chronos(2023, 12, 25),
        );
        expect(
          Chronos(2023, 2, 15).lastOfYear(IsoDayOfWeek.tuesday),
          Chronos(2023, 12, 26),
        );
        expect(
          Chronos(2023, 3, 15).lastOfYear(IsoDayOfWeek.wednesday),
          Chronos(2023, 12, 27),
        );
        expect(
          Chronos(2023, 4, 15).lastOfYear(IsoDayOfWeek.thursday),
          Chronos(2023, 12, 28),
        );
        expect(
          Chronos(2023, 5, 15).lastOfYear(IsoDayOfWeek.friday),
          Chronos(2023, 12, 29),
        );
        expect(
          Chronos(2023, 6, 15).lastOfYear(IsoDayOfWeek.saturday),
          Chronos(2023, 12, 30),
        );
        expect(
          Chronos(2023, 7, 15).lastOfYear(IsoDayOfWeek.sunday),
          Chronos(2023, 12, 31),
        );
      });
    });
  });
}
