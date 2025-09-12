import 'package:flutter_chronos/flutter_chronos.dart';

/// Represents a range between two [Chronos] date-time instances.
///
/// A [ChronosRange] defines a time period with a start and end point,
/// providing utilities for range operations like checking containment,
/// overlaps, and intersections.
///
/// Example:
/// ```dart
/// final start = Chronos(2024, 3, 15, 9, 0);
/// final end = Chronos(2024, 3, 15, 17, 0);
/// final workDay = ChronosRange(start, end);
/// ```
class ChronosRange {
  /// The starting point of the range.
  final Chronos start;

  /// The ending point of the range.
  final Chronos end;

  /// Creates a new [ChronosRange] with the specified [start] and [end] points.
  ///
  /// The [end] must not be before [start], otherwise an assertion error will be thrown.
  ///
  /// Example:
  /// ```dart
  /// final meeting = ChronosRange(
  ///   Chronos(2024, 3, 15, 14, 0), // 2:00 PM
  ///   Chronos(2024, 3, 15, 15, 30), // 3:30 PM
  /// );
  /// ```
  const ChronosRange(this.start, this.end)
    : assert(start <= end, 'end must not be before start');

  /// Returns the duration of this range.
  ///
  /// Calculates the time difference between the end and start points.
  ///
  /// Example:
  /// ```dart
  /// final range = ChronosRange(
  ///   Chronos(2024, 3, 15, 9, 0),
  ///   Chronos(2024, 3, 15, 17, 0),
  /// );
  /// print(range.duration); // 8:00:00.000000 (8 hours)
  /// ```
  Duration get duration => end.diff(start);

  /// Returns true if this range is empty (start equals end).
  ///
  /// An empty range represents a single point in time with no duration.
  ///
  /// Example:
  /// ```dart
  /// final instant = ChronosRange(
  ///   Chronos(2024, 3, 15, 12, 0),
  ///   Chronos(2024, 3, 15, 12, 0),
  /// );
  /// print(instant.isEmpty); // true
  ///
  /// final period = ChronosRange(
  ///   Chronos(2024, 3, 15, 9, 0),
  ///   Chronos(2024, 3, 15, 17, 0),
  /// );
  /// print(period.isEmpty); // false
  /// ```
  bool get isEmpty => start == end;

  /// Returns true if this range contains the specified [other] date-time.
  ///
  /// A date-time is considered contained if it falls between the start and end
  /// points (inclusive of both boundaries).
  ///
  /// Example:
  /// ```dart
  /// final businessHours = ChronosRange(
  ///   Chronos(2024, 3, 15, 9, 0),   // 9:00 AM
  ///   Chronos(2024, 3, 15, 17, 0),  // 5:00 PM
  /// );
  ///
  /// final lunchTime = Chronos(2024, 3, 15, 12, 30); // 12:30 PM
  /// final evening = Chronos(2024, 3, 15, 19, 0);    // 7:00 PM
  ///
  /// print(businessHours.contains(lunchTime)); // true
  /// print(businessHours.contains(evening));   // false
  /// ```
  bool contains(Chronos other) => start <= other && other <= end;

  /// Returns true if this range overlaps with the [other] range.
  ///
  /// [excludeEnd] determines whether the end points are considered exclusive.
  /// When true (default), ranges that only touch at endpoints don't overlap.
  /// When false, ranges that touch at endpoints are considered overlapping.
  ///
  /// Example:
  /// ```dart
  /// final morning = ChronosRange(
  ///   Chronos(2024, 3, 15, 8, 0),   // 8:00 AM
  ///   Chronos(2024, 3, 15, 12, 0),  // 12:00 PM
  /// );
  ///
  /// final afternoon = ChronosRange(
  ///   Chronos(2024, 3, 15, 12, 0),  // 12:00 PM
  ///   Chronos(2024, 3, 15, 17, 0),  // 5:00 PM
  /// );
  ///
  /// final lunch = ChronosRange(
  ///   Chronos(2024, 3, 15, 11, 30), // 11:30 AM
  ///   Chronos(2024, 3, 15, 13, 0),  // 1:00 PM
  /// );
  ///
  /// print(morning.overlaps(afternoon));        // false (touching endpoints)
  /// print(morning.overlaps(afternoon, false)); // true (including endpoints)
  /// print(morning.overlaps(lunch));            // true (actual overlap)
  /// ```
  bool overlaps(ChronosRange other, [bool excludeEnd = true]) {
    if (excludeEnd) {
      return start < other.end && other.start < end;
    }
    return start <= other.end && other.start <= end;
  }

  /// Returns the intersection of this range with the [other] range.
  ///
  /// If the ranges don't overlap, returns null. Otherwise, returns a new
  /// [ChronosRange] representing the overlapping period.
  ///
  /// The intersection is calculated by taking the later start time and the
  /// earlier end time of both ranges.
  ///
  /// Example:
  /// ```dart
  /// final meeting1 = ChronosRange(
  ///   Chronos(2024, 3, 15, 10, 0),  // 10:00 AM
  ///   Chronos(2024, 3, 15, 12, 0),  // 12:00 PM
  /// );
  ///
  /// final meeting2 = ChronosRange(
  ///   Chronos(2024, 3, 15, 11, 0),  // 11:00 AM
  ///   Chronos(2024, 3, 15, 14, 0),  // 2:00 PM
  /// );
  ///
  /// final conflict = meeting1.intersect(meeting2);
  /// print(conflict); // 2024-03-15 11:00:00.000 ~ 2024-03-15 12:00:00.000
  ///
  /// final noOverlap = ChronosRange(
  ///   Chronos(2024, 3, 15, 15, 0),  // 3:00 PM
  ///   Chronos(2024, 3, 15, 16, 0),  // 4:00 PM
  /// );
  ///
  /// final noConflict = meeting1.intersect(noOverlap);
  /// print(noConflict); // null
  /// ```
  ChronosRange? intersect(ChronosRange other) {
    if (!overlaps(other)) return null;
    final s = start > other.start ? start : other.start;
    final e = end < other.end ? end : other.end;
    return ChronosRange(s, e);
  }

  /// Returns a string representation of this range.
  ///
  /// The format is "start ~ end" where both dates are formatted using
  /// their default string representation.
  ///
  /// Example:
  /// ```dart
  /// final range = ChronosRange(
  ///   Chronos(2024, 3, 15, 9, 0),
  ///   Chronos(2024, 3, 15, 17, 0),
  /// );
  /// print(range.toString());
  /// // Output: 2024-03-15 09:00:00.000 ~ 2024-03-15 17:00:00.000
  /// ```
  @override
  String toString() => '$start ~ $end';
}
