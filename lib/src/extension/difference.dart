import 'package:flutter_chronos/flutter_chronos.dart';

/// Extension providing difference calculation methods for Chronos instances.
///
/// This extension allows you to calculate differences between dates in various
/// time units and get position information within time periods.
extension ChronosDifference on Chronos {
  /// Calculates the difference in millennia between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 1, 1);
  /// final date2 = Chronos(1024, 1, 1);
  /// final diff = date1.diffInMillennium(date2); // 1.0
  /// ```
  double diffInMillennium(Chronos other) => diffInYears(other) / 1000;

  /// Calculates the difference in centuries between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 1, 1);
  /// final date2 = Chronos(1924, 1, 1);
  /// final diff = date1.diffInCentury(date2); // 1.0
  /// ```
  double diffInCentury(Chronos other) => diffInYears(other) / 100;

  /// Calculates the difference in decades between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 1, 1);
  /// final date2 = Chronos(2014, 1, 1);
  /// final diff = date1.diffInDecade(date2); // 1.0
  /// ```
  double diffInDecade(Chronos other) => diffInYears(other) / 10;

  /// Calculates the difference in years between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 6, 15);
  /// final date2 = Chronos(2022, 6, 15);
  /// final diff = date1.diffInYears(date2); // 2.0
  /// final partialDiff = date1.diffInYears(Chronos(2022, 3, 15)); // 2.25 (approximately)
  /// ```
  double diffInYears(Chronos other) {
    Chronos start = this;
    Chronos end = other;

    if (isUtc) {
      start = start.toUtc();
      end = end.toUtc();
    }

    bool ascending = start <= end;
    int sign = ascending ? 1 : -1;

    if (!ascending) {
      [start, end] = [end, start];
    }

    int yearsDiff = end.year - start.year;

    Chronos floorEnd = start.addYears(yearsDiff);

    if (floorEnd >= end) {
      return (sign * yearsDiff).toDouble();
    }

    Chronos ceilEnd = start.addYears(yearsDiff + 1);

    double daysToFloor = floorEnd.diffInDays(end);
    double daysToCeil = end.diffInDays(ceilEnd);

    return sign * (yearsDiff + daysToFloor / (daysToCeil + daysToFloor));
  }

  /// Calculates the difference in quarters between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 10, 1); // Q4
  /// final date2 = Chronos(2024, 4, 1);  // Q2
  /// final diff = date1.diffInQuarters(date2); // 2.0
  /// ```
  double diffInQuarters(Chronos other) => diffInMonths(other) / 3;

  /// Calculates the difference in months between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 6, 15);
  /// final date2 = Chronos(2024, 3, 15);
  /// final diff = date1.diffInMonths(date2); // 3.0
  /// final partialDiff = date1.diffInMonths(Chronos(2024, 3, 1)); // 3.5 (approximately)
  /// ```
  double diffInMonths(Chronos other) {
    Chronos start = this;
    Chronos end = other;

    bool ascending = start <= end;
    int sign = ascending ? 1 : -1;

    if (!ascending) {
      [start, end] = [end, start];
    }

    int monthsDiff = (end.year - start.year) * 12 + (end.month - start.month);

    if (monthsDiff > 0 && start.day > end.day) {
      monthsDiff -= 1;
    } else if (monthsDiff < 0 && start.day < end.day) {
      monthsDiff += 1;
    }

    monthsDiff = monthsDiff.abs();

    Chronos floorEnd = start.addMonths(monthsDiff);

    if (floorEnd >= end) {
      return sign * monthsDiff.toDouble();
    }

    Chronos ceilEnd = start.addMonths(monthsDiff + 1);

    double daysToFloor = end.difference(floorEnd).inMicroseconds / Duration.microsecondsPerDay;
    double daysToCeil = ceilEnd.difference(end).inMicroseconds / Duration.microsecondsPerDay;

    return sign * (monthsDiff + daysToFloor / (daysToFloor + daysToCeil));
  }

  /// Calculates the difference in weeks between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 22);
  /// final date2 = Chronos(2024, 3, 8);
  /// final diff = date1.diffInWeeks(date2); // 2.0
  /// ```
  double diffInWeeks(Chronos other) => diffInDays(other) / 7;

  /// Calculates the difference in days between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15);
  /// final date2 = Chronos(2024, 3, 10);
  /// final diff = date1.diffInDays(date2); // 5.0
  /// ```
  double diffInDays(Chronos other) => other.diff(this).inMicroseconds / Duration.microsecondsPerDay;

  /// Calculates the difference in hours between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 18, 0, 0);
  /// final date2 = Chronos(2024, 3, 15, 12, 0, 0);
  /// final diff = date1.diffInHours(date2); // 6.0
  /// ```
  double diffInHours(Chronos other) => other.diff(this).inMicroseconds / Duration.microsecondsPerHour;

  /// Calculates the difference in minutes between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 45, 0);
  /// final date2 = Chronos(2024, 3, 15, 14, 30, 0);
  /// final diff = date1.diffInMinutes(date2); // 15.0
  /// ```
  double diffInMinutes(Chronos other) => other.diff(this).inMicroseconds / Duration.microsecondsPerMinute;

  /// Calculates the difference in seconds between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45);
  /// final date2 = Chronos(2024, 3, 15, 14, 30, 30);
  /// final diff = date1.diffInSeconds(date2); // 15.0
  /// ```
  double diffInSeconds(Chronos other) => other.diff(this).inMicroseconds / Duration.microsecondsPerSecond;

  /// Calculates the difference in milliseconds between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45, 500);
  /// final date2 = Chronos(2024, 3, 15, 14, 30, 45, 200);
  /// final diff = date1.diffInMilliseconds(date2); // 300.0
  /// ```
  double diffInMilliseconds(Chronos other) => other.diff(this).inMilliseconds / 1000;

  /// Calculates the difference in microseconds between this date and [other].
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45, 123, 500);
  /// final date2 = Chronos(2024, 3, 15, 14, 30, 45, 123, 200);
  /// final diff = date1.diffInMicroseconds(date2); // 300.0
  /// ```
  double diffInMicroseconds(Chronos other) => other.diff(this).inMicroseconds.toDouble();

  /// Calculates the difference between this date and [other] in the specified [timeUnit].
  ///
  /// This is a generic method that delegates to the appropriate specific difference method
  /// based on the provided time unit.
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 6, 15);
  /// final date2 = Chronos(2024, 3, 15);
  /// final monthsDiff = date1.diffInUnit(TimeUnit.month, date2); // 3.0
  /// final daysDiff = date1.diffInUnit(TimeUnit.day, date2); // 92.0 (approximately)
  /// ```
  double diffInUnit(TimeUnit timeUnit, Chronos other) {
    switch (timeUnit) {
      case TimeUnit.millennium:
        return diffInMillennium(other);
      case TimeUnit.century:
        return diffInCentury(other);
      case TimeUnit.decade:
        return diffInDecade(other);
      case TimeUnit.year:
        return diffInYears(other);
      case TimeUnit.quarter:
        return diffInQuarters(other);
      case TimeUnit.month:
        return diffInMonths(other);
      case TimeUnit.week:
        return diffInWeeks(other);
      case TimeUnit.day:
        return diffInDays(other);
      case TimeUnit.hour:
        return diffInHours(other);
      case TimeUnit.minute:
        return diffInMinutes(other);
      case TimeUnit.second:
        return diffInSeconds(other);
      case TimeUnit.millisecond:
        return diffInMilliseconds(other);
      case TimeUnit.microsecond:
        return diffInMicroseconds(other);
      default:
        throw UnsupportedError('Unsupported unit: $timeUnit');
    }
  }

  int _diffInDaysFiltered(Chronos other, bool Function(Chronos o) filterFunc) {
    Chronos start = this;
    Chronos end = other;

    if (start > end) {
      [start, end] = [end, start];
    }

    int count = 0;
    for (var d = start; d < end; d = d.addDay()) {
      if (filterFunc(d)) count++;
    }

    return this < other ? count : -count;
  }

  /// Calculates the number of weekdays (Monday to Friday) between this date and [other].
  ///
  /// Returns a positive number if [other] is after this date, negative if before.
  ///
  /// Example:
  /// ```dart
  /// final monday = Chronos(2024, 3, 11); // Monday
  /// final friday = Chronos(2024, 3, 15); // Friday
  /// final weekdays = friday.diffInWeekdays(monday); // 5 (Mon, Tue, Wed, Thu, Fri)
  /// ```
  int diffInWeekdays(Chronos other) => _diffInDaysFiltered(other, (o) => o.isWeekday);

  /// Calculates the number of weekend days (Saturday and Sunday) between this date and [other].
  ///
  /// Returns a positive number if [other] is after this date, negative if before.
  ///
  /// Example:
  /// ```dart
  /// final friday = Chronos(2024, 3, 15); // Friday
  /// final monday = Chronos(2024, 3, 18); // Monday (next week)
  /// final weekendDays = monday.diffInWeekend(friday); // 2 (Saturday and Sunday)
  /// ```
  int diffInWeekend(Chronos other) => _diffInDaysFiltered(other, (o) => o.isWeekend);

  /// Returns the microsecond position within the current century (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfCentury; // Microseconds since start of 21st century
  /// ```
  int get microsecondOfCentury => diff(startOfCentury()).inMicroseconds;

  /// Returns the microsecond position within the current day (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfDay; // Microseconds since start of day (00:00:00)
  /// ```
  int get microsecondOfDay => diff(startOfDay()).inMicroseconds;

  /// Returns the microsecond position within the current decade (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfDecade; // Microseconds since start of 2020s decade
  /// ```
  int get microsecondOfDecade => diff(startOfDecade()).inMicroseconds;

  /// Returns the microsecond position within the current hour (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfHour; // Microseconds since start of 14:00 hour
  /// ```
  int get microsecondOfHour => diff(startOfHour()).inMicroseconds;

  /// Returns the microsecond position within the current millennium (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfMillennium; // Microseconds since year 2000
  /// ```
  int get microsecondOfMillennium => diff(startOfMillennium()).inMicroseconds;

  /// Returns the microsecond component of the current millisecond.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfMillisecond; // 456
  /// ```
  int get microsecondOfMillisecond => microsecond;

  /// Returns the microsecond position within the current minute (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfMinute; // Microseconds since start of 14:30 minute
  /// ```
  int get microsecondOfMinute => diff(startOfMinute()).inMicroseconds;

  /// Returns the microsecond position within the current month (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfMonth; // Microseconds since start of June 2024
  /// ```
  int get microsecondOfMonth => diff(startOfMonth()).inMicroseconds;

  /// Returns the microsecond position within the current quarter (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfQuarter; // Microseconds since start of Q2 2024
  /// ```
  int get microsecondOfQuarter => diff(startOfQuarter()).inMicroseconds;

  /// Returns the microsecond position within the current second (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfSecond; // Microseconds since start of second 45
  /// ```
  int get microsecondOfSecond => diff(startOfSecond()).inMicroseconds;

  /// Returns the microsecond position within the current week (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456); // Saturday
  /// final position = date.microsecondOfWeek; // Microseconds since start of week (Monday)
  /// ```
  int get microsecondOfWeek => diff(startOfWeek()).inMicroseconds;

  /// Returns the microsecond position within the current year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfYear; // Microseconds since January 1, 2024
  /// ```
  int get microsecondOfYear => diff(startOfYear()).inMicroseconds;

  /// Returns the microsecond position within the current ISO year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123, 456);
  /// final position = date.microsecondOfIsoYear; // Microseconds since start of ISO year 2024
  /// ```
  int get microsecondOfIsoYear => diff(startOfIsoYear()).inMicroseconds;

  /// Returns the millisecond position within the current century (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfCentury; // Milliseconds since start of 21st century
  /// ```
  int get millisecondOfCentury => diff(startOfCentury()).inMilliseconds;

  /// Returns the millisecond position within the current day (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfDay; // Milliseconds since 00:00:00
  /// ```
  int get millisecondOfDay => diff(startOfDay()).inMilliseconds;

  /// Returns the millisecond position within the current decade (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfDecade; // Milliseconds since start of 2020s
  /// ```
  int get millisecondOfDecade => diff(startOfDecade()).inMilliseconds;

  /// Returns the millisecond position within the current hour (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfHour; // Milliseconds since 14:00:00
  /// ```
  int get millisecondOfHour => diff(startOfHour()).inMilliseconds;

  /// Returns the millisecond position within the current millennium (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfMillennium; // Milliseconds since year 2000
  /// ```
  int get millisecondOfMillennium => diff(startOfMillennium()).inMilliseconds;

  /// Returns the millisecond position within the current minute (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfMinute; // Milliseconds since 14:30:00
  /// ```
  int get millisecondOfMinute => diff(startOfMinute()).inMilliseconds;

  /// Returns the millisecond position within the current month (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfMonth; // Milliseconds since June 1, 2024
  /// ```
  int get millisecondOfMonth => diff(startOfMonth()).inMilliseconds;

  /// Returns the millisecond position within the current quarter (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfQuarter; // Milliseconds since start of Q2 2024
  /// ```
  int get millisecondOfQuarter => diff(startOfQuarter()).inMilliseconds;

  /// Returns the millisecond position within the current second (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfSecond; // 123
  /// ```
  int get millisecondOfSecond => diff(startOfSecond()).inMilliseconds;

  /// Returns the millisecond position within the current week (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123); // Saturday
  /// final position = date.millisecondOfWeek; // Milliseconds since Monday 00:00:00
  /// ```
  int get millisecondOfWeek => diff(startOfWeek()).inMilliseconds;

  /// Returns the millisecond position within the current year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOfYear; // Milliseconds since January 1, 2024
  /// ```
  int get millisecondOfYear => diff(startOfYear()).inMilliseconds;

  /// Returns the millisecond position within the current ISO year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45, 123);
  /// final position = date.millisecondOIsofYear; // Milliseconds since start of ISO year 2024
  /// ```
  int get millisecondOIsofYear => diff(startOfIsoYear()).inMilliseconds;

  /// Returns the second position within the current century (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfCentury; // Seconds since start of 21st century
  /// ```
  int get secondOfCentury => diff(startOfCentury()).inSeconds;

  /// Returns the second position within the current day (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfDay; // 52245 (14*3600 + 30*60 + 45)
  /// ```
  int get secondOfDay => diff(startOfDay()).inSeconds;

  /// Returns the second position within the current decade (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfDecade; // Seconds since start of 2020s
  /// ```
  int get secondOfDecade => diff(startOfDecade()).inSeconds;

  /// Returns the second position within the current hour (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfHour; // 1845 (30*60 + 45)
  /// ```
  int get secondOfHour => diff(startOfHour()).inSeconds;

  /// Returns the second position within the current millennium (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfMillennium; // Seconds since year 2000
  /// ```
  int get secondOfMillennium => diff(startOfMillennium()).inSeconds;

  /// Returns the second position within the current minute (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfMinute; // 45
  /// ```
  int get secondOfMinute => diff(startOfMinute()).inSeconds;

  /// Returns the second position within the current month (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfMonth; // Seconds since June 1, 2024 00:00:00
  /// ```
  int get secondOfMonth => diff(startOfMonth()).inSeconds;

  /// Returns the second position within the current quarter (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfQuarter; // Seconds since start of Q2 2024
  /// ```
  int get secondOfQuarter => diff(startOfQuarter()).inSeconds;

  /// Returns the second position within the current week (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45); // Saturday
  /// final position = date.secondOfWeek; // Seconds since Monday 00:00:00
  /// ```
  int get secondOfWeek => diff(startOfWeek()).inSeconds;

  /// Returns the second position within the current year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfYear; // Seconds since January 1, 2024 00:00:00
  /// ```
  int get secondOfYear => diff(startOfYear()).inSeconds;

  /// Returns the second position within the current ISO year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30, 45);
  /// final position = date.secondOfIsoYear; // Seconds since start of ISO year 2024
  /// ```
  int get secondOfIsoYear => diff(startOfIsoYear()).inSeconds;

  /// Returns the minute position within the current century (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30);
  /// final position = date.minuteOfCentury; // Minutes since start of 21st century
  /// ```
  int get minuteOfCentury => diff(startOfCentury()).inMinutes;

  /// Returns the minute position within the current day (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30);
  /// final position = date.minuteOfDay; // 870 (14*60 + 30)
  /// ```
  int get minuteOfDay => diff(startOfDay()).inMinutes;

  /// Returns the minute position within the current decade (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30);
  /// final position = date.minuteOfDecade; // Minutes since start of 2020s
  /// ```
  int get minuteOfDecade => diff(startOfDecade()).inMinutes;

  /// Returns the minute position within the current hour (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30);
  /// final position = date.minuteOfHour; // 30
  /// ```
  int get minuteOfHour => diff(startOfHour()).inMinutes;

  /// Returns the minute position within the current millennium (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30);
  /// final position = date.minuteOfMillennium; // Minutes since year 2000
  /// ```
  int get minuteOfMillennium => diff(startOfMillennium()).inMinutes;

  /// Returns the minute position within the current month (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30);
  /// final position = date.minuteOfMonth; // Minutes since June 1, 2024 00:00
  /// ```
  int get minuteOfMonth => diff(startOfMonth()).inMinutes;

  /// Returns the minute position within the current quarter (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30);
  /// final position = date.minuteOfQuarter; // Minutes since start of Q2 2024
  /// ```
  int get minuteOfQuarter => diff(startOfQuarter()).inMinutes;

  /// Returns the minute position within the current week (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30); // Saturday
  /// final position = date.minuteOfWeek; // Minutes since Monday 00:00
  /// ```
  int get minuteOfWeek => diff(startOfWeek()).inMinutes;

  /// Returns the minute position within the current year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30);
  /// final position = date.minuteOfYear; // Minutes since January 1, 2024 00:00
  /// ```
  int get minuteOfYear => diff(startOfYear()).inMinutes;

  /// Returns the minute position within the current ISO year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14, 30);
  /// final position = date.minuteOfIsoYear; // Minutes since start of ISO year 2024
  /// ```
  int get minuteOfIsoYear => diff(startOfIsoYear()).inMinutes;

  /// Returns the hour position within the current century (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14);
  /// final position = date.hourOfCentury; // Hours since start of 21st century
  /// ```
  int get hourOfCentury => diff(startOfCentury()).inHours;

  /// Returns the hour position within the current day (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14);
  /// final position = date.hourOfDay; // 14
  /// ```
  int get hourOfDay => diff(startOfDay()).inHours;

  /// Returns the hour position within the current decade (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14);
  /// final position = date.hourOfDecade; // Hours since start of 2020s
  /// ```
  int get hourOfDecade => diff(startOfDecade()).inHours;

  /// Returns the hour position within the current millennium (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14);
  /// final position = date.hourOfMillennium; // Hours since year 2000
  /// ```
  int get hourOfMillennium => diff(startOfMillennium()).inHours;

  /// Returns the hour position within the current month (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14);
  /// final position = date.hourOfMonth; // Hours since June 1, 2024 00:00
  /// ```
  int get hourOfMonth => diff(startOfMonth()).inHours;

  /// Returns the hour position within the current quarter (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14);
  /// final position = date.hourOfQuarter; // Hours since start of Q2 2024
  /// ```
  int get hourOfQuarter => diff(startOfQuarter()).inHours;

  /// Returns the hour position within the current week (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14); // Saturday 2 PM
  /// final position = date.hourOfWeek; // Hours since Monday 00:00
  /// ```
  int get hourOfWeek => diff(startOfWeek()).inHours;

  /// Returns the hour position within the current year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14);
  /// final position = date.hourOfYear; // Hours since January 1, 2024 00:00
  /// ```
  int get hourOfYear => diff(startOfYear()).inHours;

  /// Returns the hour position within the current ISO year (0-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15, 14);
  /// final position = date.hourOfIsoYear; // Hours since start of ISO year 2024
  /// ```
  int get hourOfIsoYear => diff(startOfIsoYear()).inHours;

  /// Returns the day position within the current century (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.dayOfCentury; // Day number since start of 21st century
  /// ```
  int get dayOfCentury => diff(startOfCentury()).inDays + 1;

  /// Returns the day position within the current decade (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.dayOfDecade; // Day number since start of 2020s
  /// ```
  int get dayOfDecade => diff(startOfDecade()).inDays + 1;

  /// Returns the day position within the current millennium (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.dayOfMillennium; // Day number since year 2000
  /// ```
  int get dayOfMillennium => diff(startOfMillennium()).inDays + 1;

  /// Returns the day position within the current year (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.dayOfYear; // 167 (June 15th is the 167th day of 2024)
  /// ```
  int get dayOfYear => diff(startOfYear()).inDays + 1;

  /// Returns the day position within the current ISO year (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.dayOfIsoYear; // Day number within ISO year 2024
  /// ```
  int get dayOfIsoYear => diff(startOfIsoYear()).inDays + 1;

  /// Returns the day position within the current quarter (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.dayOfQuarter; // 76 (June 15th is the 76th day of Q2)
  /// ```
  int get dayOfQuarter => diff(startOfQuarter()).inDays + 1;

  /// Returns the day position within the current month (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.dayOfMonth; // 15
  /// ```
  int get dayOfMonth => diff(startOfMonth()).inDays + 1;

  /// Returns the week position within the current century (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.weekOfCentury; // Week number since start of 21st century
  /// ```
  int get weekOfCentury => startOfCentury().diffInWeeks(this).floor() + 1;

  /// Returns the week position within the current decade (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.weekOfDecade; // Week number since start of 2020s
  /// ```
  int get weekOfDecade => startOfDecade().diffInWeeks(this).floor() + 1;

  /// Returns the week position within the current millennium (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.weekOfMillennium; // Week number since year 2000
  /// ```
  int get weekOfMillennium => startOfMillennium().diffInWeeks(this).floor() + 1;

  /// Returns the week position within the current month (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.weekOfMonth; // Week number within June 2024
  /// ```
  int get weekOfMonth => startOfMonth().diffInWeeks(this).floor() + 1;

  /// Returns the week position within the current quarter (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.weekOfQuarter; // Week number within Q2 2024
  /// ```
  int get weekOfQuarter => startOfQuarter().diffInWeeks(this).floor() + 1;

  /// Returns the week position within the current year (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.weekOfYear; // 24 (approximately week 24 of 2024)
  /// ```
  int get weekOfYear => week;

  /// Returns the week position within the current ISO year (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.weekOfIsoYear; // Week number within ISO year 2024
  /// ```
  int get weekOfIsoYear => startOfIsoYear().diffInWeeks(this).floor() + 1;

  /// Returns the month position within the current century (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.monthOfCentury; // Month number since start of 21st century
  /// ```
  int get monthOfCentury => startOfCentury().diffInMonths(this).floor() + 1;

  /// Returns the month position within the current decade (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.monthOfDecade; // Month number since start of 2020s
  /// ```
  int get monthOfDecade => startOfDecade().diffInMonths(this).floor() + 1;

  /// Returns the month position within the current millennium (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.monthOfMillennium; // Month number since year 2000
  /// ```
  int get monthOfMillennium => startOfMillennium().diffInMonths(this).floor() + 1;

  /// Returns the month position within the current quarter (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.monthOfQuarter; // 3 (June is the 3rd month of Q2)
  /// ```
  int get monthOfQuarter => startOfQuarter().diffInMonths(this).floor() + 1;

  /// Returns the month position within the current year (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.monthOfYear; // 6 (June)
  /// ```
  int get monthOfYear => month;

  /// Returns the month position within the current ISO year (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.monthOfIsoYear; // Month number within ISO year 2024
  /// ```
  int get monthOfIsoYear => startOfIsoYear().diffInMonths(this).floor() + 1;

  /// Returns the quarter position within the current century (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.quarterOfCentury; // Quarter number since start of 21st century
  /// ```
  int get quarterOfCentury => startOfCentury().diffInQuarters(this).floor() + 1;

  /// Returns the quarter position within the current decade (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.quarterOfDecade; // Quarter number since start of 2020s
  /// ```
  int get quarterOfDecade => startOfDecade().diffInQuarters(this).floor() + 1;

  /// Returns the quarter position within the current millennium (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.quarterOfMillennium; // Quarter number since year 2000
  /// ```
  int get quarterOfMillennium => startOfMillennium().diffInQuarters(this).floor() + 1;

  /// Returns the quarter position within the current year (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.quarterOfYear; // 2 (Q2)
  /// ```
  int get quarterOfYear => quarter;

  /// Returns the quarter position within the current ISO year (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.quarterOfIsoYear; // Quarter number within ISO year 2024
  /// ```
  int get quarterOfIsoYear => startOfIsoYear().diffInQuarters(this).floor() + 1;

  /// Returns the year position within the current century (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.yearOfCentury; // 24 (2024 is the 24th year of 21st century)
  /// ```
  int get yearOfCentury => startOfCentury().diffInYears(this).floor() + 1;

  /// Returns the year position within the current decade (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.yearOfDecade; // 4 (2024 is the 4th year of 2020s)
  /// ```
  int get yearOfDecade => startOfDecade().diffInYears(this).floor() + 1;

  /// Returns the year position within the current millennium (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.yearOfMillennium; // 24 (2024 is the 24th year of 3rd millennium)
  /// ```
  int get yearOfMillennium => startOfMillennium().diffInYears(this).floor() + 1;

  /// Returns the decade position within the current century (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.decadeOfCentury; // 3 (2020s is the 3rd decade of 21st century)
  /// ```
  int get decadeOfCentury => startOfCentury().diffInDecade(this).floor() + 1;

  /// Returns the decade position within the current millennium (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.decadeOfMillennium; // 3 (2020s is the 3rd decade of 3rd millennium)
  /// ```
  int get decadeOfMillennium => startOfMillennium().diffInDecade(this).floor() + 1;

  /// Returns the century position within the current millennium (1-based).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final position = date.centuryOfMillennium; // 1 (21st century is the 1st century of 3rd millennium)
  /// ```
  int get centuryOfMillennium => startOfMillennium().diffInCentury(this).floor() + 1;

  /// Returns the number of centuries in a millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.centuriesInMillennium; // 10
  /// ```
  int get centuriesInMillennium => 10;

  /// Returns the number of days in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.daysInCentury; // ~36525 (accounting for leap years)
  /// ```
  int get daysInCentury => startOfCentury().diffInDays(startOfCentury().addCentury()).round();

  /// Returns the number of days in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.daysInDecade; // ~3653 (accounting for leap years in 2020s)
  /// ```
  int get daysInDecade => startOfDecade().diffInDays(startOfDecade().addDecade()).round();

  /// Returns the number of days in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.daysInMillennium; // ~365243 (accounting for leap years)
  /// ```
  int get daysInMillennium => startOfMillennium().diffInDays(startOfMillennium().addMillennium()).round();

  /// Returns the number of days in the current month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.daysInMonth; // 30 (June has 30 days)
  /// final feb = Chronos(2024, 2, 15);
  /// final febCount = feb.daysInMonth; // 29 (2024 is a leap year)
  /// ```
  int get daysInMonth => Chronos(year, month + 1, 0).day;

  /// Returns the number of days in the current quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15); // Q2
  /// final count = date.daysInQuarter; // 91 (Apr: 30 + May: 31 + Jun: 30)
  /// ```
  int get daysInQuarter => startOfQuarter().diffInDays(startOfQuarter().addQuarter()).round();

  /// Returns the number of days in a week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.daysInWeek; // 7
  /// ```
  int get daysInWeek => 7;

  /// Returns the number of days in the current year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.daysInYear; // 366 (2024 is a leap year)
  /// final nonLeap = Chronos(2023, 6, 15);
  /// final nonLeapCount = nonLeap.daysInYear; // 365
  /// ```
  int get daysInYear => isLeapYear ? 366 : 365;

  /// Returns the number of decades in a century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.decadesInCentury; // 10
  /// ```
  int get decadesInCentury => 10;

  /// Returns the number of decades in a millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.decadesInMillennium; // 100
  /// ```
  int get decadesInMillennium => 100;

  /// Returns the number of hours in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.hoursInCentury; // ~876600 (accounting for leap years)
  /// ```
  int get hoursInCentury => startOfCentury().diffInHours(startOfCentury().addCentury()).round();

  /// Returns the number of hours in a day.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.hoursInDay; // 24
  /// ```
  int get hoursInDay => 24;

  /// Returns the number of hours in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.hoursInDecade; // ~87672 (accounting for leap years in 2020s)
  /// ```
  int get hoursInDecade => startOfDecade().diffInHours(startOfDecade().addDecade()).round();

  /// Returns the number of hours in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.hoursInMillennium; // ~8765832 (accounting for leap years)
  /// ```
  int get hoursInMillennium => startOfMillennium().diffInHours(startOfMillennium().addMillennium()).round();

  /// Returns the number of hours in the current month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.hoursInMonth; // 720 (June: 30 days * 24 hours)
  /// ```
  int get hoursInMonth => startOfMonth().diffInHours(startOfMonth().addMonth()).round();

  /// Returns the number of hours in the current quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15); // Q2
  /// final count = date.hoursInQuarter; // 2184 (91 days * 24 hours)
  /// ```
  int get hoursInQuarter => startOfQuarter().diffInHours(startOfQuarter().addQuarter()).round();

  /// Returns the number of hours in a week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.hoursInWeek; // 168 (7 days * 24 hours)
  /// ```
  int get hoursInWeek => 7 * 24;

  /// Returns the number of hours in the current year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.hoursInYear; // 8784 (366 days * 24 hours, leap year)
  /// ```
  int get hoursInYear => startOfYear().diffInHours(startOfYear().addYear()).round();

  /// Returns the number of microseconds in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInCentury; // ~3155760000000000000 (very large number)
  /// ```
  int get microsecondsInCentury => startOfCentury().diffInMicroseconds(startOfCentury().addCentury()).round();

  /// Returns the number of microseconds in a day.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInDay; // 86400000000 (24 * 60 * 60 * 1000000)
  /// ```
  int get microsecondsInDay => 24 * 60 * 60 * 1000000;

  /// Returns the number of microseconds in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInDecade; // ~315619200000000000 (very large number)
  /// ```
  int get microsecondsInDecade => startOfDecade().diffInMicroseconds(startOfDecade().addDecade()).round();

  /// Returns the number of microseconds in an hour.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInHour; // 3600000000 (60 * 60 * 1000000)
  /// ```
  int get microsecondsInHour => 60 * 60 * 1000000;

  /// Returns the number of microseconds in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInMillennium; // Extremely large number
  /// ```
  int get microsecondsInMillennium => startOfMillennium().diffInMicroseconds(startOfMillennium().addMillennium()).round();

  /// Returns the number of microseconds in a millisecond.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInMillisecond; // 1000
  /// ```
  int get microsecondsInMillisecond => 1000;

  /// Returns the number of microseconds in a minute.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInMinute; // 60000000 (60 * 1000000)
  /// ```
  int get microsecondsInMinute => 60 * 1000000;

  /// Returns the number of microseconds in the current month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInMonth; // ~2592000000000000 (June: 30 days)
  /// ```
  int get microsecondsInMonth => startOfMonth().diffInMicroseconds(startOfMonth().addMonth()).round();

  /// Returns the number of microseconds in the current quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15); // Q2
  /// final count = date.microsecondsInQuarter; // ~7862400000000000 (91 days)
  /// ```
  int get microsecondsInQuarter => startOfQuarter().diffInMicroseconds(startOfQuarter().addQuarter()).round();

  /// Returns the number of microseconds in a second.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInSecond; // 1000000
  /// ```
  int get microsecondsInSecond => 1000000;

  /// Returns the number of microseconds in a week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInWeek; // 604800000000 (7 * 24 * 60 * 60 * 1000000)
  /// ```
  int get microsecondsInWeek => 7 * 24 * 60 * 60 * 1000000;

  /// Returns the number of microseconds in the current year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.microsecondsInYear; // ~31622400000000000 (366 days, leap year)
  /// ```
  int get microsecondsInYear => startOfYear().diffInMicroseconds(startOfYear().addYear()).round();

  /// Returns the number of milliseconds in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInCentury; // ~3155760000000000 (very large number)
  /// ```
  int get millisecondsInCentury => startOfCentury().diffInMilliseconds(startOfCentury().addCentury()).round();

  /// Returns the number of milliseconds in a day.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInDay; // 86400000 (24 * 60 * 60 * 1000)
  /// ```
  int get millisecondsInDay => 24 * 60 * 60 * 1000;

  /// Returns the number of milliseconds in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInDecade; // ~315619200000000 (very large number)
  /// ```
  int get millisecondsInDecade => startOfDecade().diffInMilliseconds(startOfDecade().addDecade()).round();

  /// Returns the number of milliseconds in an hour.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInHour; // 3600000 (60 * 60 * 1000)
  /// ```
  int get millisecondsInHour => 60 * 60 * 1000;

  /// Returns the number of milliseconds in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInMillennium; // Extremely large number
  /// ```
  int get millisecondsInMillennium => startOfMillennium().diffInMilliseconds(startOfMillennium().addMillennium()).round();

  /// Returns the number of milliseconds in a minute.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInMinute; // 60000 (60 * 1000)
  /// ```
  int get millisecondsInMinute => 60 * 1000;

  /// Returns the number of milliseconds in the current month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInMonth; // 2592000000 (June: 30 days * 24 * 60 * 60 * 1000)
  /// ```
  int get millisecondsInMonth => startOfMonth().diffInMilliseconds(startOfMonth().addMonth()).round();

  /// Returns the number of milliseconds in the current quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15); // Q2
  /// final count = date.millisecondsInQuarter; // 7862400000 (91 days * 24 * 60 * 60 * 1000)
  /// ```
  int get millisecondsInQuarter => startOfQuarter().diffInMilliseconds(startOfQuarter().addQuarter()).round();

  /// Returns the number of milliseconds in a second.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInSecond; // 1000
  /// ```
  int get millisecondsInSecond => 1000;

  /// Returns the number of milliseconds in a week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInWeek; // 604800000 (7 * 24 * 60 * 60 * 1000)
  /// ```
  int get millisecondsInWeek => 7 * 24 * 60 * 60 * 1000;

  /// Returns the number of milliseconds in the current year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.millisecondsInYear; // 31622400000 (366 days * 24 * 60 * 60 * 1000, leap year)
  /// ```
  int get millisecondsInYear => startOfYear().diffInMilliseconds(startOfYear().addYear()).round();

  /// Returns the number of minutes in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.minutesInCentury; // ~52596000 (accounting for leap years)
  /// ```
  int get minutesInCentury => startOfCentury().diffInMinutes(startOfCentury().addCentury()).round();

  /// Returns the number of minutes in a day.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.minutesInDay; // 1440 (24 * 60)
  /// ```
  int get minutesInDay => 24 * 60;

  /// Returns the number of minutes in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.minutesInDecade; // ~5260320 (accounting for leap years in 2020s)
  /// ```
  int get minutesInDecade => startOfDecade().diffInMinutes(startOfDecade().addDecade()).round();

  /// Returns the number of minutes in an hour.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.minutesInHour; // 60
  /// ```
  int get minutesInHour => 60;

  /// Returns the number of minutes in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.minutesInMillennium; // ~525969000 (accounting for leap years)
  /// ```
  int get minutesInMillennium => startOfMillennium().diffInMinutes(startOfMillennium().addMillennium()).round();

  /// Returns the number of minutes in the current month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.minutesInMonth; // 43200 (June: 30 days * 24 * 60)
  /// ```
  int get minutesInMonth => startOfMonth().diffInMinutes(startOfMonth().addMonth()).round();

  /// Returns the number of minutes in the current quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15); // Q2
  /// final count = date.minutesInQuarter; // 131040 (91 days * 24 * 60)
  /// ```
  int get minutesInQuarter => startOfQuarter().diffInMinutes(startOfQuarter().addQuarter()).round();

  /// Returns the number of minutes in a week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.minutesInWeek; // 10080 (7 * 24 * 60)
  /// ```
  int get minutesInWeek => 7 * 24 * 60;

  /// Returns the number of minutes in the current year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.minutesInYear; // 527040 (366 days * 24 * 60, leap year)
  /// ```
  int get minutesInYear => startOfYear().diffInMinutes(startOfYear().addYear()).round();

  /// Returns the number of months in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.monthsInCentury; // 1200 (100 years * 12 months)
  /// ```
  int get monthsInCentury => startOfCentury().diffInMonths(startOfCentury().addCentury()).round();

  /// Returns the number of months in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.monthsInDecade; // 120 (10 years * 12 months)
  /// ```
  int get monthsInDecade => startOfDecade().diffInMonths(startOfDecade().addDecade()).round();

  /// Returns the number of months in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.monthsInMillennium; // 12000 (1000 years * 12 months)
  /// ```
  int get monthsInMillennium => startOfMillennium().diffInMonths(startOfMillennium().addMillennium()).round();

  /// Returns the number of months in the current quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.monthsInQuarter; // 3
  /// ```
  int get monthsInQuarter => startOfQuarter().diffInMonths(startOfQuarter().addQuarter()).round();

  /// Returns the number of months in a year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.monthsInYear; // 12
  /// ```
  int get monthsInYear => 12;

  /// Returns the number of quarters in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.quartersInCentury; // 400 (100 years * 4 quarters)
  /// ```
  int get quartersInCentury => startOfCentury().diffInQuarters(startOfCentury().addCentury()).round();

  /// Returns the number of quarters in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.quartersInDecade; // 40 (10 years * 4 quarters)
  /// ```
  int get quartersInDecade => startOfDecade().diffInQuarters(startOfDecade().addDecade()).round();

  /// Returns the number of quarters in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.quartersInMillennium; // 4000 (1000 years * 4 quarters)
  /// ```
  int get quartersInMillennium => startOfMillennium().diffInQuarters(startOfMillennium().addMillennium()).round();

  /// Returns the number of quarters in a year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.quartersInYear; // 4
  /// ```
  int get quartersInYear => 4;

  /// Returns the number of seconds in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.secondsInCentury; // ~3155760000 (accounting for leap years)
  /// ```
  int get secondsInCentury => startOfCentury().diffInSeconds(startOfCentury().addCentury()).round();

  /// Returns the number of seconds in a day.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.secondsInDay; // 86400 (24 * 60 * 60)
  /// ```
  int get secondsInDay => 24 * 60 * 60;

  /// Returns the number of seconds in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.secondsInDecade; // ~315619200 (accounting for leap years in 2020s)
  /// ```
  int get secondsInDecade => startOfDecade().diffInSeconds(startOfDecade().addDecade()).round();

  /// Returns the number of seconds in an hour.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.secondsInHour; // 3600 (60 * 60)
  /// ```
  int get secondsInHour => 60 * 60;

  /// Returns the number of seconds in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.secondsInMillennium; // ~31558149504 (accounting for leap years)
  /// ```
  int get secondsInMillennium => startOfMillennium().diffInSeconds(startOfMillennium().addMillennium()).round();

  /// Returns the number of seconds in a minute.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.secondsInMinute; // 60
  /// ```
  int get secondsInMinute => 60;

  /// Returns the number of seconds in the current month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.secondsInMonth; // 2592000 (June: 30 days * 24 * 60 * 60)
  /// ```
  int get secondsInMonth => startOfMonth().diffInSeconds(startOfMonth().addMonth()).round();

  /// Returns the number of seconds in the current quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15); // Q2
  /// final count = date.secondsInQuarter; // 7862400 (91 days * 24 * 60 * 60)
  /// ```
  int get secondsInQuarter => startOfQuarter().diffInSeconds(startOfQuarter().addQuarter()).round();

  /// Returns the number of seconds in a week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.secondsInWeek; // 604800 (7 * 24 * 60 * 60)
  /// ```
  int get secondsInWeek => 7 * 24 * 60 * 60;

  /// Returns the number of seconds in the current year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.secondsInYear; // 31622400 (366 days * 24 * 60 * 60, leap year)
  /// ```
  int get secondsInYear => startOfYear().diffInSeconds(startOfYear().addYear()).round();

  /// Returns the number of weeks in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.weeksInCentury; // ~5217 (accounting for leap years)
  /// ```
  int get weeksInCentury => startOfCentury().diffInWeeks(startOfCentury().addCentury()).round();

  /// Returns the number of weeks in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.weeksInDecade; // ~522 (accounting for leap years in 2020s)
  /// ```
  int get weeksInDecade => startOfDecade().diffInWeeks(startOfDecade().addDecade()).round();

  /// Returns the number of weeks in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.weeksInMillennium; // ~52178 (accounting for leap years)
  /// ```
  int get weeksInMillennium => startOfMillennium().diffInWeeks(startOfMillennium().addMillennium()).round();

  /// Returns the number of weeks in the current month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.weeksInMonth; // ~4 (June spans about 4-5 weeks)
  /// ```
  int get weeksInMonth => startOfMonth().diffInWeeks(startOfMonth().addMonth()).round();

  /// Returns the number of weeks in the current quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15); // Q2
  /// final count = date.weeksInQuarter; // 13 (91 days / 7 days per week)
  /// ```
  int get weeksInQuarter => startOfQuarter().diffInWeeks(startOfQuarter().addQuarter()).round();

  /// Returns the number of weeks in the current year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.weeksInYear; // ~52 (366 days / 7 days per week, leap year)
  /// ```
  int get weeksInYear => startOfYear().diffInWeeks(startOfYear().addYear()).round();

  /// Returns the number of years in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.yearsInCentury; // 100
  /// ```
  int get yearsInCentury => startOfCentury().diffInYears(startOfCentury().addCentury()).round();

  /// Returns the number of years in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.yearsInDecade; // 10
  /// ```
  int get yearsInDecade => startOfDecade().diffInYears(startOfDecade().addDecade()).round();

  /// Returns the number of years in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final count = date.yearsInMillennium; // 1000
  /// ```
  int get yearsInMillennium => startOfMillennium().diffInYears(startOfMillennium().addMillennium()).round();
}
