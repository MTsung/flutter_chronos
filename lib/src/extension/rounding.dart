import 'package:flutter_chronos/chronos.dart';

/// Extension providing rounding methods for Chronos instances.
///
/// This extension offers three different rounding strategies for various time units:
///
/// **Ceil (Round Up)**: Always rounds up to the next time unit boundary.
/// - `ceilDay()` - rounds 2024-03-15 14:30:45 → 2024-03-16 00:00:00
/// - `ceilHour()` - rounds 2024-03-15 14:30:45 → 2024-03-15 15:00:00
///
/// **Floor (Round Down)**: Always rounds down to the previous time unit boundary.
/// - `floorDay()` - rounds 2024-03-15 14:30:45 → 2024-03-15 00:00:00
/// - `floorHour()` - rounds 2024-03-15 14:30:45 → 2024-03-15 14:00:00
///
/// **Round (Nearest)**: Rounds to the nearest time unit boundary.
/// - `roundDay()` - rounds 2024-03-15 14:30:45 → 2024-03-16 00:00:00 (after noon)
/// - `roundHour()` - rounds 2024-03-15 14:30:45 → 2024-03-15 15:00:00 (after 30 min)
///
/// All methods support optional precision for rounding to multiples of time units.
/// For example, `roundMinutes(15)` rounds to the nearest 15-minute interval.
extension ChronosRounding on Chronos {
  /// Rounds up to the next microsecond.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final ceiled = date.ceilMicrosecond(); // rounds up to next microsecond
  /// ```
  Chronos ceilMicrosecond() => ceilMicroseconds();

  /// Rounds up to the next millisecond.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final ceiled = date.ceilMillisecond(); // 2024-03-15 14:30:45.124
  /// ```
  Chronos ceilMillisecond() => ceilMilliseconds();

  /// Rounds up to the next second.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123);
  /// final ceiled = date.ceilSecond(); // 2024-03-15 14:30:46.000
  /// ```
  Chronos ceilSecond() => ceilSeconds();

  /// Rounds up to the next minute.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final ceiled = date.ceilMinute(); // 2024-03-15 14:31:00.000
  /// ```
  Chronos ceilMinute() => ceilMinutes();

  /// Rounds up to the next hour.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final ceiled = date.ceilHour(); // 2024-03-15 15:00:00.000
  /// ```
  Chronos ceilHour() => ceilHours();

  /// Rounds up to the next day.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final ceiled = date.ceilDay(); // 2024-03-16 00:00:00.000
  /// ```
  Chronos ceilDay() => ceilDays();

  /// Rounds up to the next week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Friday
  /// final ceiled = date.ceilWeek(); // 2024-03-18 (next Monday)
  /// ```
  Chronos ceilWeek() => ceilWeeks();

  /// Rounds up to the next month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilMonth(); // 2024-04-01 00:00:00.000
  /// ```
  Chronos ceilMonth() => ceilMonths();

  /// Rounds up to the next quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Q1
  /// final ceiled = date.ceilQuarter(); // 2024-04-01 (start of Q2)
  /// ```
  Chronos ceilQuarter() => ceilQuarters();

  /// Rounds up to the next year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilYear(); // 2025-01-01 00:00:00.000
  /// ```
  Chronos ceilYear() => ceilYears();

  /// Rounds up to the next decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilDecade(); // 2030-01-01 00:00:00.000
  /// ```
  Chronos ceilDecade() => ceilDecades();

  /// Rounds up to the next century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilCentury(); // 2101-01-01 00:00:00.000
  /// ```
  Chronos ceilCentury() => ceilCenturies();

  /// Rounds up to the next millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilMillennium(); // 3001-01-01 00:00:00.000
  /// ```
  Chronos ceilMillennium() => ceilMillennia();

  /// Rounds up to the next multiple of [precision] microseconds.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final ceiled = date.ceilMicroseconds(1000); // rounds up to next 1000 microseconds
  /// ```
  Chronos ceilMicroseconds([int precision = 1]) => _roundingUnit(TimeUnit.microsecond, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] milliseconds.
  ///
  /// [precision] - The millisecond interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final ceiled = date.ceilMilliseconds(100); // rounds up to next 100ms
  /// ```
  Chronos ceilMilliseconds([int precision = 1]) => _roundingUnit(TimeUnit.millisecond, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] seconds.
  ///
  /// [precision] - The second interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final ceiled = date.ceilSeconds(15); // rounds up to next 15-second mark
  /// ```
  Chronos ceilSeconds([int precision = 1]) => _roundingUnit(TimeUnit.second, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] minutes.
  ///
  /// [precision] - The minute interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final ceiled = date.ceilMinutes(15); // rounds up to next 15-minute mark
  /// ```
  Chronos ceilMinutes([int precision = 1]) => _roundingUnit(TimeUnit.minute, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] hours.
  ///
  /// [precision] - The hour interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final ceiled = date.ceilHours(6); // rounds up to next 6-hour mark
  /// ```
  Chronos ceilHours([int precision = 1]) => _roundingUnit(TimeUnit.hour, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] days.
  ///
  /// [precision] - The day interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final ceiled = date.ceilDays(7); // rounds up to next 7-day mark
  /// ```
  Chronos ceilDays([int precision = 1]) => _roundingUnit(TimeUnit.day, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] weeks.
  ///
  /// [precision] - The week interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilWeeks(2); // rounds up to next 2-week mark
  /// ```
  Chronos ceilWeeks([int precision = 1]) => _roundingUnit(TimeUnit.week, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] months.
  ///
  /// [precision] - The month interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilMonths(3); // rounds up to next 3-month mark
  /// ```
  Chronos ceilMonths([int precision = 1]) => _roundingUnit(TimeUnit.month, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] quarters.
  ///
  /// [precision] - The quarter interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Q1
  /// final ceiled = date.ceilQuarters(2); // rounds up to next 2-quarter mark
  /// ```
  Chronos ceilQuarters([int precision = 1]) => _roundingUnit(TimeUnit.quarter, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] years.
  ///
  /// [precision] - The year interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilYears(5); // rounds up to next 5-year mark
  /// ```
  Chronos ceilYears([int precision = 1]) => _roundingUnit(TimeUnit.year, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] decades.
  ///
  /// [precision] - The decade interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilDecades(2); // rounds up to next 2-decade mark
  /// ```
  Chronos ceilDecades([int precision = 1]) => _roundingUnit(TimeUnit.decade, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] centuries.
  ///
  /// [precision] - The century interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilCenturies(2); // rounds up to next 2-century mark
  /// ```
  Chronos ceilCenturies([int precision = 1]) => _roundingUnit(TimeUnit.century, precision, (n) => n.ceil());

  /// Rounds up to the next multiple of [precision] millennia.
  ///
  /// [precision] - The millennium interval to round up to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final ceiled = date.ceilMillennia(2); // rounds up to next 2-millennium mark
  /// ```
  Chronos ceilMillennia([int precision = 1]) => _roundingUnit(TimeUnit.millennium, precision, (n) => n.ceil());

  /// Rounds down to the previous microsecond.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final floored = date.floorMicrosecond(); // rounds down to previous microsecond
  /// ```
  Chronos floorMicrosecond() => floorMicroseconds();

  /// Rounds down to the previous millisecond.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final floored = date.floorMillisecond(); // 2024-03-15 14:30:45.123
  /// ```
  Chronos floorMillisecond() => floorMilliseconds();

  /// Rounds down to the previous second.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123);
  /// final floored = date.floorSecond(); // 2024-03-15 14:30:45.000
  /// ```
  Chronos floorSecond() => floorSeconds();

  /// Rounds down to the previous minute.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final floored = date.floorMinute(); // 2024-03-15 14:30:00.000
  /// ```
  Chronos floorMinute() => floorMinutes();

  /// Rounds down to the previous hour.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final floored = date.floorHour(); // 2024-03-15 14:00:00.000
  /// ```
  Chronos floorHour() => floorHours();

  /// Rounds down to the previous day.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final floored = date.floorDay(); // 2024-03-15 00:00:00.000
  /// ```
  Chronos floorDay() => floorDays();

  /// Rounds down to the previous week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Friday
  /// final floored = date.floorWeek(); // 2024-03-11 (Monday of same week)
  /// ```
  Chronos floorWeek() => floorWeeks();

  /// Rounds down to the previous month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorMonth(); // 2024-03-01 00:00:00.000
  /// ```
  Chronos floorMonth() => floorMonths();

  /// Rounds down to the previous quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Q1
  /// final floored = date.floorQuarter(); // 2024-01-01 (start of Q1)
  /// ```
  Chronos floorQuarter() => floorQuarters();

  /// Rounds down to the previous year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorYear(); // 2024-01-01 00:00:00.000
  /// ```
  Chronos floorYear() => floorYears();

  /// Rounds down to the previous decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorDecade(); // 2020-01-01 00:00:00.000
  /// ```
  Chronos floorDecade() => floorDecades();

  /// Rounds down to the previous century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorCentury(); // 2001-01-01 00:00:00.000
  /// ```
  Chronos floorCentury() => floorCenturies();

  /// Rounds down to the previous millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorMillennium(); // 2001-01-01 00:00:00.000
  /// ```
  Chronos floorMillennium() => floorMillennia();

  /// Rounds down to the previous multiple of [precision] microseconds.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final floored = date.floorMicroseconds(1000); // rounds down to previous 1000 microseconds
  /// ```
  Chronos floorMicroseconds([int precision = 1]) => _roundingUnit(TimeUnit.microsecond, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] milliseconds.
  ///
  /// [precision] - The millisecond interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final floored = date.floorMilliseconds(100); // rounds down to previous 100ms
  /// ```
  Chronos floorMilliseconds([int precision = 1]) => _roundingUnit(TimeUnit.millisecond, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] seconds.
  ///
  /// [precision] - The second interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final floored = date.floorSeconds(15); // rounds down to previous 15-second mark
  /// ```
  Chronos floorSeconds([int precision = 1]) => _roundingUnit(TimeUnit.second, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] minutes.
  ///
  /// [precision] - The minute interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final floored = date.floorMinutes(15); // rounds down to previous 15-minute mark
  /// ```
  Chronos floorMinutes([int precision = 1]) => _roundingUnit(TimeUnit.minute, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] hours.
  ///
  /// [precision] - The hour interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final floored = date.floorHours(6); // rounds down to previous 6-hour mark
  /// ```
  Chronos floorHours([int precision = 1]) => _roundingUnit(TimeUnit.hour, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] days.
  ///
  /// [precision] - The day interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final floored = date.floorDays(7); // rounds down to previous 7-day mark
  /// ```
  Chronos floorDays([int precision = 1]) => _roundingUnit(TimeUnit.day, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] weeks.
  ///
  /// [precision] - The week interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorWeeks(2); // rounds down to previous 2-week mark
  /// ```
  Chronos floorWeeks([int precision = 1]) => _roundingUnit(TimeUnit.week, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] months.
  ///
  /// [precision] - The month interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorMonths(3); // rounds down to previous 3-month mark
  /// ```
  Chronos floorMonths([int precision = 1]) => _roundingUnit(TimeUnit.month, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] quarters.
  ///
  /// [precision] - The quarter interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Q1
  /// final floored = date.floorQuarters(2); // rounds down to previous 2-quarter mark
  /// ```
  Chronos floorQuarters([int precision = 1]) => _roundingUnit(TimeUnit.quarter, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] years.
  ///
  /// [precision] - The year interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorYears(5); // rounds down to previous 5-year mark
  /// ```
  Chronos floorYears([int precision = 1]) => _roundingUnit(TimeUnit.year, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] decades.
  ///
  /// [precision] - The decade interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorDecades(2); // rounds down to previous 2-decade mark
  /// ```
  Chronos floorDecades([int precision = 1]) => _roundingUnit(TimeUnit.decade, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] centuries.
  ///
  /// [precision] - The century interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorCenturies(2); // rounds down to previous 2-century mark
  /// ```
  Chronos floorCenturies([int precision = 1]) => _roundingUnit(TimeUnit.century, precision, (n) => n.floor());

  /// Rounds down to the previous multiple of [precision] millennia.
  ///
  /// [precision] - The millennium interval to round down to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final floored = date.floorMillennia(2); // rounds down to previous 2-millennium mark
  /// ```
  Chronos floorMillennia([int precision = 1]) => _roundingUnit(TimeUnit.millennium, precision, (n) => n.floor());

  /// Rounds to the nearest microsecond.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final rounded = date.roundMicrosecond(); // rounds to nearest microsecond
  /// ```
  Chronos roundMicrosecond() => roundMicroseconds();

  /// Rounds to the nearest millisecond.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final rounded = date.roundMillisecond(); // rounds to nearest millisecond
  /// ```
  Chronos roundMillisecond() => roundMilliseconds();

  /// Rounds to the nearest second.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 600);
  /// final rounded = date.roundSecond(); // 2024-03-15 14:30:46.000 (rounds up)
  /// ```
  Chronos roundSecond() => roundSeconds();

  /// Rounds to the nearest minute.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rounded = date.roundMinute(); // 2024-03-15 14:31:00.000 (rounds up)
  /// ```
  Chronos roundMinute() => roundMinutes();

  /// Rounds to the nearest hour.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rounded = date.roundHour(); // 2024-03-15 15:00:00.000 (rounds up)
  /// ```
  Chronos roundHour() => roundHours();

  /// Rounds to the nearest day.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rounded = date.roundDay(); // 2024-03-16 00:00:00.000 (rounds up)
  /// ```
  Chronos roundDay() => roundDays();

  /// Rounds to the nearest week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Friday
  /// final rounded = date.roundWeek(); // rounds to nearest Monday
  /// ```
  Chronos roundWeek() => roundWeeks();

  /// Rounds to the nearest month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 20);
  /// final rounded = date.roundMonth(); // 2024-04-01 (rounds to April)
  /// ```
  Chronos roundMonth() => roundMonths();

  /// Rounds to the nearest quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 2, 15); // Q1
  /// final rounded = date.roundQuarter(); // rounds to nearest quarter start
  /// ```
  Chronos roundQuarter() => roundQuarters();

  /// Rounds to the nearest year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 8, 15);
  /// final rounded = date.roundYear(); // 2025-01-01 (rounds to 2025)
  /// ```
  Chronos roundYear() => roundYears();

  /// Rounds to the nearest decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final rounded = date.roundDecade(); // 2020-01-01 (rounds to 2020s)
  /// ```
  Chronos roundDecade() => roundDecades();

  /// Rounds to the nearest century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final rounded = date.roundCentury(); // 2001-01-01 (rounds to 21st century)
  /// ```
  Chronos roundCentury() => roundCenturies();

  /// Rounds to the nearest millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final rounded = date.roundMillennium(); // 2001-01-01 (rounds to 3rd millennium)
  /// ```
  Chronos roundMillennium() => roundMillennia();

  /// Rounds to the nearest multiple of [precision] microseconds.
  ///
  /// [precision] - The microsecond interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final rounded = date.roundMicroseconds(1000); // rounds to nearest 1000 microseconds
  /// ```
  Chronos roundMicroseconds([int precision = 1]) => _roundingUnit(TimeUnit.microsecond, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] milliseconds.
  ///
  /// [precision] - The millisecond interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45, 123);
  /// final rounded = date.roundMilliseconds(100); // rounds to nearest 100ms
  /// ```
  Chronos roundMilliseconds([int precision = 1]) => _roundingUnit(TimeUnit.millisecond, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] seconds.
  ///
  /// [precision] - The second interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rounded = date.roundSeconds(15); // rounds to nearest 15-second mark
  /// ```
  Chronos roundSeconds([int precision = 1]) => _roundingUnit(TimeUnit.second, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] minutes.
  ///
  /// [precision] - The minute interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rounded = date.roundMinutes(15); // rounds to nearest 15-minute mark
  /// ```
  Chronos roundMinutes([int precision = 1]) => _roundingUnit(TimeUnit.minute, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] hours.
  ///
  /// [precision] - The hour interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rounded = date.roundHours(6); // rounds to nearest 6-hour mark
  /// ```
  Chronos roundHours([int precision = 1]) => _roundingUnit(TimeUnit.hour, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] days.
  ///
  /// [precision] - The day interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rounded = date.roundDays(7); // rounds to nearest 7-day mark
  /// ```
  Chronos roundDays([int precision = 1]) => _roundingUnit(TimeUnit.day, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] weeks.
  ///
  /// [precision] - The week interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final rounded = date.roundWeeks(2); // rounds to nearest 2-week mark
  /// ```
  Chronos roundWeeks([int precision = 1]) => _roundingUnit(TimeUnit.week, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] months.
  ///
  /// [precision] - The month interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final rounded = date.roundMonths(3); // rounds to nearest 3-month mark
  /// ```
  Chronos roundMonths([int precision = 1]) => _roundingUnit(TimeUnit.month, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] quarters.
  ///
  /// [precision] - The quarter interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Q1
  /// final rounded = date.roundQuarters(2); // rounds to nearest 2-quarter mark
  /// ```
  Chronos roundQuarters([int precision = 1]) => _roundingUnit(TimeUnit.quarter, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] years.
  ///
  /// [precision] - The year interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final rounded = date.roundYears(5); // rounds to nearest 5-year mark
  /// ```
  Chronos roundYears([int precision = 1]) => _roundingUnit(TimeUnit.year, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] decades.
  ///
  /// [precision] - The decade interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final rounded = date.roundDecades(2); // rounds to nearest 2-decade mark
  /// ```
  Chronos roundDecades([int precision = 1]) => _roundingUnit(TimeUnit.decade, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] centuries.
  ///
  /// [precision] - The century interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final rounded = date.roundCenturies(2); // rounds to nearest 2-century mark
  /// ```
  Chronos roundCenturies([int precision = 1]) => _roundingUnit(TimeUnit.century, precision, (n) => n.round());

  /// Rounds to the nearest multiple of [precision] millennia.
  ///
  /// [precision] - The millennium interval to round to (default: 1)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final rounded = date.roundMillennia(2); // rounds to nearest 2-millennium mark
  /// ```
  Chronos roundMillennia([int precision = 1]) => _roundingUnit(TimeUnit.millennium, precision, (n) => n.round());

  Chronos _roundingUnit(TimeUnit unit, int precision, int Function(num) mathFunc) {
    final start = startOfUnit(unit);
    final diff = diffInUnit(unit, start);
    final rounded = mathFunc(diff / precision) * precision;

    return start.addUnit(unit, rounded);
  }
}
