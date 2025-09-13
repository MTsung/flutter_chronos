import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Comparison Methods (DateTime inherited)', () {
    test('isBefore method', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);
      final date3 = Chronos(2024, 2, 29, 15, 30, 45);

      expect(date1.isBefore(date2), true);
      expect(date2.isBefore(date1), false);
      expect(date2.isBefore(date3), true);

      final sameMoment = Chronos(2024, 2, 28, 14, 30, 45);
      expect(date1.isBefore(sameMoment), false);

      final withMillis = Chronos(2024, 2, 28, 14, 30, 45, 500);
      expect(date1.isBefore(withMillis), true);
    });

    test('isAfter method', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);
      final date3 = Chronos(2024, 2, 29, 15, 30, 45);

      expect(date2.isAfter(date1), true);
      expect(date1.isAfter(date2), false);
      expect(date3.isAfter(date2), true);

      final sameMoment = Chronos(2024, 2, 28, 14, 30, 45);
      expect(date1.isAfter(sameMoment), false);

      final nextYear = Chronos(2025, 1, 1);
      expect(nextYear.isAfter(date1), true);
    });

    test('isAtSameMomentAs method', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);
      final sameMoment = Chronos(2024, 2, 28, 14, 30, 45);

      expect(date1.isAtSameMomentAs(sameMoment), true);
      expect(date1.isAtSameMomentAs(date2), false);

      final fromTimestamp = Chronos.fromMillisecondsSinceEpoch(
        date1.millisecondsSinceEpoch,
      );
      expect(date1.isAtSameMomentAs(fromTimestamp), true);

      final withMicros = Chronos(2024, 2, 28, 14, 30, 45, 0, 1);
      expect(date1.isAtSameMomentAs(withMicros), false);
    });

    test('compareTo method', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);
      final sameMoment = Chronos(2024, 2, 28, 14, 30, 45);

      expect(date1.compareTo(date2), lessThan(0));
      expect(date2.compareTo(date1), greaterThan(0));
      expect(date1.compareTo(sameMoment), equals(0));
    });
  });

  group('Equality Operators', () {
    test('equality operator (==)', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final date3 = Chronos(2024, 2, 29, 14, 30, 45, 500, 751);

      expect(date1 == date2, true);
      expect(date1 == date1, true);

      expect(date1 == date3, false);

      final fromTimestamp = Chronos.fromMicrosecondsSinceEpoch(
        date1.microsecondsSinceEpoch,
      );
      expect(date1 == fromTimestamp, true);

      final dateTime = DateTime.fromMicrosecondsSinceEpoch(
        date1.microsecondsSinceEpoch,
      );
      final chronosFromDateTime = dateTime.toChronos();
      expect(date1 == chronosFromDateTime, true);
    });

    test('inequality operator (!=)', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 46);
      final sameMoment = Chronos(2024, 2, 29, 14, 30, 45);

      expect(date1 != date2, true);

      expect(date1 != sameMoment, false);
    });

    test('hashCode property', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final date3 = Chronos(2024, 2, 29, 14, 30, 45, 500, 751);

      expect(date1.hashCode, date2.hashCode);

      expect(date1 == date3, false);

      expect(date1.hashCode, date1.hashCode);

      expect(date1.hashCode, date1.millisecondsSinceEpoch.hashCode);
    });

    test('equality with different timezone representations', () {
      final utcDate = Chronos.utc(2024, 2, 29, 14, 30, 45);
      final localDate = utcDate.toLocal();

      expect(utcDate == localDate, true);
      expect(utcDate.hashCode, localDate.hashCode);

      expect(utcDate.isAtSameMomentAs(localDate), true);
    });
  });

  group('Arithmetic Methods (DateTime inherited)', () {
    test('add method', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);

      final plusOneDay = date.add(Duration(days: 1));
      expect(plusOneDay.year, 2024);
      expect(plusOneDay.month, 3);
      expect(plusOneDay.day, 1);
      expect(plusOneDay.hour, 14);
      expect(plusOneDay.minute, 30);
      expect(plusOneDay.second, 45);

      final plusTwoHours = date.add(Duration(hours: 2));
      expect(plusTwoHours.hour, 16);
      expect(plusTwoHours.day, 29);

      final plusThirtyMinutes = date.add(Duration(minutes: 30));
      expect(plusThirtyMinutes.hour, 15);
      expect(plusThirtyMinutes.minute, 0);

      final plusFifteenSeconds = date.add(Duration(seconds: 15));
      expect(plusFifteenSeconds.second, 0);
      expect(plusFifteenSeconds.minute, 31);

      final plusMillis = date.add(Duration(milliseconds: 500));
      expect(plusMillis.millisecond, 500);

      final plusMicros = date.add(Duration(microseconds: 750));
      expect(plusMicros.microsecond, 750);
    });

    test('subtract method', () {
      final date = Chronos(2024, 3, 1, 14, 30, 45);

      final minusOneDay = date.subtract(Duration(days: 1));
      expect(minusOneDay.year, 2024);
      expect(minusOneDay.month, 2);
      expect(minusOneDay.day, 29);
      expect(minusOneDay.hour, 14);
      expect(minusOneDay.minute, 30);
      expect(minusOneDay.second, 45);

      final minusTwoHours = date.subtract(Duration(hours: 2));
      expect(minusTwoHours.hour, 12);
      expect(minusTwoHours.day, 1);

      final minusThirtyMinutes = date.subtract(Duration(minutes: 30));
      expect(minusThirtyMinutes.hour, 14);
      expect(minusThirtyMinutes.minute, 0);

      final minusFifteenSeconds = date.subtract(Duration(seconds: 15));
      expect(minusFifteenSeconds.second, 30);

      final minusOneMonth = date.subtract(Duration(days: 30));
      expect(minusOneMonth.month, 1);
      expect(minusOneMonth.day, 31);
    });

    test('difference method', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);

      final diff = date2.difference(date1);
      expect(diff.inDays, 1);
      expect(diff.inHours, 24);
      expect(diff.inMinutes, 24 * 60);

      final negativeDiff = date1.difference(date2);
      expect(negativeDiff.inDays, -1);
      expect(negativeDiff.inHours, -24);
    });

    test('arithmetic returns DateTime, not Chronos', () {
      final chronos = Chronos(2024, 2, 29, 14, 30, 45);

      final added = chronos.add(Duration(days: 1));
      expect(added, isA<DateTime>());
      expect(added, isNot(isA<Chronos>()));

      final subtracted = chronos.subtract(Duration(days: 1));
      expect(subtracted, isA<DateTime>());
      expect(subtracted, isNot(isA<Chronos>()));

      final backToChronos = added.toChronos();
      expect(backToChronos, isA<Chronos>());
    });

    test('chained arithmetic operations', () {
      final date = Chronos(2024, 2, 29, 12, 0, 0);

      final result = date
          .add(Duration(days: 1))
          .subtract(Duration(hours: 2))
          .add(Duration(minutes: 30));

      expect(result.year, 2024);
      expect(result.month, 3);
      expect(result.day, 1);
      expect(result.hour, 10);
      expect(result.minute, 30);
      expect(result.second, 0);
    });
  });

  group('Chronos-specific Methods', () {
    test('diff method (alias for difference)', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);

      final diff = date1.diff(date2);
      final difference = date1.difference(date2);

      expect(diff.inDays, difference.inDays);
      expect(diff.inHours, difference.inHours);
      expect(diff.inMinutes, difference.inMinutes);
    });

    test('copy method', () {
      final original = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final copied = original.copy();

      expect(copied == original, true);
      expect(copied.isAtSameMomentAs(original), true);
      expect(copied, isA<Chronos>());
    });

    test('clone method (alias for copy)', () {
      final original = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final cloned = original.clone();

      expect(cloned == original, true);
      expect(cloned.isAtSameMomentAs(original), true);
      expect(cloned, isA<Chronos>());
    });
  });

  group('Operator Edge Cases', () {
    test('comparison with different timezones', () {
      final utcDate = Chronos.utc(2024, 2, 29, 14, 30, 45);
      final localDate = utcDate.toLocal();
      final differentUtc = Chronos.utc(2024, 2, 29, 15, 30, 45);

      expect(utcDate == localDate, true);
      expect(utcDate.isAtSameMomentAs(localDate), true);
      expect(utcDate.isBefore(localDate), false);
      expect(utcDate.isAfter(localDate), false);

      expect(utcDate.isBefore(differentUtc), true);
      expect(differentUtc.isAfter(utcDate), true);
    });

    test('arithmetic with large durations', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);

      final plusOneYear = date.add(Duration(days: 366));
      expect(plusOneYear.year, 2025);
      expect(plusOneYear.month, 3);
      expect(plusOneYear.day, 1);

      final plusCentury = date.add(Duration(days: 36525));
      expect(plusCentury.year, greaterThan(2100));

      final minusDecade = date.subtract(Duration(days: 3653));
      expect(minusDecade.year, lessThan(2015));
    });

    test('arithmetic with negative durations', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);

      final addNegative = date.add(Duration(days: -1));
      final subtractPositive = date.subtract(Duration(days: 1));

      expect(addNegative.isAtSameMomentAs(subtractPositive), true);

      final subtractNegative = date.subtract(Duration(hours: -2));
      final addPositive = date.add(Duration(hours: 2));

      expect(subtractNegative.isAtSameMomentAs(addPositive), true);
    });

    test('arithmetic with zero duration', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);

      final plusZero = date.add(Duration.zero);
      expect(plusZero.isAtSameMomentAs(date), true);

      final minusZero = date.subtract(Duration.zero);
      expect(minusZero.isAtSameMomentAs(date), true);
    });

    test('comparison with extreme dates', () {
      final normalDate = Chronos(2024, 2, 29, 14, 30, 45);
      final minDate = Chronos.fromMillisecondsSinceEpoch(0, isUtc: true);
      final maxDate = Chronos(9999, 12, 31, 23, 59, 59);

      expect(normalDate.isAfter(minDate), true);
      expect(normalDate.isBefore(maxDate), true);

      expect(minDate.isBefore(normalDate), true);
      expect(minDate.isBefore(maxDate), true);

      expect(maxDate.isAfter(normalDate), true);
      expect(maxDate.isAfter(minDate), true);
    });

    test('equality with precision differences', () {
      final base = Chronos(2024, 2, 29, 14, 30, 45);
      final withMillis = Chronos(2024, 2, 29, 14, 30, 45, 0);
      final withMicros = Chronos(2024, 2, 29, 14, 30, 45, 0, 0);

      expect(base == withMillis, true);
      expect(base == withMicros, true);
      expect(withMillis == withMicros, true);

      final differentMilli = Chronos(2024, 2, 29, 14, 30, 45, 1);
      expect(base == differentMilli, false);
    });

    test('hashCode consistency with arithmetic', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 45);
      final date2 = date1.add(Duration.zero);
      final date3 = date1.subtract(Duration.zero);

      expect(date1.isAtSameMomentAs(date2), true);
      expect(date1.isAtSameMomentAs(date3), true);

      final chronos2 = date2.toChronos();
      final chronos3 = date3.toChronos();

      expect(date1 == chronos2, true);
      expect(date1 == chronos3, true);
      expect(date1.hashCode, chronos2.hashCode);
      expect(date1.hashCode, chronos3.hashCode);
    });

    test('method chaining preserves functionality', () {
      final date = Chronos(2024, 2, 29, 12, 0, 0);

      final result1 = date.add(Duration(hours: 1)).add(Duration(hours: 1));
      final result2 = date.add(Duration(hours: 1)).add(Duration(hours: 1));

      expect(result1.isAtSameMomentAs(result2), true);

      final result3 = date
          .add(Duration(hours: 2))
          .subtract(Duration(minutes: 30));
      expect(result3.hour, 13);
      expect(result3.minute, 30);
    });

    test('timezone conversion preserves comparison behavior', () {
      final utcDate = Chronos.utc(2024, 2, 29, 14, 30, 45);
      final localDate = utcDate.toLocal();

      expect(utcDate == localDate, true);
      expect(utcDate.isAtSameMomentAs(localDate), true);
      expect(utcDate.compareTo(localDate), 0);

      expect(utcDate.isUtc, true);
      expect(localDate.isUtc, false);
    });

    test('copyWith preserves equality behavior', () {
      final original = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final copied = original.copyWith();

      expect(original == copied, true);
      expect(original.hashCode, copied.hashCode);
      expect(original.isAtSameMomentAs(copied), true);

      final modified = original.copyWith(year: 2025);
      expect(original == modified, false);
      expect(original.hashCode, isNot(modified.hashCode));
    });
  });
}
