import 'package:flutter_chronos/src/extension/type_casting.dart';
import 'package:flutter_chronos/src/extension/modifiers.dart';
import 'package:flutter_chronos/src/chronos_config.dart';

class Chronos extends DateTime {
  Chronos(super.year, [super.month, super.day, super.hour, super.minute, super.second, super.millisecond, super.microsecond]);

  Chronos.utc(super.year, [super.month, super.day, super.hour, super.minute, super.second, super.millisecond, super.microsecond]) : super.utc();

  Chronos.fromMillisecondsSinceEpoch(super.millisecondsSinceEpoch, {super.isUtc}) : super.fromMillisecondsSinceEpoch();

  Chronos.fromMicrosecondsSinceEpoch(super.microsecondsSinceEpoch, {super.isUtc}) : super.fromMicrosecondsSinceEpoch();

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
  static Chronos parse(String formattedString) => DateTime.parse(formattedString).toChronos();

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
  static Chronos? tryParse(String formattedString) => DateTime.tryParse(formattedString)?.toChronos();

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
  static Chronos fromTimestamp(int timestamp) => DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toChronos();

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
    final firstThursday = firstDayOfYear.addDays((4 - firstDayOfYear.weekday + 7) % 7);

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

  Chronos copyWith({int? year, int? month, int? day, int? hour, int? minute, int? second, int? millisecond, int? microsecond, bool? isUtc}) {
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
