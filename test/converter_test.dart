import 'package:flutter_chronos/chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String Formatting - Basic', () {
    test('format method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);

      final defaultFormat = chronos.format();
      expect(defaultFormat, isA<String>());
      expect(defaultFormat, isNotEmpty);

      final customFormat = chronos.format('yyyy-MM-dd HH:mm:ss');
      expect(customFormat, '2023-12-25 14:30:45');

      final localeFormat = chronos.format('MMMM d, yyyy', 'en_US');
      expect(localeFormat, contains('December'));
    });

    test('toDateString method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.toDateString();

      expect(result, '2023-12-25');
    });

    test('toTimeString method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.toTimeString();

      expect(result, '14:30:45');
    });

    test('toDateTimeString method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.toDateTimeString();

      expect(result, '2023-12-25 14:30:45');
    });

    test('toFormattedDateString method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.toFormattedDateString();

      expect(result, 'Dec 25, 2023');
    });

    test('toFormattedDayDateString method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.toFormattedDayDateString();

      expect(result, 'Mon, Dec 25, 2023');
    });

    test('toDayDateTimeString method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.toDayDateTimeString();

      expect(result, 'Mon, Dec 25, 2023 2:30 PM');
    });
  });

  group('String Formatting - Standard', () {
    test('toIso8601String method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toIso8601String();

      expect(result, '2023-12-25T14:30:45.000Z');
    });

    test('toDateTimeLocalString method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);
      final result = chronos.toDateTimeLocalString();

      expect(result, '2023-12-25T14:30:45');
    });

    test('toRfc3339String method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toRfc3339String();

      expect(result, isA<String>());
      expect(result, contains('2023-12-25T14:30:45'));
    });

    test('toRfc822String method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toRfc822String();

      expect(result, contains('Mon, 25 Dec 23 14:30:45'));

      expect(result, isA<String>());
    });

    test('toRfc850String method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toRfc850String();

      expect(result, contains('Monday, 25-Dec-23 14:30:45 UTC'));
    });

    test('toRfc1036String method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toRfc1036String();

      expect(result, contains('Mon, 25 Dec 23 14:30:45'));

      expect(result, isA<String>());
    });

    test('toRfc1123String method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toRfc1123String();

      expect(result, contains('Mon, 25 Dec 2023 14:30:45'));

      expect(result, isA<String>());
    });

    test('toRfc2822String method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toRfc2822String();

      expect(result, contains('Mon, 25 Dec 2023 14:30:45'));

      expect(result, isA<String>());
    });

    test('toRfc7231String method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toRfc7231String();

      expect(result, contains('Mon, 25 Dec 2023 14:30:45 GMT'));
    });

    test('toAtomString method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toAtomString();

      expect(result, isA<String>());
      expect(result, contains('2023-12-25T14:30:45'));
    });

    test('toW3cString method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toW3cString();

      expect(result, isA<String>());
      expect(result, contains('2023-12-25T14:30:45'));
    });

    test('toRssString method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toRssString();

      expect(result, contains('Mon, 25 Dec 2023 14:30:45'));

      expect(result, isA<String>());
    });

    test('toCookieString method', () {
      final chronos = Chronos.utc(2023, 12, 25, 14, 30, 45);
      final result = chronos.toCookieString();

      expect(result, contains('Monday, 25-Dec-2023 14:30:45 UTC'));
    });
  });

  group('Time Unit Positions - Microsecond', () {
    test('microsecond positions', () {
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfMillisecond, 750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfSecond, 500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfMinute, 45500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfHour, 1845500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfDay, 52245500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfWeek, 138645500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfMonth, 2125845500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfQuarter, 7396245500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfYear, 30983445500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfIsoYear, 30897045500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfDecade, 125677845500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfCentury, 725207445500750);
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).microsecondOfMillennium, 725207445500750);
    });
  });

  group('Time Unit Positions - Other Units', () {
    test('basic time positions', () {
      expect(Chronos(2023, 12, 25, 14, 30, 45, 500, 750).millisecondOfSecond, 500);
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
      expect(Chronos(2021, 1, 1).yearOfDecade, 2);
      expect(Chronos(2025, 1, 1).yearOfDecade, 6);
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
