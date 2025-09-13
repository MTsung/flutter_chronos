import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChronosRange Constructor', () {
    test('creates range with valid start and end', () {
      final start = Chronos(2024, 3, 15, 9, 0);
      final end = Chronos(2024, 3, 15, 17, 0);
      final range = ChronosRange(start, end);

      expect(range.start, start);
      expect(range.end, end);
    });

    test('creates range with same start and end (empty range)', () {
      final instant = Chronos(2024, 3, 15, 12, 0);
      final range = ChronosRange(instant, instant);

      expect(range.start, instant);
      expect(range.end, instant);
      expect(range.isEmpty, true);
    });

    test('throws assertion error when end is before start', () {
      final start = Chronos(2024, 3, 15, 17, 0);
      final end = Chronos(2024, 3, 15, 9, 0);

      expect(() => ChronosRange(start, end), throwsA(isA<AssertionError>()));
    });
  });

  group('ChronosRange Properties', () {
    test('duration returns correct time difference', () {
      final start = Chronos(2024, 3, 15, 9, 0);
      final end = Chronos(2024, 3, 15, 17, 0);
      final range = ChronosRange(start, end);

      expect(range.duration, const Duration(hours: 8));
    });

    test('duration returns zero for empty range', () {
      final instant = Chronos(2024, 3, 15, 12, 0);
      final range = ChronosRange(instant, instant);

      expect(range.duration, Duration.zero);
    });

    test('duration handles different time units', () {
      final start = Chronos(2024, 3, 15, 14, 30, 15);
      final end = Chronos(2024, 3, 15, 15, 45, 30);
      final range = ChronosRange(start, end);

      expect(
        range.duration,
        const Duration(hours: 1, minutes: 15, seconds: 15),
      );
    });

    test('isEmpty returns true for equal start and end', () {
      final instant = Chronos(2024, 3, 15, 12, 0);
      final range = ChronosRange(instant, instant);

      expect(range.isEmpty, true);
    });

    test('isEmpty returns false for different start and end', () {
      final start = Chronos(2024, 3, 15, 9, 0);
      final end = Chronos(2024, 3, 15, 17, 0);
      final range = ChronosRange(start, end);

      expect(range.isEmpty, false);
    });
  });

  group('ChronosRange contains method', () {
    late ChronosRange businessHours;

    setUp(() {
      businessHours = ChronosRange(
        Chronos(2024, 3, 15, 9, 0),
        Chronos(2024, 3, 15, 17, 0),
      );
    });

    test('returns true for time within range', () {
      final lunchTime = Chronos(2024, 3, 15, 12, 30);
      expect(businessHours.contains(lunchTime), true);
    });

    test('returns true for time at start boundary', () {
      final startTime = Chronos(2024, 3, 15, 9, 0);
      expect(businessHours.contains(startTime), true);
    });

    test('returns true for time at end boundary', () {
      final endTime = Chronos(2024, 3, 15, 17, 0);
      expect(businessHours.contains(endTime), true);
    });

    test('returns false for time before range', () {
      final earlyMorning = Chronos(2024, 3, 15, 7, 0);
      expect(businessHours.contains(earlyMorning), false);
    });

    test('returns false for time after range', () {
      final evening = Chronos(2024, 3, 15, 19, 0);
      expect(businessHours.contains(evening), false);
    });

    test('returns false for different day', () {
      final nextDay = Chronos(2024, 3, 16, 12, 0);
      expect(businessHours.contains(nextDay), false);
    });

    test('handles empty range', () {
      final instant = Chronos(2024, 3, 15, 12, 0);
      final emptyRange = ChronosRange(instant, instant);

      expect(emptyRange.contains(instant), true);
      expect(emptyRange.contains(instant.addMinute()), false);
    });
  });

  group('ChronosRange overlaps method', () {
    late ChronosRange morning;
    late ChronosRange afternoon;
    late ChronosRange lunch;
    late ChronosRange evening;

    setUp(() {
      morning = ChronosRange(
        Chronos(2024, 3, 15, 8, 0),
        Chronos(2024, 3, 15, 12, 0),
      );

      afternoon = ChronosRange(
        Chronos(2024, 3, 15, 12, 0),
        Chronos(2024, 3, 15, 17, 0),
      );

      lunch = ChronosRange(
        Chronos(2024, 3, 15, 11, 30),
        Chronos(2024, 3, 15, 13, 0),
      );

      evening = ChronosRange(
        Chronos(2024, 3, 15, 18, 0),
        Chronos(2024, 3, 15, 22, 0),
      );
    });

    test(
      'returns false for ranges touching at endpoints (excludeEnd=true)',
      () {
        expect(morning.overlaps(afternoon), false);
        expect(morning.overlaps(afternoon, true), false);
      },
    );

    test(
      'returns true for ranges touching at endpoints (excludeEnd=false)',
      () {
        expect(morning.overlaps(afternoon, false), true);
      },
    );

    test('returns true for ranges with actual overlap', () {
      expect(morning.overlaps(lunch), true);
      expect(afternoon.overlaps(lunch), true);
      expect(lunch.overlaps(morning), true);
      expect(lunch.overlaps(afternoon), true);
    });

    test('returns false for non-overlapping ranges', () {
      expect(morning.overlaps(evening), false);
      expect(afternoon.overlaps(evening), false);
      expect(evening.overlaps(morning), false);
      expect(evening.overlaps(afternoon), false);
    });

    test('returns true for identical ranges', () {
      final sameMorning = ChronosRange(
        Chronos(2024, 3, 15, 8, 0),
        Chronos(2024, 3, 15, 12, 0),
      );
      expect(morning.overlaps(sameMorning), true);
    });

    test('returns true for range contained within another', () {
      final shortBreak = ChronosRange(
        Chronos(2024, 3, 15, 10, 0),
        Chronos(2024, 3, 15, 10, 15),
      );
      expect(morning.overlaps(shortBreak), true);
      expect(shortBreak.overlaps(morning), true);
    });

    test('handles empty ranges', () {
      final instant = Chronos(2024, 3, 15, 12, 0);
      final emptyRange = ChronosRange(instant, instant);

      expect(morning.overlaps(emptyRange, false), true);
      expect(morning.overlaps(emptyRange, true), false);
      expect(emptyRange.overlaps(morning, false), true);
      expect(emptyRange.overlaps(morning, true), false);
    });
  });

  group('ChronosRange intersect method', () {
    late ChronosRange meeting1;
    late ChronosRange meeting2;
    late ChronosRange meeting3;

    setUp(() {
      meeting1 = ChronosRange(
        Chronos(2024, 3, 15, 10, 0),
        Chronos(2024, 3, 15, 12, 0),
      );

      meeting2 = ChronosRange(
        Chronos(2024, 3, 15, 11, 0),
        Chronos(2024, 3, 15, 14, 0),
      );

      meeting3 = ChronosRange(
        Chronos(2024, 3, 15, 15, 0),
        Chronos(2024, 3, 15, 16, 0),
      );
    });

    test('returns intersection for overlapping ranges', () {
      final intersection = meeting1.intersect(meeting2);

      expect(intersection, isNotNull);
      expect(intersection!.start, Chronos(2024, 3, 15, 11, 0));
      expect(intersection.end, Chronos(2024, 3, 15, 12, 0));
      expect(intersection.duration, const Duration(hours: 1));
    });

    test('returns null for non-overlapping ranges', () {
      final intersection = meeting1.intersect(meeting3);
      expect(intersection, isNull);
    });

    test('returns identical range for same ranges', () {
      final intersection = meeting1.intersect(meeting1);

      expect(intersection, isNotNull);
      expect(intersection!.start, meeting1.start);
      expect(intersection.end, meeting1.end);
    });

    test('returns smaller range when one contains the other', () {
      final largeRange = ChronosRange(
        Chronos(2024, 3, 15, 9, 0),
        Chronos(2024, 3, 15, 15, 0),
      );

      final intersection = largeRange.intersect(meeting1);

      expect(intersection, isNotNull);
      expect(intersection!.start, meeting1.start);
      expect(intersection.end, meeting1.end);
    });

    test('handles partial overlaps correctly', () {
      final partialOverlap = ChronosRange(
        Chronos(2024, 3, 15, 11, 30),
        Chronos(2024, 3, 15, 13, 30),
      );

      final intersection = meeting1.intersect(partialOverlap);

      expect(intersection, isNotNull);
      expect(intersection!.start, Chronos(2024, 3, 15, 11, 30));
      expect(intersection.end, Chronos(2024, 3, 15, 12, 0));
      expect(intersection.duration, const Duration(minutes: 30));
    });

    test('handles empty ranges', () {
      final instant = Chronos(2024, 3, 15, 11, 0);
      final emptyRange = ChronosRange(instant, instant);

      final intersection = meeting1.intersect(emptyRange);
      expect(intersection, isNotNull);
      expect(intersection!.isEmpty, true);
    });

    test('returns empty range for ranges touching at endpoints', () {
      final touchingRange = ChronosRange(
        Chronos(2024, 3, 15, 12, 0),
        Chronos(2024, 3, 15, 14, 0),
      );

      final intersection = meeting1.intersect(touchingRange);
      expect(intersection, isNull);
    });
  });

  group('ChronosRange toString method', () {
    test('returns correct string representation', () {
      final range = ChronosRange(
        Chronos(2024, 3, 15, 9, 0),
        Chronos(2024, 3, 15, 17, 0),
      );

      final result = range.toString();
      expect(result, contains('2024-03-15 09:00:00.000'));
      expect(result, contains('2024-03-15 17:00:00.000'));
      expect(result, contains(' ~ '));
    });

    test('handles empty range string representation', () {
      final instant = Chronos(2024, 3, 15, 12, 0);
      final range = ChronosRange(instant, instant);

      final result = range.toString();
      expect(result, contains('2024-03-15 12:00:00.000'));
      expect(result, contains(' ~ '));
      final parts = result.split(' ~ ');
      expect(parts.length, 2);
      expect(parts[0], parts[1]);
    });

    test('handles different date formats', () {
      final range = ChronosRange(
        Chronos(2024, 12, 31, 23, 59, 59, 999),
        Chronos(2025, 1, 1, 0, 0, 0, 0),
      );

      final result = range.toString();
      expect(result, contains('2024-12-31'));
      expect(result, contains('2025-01-01'));
      expect(result, contains(' ~ '));
    });
  });

  group('ChronosRange Edge Cases', () {
    test('handles microsecond precision', () {
      final start = Chronos(2024, 3, 15, 12, 0, 0, 0, 1);
      final end = Chronos(2024, 3, 15, 12, 0, 0, 0, 2);
      final range = ChronosRange(start, end);

      expect(range.duration, const Duration(microseconds: 1));
      expect(range.isEmpty, false);
    });

    test('handles year boundaries', () {
      final range = ChronosRange(
        Chronos(2023, 12, 31, 23, 0),
        Chronos(2024, 1, 1, 1, 0),
      );

      expect(range.duration, const Duration(hours: 2));
      expect(range.contains(Chronos(2024, 1, 1, 0, 0)), true);
    });

    test('handles leap year dates', () {
      final range = ChronosRange(
        Chronos(2024, 2, 28, 12, 0),
        Chronos(2024, 3, 1, 12, 0),
      );

      expect(range.duration, const Duration(days: 2));
      expect(range.contains(Chronos(2024, 2, 29, 12, 0)), true);
    });

    test('handles very long ranges', () {
      final centuryRange = ChronosRange(
        Chronos(1900, 1, 1),
        Chronos(2000, 1, 1),
      );

      expect(centuryRange.duration.inDays, greaterThan(36500));
      expect(centuryRange.contains(Chronos(1950, 6, 15)), true);
    });

    test('handles very short ranges', () {
      final start = Chronos(2024, 3, 15, 12, 0, 0, 0, 0);
      final end = Chronos(2024, 3, 15, 12, 0, 0, 0, 1);
      final range = ChronosRange(start, end);

      expect(range.duration, const Duration(microseconds: 1));
      expect(range.isEmpty, false);
    });
  });

  group('ChronosRange Real-world Scenarios', () {
    test('business hours scenario', () {
      final businessHours = ChronosRange(
        Chronos(2024, 3, 15, 9, 0),
        Chronos(2024, 3, 15, 17, 0),
      );

      final lunchBreak = ChronosRange(
        Chronos(2024, 3, 15, 12, 0),
        Chronos(2024, 3, 15, 13, 0),
      );

      expect(businessHours.contains(Chronos(2024, 3, 15, 10, 30)), true);
      expect(businessHours.overlaps(lunchBreak), true);
      expect(lunchBreak.intersect(businessHours), isNotNull);
    });

    test('meeting conflict detection', () {
      final meeting1 = ChronosRange(
        Chronos(2024, 3, 15, 14, 0),
        Chronos(2024, 3, 15, 15, 0),
      );

      final meeting2 = ChronosRange(
        Chronos(2024, 3, 15, 14, 30),
        Chronos(2024, 3, 15, 15, 30),
      );

      final meeting3 = ChronosRange(
        Chronos(2024, 3, 15, 15, 0),
        Chronos(2024, 3, 15, 16, 0),
      );

      expect(meeting1.overlaps(meeting2), true);
      expect(meeting1.overlaps(meeting3), false);
      expect(meeting1.overlaps(meeting3, false), true);
    });

    test('shift scheduling scenario', () {
      final morningShift = ChronosRange(
        Chronos(2024, 3, 15, 6, 0),
        Chronos(2024, 3, 15, 14, 0),
      );

      final afternoonShift = ChronosRange(
        Chronos(2024, 3, 15, 14, 0),
        Chronos(2024, 3, 15, 22, 0),
      );

      final nightShift = ChronosRange(
        Chronos(2024, 3, 15, 22, 0),
        Chronos(2024, 3, 16, 6, 0),
      );

      expect(morningShift.overlaps(afternoonShift), false);
      expect(afternoonShift.overlaps(nightShift), false);
      expect(morningShift.overlaps(nightShift), false);

      final fullDay = ChronosRange(
        Chronos(2024, 3, 15, 6, 0),
        Chronos(2024, 3, 16, 6, 0),
      );

      expect(fullDay.duration, const Duration(hours: 24));
    });

    test('event duration calculation', () {
      final conference = ChronosRange(
        Chronos(2024, 3, 15, 9, 0),
        Chronos(2024, 3, 15, 17, 30),
      );

      expect(conference.duration, const Duration(hours: 8, minutes: 30));

      final keynote = ChronosRange(
        Chronos(2024, 3, 15, 9, 0),
        Chronos(2024, 3, 15, 10, 30),
      );

      expect(conference.contains(keynote.start), true);
      expect(conference.contains(keynote.end), true);
      expect(conference.overlaps(keynote), true);
    });
  });

  test('period', () {
    final period = ChronosRange(
      Chronos(2024, 2, 28),
      Chronos(2024, 3, 15),
    ).period(TimeUnit.hour, 6);
    expect(period.length, 65);
    expect(period[24], Chronos.parse('2024-03-05 00:00:00.000'));
    expect(period[64], Chronos.parse('2024-03-15 00:00:00.000'));

    expect(
      ChronosRange(
        Chronos(2024, 2, 28),
        Chronos(2024, 3, 15),
      ).period(TimeUnit.day).length,
      17,
    );
    expect(
      ChronosRange(
        Chronos.yesterday(),
        Chronos.tomorrow(),
      ).period(TimeUnit.hour).length,
      49,
    );
    expect(
      ChronosRange(
        Chronos.yesterday(),
        Chronos.tomorrow(),
      ).period(TimeUnit.hour, 7).length,
      7,
    );
  });
}
