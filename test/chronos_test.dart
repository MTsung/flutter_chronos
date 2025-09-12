import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Chronos Constructors', () {
    test('basic constructor', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);

      expect(chronos.year, 2023);
      expect(chronos.month, 12);
      expect(chronos.day, 25);
      expect(chronos.hour, 14);
      expect(chronos.minute, 30);
      expect(chronos.second, 45);
      expect(chronos.millisecond, 500);
      expect(chronos.microsecond, 750);
      expect(chronos.isUtc, false);
    });

    test('UTC constructor', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45, 500, 750);

      expect(chronos.year, 2023);
      expect(chronos.month, 12);
      expect(chronos.day, 25);
      expect(chronos.hour, 14);
      expect(chronos.minute, 30);
      expect(chronos.second, 45);
      expect(chronos.millisecond, 500);
      expect(chronos.microsecond, 750);
      expect(chronos.isUtc, true);
    });

    test('fromMillisecondsSinceEpoch constructor', () {
      final timestamp = 1703505600000; // 2023-12-25 12:00:00 UTC
      final chronos = Chronos.fromMillisecondsSinceEpoch(
        timestamp,
        isUtc: true,
      );

      expect(chronos.millisecondsSinceEpoch, timestamp);
      expect(chronos.isUtc, true);
    });

    test('fromMicrosecondsSinceEpoch constructor', () {
      final timestamp = 1703505600000000; // 2023-12-25 12:00:00 UTC
      final chronos = Chronos.fromMicrosecondsSinceEpoch(
        timestamp,
        isUtc: true,
      );

      expect(chronos.microsecondsSinceEpoch, timestamp);
      expect(chronos.isUtc, true);
    });
  });

  group('Static Factory Methods', () {
    test('parse method', () {
      final chronos = Chronos.parse('2023-12-25T14:30:45.000Z');

      expect(chronos.year, 2023);
      expect(chronos.month, 12);
      expect(chronos.day, 25);
      expect(chronos.hour, 14);
      expect(chronos.minute, 30);
      expect(chronos.second, 45);
    });

    test('tryParse method', () {
      final validChronos = Chronos.tryParse('2023-12-25T14:30:45.000Z');
      expect(validChronos, isNotNull);
      expect(validChronos!.year, 2023);
      expect(validChronos.month, 12);
      expect(validChronos.day, 25);
      expect(validChronos.hour, 14);
      expect(validChronos.minute, 30);
      expect(validChronos.second, 45);
      expect(validChronos.millisecond, 0);
      expect(validChronos.microsecond, 0);

      final invalidChronos = Chronos.tryParse('invalid-date');
      expect(invalidChronos, isNull);
    });

    test('fromTimestamp method', () {
      final timestamp = 1703505600; // 2023-12-25 12:00:00 UTC
      final chronos = Chronos.fromTimestamp(timestamp);

      expect(chronos.timestamp, timestamp);
    });

    test('fromDateTime method', () {
      final dateTime = DateTime(2023, 12, 25, 14, 30, 45);
      final chronos = Chronos.fromDateTime(dateTime);

      expect(chronos.year, dateTime.year);
      expect(chronos.month, dateTime.month);
      expect(chronos.day, dateTime.day);
      expect(chronos.hour, dateTime.hour);
      expect(chronos.minute, dateTime.minute);
      expect(chronos.second, dateTime.second);
      expect(chronos.millisecond, dateTime.millisecond);
      expect(chronos.microsecond, dateTime.microsecond);
    });

    test('now method', () {
      final now = Chronos.now();
      final dartNow = DateTime.now();

      expect(
        (now.millisecondsSinceEpoch - dartNow.millisecondsSinceEpoch).abs(),
        lessThan(1000),
      );
    });

    test('today method', () {
      final today = Chronos.today();
      final now = Chronos.now();

      expect(today.year, now.year);
      expect(today.month, now.month);
      expect(today.day, now.day);
      expect(today.hour, 0);
      expect(today.minute, 0);
      expect(today.second, 0);
      expect(today.millisecond, 0);
      expect(today.microsecond, 0);
    });

    test('tomorrow method', () {
      final tomorrow = Chronos.tomorrow();
      final today = Chronos.today();

      expect(tomorrow.difference(today).inDays, 1);
      expect(tomorrow.hour, 0);
      expect(tomorrow.minute, 0);
      expect(tomorrow.second, 0);
    });

    test('yesterday method', () {
      final yesterday = Chronos.yesterday();
      final today = Chronos.today();

      expect(today.difference(yesterday).inDays, 1);
      expect(yesterday.hour, 0);
      expect(yesterday.minute, 0);
      expect(yesterday.second, 0);
    });
  });

  group('Basic Properties', () {
    test('year property', () {
      final chronos = Chronos(2023, 12, 25);
      expect(chronos.year, 2023);
    });

    test('month property', () {
      final chronos = Chronos(2023, 12, 25);
      expect(chronos.month, 12);
    });

    test('day property', () {
      final chronos = Chronos(2023, 12, 25);
      expect(chronos.day, 25);
    });

    test('hour property', () {
      final chronos = Chronos(2023, 12, 25, 14);
      expect(chronos.hour, 14);
    });

    test('minute property', () {
      final chronos = Chronos(2023, 12, 25, 14, 30);
      expect(chronos.minute, 30);
    });

    test('second property', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      expect(chronos.second, 45);
    });

    test('millisecond property', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500);
      expect(chronos.millisecond, 500);
    });

    test('microsecond property', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45, 500, 750);
      expect(chronos.microsecond, 750);
    });

    test('weekday property', () {
      expect(Chronos(2023, 12, 25).weekday, IsoDayOfWeek.monday.value);
      expect(Chronos(2023, 12, 26).weekday, IsoDayOfWeek.tuesday.value);
      expect(Chronos(2023, 12, 27).weekday, IsoDayOfWeek.wednesday.value);
      expect(Chronos(2023, 12, 28).weekday, IsoDayOfWeek.thursday.value);
      expect(Chronos(2023, 12, 29).weekday, IsoDayOfWeek.friday.value);
      expect(Chronos(2023, 12, 30).weekday, IsoDayOfWeek.saturday.value);
      expect(Chronos(2023, 12, 31).weekday, IsoDayOfWeek.sunday.value);
      expect(Chronos(2024, 1, 1).weekday, IsoDayOfWeek.monday.value);
    });

    test('dayOfWeek property', () {
      expect(Chronos(2023, 12, 25).dayOfWeek, DayOfWeek.monday.value);
      expect(Chronos(2023, 12, 26).dayOfWeek, DayOfWeek.tuesday.value);
      expect(Chronos(2023, 12, 27).dayOfWeek, DayOfWeek.wednesday.value);
      expect(Chronos(2023, 12, 28).dayOfWeek, DayOfWeek.thursday.value);
      expect(Chronos(2023, 12, 29).dayOfWeek, DayOfWeek.friday.value);
      expect(Chronos(2023, 12, 30).dayOfWeek, DayOfWeek.saturday.value);
      expect(Chronos(2023, 12, 31).dayOfWeek, DayOfWeek.sunday.value);
      expect(Chronos(2024, 1, 1).dayOfWeek, DayOfWeek.monday.value);
    });

    test('isoDayOfWeek property', () {
      expect(Chronos(2023, 12, 25).isoDayOfWeek, IsoDayOfWeek.monday.value);
      expect(Chronos(2023, 12, 26).isoDayOfWeek, IsoDayOfWeek.tuesday.value);
      expect(Chronos(2023, 12, 27).isoDayOfWeek, IsoDayOfWeek.wednesday.value);
      expect(Chronos(2023, 12, 28).isoDayOfWeek, IsoDayOfWeek.thursday.value);
      expect(Chronos(2023, 12, 29).isoDayOfWeek, IsoDayOfWeek.friday.value);
      expect(Chronos(2023, 12, 30).isoDayOfWeek, IsoDayOfWeek.saturday.value);
      expect(Chronos(2023, 12, 31).isoDayOfWeek, IsoDayOfWeek.sunday.value);
      expect(Chronos(2024, 1, 1).isoDayOfWeek, IsoDayOfWeek.monday.value);
    });

    test('isoYear property', () {
      expect(Chronos(2021, 12, 25).isoYear, 2021);
      expect(Chronos(2021, 12, 26).isoYear, 2021);
      expect(Chronos(2021, 12, 27).isoYear, 2021);
      expect(Chronos(2021, 12, 28).isoYear, 2021);
      expect(Chronos(2021, 12, 29).isoYear, 2021);
      expect(Chronos(2021, 12, 30).isoYear, 2021);
      expect(Chronos(2021, 12, 31).isoYear, 2021);
      expect(Chronos(2022, 1, 1).isoYear, 2021);
      expect(Chronos(2022, 1, 2).isoYear, 2021);
      expect(Chronos(2022, 1, 3).isoYear, 2022);
      expect(Chronos(2022, 1, 4).isoYear, 2022);
      expect(Chronos(2022, 1, 5).isoYear, 2022);
      expect(Chronos(2022, 1, 6).isoYear, 2022);

      expect(Chronos(2022, 12, 25).isoYear, 2022);
      expect(Chronos(2022, 12, 26).isoYear, 2022);
      expect(Chronos(2022, 12, 27).isoYear, 2022);
      expect(Chronos(2022, 12, 28).isoYear, 2022);
      expect(Chronos(2022, 12, 29).isoYear, 2022);
      expect(Chronos(2022, 12, 30).isoYear, 2022);
      expect(Chronos(2022, 12, 31).isoYear, 2022);
      expect(Chronos(2023, 1, 1).isoYear, 2022);
      expect(Chronos(2023, 1, 2).isoYear, 2023);
      expect(Chronos(2023, 1, 3).isoYear, 2023);
      expect(Chronos(2023, 1, 4).isoYear, 2023);
      expect(Chronos(2023, 1, 5).isoYear, 2023);
      expect(Chronos(2023, 1, 6).isoYear, 2023);

      expect(Chronos(2023, 12, 25).isoYear, 2023);
      expect(Chronos(2023, 12, 26).isoYear, 2023);
      expect(Chronos(2023, 12, 27).isoYear, 2023);
      expect(Chronos(2023, 12, 28).isoYear, 2023);
      expect(Chronos(2023, 12, 29).isoYear, 2023);
      expect(Chronos(2023, 12, 30).isoYear, 2023);
      expect(Chronos(2023, 12, 31).isoYear, 2023);
      expect(Chronos(2024, 1, 1).isoYear, 2024);
      expect(Chronos(2024, 1, 2).isoYear, 2024);
      expect(Chronos(2024, 1, 3).isoYear, 2024);
      expect(Chronos(2024, 1, 4).isoYear, 2024);
      expect(Chronos(2024, 1, 5).isoYear, 2024);
      expect(Chronos(2024, 1, 6).isoYear, 2024);
    });

    test('quarter property', () {
      expect(Chronos(2023, 1, 15).quarter, 1);
      expect(Chronos(2023, 3, 15).quarter, 1);
      expect(Chronos(2023, 4, 15).quarter, 2);
      expect(Chronos(2023, 6, 15).quarter, 2);
      expect(Chronos(2023, 7, 15).quarter, 3);
      expect(Chronos(2023, 9, 15).quarter, 3);
      expect(Chronos(2023, 10, 15).quarter, 4);
      expect(Chronos(2023, 12, 15).quarter, 4);
    });

    test('week property', () {
      expect(Chronos(2023, 1, 1).week, 1);
      expect(Chronos(2023, 1, 8).week, 2);
    });

    test('isoWeek property', () {
      expect(Chronos(2021, 1, 1).isoWeek, 53);
      expect(Chronos(2021, 1, 4).isoWeek, 1);
      expect(Chronos(2021, 1, 7).isoWeek, 1);
      expect(Chronos(2021, 1, 10).isoWeek, 1);
      expect(Chronos(2021, 1, 13).isoWeek, 2);

      expect(Chronos(2022, 1, 1).isoWeek, 52);
      expect(Chronos(2022, 1, 4).isoWeek, 1);
      expect(Chronos(2022, 1, 7).isoWeek, 1);
      expect(Chronos(2022, 1, 10).isoWeek, 2);
      expect(Chronos(2022, 1, 13).isoWeek, 2);

      expect(Chronos(2023, 1, 1).isoWeek, 52);
      expect(Chronos(2023, 1, 4).isoWeek, 1);
      expect(Chronos(2023, 1, 7).isoWeek, 1);
      expect(Chronos(2023, 1, 10).isoWeek, 2);
      expect(Chronos(2023, 1, 13).isoWeek, 2);

      expect(Chronos(2024, 1, 1).isoWeek, 1);
      expect(Chronos(2024, 1, 4).isoWeek, 1);
      expect(Chronos(2024, 1, 7).isoWeek, 1);
      expect(Chronos(2024, 1, 10).isoWeek, 2);
      expect(Chronos(2024, 1, 13).isoWeek, 2);
    });

    test('decade property', () {
      expect(Chronos(2023, 1, 1).decade, 203);
      expect(Chronos(2030, 1, 1).decade, 203);
    });

    test('century property', () {
      expect(Chronos(2023, 1, 1).century, 21);
      expect(Chronos(1999, 1, 1).century, 20);
    });

    test('millennium property', () {
      expect(Chronos(2023, 1, 1).millennium, 3);
      expect(Chronos(2001, 1, 1).millennium, 3);
      expect(Chronos(2000, 12, 31, 23, 59, 59, 999, 999).millennium, 2);
      expect(Chronos(1999, 1, 1).millennium, 2);
    });

    test('timestamp property', () {
      final chronos = Chronos.fromTimestamp(1703505600);
      expect(chronos.timestamp, 1703505600);
    });

    test('millisecondsSinceEpoch property', () {
      final chronos = Chronos.fromMillisecondsSinceEpoch(1703505600000);
      expect(chronos.millisecondsSinceEpoch, 1703505600000);
    });

    test('microsecondsSinceEpoch property', () {
      final chronos = Chronos.fromMicrosecondsSinceEpoch(1703505600000000);
      expect(chronos.microsecondsSinceEpoch, 1703505600000000);
    });
  });

  group('Timezone Properties', () {
    test('getTimeZone method', () {
      final localChronos = Chronos(2023, 12, 25);
      final utcChronos = Chronos.utc(2023, 12, 25);

      expect(localChronos.getTimeZone(), isNotEmpty);
      expect(utcChronos.getTimeZone(), 'UTC');
    });

    test('getTimeZonOffset method', () {
      final localChronos = Chronos(2023, 12, 25);
      final utcChronos = Chronos.utc(2023, 12, 25);

      expect(localChronos.getTimeZonOffset(), isA<Duration>());
      expect(utcChronos.getTimeZonOffset(), Duration.zero);
    });

    test('isUtc property', () {
      final localChronos = Chronos(2023, 12, 25);
      final utcChronos = Chronos.utc(2023, 12, 25);

      expect(localChronos.isUtc, false);
      expect(utcChronos.isUtc, true);
    });

    test('isLocal property', () {
      final localChronos = Chronos(2023, 12, 25);
      final utcChronos = Chronos.utc(2023, 12, 25);

      expect(localChronos.isLocal, true);
      expect(utcChronos.isLocal, false);
    });

    test('isDst property', () {
      expect(Chronos(2023, 7, 15).isDst, isA<bool>());
    });
  });

  group('Day of Week Checks', () {
    test('isSunday property', () {
      expect(Chronos(2023, 12, 31).isSunday, true);
      expect(Chronos(2023, 12, 25).isSunday, false);
    });

    test('isMonday property', () {
      expect(Chronos(2023, 12, 25).isMonday, true);
      expect(Chronos(2023, 12, 26).isMonday, false);
    });

    test('isTuesday property', () {
      expect(Chronos(2023, 12, 26).isTuesday, true);
      expect(Chronos(2023, 12, 27).isTuesday, false);
    });

    test('isWednesday property', () {
      expect(Chronos(2023, 12, 27).isWednesday, true);
      expect(Chronos(2023, 12, 28).isWednesday, false);
    });

    test('isThursday property', () {
      expect(Chronos(2023, 12, 28).isThursday, true);
      expect(Chronos(2023, 12, 29).isThursday, false);
    });

    test('isFriday property', () {
      expect(Chronos(2023, 12, 29).isFriday, true);
      expect(Chronos(2023, 12, 30).isFriday, false);
    });

    test('isSaturday property', () {
      expect(Chronos(2023, 12, 30).isSaturday, true);
      expect(Chronos(2023, 12, 31).isSaturday, false);
    });

    test('isWeekday property', () {
      expect(Chronos(2023, 12, 25).isWeekday, true);
      expect(Chronos(2023, 12, 29).isWeekday, true);
      expect(Chronos(2023, 12, 30).isWeekday, false);
      expect(Chronos(2023, 12, 31).isWeekday, false);
    });

    test('isWeekend property', () {
      expect(Chronos(2023, 12, 25).isWeekend, false);
      expect(Chronos(2023, 12, 29).isWeekend, false);
      expect(Chronos(2023, 12, 30).isWeekend, true);
      expect(Chronos(2023, 12, 31).isWeekend, true);
    });
  });

  group('Time Checks', () {
    test('isToday property', () {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 1));

      expect(Chronos.today().isToday, true);
      expect(Chronos(2020, 1, 1).isToday, false);
      expect(Chronos(2025, 1, 1).isToday, true);

      ChronosConfig().resetFakeNow();
    });

    test('isTomorrow property', () {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 1));

      expect(Chronos.tomorrow().isTomorrow, true);
      expect(Chronos(2020, 1, 1).isTomorrow, false);
      expect(Chronos(2025, 1, 2).isTomorrow, true);

      ChronosConfig().resetFakeNow();
    });

    test('isYesterday property', () {
      ChronosConfig().setFakeNow(Chronos(2025, 1, 1));

      expect(Chronos.yesterday().isYesterday, true);
      expect(Chronos(2020, 1, 1).isYesterday, false);
      expect(Chronos(2024, 12, 31).isYesterday, true);

      ChronosConfig().resetFakeNow();
    });

    test('isFuture property', () {
      expect(Chronos.now().addHour().isFuture, true);
      expect(Chronos.now().subHour().isFuture, false);
    });

    test('isPast property', () {
      expect(Chronos.now().subHour().isPast, true);
      expect(Chronos.now().addHour().isPast, false);
    });

    test('isLeapYear property', () {
      expect(Chronos(2024).isLeapYear, true);
      expect(Chronos(2023).isLeapYear, false);
      expect(Chronos(2000).isLeapYear, true);
      expect(Chronos(1900).isLeapYear, false);
    });
  });

  group('Season Properties', () {
    test('season property', () {
      expect(Chronos(2023, 3, 15).season, Season.spring);
      expect(Chronos(2023, 6, 15).season, Season.summer);
      expect(Chronos(2023, 9, 15).season, Season.fall);
      expect(Chronos(2023, 12, 15).season, Season.winter);

      ChronosConfig().setHemisphere(Hemisphere.southern);

      expect(Chronos(2023, 3, 15).season, Season.fall);
      expect(Chronos(2023, 6, 15).season, Season.winter);
      expect(Chronos(2023, 9, 15).season, Season.spring);
      expect(Chronos(2023, 12, 15).season, Season.summer);

      ChronosConfig().resetHemisphere();
    });

    test('isInSpring property', () {
      expect(Chronos(2023, 3, 15).isInSpring, true);
      expect(Chronos(2023, 6, 15).isInSpring, false);
      expect(Chronos(2023, 9, 15).isInSpring, false);
      expect(Chronos(2023, 12, 15).isInSpring, false);

      ChronosConfig().setHemisphere(Hemisphere.southern);

      expect(Chronos(2023, 3, 15).isInSpring, false);
      expect(Chronos(2023, 6, 15).isInSpring, false);
      expect(Chronos(2023, 9, 15).isInSpring, true);
      expect(Chronos(2023, 12, 15).isInSpring, false);

      ChronosConfig().resetHemisphere();
    });

    test('isInSummer property', () {
      expect(Chronos(2023, 3, 15).isInSummer, false);
      expect(Chronos(2023, 6, 15).isInSummer, true);
      expect(Chronos(2023, 9, 15).isInSummer, false);
      expect(Chronos(2023, 12, 15).isInSummer, false);

      ChronosConfig().setHemisphere(Hemisphere.southern);

      expect(Chronos(2023, 3, 15).isInSummer, false);
      expect(Chronos(2023, 6, 15).isInSummer, false);
      expect(Chronos(2023, 9, 15).isInSummer, false);
      expect(Chronos(2023, 12, 15).isInSummer, true);

      ChronosConfig().resetHemisphere();
    });

    test('isInFall property', () {
      expect(Chronos(2023, 3, 15).isInFall, false);
      expect(Chronos(2023, 6, 15).isInFall, false);
      expect(Chronos(2023, 9, 15).isInFall, true);
      expect(Chronos(2023, 12, 15).isInFall, false);

      ChronosConfig().setHemisphere(Hemisphere.southern);

      expect(Chronos(2023, 3, 15).isInFall, true);
      expect(Chronos(2023, 6, 15).isInFall, false);
      expect(Chronos(2023, 9, 15).isInFall, false);
      expect(Chronos(2023, 12, 15).isInFall, false);

      ChronosConfig().resetHemisphere();
    });

    test('isInWinter property', () {
      expect(Chronos(2023, 3, 15).isInWinter, false);
      expect(Chronos(2023, 6, 15).isInWinter, false);
      expect(Chronos(2023, 9, 15).isInWinter, false);
      expect(Chronos(2023, 12, 15).isInWinter, true);

      ChronosConfig().setHemisphere(Hemisphere.southern);

      expect(Chronos(2023, 3, 15).isInWinter, false);
      expect(Chronos(2023, 6, 15).isInWinter, true);
      expect(Chronos(2023, 9, 15).isInWinter, false);
      expect(Chronos(2023, 12, 15).isInWinter, false);

      ChronosConfig().resetHemisphere();
    });
  });

  group('Basic Methods', () {
    test('diff method', () {
      expect(
        Chronos(2023, 12, 25, 12).diff(Chronos(2023, 12, 25, 14)).inHours,
        -2,
      );
      expect(
        Chronos(2023, 12, 25, 14).diff(Chronos(2023, 12, 25, 12)).inHours,
        2,
      );
      expect(
        Chronos(
          2023,
          12,
          25,
          12,
          0,
        ).diff(Chronos(2023, 12, 25, 12, 30)).inMinutes,
        -30,
      );
      expect(
        Chronos(2023, 12, 25, 23, 0).diff(Chronos(2023, 12, 26, 1, 0)).inHours,
        -2,
      );
      expect(Chronos(2023, 1, 31).diff(Chronos(2023, 2, 1)).inDays, -1);
      expect(
        Chronos(2023, 12, 31, 23, 59).diff(Chronos(2024, 1, 1, 0, 0)).inMinutes,
        -1,
      );
      expect(Chronos(2023, 2, 28).diff(Chronos(2024, 2, 29)).inDays, -366);
      expect(
        Chronos(2023, 12, 25, 12).diff(Chronos(2023, 12, 25, 12)).inSeconds,
        0,
      );
    });

    test('copy method', () {
      final original = Chronos(2023, 12, 25, 14, 30, 45);
      final copy = original.copy();

      expect(copy.year, original.year);
      expect(copy.month, original.month);
      expect(copy.day, original.day);
      expect(copy.hour, original.hour);
      expect(copy.minute, original.minute);
      expect(copy.second, original.second);
      expect(copy == original, true);
      expect(identical(copy, original), false);
    });

    test('clone method', () {
      final original = Chronos(2023, 12, 25, 14, 30, 45);
      final clone = original.clone();

      expect(clone.year, original.year);
      expect(clone.month, original.month);
      expect(clone.day, original.day);
      expect(clone.hour, original.hour);
      expect(clone.minute, original.minute);
      expect(clone.second, original.second);
      expect(clone == original, true);
      expect(identical(clone, original), false);
    });

    test('copyWith method', () {
      final original = Chronos(2023, 12, 25, 14, 30, 45);
      final modified = original.copyWith(year: 2024, month: 1, hour: 16);

      expect(modified.year, 2024);
      expect(modified.month, 1);
      expect(modified.day, 25);
      expect(modified.hour, 16);
      expect(modified.minute, 30);
      expect(modified.second, 45);
    });
  });

  group('Timezone Conversions', () {
    test('toLocal method', () {
      final utcChronos = Chronos.utc(2023, 12, 25, 12, 0, 0);
      final localChronos = utcChronos.toLocal();

      expect(localChronos.isUtc, false);
      expect(localChronos.isLocal, true);
      expect(localChronos, isA<Chronos>());
    });

    test('toUtc method', () {
      final localChronos = Chronos(2023, 12, 25, 12, 0, 0);
      final utcChronos = localChronos.toUtc();

      expect(utcChronos.isUtc, true);
      expect(utcChronos.isLocal, false);
      expect(utcChronos, isA<Chronos>());
    });
  });

  group('Fluent Interface', () {
    test('method chaining', () {
      final result = Chronos(
        2023,
        1,
        1,
      ).addMonths(6).addDays(15).addHours(12).setMinute(30);

      expect(result.year, 2023);
      expect(result.month, 7);
      expect(result.day, 16);
      expect(result.hour, 12);
      expect(result.minute, 30);
    });

    test('complex fluent operations', () {
      final result = Chronos(
        2023,
        12,
        25,
      ).startOfMonth().addWeeks(2).nextWeekday().setTime(hour: 9, minute: 30);

      expect(result.month, 12);
      expect(result.isWeekday, true);
      expect(result.hour, 9);
      expect(result.minute, 30);
      expect(result.second, 0);
    });
  });

  group('Edge Cases', () {
    test('leap year handling', () {
      expect(Chronos(2024, 2, 29).month, 2);
      expect(Chronos(2024, 2, 29).day, 29);

      expect(Chronos(2024, 2, 29).addYear().year, 2025);
      expect(Chronos(2024, 2, 29).addYear().month, 2);
      expect(Chronos(2024, 2, 29).addYear().day, 28);
    });

    test('month end boundaries', () {
      expect(Chronos(2023, 1, 31).addMonth().month, 2);
      expect(Chronos(2023, 1, 31).addMonth().day, 28);

      expect(Chronos(2023, 3, 31).addMonth().month, 4);
      expect(Chronos(2023, 3, 31).addMonth().day, 30);
    });

    test('year boundaries', () {
      expect(Chronos(2023, 12, 31).addDay().year, 2024);
      expect(Chronos(2023, 12, 31).addDay().month, 1);
      expect(Chronos(2023, 12, 31).addDay().day, 1);

      expect(Chronos(2024, 1, 1).subDay().year, 2023);
      expect(Chronos(2024, 1, 1).subDay().month, 12);
      expect(Chronos(2024, 1, 1).subDay().day, 31);
    });

    test('daylight saving time transitions', () {
      // This test depends on local timezone, so we'll just verify it doesn't crash
      final springForward = Chronos(2023, 3, 12); // Typical DST start in US
      final fallBack = Chronos(2023, 11, 5); // Typical DST end in US

      expect(() => springForward.addHours(24), returnsNormally);
      expect(() => fallBack.addHours(24), returnsNormally);
      expect(springForward.isDst, isA<bool>());
      expect(fallBack.isDst, isA<bool>());
    });
  });
}
