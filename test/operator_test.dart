import 'package:flutter_chronos/chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Comparison Methods (DateTime inherited)', () {
    test('isBefore method', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);
      final date3 = Chronos(2024, 2, 29, 15, 30, 45);

      // Test basic before comparison
      expect(date1.isBefore(date2), true);
      expect(date2.isBefore(date1), false);
      expect(date2.isBefore(date3), true);

      // Test same moment
      final sameMoment = Chronos(2024, 2, 28, 14, 30, 45);
      expect(date1.isBefore(sameMoment), false);

      // Test with different precision
      final withMillis = Chronos(2024, 2, 28, 14, 30, 45, 500);
      expect(date1.isBefore(withMillis), true);
    });

    test('isAfter method', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);
      final date3 = Chronos(2024, 2, 29, 15, 30, 45);

      // Test basic after comparison
      expect(date2.isAfter(date1), true);
      expect(date1.isAfter(date2), false);
      expect(date3.isAfter(date2), true);

      // Test same moment
      final sameMoment = Chronos(2024, 2, 28, 14, 30, 45);
      expect(date1.isAfter(sameMoment), false);

      // Test year boundaries
      final nextYear = Chronos(2025, 1, 1);
      expect(nextYear.isAfter(date1), true);
    });

    test('isAtSameMomentAs method', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);
      final sameMoment = Chronos(2024, 2, 28, 14, 30, 45);

      // Test same moment
      expect(date1.isAtSameMomentAs(sameMoment), true);
      expect(date1.isAtSameMomentAs(date2), false);

      // Test with different constructors
      final fromTimestamp = Chronos.fromMillisecondsSinceEpoch(date1.millisecondsSinceEpoch);
      expect(date1.isAtSameMomentAs(fromTimestamp), true);

      // Test with microsecond precision
      final withMicros = Chronos(2024, 2, 28, 14, 30, 45, 0, 1);
      expect(date1.isAtSameMomentAs(withMicros), false);
    });

    test('compareTo method', () {
      final date1 = Chronos(2024, 2, 28, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45);
      final sameMoment = Chronos(2024, 2, 28, 14, 30, 45);

      // Test comparison results
      expect(date1.compareTo(date2), lessThan(0)); // date1 < date2
      expect(date2.compareTo(date1), greaterThan(0)); // date2 > date1
      expect(date1.compareTo(sameMoment), equals(0)); // date1 == sameMoment
    });
  });

  group('Equality Operators', () {
    test('equality operator (==)', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final date3 = Chronos(2024, 2, 29, 14, 30, 45, 500, 751);

      // Test equal dates
      expect(date1 == date2, true);
      expect(date1 == date1, true);

      // Test different dates
      expect(date1 == date3, false);

      // Test with different constructors but same moment
      final fromTimestamp = Chronos.fromMicrosecondsSinceEpoch(date1.microsecondsSinceEpoch);
      expect(date1 == fromTimestamp, true);

      // Test with DateTime conversion
      final dateTime = DateTime.fromMicrosecondsSinceEpoch(date1.microsecondsSinceEpoch);
      final chronosFromDateTime = dateTime.toChronos();
      expect(date1 == chronosFromDateTime, true);
    });

    test('inequality operator (!=)', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 45);
      final date2 = Chronos(2024, 2, 29, 14, 30, 46);
      final sameMoment = Chronos(2024, 2, 29, 14, 30, 45);

      // Test different dates
      expect(date1 != date2, true);

      // Test same dates
      expect(date1 != sameMoment, false);
    });

    test('hashCode property', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final date2 = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final date3 = Chronos(2024, 2, 29, 14, 30, 45, 500, 751);

      // Equal objects should have equal hash codes
      expect(date1.hashCode, date2.hashCode);

      // Different objects should typically have different hash codes
      // Note: Hash codes may occasionally collide, so we just verify they're different objects
      expect(date1 == date3, false);

      // Hash code should be consistent
      expect(date1.hashCode, date1.hashCode);

      // Hash code should be based on millisecondsSinceEpoch
      expect(date1.hashCode, date1.millisecondsSinceEpoch.hashCode);
    });

    test('equality with different timezone representations', () {
      final utcDate = Chronos.utc(2024, 2, 29, 14, 30, 45);
      final localDate = utcDate.toLocal();

      // Same moment in different timezones should be equal
      expect(utcDate == localDate, true);
      expect(utcDate.hashCode, localDate.hashCode);

      // Test isAtSameMomentAs explicitly
      expect(utcDate.isAtSameMomentAs(localDate), true);
    });
  });

  group('Arithmetic Methods (DateTime inherited)', () {
    test('add method', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);

      // Add days
      final plusOneDay = date.add(Duration(days: 1));
      expect(plusOneDay.year, 2024);
      expect(plusOneDay.month, 3);
      expect(plusOneDay.day, 1);
      expect(plusOneDay.hour, 14);
      expect(plusOneDay.minute, 30);
      expect(plusOneDay.second, 45);

      // Add hours
      final plusTwoHours = date.add(Duration(hours: 2));
      expect(plusTwoHours.hour, 16);
      expect(plusTwoHours.day, 29);

      // Add minutes
      final plusThirtyMinutes = date.add(Duration(minutes: 30));
      expect(plusThirtyMinutes.hour, 15);
      expect(plusThirtyMinutes.minute, 0);

      // Add seconds
      final plusFifteenSeconds = date.add(Duration(seconds: 15));
      expect(plusFifteenSeconds.second, 0);
      expect(plusFifteenSeconds.minute, 31);

      // Add milliseconds
      final plusMillis = date.add(Duration(milliseconds: 500));
      expect(plusMillis.millisecond, 500);

      // Add microseconds
      final plusMicros = date.add(Duration(microseconds: 750));
      expect(plusMicros.microsecond, 750);
    });

    test('subtract method', () {
      final date = Chronos(2024, 3, 1, 14, 30, 45);

      // Subtract days
      final minusOneDay = date.subtract(Duration(days: 1));
      expect(minusOneDay.year, 2024);
      expect(minusOneDay.month, 2);
      expect(minusOneDay.day, 29); // Leap year
      expect(minusOneDay.hour, 14);
      expect(minusOneDay.minute, 30);
      expect(minusOneDay.second, 45);

      // Subtract hours
      final minusTwoHours = date.subtract(Duration(hours: 2));
      expect(minusTwoHours.hour, 12);
      expect(minusTwoHours.day, 1);

      // Subtract minutes
      final minusThirtyMinutes = date.subtract(Duration(minutes: 30));
      expect(minusThirtyMinutes.hour, 14);
      expect(minusThirtyMinutes.minute, 0);

      // Subtract seconds
      final minusFifteenSeconds = date.subtract(Duration(seconds: 15));
      expect(minusFifteenSeconds.second, 30);

      // Subtract across month boundary
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

      // Test negative difference
      final negativeDiff = date1.difference(date2);
      expect(negativeDiff.inDays, -1);
      expect(negativeDiff.inHours, -24);
    });

    test('arithmetic returns DateTime, not Chronos', () {
      final chronos = Chronos(2024, 2, 29, 14, 30, 45);

      // Addition returns DateTime
      final added = chronos.add(Duration(days: 1));
      expect(added, isA<DateTime>());
      expect(added, isNot(isA<Chronos>()));

      // Subtraction returns DateTime
      final subtracted = chronos.subtract(Duration(days: 1));
      expect(subtracted, isA<DateTime>());
      expect(subtracted, isNot(isA<Chronos>()));

      // Can convert back to Chronos
      final backToChronos = added.toChronos();
      expect(backToChronos, isA<Chronos>());
    });

    test('chained arithmetic operations', () {
      final date = Chronos(2024, 2, 29, 12, 0, 0);

      // Chain multiple operations
      final result = date.add(Duration(days: 1)).subtract(Duration(hours: 2)).add(Duration(minutes: 30));

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

      // Same moment in different timezones
      expect(utcDate == localDate, true);
      expect(utcDate.isAtSameMomentAs(localDate), true);
      expect(utcDate.isBefore(localDate), false);
      expect(utcDate.isAfter(localDate), false);

      // Different moments
      expect(utcDate.isBefore(differentUtc), true);
      expect(differentUtc.isAfter(utcDate), true);
    });

    test('arithmetic with large durations', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);

      // Add large duration (1 year worth of days)
      final plusOneYear = date.add(Duration(days: 366)); // 2024 is leap year
      expect(plusOneYear.year, 2025);
      expect(plusOneYear.month, 3); // March because 2025 is not a leap year
      expect(plusOneYear.day, 1); // March 1st

      // Add very large duration
      final plusCentury = date.add(Duration(days: 36525)); // ~100 years
      expect(plusCentury.year, greaterThan(2100));

      // Subtract large duration
      final minusDecade = date.subtract(Duration(days: 3653)); // ~10 years
      expect(minusDecade.year, lessThan(2015));
    });

    test('arithmetic with negative durations', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45);

      // Adding negative duration is same as subtracting positive
      final addNegative = date.add(Duration(days: -1));
      final subtractPositive = date.subtract(Duration(days: 1));

      expect(addNegative.isAtSameMomentAs(subtractPositive), true);

      // Subtracting negative duration is same as adding positive
      final subtractNegative = date.subtract(Duration(hours: -2));
      final addPositive = date.add(Duration(hours: 2));

      expect(subtractNegative.isAtSameMomentAs(addPositive), true);
    });

    test('arithmetic with zero duration', () {
      final date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);

      // Adding zero should return equivalent moment
      final plusZero = date.add(Duration.zero);
      expect(plusZero.isAtSameMomentAs(date), true);

      // Subtracting zero should return equivalent moment
      final minusZero = date.subtract(Duration.zero);
      expect(minusZero.isAtSameMomentAs(date), true);
    });

    test('comparison with extreme dates', () {
      final normalDate = Chronos(2024, 2, 29, 14, 30, 45);
      final minDate = Chronos.fromMillisecondsSinceEpoch(0, isUtc: true);
      final maxDate = Chronos(9999, 12, 31, 23, 59, 59);

      // Normal date should be between min and max
      expect(normalDate.isAfter(minDate), true);
      expect(normalDate.isBefore(maxDate), true);

      // Min date should be less than everything else
      expect(minDate.isBefore(normalDate), true);
      expect(minDate.isBefore(maxDate), true);

      // Max date should be greater than everything else
      expect(maxDate.isAfter(normalDate), true);
      expect(maxDate.isAfter(minDate), true);
    });

    test('equality with precision differences', () {
      final base = Chronos(2024, 2, 29, 14, 30, 45);
      final withMillis = Chronos(2024, 2, 29, 14, 30, 45, 0);
      final withMicros = Chronos(2024, 2, 29, 14, 30, 45, 0, 0);

      // All should be equal (same moment)
      expect(base == withMillis, true);
      expect(base == withMicros, true);
      expect(withMillis == withMicros, true);

      // But different precision should not be equal
      final differentMilli = Chronos(2024, 2, 29, 14, 30, 45, 1);
      expect(base == differentMilli, false);
    });

    test('hashCode consistency with arithmetic', () {
      final date1 = Chronos(2024, 2, 29, 14, 30, 45);
      final date2 = date1.add(Duration.zero);
      final date3 = date1.subtract(Duration.zero);

      // Adding/subtracting zero should maintain same moment
      expect(date1.isAtSameMomentAs(date2), true);
      expect(date1.isAtSameMomentAs(date3), true);

      // But since arithmetic returns DateTime, not Chronos,
      // we need to convert back for proper equality
      final chronos2 = date2.toChronos();
      final chronos3 = date3.toChronos();

      expect(date1 == chronos2, true);
      expect(date1 == chronos3, true);
      expect(date1.hashCode, chronos2.hashCode);
      expect(date1.hashCode, chronos3.hashCode);
    });

    test('method chaining preserves functionality', () {
      final date = Chronos(2024, 2, 29, 12, 0, 0);

      // Test that operations work correctly when chained
      final result1 = date.add(Duration(hours: 1)).add(Duration(hours: 1));
      final result2 = date.add(Duration(hours: 1)).add(Duration(hours: 1));

      expect(result1.isAtSameMomentAs(result2), true);

      // Test mixed operations
      final result3 = date.add(Duration(hours: 2)).subtract(Duration(minutes: 30));
      expect(result3.hour, 13);
      expect(result3.minute, 30);
    });

    test('timezone conversion preserves comparison behavior', () {
      final utcDate = Chronos.utc(2024, 2, 29, 14, 30, 45);
      final localDate = utcDate.toLocal();

      // Converted dates should still be equal
      expect(utcDate == localDate, true);
      expect(utcDate.isAtSameMomentAs(localDate), true);
      expect(utcDate.compareTo(localDate), 0);

      // But they should have different timezone properties
      expect(utcDate.isUtc, true);
      expect(localDate.isUtc, false);
    });

    test('copyWith preserves equality behavior', () {
      final original = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);
      final copied = original.copyWith();

      expect(original == copied, true);
      expect(original.hashCode, copied.hashCode);
      expect(original.isAtSameMomentAs(copied), true);

      // Modified copy should not be equal
      final modified = original.copyWith(year: 2025);
      expect(original == modified, false);
      expect(original.hashCode, isNot(modified.hashCode));
    });
  });
}
