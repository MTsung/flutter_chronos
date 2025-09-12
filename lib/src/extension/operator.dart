import 'package:flutter_chronos/src/chronos.dart';
import 'package:flutter_chronos/src/extension/type_casting.dart';

/// Extension providing operator overloads for Chronos instances.
///
/// This extension allows you to use standard comparison and arithmetic
/// operators with Chronos objects, making date/time operations more intuitive
/// and readable in your code.
extension Operator on Chronos {
  /// Returns true if this date is after [other].
  ///
  /// Compares two Chronos instances to determine if this date occurs
  /// chronologically after the other date. Useful for sorting dates,
  /// validating date ranges, or checking if deadlines have passed.
  ///
  /// Example:
  /// ```dart
  /// final deadline = Chronos(2024, 12, 31, 23, 59, 59);
  /// final currentDate = Chronos(2025, 1, 1, 0, 0, 0);
  ///
  /// if (currentDate > deadline) {
  ///   print('Deadline has passed!'); // This will print
  /// }
  /// ```
  bool operator >(Chronos other) => isAfter(other);

  /// Returns true if this date is before [other].
  ///
  /// Compares two Chronos instances to determine if this date occurs
  /// chronologically before the other date. Commonly used for validating
  /// that start dates come before end dates or checking upcoming events.
  ///
  /// Example:
  /// ```dart
  /// final eventStart = Chronos(2024, 6, 15, 9, 0, 0);
  /// final eventEnd = Chronos(2024, 6, 15, 17, 0, 0);
  ///
  /// if (eventStart < eventEnd) {
  ///   print('Valid event timeframe'); // This will print
  /// }
  /// ```
  bool operator <(Chronos other) => isBefore(other);

  /// Returns true if this date is after or equal to [other].
  ///
  /// Compares two Chronos instances to determine if this date occurs
  /// chronologically after or at the exact same moment as the other date.
  /// Useful for inclusive date range validations.
  ///
  /// Example:
  /// ```dart
  /// final subscriptionStart = Chronos(2024, 1, 1);
  /// final accessDate = Chronos(2024, 1, 1);
  ///
  /// if (accessDate >= subscriptionStart) {
  ///   print('Access granted'); // This will print (equal dates)
  /// }
  /// ```
  bool operator >=(Chronos other) => isAfter(other) || isAtSameMomentAs(other);

  /// Returns true if this date is before or equal to [other].
  ///
  /// Compares two Chronos instances to determine if this date occurs
  /// chronologically before or at the exact same moment as the other date.
  /// Useful for inclusive upper bound validations.
  ///
  /// Example:
  /// ```dart
  /// final promotionEnd = Chronos(2024, 12, 31, 23, 59, 59);
  /// final purchaseDate = Chronos(2024, 12, 25, 14, 30, 0);
  ///
  /// if (purchaseDate <= promotionEnd) {
  ///   print('Promotion still valid'); // This will print
  /// }
  /// ```
  bool operator <=(Chronos other) => isBefore(other) || isAtSameMomentAs(other);

  /// Adds a [duration] to this date and returns a new Chronos instance.
  ///
  /// Creates a new Chronos object by adding the specified duration to the
  /// current date/time. The original Chronos instance remains unchanged.
  /// Useful for calculating future dates, scheduling events, or adding
  /// time intervals.
  ///
  /// Example:
  /// ```dart
  /// final meetingStart = Chronos(2024, 3, 15, 14, 0, 0);
  /// final meetingEnd = meetingStart + Duration(hours: 1, minutes: 30);
  ///
  /// print('Meeting: ${meetingStart.format('HH:mm')} - ${meetingEnd.format('HH:mm')}');
  /// // Output: Meeting: 14:00 - 15:30
  /// ```
  Chronos operator +(Duration duration) => add(duration).toChronos();

  /// Subtracts a [duration] from this date and returns a new Chronos instance.
  ///
  /// Creates a new Chronos object by subtracting the specified duration from
  /// the current date/time. The original Chronos instance remains unchanged.
  /// Useful for calculating past dates, determining preparation times, or
  /// working backwards from deadlines.
  ///
  /// Example:
  /// ```dart
  /// final projectDeadline = Chronos(2024, 6, 30, 17, 0, 0);
  /// final startPreparation = projectDeadline - Duration(days: 7);
  ///
  /// print('Start preparation by: ${startPreparation.format('yyyy-MM-dd')}');
  /// // Output: Start preparation by: 2024-06-23
  /// ```
  Chronos operator -(Duration duration) => subtract(duration).toChronos();
}
