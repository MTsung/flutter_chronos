import 'package:flutter_chronos/src/chronos.dart';

/// Extension providing type conversion methods for DateTime instances.
///
/// This extension allows you to convert standard DateTime objects to
/// Chronos instances while preserving timezone information and all
/// temporal values (year, month, day, hour, minute, second, etc.).
extension TypeCasting on DateTime {
  /// Converts a DateTime instance to a Chronos instance.
  ///
  /// Preserves all temporal values and timezone information:
  /// - UTC DateTimes become UTC Chronos instances
  /// - Local DateTimes become local Chronos instances
  /// - All precision (microseconds) is maintained
  ///
  /// **Important Notes:**
  /// - No data loss occurs during conversion
  /// - The resulting Chronos has access to all Chronos extension methods
  /// - Timezone offset is preserved for local DateTimes
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(2024, 3, 15, 14, 30, 45);
  /// final chronos = dateTime.toChronos(); // Chronos(2024, 3, 15, 14, 30, 45)
  /// print(chronos.isUtc == dateTime.isUtc); // true
  ///
  /// final utcDateTime = DateTime.utc(2024, 3, 15, 14, 30, 45);
  /// final utcChronos = utcDateTime.toChronos(); // Chronos.utc(2024, 3, 15, 14, 30, 45)
  /// print(utcChronos.isUtc); // true
  /// ```
  Chronos toChronos() => isUtc
      ? Chronos.utc(year, month, day, hour, minute, second, millisecond, microsecond)
      : Chronos(year, month, day, hour, minute, second, millisecond, microsecond);
}
