import 'package:flutter_chronos/src/extension/type_casting.dart';
import 'package:flutter_chronos/src/extension/modifiers.dart';
import 'package:flutter_chronos/src/chronos_config.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

/// A powerful extension of [DateTime] with additional utilities for date and time manipulation.
///
/// [Chronos] provides all the functionality of [DateTime] plus additional methods
/// for date arithmetic, formatting, comparisons, and human-readable representations.
/// It maintains full compatibility with [DateTime] while offering enhanced capabilities.
///
/// ## Creating Chronos instances
///
/// ```dart
/// // Create from date components
/// final chronos = Chronos(2024, 3, 15, 14, 30, 45);
///
/// // Create current time
/// final now = Chronos.now();
///
/// // Create from timestamp
/// final fromTimestamp = Chronos.fromTimestamp(1710511845);
///
/// // Parse from string
/// final parsed = Chronos.parse('2024-03-15 14:30:45');
/// ```
///
/// ## Date operations
///
/// ```dart
/// final date = Chronos.now();
/// final tomorrow = date.addDay();
/// final lastWeek = date.subWeek();
/// final startOfMonth = date.startOfMonth();
/// ```
class Chronos extends DateTime {
  /// Creates a [Chronos] instance with the given date and time components.
  ///
  /// The [year] parameter is required. All other parameters are optional and
  /// default to their minimum values (1 for month and day, 0 for time components).
  /// The resulting instance will be in the local timezone.
  ///
  /// Example:
  /// ```dart
  /// final chronos1 = Chronos(2024); // 2024-01-01 00:00:00
  /// final chronos2 = Chronos(2024, 3, 15); // 2024-03-15 00:00:00
  /// final chronos3 = Chronos(2024, 3, 15, 14, 30, 45); // 2024-03-15 14:30:45
  /// ```
  Chronos(
    super.year, [
    super.month,
    super.day,
    super.hour,
    super.minute,
    super.second,
    super.millisecond,
    super.microsecond,
  ]);

  /// Creates a [Chronos] instance in UTC timezone with the given date and time components.
  ///
  /// Similar to the default constructor but creates the instance in UTC timezone
  /// instead of local timezone. The [year] parameter is required, all others are optional.
  ///
  /// Example:
  /// ```dart
  /// final utcChronos = Chronos.utc(2024, 3, 15, 14, 30, 45);
  /// print(utcChronos.isUtc); // true
  /// ```
  Chronos.utc(
    super.year, [
    super.month,
    super.day,
    super.hour,
    super.minute,
    super.second,
    super.millisecond,
    super.microsecond,
  ]) : super.utc();

  /// Creates a [Chronos] instance from milliseconds since Unix epoch.
  ///
  /// The [millisecondsSinceEpoch] parameter represents the number of milliseconds
  /// since January 1, 1970, 00:00:00 UTC. The [isUtc] parameter determines
  /// whether the resulting instance should be in UTC (true) or local timezone (false).
  ///
  /// Example:
  /// ```dart
  /// final chronos1 = Chronos.fromMillisecondsSinceEpoch(1710511845000);
  /// final chronos2 = Chronos.fromMillisecondsSinceEpoch(1710511845000, isUtc: true);
  /// print(chronos2.isUtc); // true
  /// ```
  Chronos.fromMillisecondsSinceEpoch(
    super.millisecondsSinceEpoch, {
    super.isUtc,
  }) : super.fromMillisecondsSinceEpoch();

  /// Creates a [Chronos] instance from microseconds since Unix epoch.
  ///
  /// The [microsecondsSinceEpoch] parameter represents the number of microseconds
  /// since January 1, 1970, 00:00:00 UTC. The [isUtc] parameter determines
  /// whether the resulting instance should be in UTC (true) or local timezone (false).
  /// This constructor provides higher precision than [fromMillisecondsSinceEpoch].
  ///
  /// Example:
  /// ```dart
  /// final chronos1 = Chronos.fromMicrosecondsSinceEpoch(1710511845000000);
  /// final chronos2 = Chronos.fromMicrosecondsSinceEpoch(1710511845000000, isUtc: true);
  /// print(chronos2.microsecond); // Preserves microsecond precision
  /// ```
  Chronos.fromMicrosecondsSinceEpoch(
    super.microsecondsSinceEpoch, {
    super.isUtc,
  }) : super.fromMicrosecondsSinceEpoch();

  /// Parses a string and returns a Chronos instance.
  ///
  /// Accepts the same string formats as [DateTime.parse] but returns a Chronos
  /// instance instead of DateTime. The timezone information is preserved based
  /// on the input string format.
  ///
  /// Example:
  /// ```dart
  /// final chronos1 = Chronos.parse('2024-03-15 14:30:45');
  /// print(chronos1); // 2024-03-15 14:30:45.000
  ///
  /// final chronos2 = Chronos.parse('2024-03-15T14:30:45Z');
  /// print(chronos2.isUtc); // true
  /// ```
  static Chronos parse(String formattedString) =>
      DateTime.parse(formattedString).toChronos();

  /// Tries to parse a string and returns a Chronos instance or null if parsing fails.
  ///
  /// Similar to [parse] but returns null instead of throwing an exception
  /// when the string format is invalid. This is safer for user input validation.
  ///
  /// Example:
  /// ```dart
  /// final validChronos = Chronos.tryParse('2024-03-15 14:30:45');
  /// print(validChronos != null); // true
  ///
  /// final invalidChronos = Chronos.tryParse('invalid-date');
  /// print(invalidChronos == null); // true
  /// ```
  static Chronos? tryParse(String formattedString) =>
      DateTime.tryParse(formattedString)?.toChronos();

  /// Parses a time string into a [Chronos] instance.
  /// **today's date with the specified time**.
  ///
  /// Supported formats:
  /// - `HH:mm:ss` (strict two digits, e.g. `08:05:03`)
  /// - `HH:mm` (strict two digits, e.g. `08:05`)
  /// - `HH` (strict two digits, e.g. `08`)
  ///
  /// Throws a [FormatException] if the string does not match
  /// any of the supported formats.
  ///
  /// Example:
  /// ```dart
  /// final time1 = Chronos.parseTime('14:30:45'); // Today at 14:30:45
  /// final time2 = Chronos.parseTime('08:15'); // Today at 08:15:00
  /// final time3 = Chronos.parseTime('09'); // Today at 09:00:00
  /// ```
  static Chronos parseTime(String timeString) {
    final formats = ['HH:mm:ss', 'HH:mm', 'HH'];

    for (final pattern in formats) {
      try {
        return today().setTimeFrom(
          DateFormat(pattern).parseStrict(timeString).toChronos(),
        );
      } catch (_) {
        // Try the next pattern
      }
    }

    throw FormatException('Invalid time format: $timeString');
  }

  /// Tries to parse a time string into a [Chronos] instance.
  /// **today's date with the specified time**.
  ///
  /// Behaves the same as [parseTime], except that instead of throwing
  /// a [FormatException] on failure, it returns `null`.
  ///
  /// Example:
  /// ```dart
  /// final validTime = Chronos.tryParseTime('14:30:45'); // Today at 14:30:45
  /// final invalidTime = Chronos.tryParseTime('25:70:90'); // null
  /// print(validTime != null); // true
  /// print(invalidTime == null); // true
  /// ```
  static Chronos? tryParseTime(String timeString) {
    try {
      return parseTime(timeString);
    } catch (_) {
      return null;
    }
  }

  /// Creates a Chronos instance from a Unix timestamp.
  ///
  /// The [timestamp] parameter should be in seconds since Unix epoch (January 1, 1970).
  /// The resulting Chronos instance will be in UTC timezone.
  ///
  /// Example:
  /// ```dart
  /// final timestamp = 1710511845; // March 15, 2024 14:30:45 UTC
  /// final chronos = Chronos.fromTimestamp(timestamp);
  /// print(chronos.isUtc); // true
  /// print(chronos.year); // 2024
  /// ```
  static Chronos fromTimestamp(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toChronos();

  /// Converts a DateTime instance to a Chronos instance.
  ///
  /// This is a convenience method that wraps the [toChronos] extension method.
  /// Preserves all timezone information and temporal values from the original DateTime.
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(2024, 3, 15, 14, 30, 45);
  /// final chronos = Chronos.fromDateTime(dateTime);
  /// print(chronos.year); // 2024
  /// print(chronos.isUtc == dateTime.isUtc); // true
  /// ```
  static Chronos fromDateTime(DateTime dateTime) => dateTime.toChronos();

  /// Returns the current date and time.
  ///
  /// If a fake time is set via [ChronosConfig.setFakeNow], returns that time instead.
  /// This is useful for testing time-dependent functionality.
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos.now();
  /// print(now); // Current date and time
  /// ```
  static Chronos now() => ChronosConfig().fakeNow ?? DateTime.now().toChronos();

  /// Returns today's date at 00:00:00.000.
  ///
  /// Example:
  /// ```dart
  /// final today = Chronos.today();
  /// print(today.hour); // 0
  /// print(today.minute); // 0
  /// print(today.second); // 0
  /// ```
  static Chronos today() => Chronos.now().setTime();

  /// Returns tomorrow's date at 00:00:00.000.
  ///
  /// Example:
  /// ```dart
  /// final tomorrow = Chronos.tomorrow();
  /// final today = Chronos.today();
  /// ```
  static Chronos tomorrow() => today().addDay();

  /// Returns yesterday's date at 00:00:00.000.
  ///
  /// Example:
  /// ```dart
  /// final yesterday = Chronos.yesterday();
  /// final today = Chronos.today();
  /// ```
  static Chronos yesterday() => today().subDay();

  /// Calculates the difference between this and another Chronos instance.
  ///
  /// Returns a [Duration] representing the time difference. Positive duration
  /// means this instance is after the other, negative means it's before.
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30);
  /// final date2 = Chronos(2024, 3, 15, 12, 30);
  /// final diff = date1.diff(date2);
  /// print(diff.inHours); // 2
  /// ```
  Duration diff(Chronos other) => difference(other);

  /// Returns the Unix timestamp in seconds.
  ///
  /// Example:
  /// ```dart
  /// final chronos = Chronos(2024, 3, 15, 14, 30, 45);
  /// final timestamp = chronos.timestamp;
  /// print(timestamp); // Unix timestamp in seconds
  /// ```
  int get timestamp => (millisecondsSinceEpoch / 1000).toInt();

  /// Returns the timezone name.
  ///
  /// Example:
  /// ```dart
  /// final chronos = Chronos.now();
  /// print(chronos.getTimeZone()); // e.g., "PST", "UTC", "JST"
  /// ```
  String getTimeZone() => timeZoneName;

  /// Returns the timezone offset from UTC.
  ///
  /// Example:
  /// ```dart
  /// final chronos = Chronos.now();
  /// final offset = chronos.getTimeZoneOffset();
  /// print(offset.inHours); // e.g., -8 for PST, 9 for JST
  /// ```
  Duration getTimeZoneOffset() => timeZoneOffset;

  /// Creates a copy of this Chronos instance.
  ///
  /// Returns a new Chronos instance with identical values. This is equivalent
  /// to calling [copyWith] with no parameters.
  ///
  /// Example:
  /// ```dart
  /// final original = Chronos(2024, 3, 15, 14, 30, 45);
  /// final copied = original.copy();
  /// print(copied == original); // true (same values)
  /// print(identical(copied, original)); // false (different instances)
  /// ```
  Chronos copy() => copyWith();

  /// Creates a clone of this Chronos instance.
  ///
  /// Alias for [copy]. Returns a new Chronos instance with identical values.
  ///
  /// Example:
  /// ```dart
  /// final original = Chronos(2024, 3, 15, 14, 30, 45);
  /// final cloned = original.clone();
  /// print(cloned.millisecondsSinceEpoch == original.millisecondsSinceEpoch); // true
  /// ```
  Chronos clone() => copy();

  /// ISO weekday number (Monday = 1, Sunday = 7)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023, 12, 25); // Monday
  /// print(date.isoDayOfWeek); // 1
  /// ```
  int get isoDayOfWeek => weekday;

  /// Weekday number with Sunday as 0 (Sunday = 0, Monday = 1, …, Saturday = 6)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023, 12, 25); // Monday
  /// print(date.dayOfWeek); // 1
  /// ```
  int get dayOfWeek => weekday % 7;

  /// ISO year of the date (can differ from calendar year for dates near year start/end)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2021, 1, 1);
  /// print(date.isoYear); // 2020
  /// ```
  int get isoYear => add(Duration(days: 4 - isoDayOfWeek)).year;

  /// Calendar week number starting from the first day of the year
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023, 1, 10);
  /// print(date.week); // 2
  /// ```
  int get week => ((diff(Chronos(year, 1, 1)).inDays) ~/ 7) + 1;

  /// ISO 8601 week number (weeks start on Monday)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023, 1, 5); // Thursday
  /// print(date.isoWeek); // 1
  /// ```
  int get isoWeek {
    final thursday = addDays(4 - isoDayOfWeek);
    final firstDayOfYear = Chronos(thursday.year, 1, 1);
    final firstThursday = firstDayOfYear.addDays(
      (4 - firstDayOfYear.weekday + 7) % 7,
    );

    return ((thursday.diff(firstThursday).inDays) ~/ 7) + 1;
  }

  /// Decade number (1-based, e.g., 2023 is 203rd decade)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023);
  /// print(date.decade); // 203
  /// ```
  int get decade => (year - 1) ~/ 10 + 1;

  /// Century number (1-based, e.g., 2023 is 21st century)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023);
  /// print(date.century); // 21
  /// ```
  int get century => (year - 1) ~/ 100 + 1;

  /// Millennium number (1-based, e.g., 2023 is 3rd millennium)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023);
  /// print(date.millennium); // 3
  /// ```
  int get millennium => (year - 1) ~/ 1000 + 1;

  /// Quarter of the year (1-4)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023, 12);
  /// print(date.quarter); // 4
  /// ```
  int get quarter => ((month - 1) ~/ 3) + 1;

  /// Converts this Chronos instance to local timezone.
  ///
  /// Returns a new Chronos instance representing the same moment in time
  /// but expressed in the local timezone. If this instance is already in
  /// local time, returns a copy of this instance.
  ///
  /// Example:
  /// ```dart
  /// final utcChronos = Chronos.utc(2024, 3, 15, 14, 30, 45);
  /// final localChronos = utcChronos.toLocal();
  /// print(localChronos.isUtc); // false
  /// print(localChronos.hour); // Adjusted for local timezone
  /// ```
  @override
  Chronos toLocal() => super.toLocal().toChronos();

  /// Converts this Chronos instance to UTC timezone.
  ///
  /// Returns a new Chronos instance representing the same moment in time
  /// but expressed in UTC. If this instance is already in UTC, returns
  /// a copy of this instance.
  ///
  /// Example:
  /// ```dart
  /// final localChronos = Chronos(2024, 3, 15, 14, 30, 45);
  /// final utcChronos = localChronos.toUtc();
  /// print(utcChronos.isUtc); // true
  /// print(utcChronos.hour); // Adjusted for UTC timezone
  /// ```
  @override
  Chronos toUtc() => super.toUtc().toChronos();

  /// Compares two Chronos instances for equality.
  ///
  /// Returns true if both instances represent the same moment in time,
  /// regardless of timezone representation.
  ///
  /// Example:
  /// ```dart
  /// final chronos1 = Chronos(2024, 3, 15, 14, 30, 45);
  /// final chronos2 = Chronos(2024, 3, 15, 14, 30, 45);
  /// final chronos3 = Chronos(2024, 3, 15, 14, 30, 46);
  /// print(chronos1 == chronos2); // true
  /// print(chronos1 == chronos3); // false
  /// ```
  @override
  bool operator ==(Object other) => other is Chronos && isAtSameMomentAs(other);

  /// Returns the hash code for this Chronos instance.
  ///
  /// The hash code is based on the milliseconds since epoch, ensuring that
  /// equal Chronos instances have the same hash code.
  ///
  /// Example:
  /// ```dart
  /// final chronos1 = Chronos(2024, 3, 15, 14, 30, 45);
  /// final chronos2 = Chronos(2024, 3, 15, 14, 30, 45);
  /// print(chronos1.hashCode == chronos2.hashCode); // true
  /// ```
  @override
  int get hashCode => millisecondsSinceEpoch.hashCode;

  /// Initializes i18n date formatting for the given locale.
  ///
  /// Call this once before using any i18n date format methods,
  /// otherwise `DateFormat` may throw `LocaleDataException`.
  ///
  /// Example:
  /// ```dart
  /// await Chronos.initI18n(locale: 'en_US');
  /// print(DateFormat.yMMMMd('en_US').format(DateTime.now()));
  /// ```
  static Future<void> initI18n([String locale = 'en_US']) async =>
      await initializeDateFormatting(locale);

  /// Creates a copy of this Chronos with optionally modified values.
  ///
  /// Returns a new Chronos instance with the same values as this instance,
  /// except for any values that are explicitly overridden by the parameters.
  ///
  /// Example:
  /// ```dart
  /// final original = Chronos(2024, 3, 15, 14, 30, 45);
  /// final modified = original.copyWith(year: 2025, hour: 16);
  /// print(modified); // 2025-03-15 16:30:45.000
  /// print(original); // 2024-03-15 14:30:45.000 (unchanged)
  /// ```
  Chronos copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
    bool? isUtc,
  }) {
    return ((isUtc ?? this.isUtc) ? Chronos.utc : Chronos.new)(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
