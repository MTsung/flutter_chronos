import 'package:flutter_chronos/src/extension/type_casting.dart';
import 'package:flutter_chronos/src/extension/modifiers.dart';
import 'package:flutter_chronos/src/chronos_config.dart';

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

  static Chronos now() => ChronosConfig().fakeNow ?? DateTime.now().toChronos();

  static Chronos today() => Chronos.now().setTime();

  static Chronos tomorrow() => today().addDay();

  static Chronos yesterday() => today().subDay();

  Duration diff(Chronos other) => difference(other);

  int get timestamp => (millisecondsSinceEpoch / 1000).toInt();

  String getTimeZone() => timeZoneName;

  Duration getTimeZonOffset() => timeZoneOffset;

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

  int get isoDayOfWeek => weekday;

  int get dayOfWeek => weekday % 7;

  int get isoYear => add(Duration(days: 4 - isoDayOfWeek)).year;

  int get week => ((diff(Chronos(year, 1, 1)).inDays) ~/ 7) + 1;

  int get isoWeek {
    final thursday = addDays(4 - isoDayOfWeek);
    final firstDayOfYear = Chronos(thursday.year, 1, 1);
    final firstThursday = firstDayOfYear.addDays(
      (4 - firstDayOfYear.weekday + 7) % 7,
    );

    return ((thursday.diff(firstThursday).inDays) ~/ 7) + 1;
  }

  int get decade => (year - 1) ~/ 10 + 1;

  int get century => (year - 1) ~/ 100 + 1;

  int get millennium => (year - 1) ~/ 1000 + 1;

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

  @override
  bool operator ==(Object other) => other is Chronos && isAtSameMomentAs(other);

  @override
  int get hashCode => millisecondsSinceEpoch.hashCode;

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
