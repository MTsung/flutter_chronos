import 'package:flutter_chronos/chronos.dart';

/// Extension providing modification methods for Chronos instances.
///
/// This extension allows you to add/subtract time units, set specific values,
/// and perform various date manipulations.
extension ChronosModifiers on Chronos {
  /// Sets the date components (year, month, day) while keeping time unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final newDate = date.setDate(2025, month: 12, day: 25); // 2025-12-25 14:30:45
  /// ```
  Chronos setDate(int year, {int month = 1, int day = 1}) => copyWith(year: year, month: month, day: day);

  /// Sets the time components while keeping date unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final newTime = date.setTime(hour: 9, minute: 15, second: 30); // 2024-03-15 09:15:30
  /// ```
  Chronos setTime({int hour = 0, int minute = 0, int second = 0, int microsecond = 0, int millisecond = 0}) =>
      copyWith(hour: hour, minute: minute, second: second, millisecond: millisecond, microsecond: microsecond);

  /// Sets the date from another Chronos instance while keeping time unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45);
  /// final date2 = Chronos(2025, 12, 25, 9, 15, 30);
  /// final result = date1.setDateFrom(date2); // 2025-12-25 14:30:45
  /// ```
  Chronos setDateFrom(Chronos other) => copyWith(year: other.year, month: other.month, day: other.day);

  /// Sets the time from another Chronos instance while keeping date unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45);
  /// final date2 = Chronos(2025, 12, 25, 9, 15, 30);
  /// final result = date1.setTimeFrom(date2); // 2024-03-15 09:15:30
  /// ```
  Chronos setTimeFrom(Chronos other) =>
      copyWith(hour: other.hour, minute: other.minute, second: other.second, millisecond: other.millisecond, microsecond: other.microsecond);

  /// Sets the year while keeping other components unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final newYear = date.setYear(2025); // 2025-03-15 14:30:45
  /// ```
  Chronos setYear(int year) => copyWith(year: year);

  /// Sets the month while keeping other components unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final newMonth = date.setMonth(12); // 2024-12-15 14:30:45
  /// ```
  Chronos setMonth(int month) => copyWith(month: month);

  /// Sets the day while keeping other components unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final newDay = date.setDay(25); // 2024-03-25 14:30:45
  /// ```
  Chronos setDay(int day) => copyWith(day: day);

  /// Sets the hour while keeping other components unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final newHour = date.setHour(9); // 2024-03-15 09:30:45
  /// ```
  Chronos setHour(int hour) => copyWith(hour: hour);

  /// Sets the minute while keeping other components unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final newMinute = date.setMinute(15); // 2024-03-15 14:15:45
  /// ```
  Chronos setMinute(int minute) => copyWith(minute: minute);

  /// Sets the second while keeping other components unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final newSecond = date.setSecond(0); // 2024-03-15 14:30:00
  /// ```
  Chronos setSecond(int second) => copyWith(second: second);

  /// Sets the microsecond while keeping other components unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final newMicrosecond = date.setMicrosecond(789); // 2024-03-15 14:30:45.123789
  /// ```
  Chronos setMicrosecond(int microsecond) => copyWith(microsecond: microsecond);

  /// Sets the millisecond while keeping other components unchanged.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final newMillisecond = date.setMillisecond(999); // 2024-03-15 14:30:45.999456
  /// ```
  Chronos setMillisecond(int millisecond) => copyWith(millisecond: millisecond);

  /// Creates a new Chronos instance from a timestamp.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos.now();
  /// final fromTimestamp = date.setTimestamp(1640995200); // 2022-01-01 00:00:00 UTC
  /// ```
  Chronos setTimestamp(int timestamp) => Chronos.fromTimestamp(timestamp);

  /// Adds one microsecond to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final added = date.addMicrosecond(); // 2024-03-15 14:30:45.123457
  /// ```
  Chronos addMicrosecond() => addMicroseconds(1).toChronos();

  /// Adds one millisecond to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123);
  /// final added = date.addMillisecond(); // 2024-03-15 14:30:45.124
  /// ```
  Chronos addMillisecond() => addMilliseconds(1).toChronos();

  /// Adds one second to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final added = date.addSecond(); // 2024-03-15 14:30:46
  /// ```
  Chronos addSecond() => addSeconds(1).toChronos();

  /// Adds one minute to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final added = date.addMinute(); // 2024-03-15 14:31:45
  /// ```
  Chronos addMinute() => addMinutes(1).toChronos();

  /// Adds one hour to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final added = date.addHour(); // 2024-03-15 15:30:45
  /// ```
  Chronos addHour() => addHours(1).toChronos();

  /// Adds one day to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final tomorrow = date.addDay(); // 2024-03-16
  /// ```
  Chronos addDay() => addDays(1).toChronos();

  /// Adds one week to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addWeek(); // 2024-03-22
  /// ```
  Chronos addWeek() => addWeeks(1).toChronos();

  /// Adds one ISO week to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addIsoWeek(); // 2024-03-22
  /// ```
  Chronos addIsoWeek() => addIsoWeeks(1).toChronos();

  /// Adds one month to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final nextMonth = date.addMonth(); // 2024-04-15
  /// ```
  Chronos addMonth() => addMonths(1).toChronos();

  /// Adds one year to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addYear(); // 2025-03-15
  /// ```
  Chronos addYear() => addYears(1).toChronos();

  /// Adds one ISO year to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addIsoYear(); // 2025-03-15
  /// ```
  Chronos addIsoYear() => addIsoYears(1).toChronos();

  /// Adds one quarter to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Q1
  /// final added = date.addQuarter(); // 2024-06-15 (Q2)
  /// ```
  Chronos addQuarter() => addQuarters(1).toChronos();

  /// Adds one decade to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addDecade(); // 2034-03-15
  /// ```
  Chronos addDecade() => addDecades(1).toChronos();

  /// Adds one century to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addCentury(); // 2124-03-15
  /// ```
  Chronos addCentury() => addCenturies(1).toChronos();

  /// Adds one millennium to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addMillennium(); // 3024-03-15
  /// ```
  Chronos addMillennium() => addMillennia(1).toChronos();

  /// Adds the specified number of microseconds to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final added = date.addMicroseconds(1000); // adds 1000 microseconds
  /// ```
  Chronos addMicroseconds(int microseconds) => add(Duration(microseconds: microseconds)).toChronos();

  /// Adds the specified number of milliseconds to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123);
  /// final added = date.addMilliseconds(500); // adds 500 milliseconds
  /// ```
  Chronos addMilliseconds(int milliseconds) => add(Duration(milliseconds: milliseconds)).toChronos();

  /// Adds the specified number of seconds to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final added = date.addSeconds(30); // 2024-03-15 14:31:15
  /// ```
  Chronos addSeconds(int seconds) => add(Duration(seconds: seconds)).toChronos();

  /// Adds the specified number of minutes to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final added = date.addMinutes(15); // 2024-03-15 14:45:45
  /// ```
  Chronos addMinutes(int minutes) => add(Duration(minutes: minutes)).toChronos();

  /// Adds the specified number of hours to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final added = date.addHours(5); // 2024-03-15 19:30:45
  /// ```
  Chronos addHours(int hours) => add(Duration(hours: hours)).toChronos();

  /// Adds the specified number of days to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addDays(7); // 2024-03-22
  /// ```
  Chronos addDays(int days) => add(Duration(days: days)).toChronos();

  /// Adds the specified number of weeks to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addWeeks(2); // 2024-03-29
  /// ```
  Chronos addWeeks(int weeks) => add(Duration(days: 7 * weeks)).toChronos();

  /// Adds the specified number of ISO weeks to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addIsoWeeks(3); // 2024-04-05
  /// ```
  Chronos addIsoWeeks(int weeks) => addWeeks(weeks);

  /// Adds the specified number of months to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addMonths(3); // 2024-06-15
  /// final overflow = Chronos(2024, 1, 31).addMonths(1); // 2024-02-29 (handles overflow)
  /// ```
  Chronos addMonths(int months) {
    final newChronos = copyWith(month: month + months);

    if (newChronos.day != day) {
      return newChronos.subDays(newChronos.day);
    }

    return newChronos;
  }

  /// Adds the specified number of years to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addYears(2); // 2026-03-15
  /// ```
  Chronos addYears(int years) => addMonths(years * 12);

  /// Adds the specified number of ISO years to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addIsoYears(1); // 2025-03-15
  /// ```
  Chronos addIsoYears(int years) => addYears(years);

  /// Adds the specified number of quarters to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Q1
  /// final added = date.addQuarters(2); // 2024-09-15 (Q3)
  /// ```
  Chronos addQuarters(int quarters) => addMonths(quarters * 3);

  /// Adds the specified number of decades to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addDecades(1); // 2034-03-15
  /// ```
  Chronos addDecades(int decades) => addYears(decades * 10);

  /// Adds the specified number of centuries to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addCenturies(1); // 2124-03-15
  /// ```
  Chronos addCenturies(int centuries) => addYears(centuries * 100);

  /// Adds the specified number of millennia to the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addMillennia(1); // 3024-03-15
  /// ```
  Chronos addMillennia(int millennia) => addYears(millennia * 1000);

  /// Adds the specified value of the given time unit to the date.
  ///
  /// [timeUnit] - The time unit to add (microsecond, millisecond, second, etc.)
  /// [value] - The number of units to add (defaults to 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final added = date.addUnit(TimeUnit.month, 3); // 2024-06-15
  /// final addedDay = date.addUnit(TimeUnit.day); // 2024-03-16 (default value = 1)
  /// ```
  Chronos addUnit(TimeUnit timeUnit, [int value = 1]) {
    switch (timeUnit) {
      case TimeUnit.microsecond:
        return addMicroseconds(value);
      case TimeUnit.millisecond:
        return addMilliseconds(value);
      case TimeUnit.second:
        return addSeconds(value);
      case TimeUnit.minute:
        return addMinutes(value);
      case TimeUnit.hour:
        return addHours(value);
      case TimeUnit.day:
        return addDays(value);
      case TimeUnit.week:
        return addWeeks(value);
      case TimeUnit.month:
        return addMonths(value);
      case TimeUnit.quarter:
        return addQuarters(value);
      case TimeUnit.year:
        return addYears(value);
      case TimeUnit.isoWeek:
        return addIsoWeeks(value);
      case TimeUnit.isoYear:
        return addIsoYears(value);
      case TimeUnit.decade:
        return addDecades(value);
      case TimeUnit.century:
        return addCenturies(value);
      case TimeUnit.millennium:
        return addMillennia(value);
    }
  }

  /// Subtracts one microsecond from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final subtracted = date.subMicrosecond(); // 2024-03-15 14:30:45.123455
  /// ```
  Chronos subMicrosecond() => subMicroseconds(1).toChronos();

  /// Subtracts one millisecond from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123);
  /// final subtracted = date.subMillisecond(); // 2024-03-15 14:30:45.122
  /// ```
  Chronos subMillisecond() => subMilliseconds(1).toChronos();

  /// Subtracts one second from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final subtracted = date.subSecond(); // 2024-03-15 14:30:44
  /// ```
  Chronos subSecond() => subSeconds(1).toChronos();

  /// Subtracts one minute from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final subtracted = date.subMinute(); // 2024-03-15 14:29:45
  /// ```
  Chronos subMinute() => subMinutes(1).toChronos();

  /// Subtracts one hour from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final subtracted = date.subHour(); // 2024-03-15 13:30:45
  /// ```
  Chronos subHour() => subHours(1).toChronos();

  /// Subtracts one day from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final yesterday = date.subDay(); // 2024-03-14
  /// ```
  Chronos subDay() => subDays(1).toChronos();

  /// Subtracts one week from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subWeek(); // 2024-03-08
  /// ```
  Chronos subWeek() => subWeeks(1).toChronos();

  /// Subtracts one ISO week from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subIsoWeek(); // 2024-03-08
  /// ```
  Chronos subIsoWeek() => subIsoWeeks(1).toChronos();

  /// Subtracts one month from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final lastMonth = date.subMonth(); // 2024-02-15
  /// ```
  Chronos subMonth() => subMonths(1).toChronos();

  /// Subtracts one year from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final lastYear = date.subYear(); // 2023-03-15
  /// ```
  Chronos subYear() => subYears(1).toChronos();

  /// Subtracts one ISO year from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subIsoYear(); // 2023-03-15
  /// ```
  Chronos subIsoYear() => subIsoYears(1).toChronos();

  /// Subtracts one quarter from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15); // Q2
  /// final subtracted = date.subQuarter(); // 2024-03-15 (Q1)
  /// ```
  Chronos subQuarter() => subQuarters(1).toChronos();

  /// Subtracts one decade from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subDecade(); // 2014-03-15
  /// ```
  Chronos subDecade() => subDecades(1).toChronos();

  /// Subtracts one century from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subCentury(); // 1924-03-15
  /// ```
  Chronos subCentury() => subCenturies(1).toChronos();

  /// Subtracts one millennium from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subMillennium(); // 1024-03-15
  /// ```
  Chronos subMillennium() => subMillennia(1).toChronos();

  /// Subtracts the specified number of microseconds from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final subtracted = date.subMicroseconds(1000); // subtracts 1000 microseconds
  /// ```
  Chronos subMicroseconds(int microseconds) => addMicroseconds(-microseconds);

  /// Subtracts the specified number of milliseconds from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 500);
  /// final subtracted = date.subMilliseconds(200); // subtracts 200 milliseconds
  /// ```
  Chronos subMilliseconds(int milliseconds) => addMilliseconds(-milliseconds);

  /// Subtracts the specified number of seconds from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final subtracted = date.subSeconds(30); // 2024-03-15 14:30:15
  /// ```
  Chronos subSeconds(int seconds) => addSeconds(-seconds);

  /// Subtracts the specified number of minutes from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final subtracted = date.subMinutes(15); // 2024-03-15 14:15:45
  /// ```
  Chronos subMinutes(int minutes) => addMinutes(-minutes);

  /// Subtracts the specified number of hours from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final subtracted = date.subHours(5); // 2024-03-15 09:30:45
  /// ```
  Chronos subHours(int hours) => addHours(-hours);

  /// Subtracts the specified number of days from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subDays(7); // 2024-03-08
  /// ```
  Chronos subDays(int days) => addDays(-days);

  /// Subtracts the specified number of weeks from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subWeeks(2); // 2024-03-01
  /// ```
  Chronos subWeeks(int weeks) => addWeeks(-weeks);

  /// Subtracts the specified number of ISO weeks from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subIsoWeeks(3); // 2024-02-23
  /// ```
  Chronos subIsoWeeks(int weeks) => addIsoWeeks(-weeks);

  /// Subtracts the specified number of months from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final subtracted = date.subMonths(3); // 2024-03-15
  /// final overflow = Chronos(2024, 3, 31).subMonths(1); // 2024-02-29 (handles overflow)
  /// ```
  Chronos subMonths(int months) => addMonths(-months);

  /// Subtracts the specified number of years from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subYears(2); // 2022-03-15
  /// ```
  Chronos subYears(int years) => addYears(-years);

  /// Subtracts the specified number of ISO years from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subIsoYears(1); // 2023-03-15
  /// ```
  Chronos subIsoYears(int years) => addIsoYears(-years);

  /// Subtracts the specified number of quarters from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 9, 15); // Q3
  /// final subtracted = date.subQuarters(2); // 2024-03-15 (Q1)
  /// ```
  Chronos subQuarters(int quarters) => addQuarters(-quarters);

  /// Subtracts the specified number of decades from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subDecades(1); // 2014-03-15
  /// ```
  Chronos subDecades(int decades) => addDecades(-decades);

  /// Subtracts the specified number of centuries from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subCenturies(1); // 1924-03-15
  /// ```
  Chronos subCenturies(int centuries) => addCenturies(-centuries);

  /// Subtracts the specified number of millennia from the date.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final subtracted = date.subMillennia(1); // 1024-03-15
  /// ```
  Chronos subMillennia(int millennia) => addMillennia(-millennia);

  /// Subtracts the specified value of the given time unit from the date.
  ///
  /// [timeUnit] - The time unit to subtract (microsecond, millisecond, second, etc.)
  /// [value] - The number of units to subtract (defaults to 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final subtracted = date.subUnit(TimeUnit.month, 3); // 2024-03-15
  /// final subDay = date.subUnit(TimeUnit.day); // 2024-06-14 (default value = 1)
  /// ```
  Chronos subUnit(TimeUnit timeUnit, [int value = 1]) {
    switch (timeUnit) {
      case TimeUnit.microsecond:
        return subMicroseconds(value);
      case TimeUnit.millisecond:
        return subMilliseconds(value);
      case TimeUnit.second:
        return subSeconds(value);
      case TimeUnit.minute:
        return subMinutes(value);
      case TimeUnit.hour:
        return subHours(value);
      case TimeUnit.day:
        return subDays(value);
      case TimeUnit.week:
        return subWeeks(value);
      case TimeUnit.month:
        return subMonths(value);
      case TimeUnit.quarter:
        return subQuarters(value);
      case TimeUnit.year:
        return subYears(value);
      case TimeUnit.isoWeek:
        return subIsoWeeks(value);
      case TimeUnit.isoYear:
        return subIsoYears(value);
      case TimeUnit.decade:
        return subDecades(value);
      case TimeUnit.century:
        return subCenturies(value);
      case TimeUnit.millennium:
        return subMillennia(value);
    }
  }

  /// Adds one weekday (Monday-Friday) to the date, skipping weekends.
  ///
  /// Example:
  /// ```dart
  /// final friday = Chronos(2024, 3, 15); // Friday
  /// final nextWeekday = friday.addWeekday(); // 2024-03-18 (Monday)
  /// ```
  Chronos addWeekday() => addWeekdays(1);

  /// Adds the specified number of weekdays to the date, skipping weekends.
  ///
  /// [weekdays] - The number of weekdays to add (can be negative to subtract)
  ///
  /// Example:
  /// ```dart
  /// final monday = Chronos(2024, 3, 11); // Monday
  /// final added = monday.addWeekdays(5); // 2024-03-18 (next Monday)
  /// final friday = Chronos(2024, 3, 15); // Friday
  /// final nextWeek = friday.addWeekdays(3); // 2024-03-20 (Wednesday)
  /// ```
  Chronos addWeekdays(int weekdays) {
    if (weekdays == 0) return this;

    Chronos current = this;
    int remaining = weekdays.abs();
    int direction = weekdays.isNegative ? -1 : 1;

    while (remaining > 0) {
      current = current.addDays(direction);
      if (current.isWeekday) {
        remaining--;
      }
    }

    return current;
  }

  /// Subtracts one weekday from the date, skipping weekends.
  ///
  /// Example:
  /// ```dart
  /// final monday = Chronos(2024, 3, 18); // Monday
  /// final prevWeekday = monday.subWeekday(); // 2024-03-15 (Friday)
  /// ```
  Chronos subWeekday() => subWeekdays(1);

  /// Subtracts the specified number of weekdays from the date, skipping weekends.
  ///
  /// [weekdays] - The number of weekdays to subtract
  ///
  /// Example:
  /// ```dart
  /// final friday = Chronos(2024, 3, 15); // Friday
  /// final subtracted = friday.subWeekdays(5); // 2024-03-08 (previous Friday)
  /// ```
  Chronos subWeekdays(int weekdays) => addWeekdays(-weekdays);

  /// Returns the first occurrence of the specified day of week in the current month.
  ///
  /// [isoDayOfWeek] - The target day of the week (Monday = 1, Sunday = 7)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // March 2024
  /// final firstMonday = date.firstOfMonth(IsoDayOfWeek.monday); // 2024-03-04
  /// final firstFriday = date.firstOfMonth(IsoDayOfWeek.friday); // 2024-03-01
  /// ```
  Chronos firstOfMonth(IsoDayOfWeek isoDayOfWeek) {
    final firstDay = startOfMonth();
    final targetDay = isoDayOfWeek.value;
    final currentDay = firstDay.weekday;

    int daysToAdd = (targetDay - currentDay + 7) % 7;
    return firstDay.addDays(daysToAdd);
  }

  /// Returns the last occurrence of the specified day of week in the current month.
  ///
  /// [isoDayOfWeek] - The target day of the week (Monday = 1, Sunday = 7)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // March 2024
  /// final lastMonday = date.lastOfMonth(IsoDayOfWeek.monday); // 2024-03-25
  /// final lastSunday = date.lastOfMonth(IsoDayOfWeek.sunday); // 2024-03-31
  /// ```
  Chronos lastOfMonth(IsoDayOfWeek isoDayOfWeek) {
    final lastDay = endOfMonth().startOfDay();
    final targetDay = isoDayOfWeek.value;
    final currentDay = lastDay.weekday;

    int daysToSubtract = (currentDay - targetDay + 7) % 7;
    return lastDay.subDays(daysToSubtract);
  }

  /// Returns the first occurrence of the specified day of week in the current quarter.
  ///
  /// [isoDayOfWeek] - The target day of the week (Monday = 1, Sunday = 7)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 5, 15); // Q2 2024
  /// final firstMonday = date.firstOfQuarter(IsoDayOfWeek.monday); // 2024-04-01
  /// ```
  Chronos firstOfQuarter(IsoDayOfWeek isoDayOfWeek) {
    final firstDay = startOfQuarter();
    final targetDay = isoDayOfWeek.value;
    final currentDay = firstDay.weekday;

    int daysToAdd = (targetDay - currentDay + 7) % 7;
    return firstDay.addDays(daysToAdd);
  }

  /// Returns the last occurrence of the specified day of week in the current quarter.
  ///
  /// [isoDayOfWeek] - The target day of the week (Monday = 1, Sunday = 7)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 5, 15); // Q2 2024
  /// final lastFriday = date.lastOfQuarter(IsoDayOfWeek.friday); // 2024-06-28
  /// ```
  Chronos lastOfQuarter(IsoDayOfWeek isoDayOfWeek) {
    final lastDay = endOfQuarter().startOfDay();
    final targetDay = isoDayOfWeek.value;
    final currentDay = lastDay.weekday;

    int daysToSubtract = (currentDay - targetDay + 7) % 7;
    return lastDay.subDays(daysToSubtract);
  }

  /// Returns the first occurrence of the specified day of week in the current year.
  ///
  /// [isoDayOfWeek] - The target day of the week (Monday = 1, Sunday = 7)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final firstMonday = date.firstOfYear(IsoDayOfWeek.monday); // 2024-01-01
  /// final firstSaturday = date.firstOfYear(IsoDayOfWeek.saturday); // 2024-01-06
  /// ```
  Chronos firstOfYear(IsoDayOfWeek isoDayOfWeek) {
    final firstDay = startOfYear();
    final targetDay = isoDayOfWeek.value;
    final currentDay = firstDay.weekday;

    int daysToAdd = (targetDay - currentDay + 7) % 7;
    return firstDay.addDays(daysToAdd);
  }

  /// Returns the last occurrence of the specified day of week in the current year.
  ///
  /// [isoDayOfWeek] - The target day of the week (Monday = 1, Sunday = 7)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final lastMonday = date.lastOfYear(IsoDayOfWeek.monday); // 2024-12-30
  /// final lastSunday = date.lastOfYear(IsoDayOfWeek.sunday); // 2024-12-29
  /// ```
  Chronos lastOfYear(IsoDayOfWeek isoDayOfWeek) {
    final lastDay = endOfYear().startOfDay();
    final targetDay = isoDayOfWeek.value;
    final currentDay = lastDay.weekday;

    int daysToSubtract = (currentDay - targetDay + 7) % 7;
    return lastDay.subDays(daysToSubtract);
  }

  /// Returns the next weekday (Monday-Friday) after the current date.
  ///
  /// Example:
  /// ```dart
  /// final friday = Chronos(2024, 3, 15); // Friday
  /// final nextWeekday = friday.nextWeekday(); // 2024-03-18 (Monday)
  /// final tuesday = Chronos(2024, 3, 12); // Tuesday
  /// final nextWeekday2 = tuesday.nextWeekday(); // 2024-03-13 (Wednesday)
  /// ```
  Chronos nextWeekday() {
    Chronos current = addDay();
    while (!current.isWeekday) {
      current = current.addDay();
    }
    return current;
  }

  /// Returns the previous weekday (Monday-Friday) before the current date.
  ///
  /// Example:
  /// ```dart
  /// final monday = Chronos(2024, 3, 18); // Monday
  /// final prevWeekday = monday.previousWeekday(); // 2024-03-15 (Friday)
  /// final wednesday = Chronos(2024, 3, 13); // Wednesday
  /// final prevWeekday2 = wednesday.previousWeekday(); // 2024-03-12 (Tuesday)
  /// ```
  Chronos previousWeekday() {
    Chronos current = subDay();
    while (!current.isWeekday) {
      current = current.subDay();
    }
    return current;
  }

  /// Returns the next weekend day (Saturday or Sunday) after the current date.
  ///
  /// Example:
  /// ```dart
  /// final friday = Chronos(2024, 3, 15); // Friday
  /// final nextWeekend = friday.nextWeekendDay(); // 2024-03-16 (Saturday)
  /// final saturday = Chronos(2024, 3, 16); // Saturday
  /// final nextWeekend2 = saturday.nextWeekendDay(); // 2024-03-17 (Sunday)
  /// ```
  Chronos nextWeekendDay() {
    Chronos current = addDay();
    while (!current.isWeekend) {
      current = current.addDay();
    }
    return current;
  }

  /// Returns the previous weekend day (Saturday or Sunday) before the current date.
  ///
  /// Example:
  /// ```dart
  /// final monday = Chronos(2024, 3, 18); // Monday
  /// final prevWeekend = monday.previousWeekendDay(); // 2024-03-17 (Sunday)
  /// final sunday = Chronos(2024, 3, 17); // Sunday
  /// final prevWeekend2 = sunday.previousWeekendDay(); // 2024-03-16 (Saturday)
  /// ```
  Chronos previousWeekendDay() {
    Chronos current = subDay();
    while (!current.isWeekend) {
      current = current.subDay();
    }
    return current;
  }

  /// Linear interpolation between this date and another date.
  ///
  /// [other] - The target date to interpolate towards
  /// [t] - The interpolation factor (0.0 = this date, 1.0 = other date)
  ///
  /// Example:
  /// ```dart
  /// final start = Chronos(2024, 1, 1);
  /// final end = Chronos(2024, 12, 31);
  /// final midYear = start.lerp(end, 0.5); // Around 2024-07-01
  /// final quarter = start.lerp(end, 0.25); // Around 2024-04-01
  /// ```
  Chronos lerp(Chronos other, double t) {
    final startMicro = microsecondsSinceEpoch;
    final endMicro = other.microsecondsSinceEpoch;
    final lerpedMicro = startMicro + ((endMicro - startMicro) * t).round();

    return Chronos.fromMicrosecondsSinceEpoch(lerpedMicro);
  }

  /// Returns the midpoint between this date and another date.
  ///
  /// [other] - The other date to find the midpoint with
  ///
  /// Example:
  /// ```dart
  /// final start = Chronos(2024, 1, 1);
  /// final end = Chronos(2024, 12, 31);
  /// final midpoint = start.mid(end); // Around 2024-07-01
  /// ```
  Chronos mid(Chronos other) => lerp(other, 0.5);

  /// Returns the date that is closest to this date from the two provided dates.
  ///
  /// [c1] - First date to compare
  /// [c2] - Second date to compare
  ///
  /// Example:
  /// ```dart
  /// final current = Chronos(2024, 6, 15);
  /// final date1 = Chronos(2024, 6, 10); // 5 days before
  /// final date2 = Chronos(2024, 6, 25); // 10 days after
  /// final closest = current.closest(date1, date2); // Returns date1 (closer)
  /// ```
  Chronos closest(Chronos c1, Chronos c2) => (diffInMicroseconds(c1).abs() <= diffInMicroseconds(c2).abs()) ? c1 : c2;

  /// Returns the date that is farthest from this date from the two provided dates.
  ///
  /// [c1] - First date to compare
  /// [c2] - Second date to compare
  ///
  /// Example:
  /// ```dart
  /// final current = Chronos(2024, 6, 15);
  /// final date1 = Chronos(2024, 6, 10); // 5 days before
  /// final date2 = Chronos(2024, 6, 25); // 10 days after
  /// final farthest = current.farthest(date1, date2); // Returns date2 (farther)
  /// ```
  Chronos farthest(Chronos c1, Chronos c2) => (diffInMicroseconds(c1).abs() >= diffInMicroseconds(c2).abs()) ? c1 : c2;

  /// Returns the earliest date from this date and the provided dates.
  ///
  /// [other] - Another date to compare
  /// [others] - Optional additional dates to compare
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15);
  /// final date2 = Chronos(2024, 1, 10);
  /// final date3 = Chronos(2024, 6, 20);
  /// final earliest = date1.min(date2, [date3]); // Returns date2 (2024-01-10)
  /// ```
  Chronos min(Chronos other, [Iterable<Chronos>? others]) {
    final all = [this, other, if (others != null) ...others];
    return all.reduce((a, b) => a < b ? a : b);
  }

  /// Returns the latest date from this date and the provided dates.
  ///
  /// [other] - Another date to compare
  /// [others] - Optional additional dates to compare
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15);
  /// final date2 = Chronos(2024, 1, 10);
  /// final date3 = Chronos(2024, 6, 20);
  /// final latest = date1.max(date2, [date3]); // Returns date3 (2024-06-20)
  /// ```
  Chronos max(Chronos other, [Iterable<Chronos>? others]) {
    final all = [this, other, if (others != null) ...others];
    return all.reduce((a, b) => a > b ? a : b);
  }

  /// Sets the date to the specified week of the year.
  ///
  /// [week] - The week number (1-53)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final weekOne = date.setWeek(1); // First week of 2024
  /// final week26 = date.setWeek(26); // 26th week of 2024
  /// ```
  Chronos setWeek(int week) => startOfYear().addWeeks(week - 1);

  /// Sets the date to the specified ISO week of the year.
  ///
  /// [isoWeek] - The ISO week number (1-53)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 6, 15);
  /// final isoWeekOne = date.setIsoWeek(1); // First ISO week of 2024
  /// final isoWeek26 = date.setIsoWeek(26); // 26th ISO week of 2024
  /// ```
  Chronos setIsoWeek(int isoWeek) => startOfIsoYear().addIsoWeeks(isoWeek - 1);

  /// Sets the date to the specified day of the week within the current week.
  ///
  /// [dayOfWeek] - The day of the week (1 = Monday, 7 = Sunday)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Friday
  /// final monday = date.setDayOfWeek(1); // Monday of the same week
  /// final sunday = date.setDayOfWeek(7); // Sunday of the same week
  /// ```
  Chronos setDayOfWeek(int dayOfWeek) => startOfWeek().addDays(dayOfWeek - 1);

  /// Sets the date to the specified ISO day of the week within the current ISO week.
  ///
  /// [isoDayOfWeek] - The ISO day of the week (1 = Monday, 7 = Sunday)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Friday
  /// final monday = date.setIsoDayOfWeek(1); // Monday of the same ISO week
  /// final sunday = date.setIsoDayOfWeek(7); // Sunday of the same ISO week
  /// ```
  Chronos setIsoDayOfWeek(int isoDayOfWeek) => startOfIsoWeek().addDays(isoDayOfWeek - 1);
}
