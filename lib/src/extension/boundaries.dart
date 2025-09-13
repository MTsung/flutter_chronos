import 'package:flutter_chronos/flutter_chronos.dart';

/// Extension providing boundary methods for Chronos instances.
///
/// This extension allows you to get the start and end of various time units
/// like day, week, month, year, etc.
extension ChronosBoundaries on Chronos {
  /// Returns the start of the day (00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final startOfDay = date.startOfDay(); // 2024-03-15 00:00:00.000
  /// ```
  Chronos startOfDay() => Chronos(year, month, day);

  /// Returns the start of the week (Sunday at 00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Friday
  /// final startOfWeek = date.startOfWeek(); // 2024-03-10 00:00:00.000 (Sunday)
  /// ```
  Chronos startOfWeek() {
    final daysFromSunday = weekday == 7 ? 0 : weekday;
    return subtract(Duration(days: daysFromSunday)).toChronos().startOfDay();
  }

  /// Returns the start of the ISO week (Monday at 00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Friday
  /// final startOfIsoWeek = date.startOfIsoWeek(); // 2024-03-11 00:00:00.000 (Monday)
  /// ```
  Chronos startOfIsoWeek() {
    final daysFromMonday = weekday - 1;
    return subtract(Duration(days: daysFromMonday)).toChronos().startOfDay();
  }

  /// Returns the start of the month (1st day at 00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final startOfMonth = date.startOfMonth(); // 2024-03-01 00:00:00.000
  /// ```
  Chronos startOfMonth() => Chronos(year, month, 1);

  /// Returns the start of the quarter (1st day of quarter at 00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15); // August (Q3)
  /// final startOfQuarter = date.startOfQuarter(); // 2024-07-01 00:00:00.000 (July 1st)
  /// ```
  Chronos startOfQuarter() {
    final quarterStartMonth = ((month - 1) ~/ 3) * 3 + 1;
    return Chronos(year, quarterStartMonth, 1);
  }

  /// Returns the start of the year (January 1st at 00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final startOfYear = date.startOfYear(); // 2024-01-01 00:00:00.000
  /// ```
  Chronos startOfYear() => Chronos(year, 1, 1);

  /// Returns the start of the ISO year (first Monday of the ISO year).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final startOfIsoYear = date.startOfIsoYear(); // Start of ISO year 2024
  /// ```
  Chronos startOfIsoYear() => Chronos(isoYear, 1, 4).startOfIsoWeek();

  /// Returns the start of the decade (first year of decade at 00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final startOfDecade = date.startOfDecade(); // 2020-01-01 00:00:00.000
  /// ```
  Chronos startOfDecade() {
    final decadeStartYear = (year ~/ 10) * 10;
    return Chronos(decadeStartYear, 1, 1);
  }

  /// Returns the start of the century (first year of century at 00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final startOfCentury = date.startOfCentury(); // 2001-01-01 00:00:00.000
  /// ```
  Chronos startOfCentury() {
    final centuryStartYear = ((year - 1) ~/ 100) * 100 + 1;
    return Chronos(centuryStartYear, 1, 1);
  }

  /// Returns the start of the millennium (first year of millennium at 00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final startOfMillennium = date.startOfMillennium(); // 2001-01-01 00:00:00.000
  /// ```
  Chronos startOfMillennium() {
    final millenniumStartYear = ((year - 1) ~/ 1000) * 1000 + 1;
    return Chronos(millenniumStartYear, 1, 1);
  }

  /// Returns the start of the hour (00 minutes, 00 seconds, 000 milliseconds).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final startOfHour = date.startOfHour(); // 2024-03-15 14:00:00.000
  /// ```
  Chronos startOfHour() => Chronos(year, month, day, hour);

  /// Returns the start of the minute (00 seconds, 000 milliseconds).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final startOfMinute = date.startOfMinute(); // 2024-03-15 14:30:00.000
  /// ```
  Chronos startOfMinute() => Chronos(year, month, day, hour, minute);

  /// Returns the start of the second (000 milliseconds, 000 microseconds).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final startOfSecond = date.startOfSecond(); // 2024-03-15 14:30:45.000000
  /// ```
  Chronos startOfSecond() => Chronos(year, month, day, hour, minute, second);

  /// Returns the start of the millisecond (000 microseconds).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final startOfMillisecond = date.startOfMillisecond(); // 2024-03-15 14:30:45.123000
  /// ```
  Chronos startOfMillisecond() =>
      Chronos(year, month, day, hour, minute, second, millisecond);

  /// Returns the start of the season (first day of season at 00:00:00.000).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15); // August (Summer)
  /// final startOfSeason = date.startOfSeason(); // 2024-06-01 00:00:00.000 (June 1st)
  /// ```
  Chronos startOfSeason() {
    int seasonStartMonth;
    if (month >= Month.march.value && month <= Month.may.value) {
      seasonStartMonth = Month.march.value;
    } else if (month >= Month.june.value && month <= Month.august.value) {
      seasonStartMonth = Month.june.value;
    } else if (month >= Month.september.value &&
        month <= Month.november.value) {
      seasonStartMonth = Month.september.value;
    } else {
      seasonStartMonth = Month.december.value;
      if (month <= Month.february.value) {
        return Chronos(year - 1, Month.december.value, 1);
      }
    }
    return Chronos(year, seasonStartMonth, 1);
  }

  /// Returns the start of the specified time unit.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final startOfDay = date.startOfUnit(TimeUnit.day); // 2024-03-15 00:00:00.000
  /// final startOfMonth = date.startOfUnit(TimeUnit.month); // 2024-03-01 00:00:00.000
  /// ```
  Chronos startOfUnit(TimeUnit timeUnit) {
    switch (timeUnit) {
      case TimeUnit.millisecond:
        return startOfMillisecond();
      case TimeUnit.second:
        return startOfSecond();
      case TimeUnit.minute:
        return startOfMinute();
      case TimeUnit.hour:
        return startOfHour();
      case TimeUnit.day:
        return startOfDay();
      case TimeUnit.week:
        return startOfWeek();
      case TimeUnit.isoWeek:
        return startOfIsoWeek();
      case TimeUnit.month:
        return startOfMonth();
      case TimeUnit.quarter:
        return startOfQuarter();
      case TimeUnit.year:
        return startOfYear();
      case TimeUnit.isoYear:
        return startOfIsoYear();
      case TimeUnit.decade:
        return startOfDecade();
      case TimeUnit.century:
        return startOfCentury();
      case TimeUnit.millennium:
        return startOfMillennium();
      default:
        throw UnsupportedError('Unsupported unit: $timeUnit');
    }
  }

  /// Returns the end of the day (23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final endOfDay = date.endOfDay(); // 2024-03-15 23:59:59.999999
  /// ```
  Chronos endOfDay() => Chronos(year, month, day, 23, 59, 59, 999, 999);

  /// Returns the end of the week (Saturday at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Friday
  /// final endOfWeek = date.endOfWeek(); // 2024-03-16 23:59:59.999999 (Saturday)
  /// ```
  Chronos endOfWeek() {
    final daysToSaturday = weekday == 7
        ? 6
        : 6 - weekday; // Saturday is 6 days after Sunday
    return add(Duration(days: daysToSaturday)).toChronos().endOfDay();
  }

  /// Returns the end of the ISO week (Sunday at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Friday
  /// final endOfIsoWeek = date.endOfIsoWeek(); // 2024-03-17 23:59:59.999999 (Sunday)
  /// ```
  Chronos endOfIsoWeek() {
    final daysToSunday = 7 - weekday;
    return add(Duration(days: daysToSunday)).toChronos().endOfDay();
  }

  /// Returns the end of the month (last day at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final endOfMonth = date.endOfMonth(); // 2024-03-31 23:59:59.999999
  /// ```
  Chronos endOfMonth() => copyWith(month: month + 1, day: 0).endOfDay();

  /// Returns the end of the quarter (last day of quarter at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15); // August (Q3)
  /// final endOfQuarter = date.endOfQuarter(); // 2024-09-30 23:59:59.999999
  /// ```
  Chronos endOfQuarter() =>
      copyWith(month: ((month - 1) ~/ 3 + 1) * 3 + 1, day: 0).endOfDay();

  /// Returns the end of the year (December 31st at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final endOfYear = date.endOfYear(); // 2024-12-31 23:59:59.999999
  /// ```
  Chronos endOfYear() => Chronos(year, 12, 31, 23, 59, 59, 999, 999);

  /// Returns the end of the ISO year (last moment of ISO year at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final endOfIsoYear = date.endOfIsoYear(); // End of ISO year 2024
  /// ```
  Chronos endOfIsoYear() {
    final nextYearJan4 = Chronos(year + 1, 1, 4);
    final nextIsoYearStart = nextYearJan4.startOfIsoWeek();
    return nextIsoYearStart.subMicrosecond();
  }

  /// Returns the end of the decade (last year of decade at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final endOfDecade = date.endOfDecade(); // 2029-12-31 23:59:59.999999
  /// ```
  Chronos endOfDecade() {
    final decadeEndYear = (year ~/ 10) * 10 + 9;
    return Chronos(decadeEndYear, 12, 31, 23, 59, 59, 999, 999);
  }

  /// Returns the end of the century (last year of century at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final endOfCentury = date.endOfCentury(); // 2100-12-31 23:59:59.999999
  /// ```
  Chronos endOfCentury() {
    final centuryEndYear = ((year - 1) ~/ 100 + 1) * 100;
    return Chronos(centuryEndYear, 12, 31, 23, 59, 59, 999, 999);
  }

  /// Returns the end of the millennium (last year of millennium at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final endOfMillennium = date.endOfMillennium(); // 3000-12-31 23:59:59.999999
  /// ```
  Chronos endOfMillennium() {
    final millenniumEndYear = ((year - 1) ~/ 1000 + 1) * 1000;
    return Chronos(millenniumEndYear, 12, 31, 23, 59, 59, 999, 999);
  }

  /// Returns the end of the hour (59 minutes, 59 seconds, 999 milliseconds).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final endOfHour = date.endOfHour(); // 2024-03-15 14:59:59.999999
  /// ```
  Chronos endOfHour() => Chronos(year, month, day, hour, 59, 59, 999, 999);

  /// Returns the end of the minute (59 seconds, 999 milliseconds).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final endOfMinute = date.endOfMinute(); // 2024-03-15 14:30:59.999999
  /// ```
  Chronos endOfMinute() =>
      Chronos(year, month, day, hour, minute, 59, 999, 999);

  /// Returns the end of the second (999 milliseconds, 999 microseconds).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final endOfSecond = date.endOfSecond(); // 2024-03-15 14:30:45.999999
  /// ```
  Chronos endOfSecond() =>
      Chronos(year, month, day, hour, minute, second, 999, 999);

  /// Returns the end of the millisecond (999 microseconds).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final endOfMillisecond = date.endOfMillisecond(); // 2024-03-15 14:30:45.123999
  /// ```
  Chronos endOfMillisecond() =>
      Chronos(year, month, day, hour, minute, second, millisecond, 999);

  /// Returns the end of the season (last day of season at 23:59:59.999999).
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15); // August (Summer)
  /// final endOfSeason = date.endOfSeason(); // 2024-08-31 23:59:59.999999 (August 31st)
  /// ```
  Chronos endOfSeason() {
    int seasonEndMonth;
    if (month >= Month.march.value && month <= Month.may.value) {
      seasonEndMonth = Month.may.value;
    } else if (month >= Month.june.value && month <= Month.august.value) {
      seasonEndMonth = Month.august.value;
    } else if (month >= Month.september.value &&
        month <= Month.november.value) {
      seasonEndMonth = Month.november.value;
    } else {
      seasonEndMonth = Month.february.value;
      if (month <= Month.february.value) {
        return Chronos(year, 2, 1).endOfMonth();
      } else {
        return Chronos(year + 1, 2, 1).endOfMonth();
      }
    }
    return Chronos(year, seasonEndMonth, 1).endOfMonth();
  }

  /// Returns the end of the specified time unit.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final endOfDay = date.endOfUnit(TimeUnit.day); // 2024-03-15 23:59:59.999999
  /// final endOfMonth = date.endOfUnit(TimeUnit.month); // 2024-03-31 23:59:59.999999
  /// ```
  Chronos endOfUnit(TimeUnit timeUnit) {
    switch (timeUnit) {
      case TimeUnit.millisecond:
        return endOfMillisecond();
      case TimeUnit.second:
        return endOfSecond();
      case TimeUnit.minute:
        return endOfMinute();
      case TimeUnit.hour:
        return endOfHour();
      case TimeUnit.day:
        return endOfDay();
      case TimeUnit.week:
        return endOfWeek();
      case TimeUnit.isoWeek:
        return endOfIsoWeek();
      case TimeUnit.month:
        return endOfMonth();
      case TimeUnit.quarter:
        return endOfQuarter();
      case TimeUnit.year:
        return endOfYear();
      case TimeUnit.isoYear:
        return endOfIsoYear();
      case TimeUnit.decade:
        return endOfDecade();
      case TimeUnit.century:
        return endOfCentury();
      case TimeUnit.millennium:
        return endOfMillennium();
      default:
        throw UnsupportedError('Unsupported unit: $timeUnit');
    }
  }
}
