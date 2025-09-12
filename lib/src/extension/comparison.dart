import 'package:flutter_chronos/flutter_chronos.dart';

/// Extension providing comparison methods for Chronos instances.
///
/// This extension allows you to compare dates, check if they're in specific
/// time periods, and determine relationships between different time units.
extension ChronosComparison on Chronos {
  /// Returns true if the date is in daylight saving time.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 7, 15); // Summer date
  /// final isDst = date.isDst; // true (if in DST timezone)
  /// ```
  bool get isDst => copyWith(year: 3000).timeZoneOffset != timeZoneOffset;

  /// Returns true if the date is in local timezone (not UTC).
  ///
  /// Example:
  /// ```dart
  /// final localDate = Chronos.now();
  /// final utcDate = Chronos.now().toUtc();
  /// print(localDate.isLocal); // true
  /// print(utcDate.isLocal); // false
  /// ```
  bool get isLocal => !isUtc;

  /// Returns true if the date is a Sunday.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 17); // Sunday
  /// print(date.isSunday); // true
  /// ```
  bool get isSunday => isoDayOfWeek == DateTime.sunday;

  /// Returns true if the date is a Monday.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 18); // Monday
  /// print(date.isMonday); // true
  /// ```
  bool get isMonday => isoDayOfWeek == DateTime.monday;

  /// Returns true if the date is a Tuesday.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 19); // Tuesday
  /// print(date.isTuesday); // true
  /// ```
  bool get isTuesday => isoDayOfWeek == DateTime.tuesday;

  /// Returns true if the date is a Wednesday.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 20); // Wednesday
  /// print(date.isWednesday); // true
  /// ```
  bool get isWednesday => isoDayOfWeek == DateTime.wednesday;

  /// Returns true if the date is a Thursday.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 21); // Thursday
  /// print(date.isThursday); // true
  /// ```
  bool get isThursday => isoDayOfWeek == DateTime.thursday;

  /// Returns true if the date is a Friday.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 22); // Friday
  /// print(date.isFriday); // true
  /// ```
  bool get isFriday => isoDayOfWeek == DateTime.friday;

  /// Returns true if the date is a Saturday.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 23); // Saturday
  /// print(date.isSaturday); // true
  /// ```
  bool get isSaturday => isoDayOfWeek == DateTime.saturday;

  /// Returns true if this date is in the same year as [other] (or current year if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15);
  /// final date2 = Chronos(2024, 8, 20);
  /// print(date1.isSameYear(date2)); // true
  /// print(date1.isSameYear()); // true if current year is 2024
  /// ```
  bool isSameYear([Chronos? other]) => isSameUnit(TimeUnit.year, other);

  /// Returns true if this date is in the same ISO year as [other] (or current ISO year if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 1, 1); // ISO year 2024
  /// final date2 = Chronos(2023, 12, 31); // ISO year 2024 (week starts in 2024)
  /// print(date1.isSameIsoYear(date2)); // true
  /// ```
  bool isSameIsoYear([Chronos? other]) => isSameUnit(TimeUnit.isoYear, other);

  /// Returns true if this date is in the same month as [other] (or current month if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15);
  /// final date2 = Chronos(2024, 3, 25);
  /// print(date1.isSameMonth(date2)); // true
  /// print(date1.isSameMonth()); // true if current month is March 2024
  /// ```
  bool isSameMonth([Chronos? other]) => isSameUnit(TimeUnit.month, other);

  /// Returns true if this date is in the same week as [other] (or current week if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 18); // Monday
  /// final date2 = Chronos(2024, 3, 22); // Friday (same week)
  /// print(date1.isSameWeek(date2)); // true
  /// ```
  bool isSameWeek([Chronos? other]) => isSameUnit(TimeUnit.week, other);

  /// Returns true if this date is in the same ISO week as [other] (or current ISO week if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 1, 1); // Monday (ISO week 1)
  /// final date2 = Chronos(2024, 1, 7); // Sunday (same ISO week)
  /// print(date1.isSameIsoWeek(date2)); // true
  /// ```
  bool isSameIsoWeek([Chronos? other]) => isSameUnit(TimeUnit.isoWeek, other);

  /// Returns true if this date is on the same day as [other] (or today if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 10, 30);
  /// final date2 = Chronos(2024, 3, 15, 18, 45);
  /// print(date1.isSameDay(date2)); // true (same day, different time)
  /// print(date1.isSameDay()); // true if today is March 15, 2024
  /// ```
  bool isSameDay([Chronos? other]) => isSameUnit(TimeUnit.day, other);

  /// Returns true if this date is in the same hour as [other] (or current hour if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45);
  /// final date2 = Chronos(2024, 3, 15, 14, 55, 20);
  /// print(date1.isSameHour(date2)); // true (both in 14:xx hour)
  /// ```
  bool isSameHour([Chronos? other]) => isSameUnit(TimeUnit.hour, other);

  /// Returns true if this date is in the same minute as [other] (or current minute if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 15);
  /// final date2 = Chronos(2024, 3, 15, 14, 30, 45);
  /// print(date1.isSameMinute(date2)); // true (both in 14:30:xx)
  /// ```
  bool isSameMinute([Chronos? other]) => isSameUnit(TimeUnit.minute, other);

  /// Returns true if this date is in the same second as [other] (or current second if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45, 100);
  /// final date2 = Chronos(2024, 3, 15, 14, 30, 45, 900);
  /// print(date1.isSameSecond(date2)); // true (both in 45th second)
  /// ```
  bool isSameSecond([Chronos? other]) => isSameUnit(TimeUnit.second, other);

  /// Returns true if this date is in the same millisecond as [other] (or current millisecond if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final date2 = Chronos(2024, 3, 15, 14, 30, 45, 123, 789);
  /// print(date1.isSameMillisecond(date2)); // true (both in 123rd millisecond)
  /// ```
  bool isSameMillisecond([Chronos? other]) =>
      isSameUnit(TimeUnit.millisecond, other);

  /// Returns true if this date is in the same microsecond as [other] (or current microsecond if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// final date2 = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  /// print(date1.isSameMicrosecond(date2)); // true (exact same time)
  /// ```
  bool isSameMicrosecond([Chronos? other]) =>
      isSameUnit(TimeUnit.microsecond, other);

  /// Returns true if this date is in the same millennium as [other] (or current millennium if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15);
  /// final date2 = Chronos(2500, 8, 20);
  /// print(date1.isSameMillennium(date2)); // true (both in 3rd millennium)
  /// ```
  bool isSameMillennium([Chronos? other]) =>
      isSameUnit(TimeUnit.millennium, other);

  /// Returns true if this date is in the same century as [other] (or current century if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15);
  /// final date2 = Chronos(2099, 12, 31);
  /// print(date1.isSameCentury(date2)); // true (both in 21st century)
  /// ```
  bool isSameCentury([Chronos? other]) => isSameUnit(TimeUnit.century, other);

  /// Returns true if this date is in the same decade as [other] (or current decade if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15);
  /// final date2 = Chronos(2029, 8, 20);
  /// print(date1.isSameDecade(date2)); // true (both in 2020s)
  /// ```
  bool isSameDecade([Chronos? other]) => isSameUnit(TimeUnit.decade, other);

  /// Returns true if this date is in the same quarter as [other] (or current quarter if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 1, 15); // Q1
  /// final date2 = Chronos(2024, 3, 20); // Q1
  /// final date3 = Chronos(2024, 4, 10); // Q2
  /// print(date1.isSameQuarter(date2)); // true
  /// print(date1.isSameQuarter(date3)); // false
  /// ```
  bool isSameQuarter([Chronos? other]) => isSameUnit(TimeUnit.quarter, other);

  /// Returns true if this date is in the same time unit as [other] (or current time if null).
  ///
  /// Example:
  /// ```dart
  /// final date1 = Chronos(2024, 3, 15, 14, 30, 45);
  /// final date2 = Chronos(2024, 3, 15, 16, 45, 30);
  /// print(date1.isSameUnit(TimeUnit.day, date2)); // true (same day)
  /// print(date1.isSameUnit(TimeUnit.hour, date2)); // false (different hour)
  /// ```
  bool isSameUnit(TimeUnit timeUnit, Chronos? other) {
    if (other == null) {
      return isCurrentUnit(timeUnit);
    }

    switch (timeUnit) {
      case TimeUnit.microsecond:
        return microsecond == other.microsecond &&
            isSameUnit(TimeUnit.millisecond, other);
      case TimeUnit.millisecond:
        return millisecond == other.millisecond &&
            isSameUnit(TimeUnit.second, other);
      case TimeUnit.second:
        return second == other.second && isSameUnit(TimeUnit.minute, other);
      case TimeUnit.minute:
        return minute == other.minute && isSameUnit(TimeUnit.hour, other);
      case TimeUnit.hour:
        return hour == other.hour && isSameUnit(TimeUnit.day, other);
      case TimeUnit.day:
        return day == other.day && isSameUnit(TimeUnit.month, other);
      case TimeUnit.week:
        return week == other.week && isSameUnit(TimeUnit.year, other);
      case TimeUnit.isoWeek:
        return isoWeek == other.isoWeek && isSameUnit(TimeUnit.isoYear, other);
      case TimeUnit.month:
        return month == other.month && isSameUnit(TimeUnit.year, other);
      case TimeUnit.quarter:
        return quarter == other.quarter && isSameUnit(TimeUnit.year, other);
      case TimeUnit.year:
        return year == other.year;
      case TimeUnit.isoYear:
        return isoYear == other.isoYear;
      case TimeUnit.decade:
        return decade == other.decade && isSameUnit(TimeUnit.century, other);
      case TimeUnit.century:
        return century == other.century &&
            isSameUnit(TimeUnit.millennium, other);
      case TimeUnit.millennium:
        return millennium == other.millennium;
    }
  }

  /// Returns true if this date is in the current year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// print(date.isCurrentYear); // true if current year is 2024
  /// ```
  bool get isCurrentYear => isCurrentUnit(TimeUnit.year);

  /// Returns true if this date is in the current ISO year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 1, 1);
  /// print(date.isCurrentIsoYear); // true if current ISO year is 2024
  /// ```
  bool get isCurrentIsoYear => isCurrentUnit(TimeUnit.isoYear);

  /// Returns true if this date is in the current month.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// print(date.isCurrentMonth); // true if current month is March 2024
  /// ```
  bool get isCurrentMonth => isCurrentUnit(TimeUnit.month);

  /// Returns true if this date is in the current week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 18);
  /// print(date.isCurrentWeek); // true if current week contains March 18, 2024
  /// ```
  bool get isCurrentWeek => isCurrentUnit(TimeUnit.week);

  /// Returns true if this date is in the current ISO week.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 1, 1);
  /// print(date.isCurrentIsoWeek); // true if current ISO week is week 1 of 2024
  /// ```
  bool get isCurrentIsoWeek => isCurrentUnit(TimeUnit.isoWeek);

  /// Returns true if this date is today.
  ///
  /// Example:
  /// ```dart
  /// final today = Chronos.now();
  /// final yesterday = today.subDays(1);
  /// print(today.isCurrentDay); // true
  /// print(yesterday.isCurrentDay); // false
  /// ```
  bool get isCurrentDay => isCurrentUnit(TimeUnit.day);

  /// Returns true if this date is in the current hour.
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos.now();
  /// final sameHour = now.copyWith(minute: 30);
  /// print(sameHour.isCurrentHour); // true
  /// ```
  bool get isCurrentHour => isCurrentUnit(TimeUnit.hour);

  /// Returns true if this date is in the current minute.
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos.now();
  /// final sameMinute = now.copyWith(second: 30);
  /// print(sameMinute.isCurrentMinute); // true
  /// ```
  bool get isCurrentMinute => isCurrentUnit(TimeUnit.minute);

  /// Returns true if this date is in the current second.
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos.now();
  /// final sameSecond = now.copyWith(millisecond: 500);
  /// print(sameSecond.isCurrentSecond); // true
  /// ```
  bool get isCurrentSecond => isCurrentUnit(TimeUnit.second);

  /// Returns true if this date is in the current millisecond.
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos.now();
  /// final sameMs = now.copyWith(microsecond: 500);
  /// print(sameMs.isCurrentMillisecond); // true
  /// ```
  bool get isCurrentMillisecond => isCurrentUnit(TimeUnit.millisecond);

  /// Returns true if this date is in the current microsecond.
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos.now();
  /// print(now.isCurrentMicrosecond); // true (exact current time)
  /// ```
  bool get isCurrentMicrosecond => isCurrentUnit(TimeUnit.microsecond);

  /// Returns true if this date is in the current millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// print(date.isCurrentMillennium); // true (3rd millennium: 2001-3000)
  /// ```
  bool get isCurrentMillennium => isCurrentUnit(TimeUnit.millennium);

  /// Returns true if this date is in the current century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// print(date.isCurrentCentury); // true (21st century: 2001-2100)
  /// ```
  bool get isCurrentCentury => isCurrentUnit(TimeUnit.century);

  /// Returns true if this date is in the current decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// print(date.isCurrentDecade); // true (2020s: 2020-2029)
  /// ```
  bool get isCurrentDecade => isCurrentUnit(TimeUnit.decade);

  /// Returns true if this date is in the current quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15); // Q1
  /// print(date.isCurrentQuarter); // true if current quarter is Q1 2024
  /// ```
  bool get isCurrentQuarter => isCurrentUnit(TimeUnit.quarter);

  bool isCurrentUnit(TimeUnit timeUnit) {
    Chronos now = Chronos.now();

    if (isUtc) {
      now = now.toUtc();
    }

    bool check(TimeUnit checkTimeUnit) {
      switch (checkTimeUnit) {
        case TimeUnit.microsecond:
          return microsecond == now.microsecond && check(TimeUnit.millisecond);
        case TimeUnit.millisecond:
          return millisecond == now.millisecond && check(TimeUnit.second);
        case TimeUnit.second:
          return second == now.second && check(TimeUnit.minute);
        case TimeUnit.minute:
          return minute == now.minute && check(TimeUnit.hour);
        case TimeUnit.hour:
          return hour == now.hour && check(TimeUnit.day);
        case TimeUnit.day:
          return day == now.day && check(TimeUnit.month);
        case TimeUnit.week:
          return week == now.week && check(TimeUnit.year);
        case TimeUnit.isoWeek:
          return isoWeek == now.isoWeek && check(TimeUnit.isoYear);
        case TimeUnit.month:
          return month == now.month && check(TimeUnit.year);
        case TimeUnit.quarter:
          return quarter == now.quarter && check(TimeUnit.year);
        case TimeUnit.year:
          return year == now.year;
        case TimeUnit.isoYear:
          return isoYear == now.isoYear;
        case TimeUnit.decade:
          return decade == now.decade && check(TimeUnit.century);
        case TimeUnit.century:
          return century == now.century && check(TimeUnit.millennium);
        case TimeUnit.millennium:
          return millennium == now.millennium;
      }
    }

    return check(timeUnit);
  }

  /// Returns true if this date is in the next year.
  ///
  /// Example:
  /// ```dart
  /// final nextYear = Chronos(2025, 3, 15);
  /// print(nextYear.isNextYear); // true if current year is 2024
  /// ```
  bool get isNextYear => isNextUnit(TimeUnit.year);

  /// Returns true if this date is in the next ISO year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2025, 1, 6); // ISO year 2025
  /// print(date.isNextIsoYear); // true if current ISO year is 2024
  /// ```
  bool get isNextIsoYear => isNextUnit(TimeUnit.isoYear);

  /// Returns true if this date is in the next month.
  ///
  /// Example:
  /// ```dart
  /// final nextMonth = Chronos(2024, 4, 15);
  /// print(nextMonth.isNextMonth); // true if current month is March 2024
  /// ```
  bool get isNextMonth => isNextUnit(TimeUnit.month);

  /// Returns true if this date is in the next week.
  ///
  /// Example:
  /// ```dart
  /// final nextWeek = Chronos.now().addWeeks(1);
  /// print(nextWeek.isNextWeek); // true
  /// ```
  bool get isNextWeek => isNextUnit(TimeUnit.week);

  /// Returns true if this date is in the next ISO week.
  ///
  /// Example:
  /// ```dart
  /// final nextIsoWeek = Chronos.now().addUnit(TimeUnit.isoWeek);
  /// print(nextIsoWeek.isNextIsoWeek); // true
  /// ```
  bool get isNextIsoWeek => isNextUnit(TimeUnit.isoWeek);

  /// Returns true if this date is tomorrow.
  ///
  /// Example:
  /// ```dart
  /// final tomorrow = Chronos.now().addDays(1);
  /// print(tomorrow.isNextDay); // true
  /// ```
  bool get isNextDay => isNextUnit(TimeUnit.day);

  /// Returns true if this date is in the next hour.
  ///
  /// Example:
  /// ```dart
  /// final nextHour = Chronos.now().addHours(1);
  /// print(nextHour.isNextHour); // true
  /// ```
  bool get isNextHour => isNextUnit(TimeUnit.hour);

  /// Returns true if this date is in the next minute.
  ///
  /// Example:
  /// ```dart
  /// final nextMinute = Chronos.now().addMinutes(1);
  /// print(nextMinute.isNextMinute); // true
  /// ```
  bool get isNextMinute => isNextUnit(TimeUnit.minute);

  /// Returns true if this date is in the next second.
  ///
  /// Example:
  /// ```dart
  /// final nextSecond = Chronos.now().addSeconds(1);
  /// print(nextSecond.isNextSecond); // true
  /// ```
  bool get isNextSecond => isNextUnit(TimeUnit.second);

  /// Returns true if this date is in the next millisecond.
  ///
  /// Example:
  /// ```dart
  /// final nextMs = Chronos.now().addMilliseconds(1);
  /// print(nextMs.isNextMillisecond); // true
  /// ```
  bool get isNextMillisecond => isNextUnit(TimeUnit.millisecond);

  /// Returns true if this date is in the next microsecond.
  ///
  /// Example:
  /// ```dart
  /// final nextMicro = Chronos.now().addMicroseconds(1);
  /// print(nextMicro.isNextMicrosecond); // true
  /// ```
  bool get isNextMicrosecond => isNextUnit(TimeUnit.microsecond);

  /// Returns true if this date is in the next millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(3001, 1, 1); // 4th millennium
  /// print(date.isNextMillennium); // true if current millennium is 3rd
  /// ```
  bool get isNextMillennium => isNextUnit(TimeUnit.millennium);

  /// Returns true if this date is in the next century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2101, 1, 1); // 22nd century
  /// print(date.isNextCentury); // true if current century is 21st
  /// ```
  bool get isNextCentury => isNextUnit(TimeUnit.century);

  /// Returns true if this date is in the next decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2030, 1, 1); // 2030s
  /// print(date.isNextDecade); // true if current decade is 2020s
  /// ```
  bool get isNextDecade => isNextUnit(TimeUnit.decade);

  /// Returns true if this date is in the next quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 4, 1); // Q2
  /// print(date.isNextQuarter); // true if current quarter is Q1 2024
  /// ```
  bool get isNextQuarter => isNextUnit(TimeUnit.quarter);

  bool isNextUnit(TimeUnit timeUnit) {
    Chronos now = Chronos.now();

    if (isUtc) {
      now = now.toUtc();
    }

    bool check(TimeUnit checkTimeUnit) {
      switch (checkTimeUnit) {
        case TimeUnit.microsecond:
          return isSameUnit(
            TimeUnit.microsecond,
            now.addUnit(TimeUnit.microsecond),
          );
        case TimeUnit.millisecond:
          return isSameUnit(
            TimeUnit.millisecond,
            now.addUnit(TimeUnit.millisecond),
          );
        case TimeUnit.second:
          return isSameUnit(TimeUnit.second, now.addUnit(TimeUnit.second));
        case TimeUnit.minute:
          return isSameUnit(TimeUnit.minute, now.addUnit(TimeUnit.minute));
        case TimeUnit.hour:
          return isSameUnit(TimeUnit.hour, now.addUnit(TimeUnit.hour));
        case TimeUnit.day:
          return isSameUnit(TimeUnit.day, now.addUnit(TimeUnit.day));
        case TimeUnit.week:
          return isSameUnit(TimeUnit.week, now.addUnit(TimeUnit.week));
        case TimeUnit.isoWeek:
          return isSameUnit(TimeUnit.isoWeek, now.addUnit(TimeUnit.isoWeek));
        case TimeUnit.month:
          return isSameUnit(TimeUnit.month, now.addUnit(TimeUnit.month));
        case TimeUnit.quarter:
          return isSameUnit(TimeUnit.quarter, now.addUnit(TimeUnit.quarter));
        case TimeUnit.year:
          return isSameUnit(TimeUnit.year, now.addUnit(TimeUnit.year));
        case TimeUnit.isoYear:
          return isSameUnit(TimeUnit.isoYear, now.addUnit(TimeUnit.isoYear));
        case TimeUnit.decade:
          return isSameUnit(TimeUnit.decade, now.addUnit(TimeUnit.decade));
        case TimeUnit.century:
          return isSameUnit(TimeUnit.century, now.addUnit(TimeUnit.century));
        case TimeUnit.millennium:
          return isSameUnit(
            TimeUnit.millennium,
            now.addUnit(TimeUnit.millennium),
          );
      }
    }

    return check(timeUnit);
  }

  /// Returns true if this date is in the last year.
  ///
  /// Example:
  /// ```dart
  /// final lastYear = Chronos(2023, 3, 15);
  /// print(lastYear.isLastYear); // true if current year is 2024
  /// ```
  bool get isLastYear => isLastUnit(TimeUnit.year);

  /// Returns true if this date is in the last ISO year.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023, 12, 31); // ISO year 2023
  /// print(date.isLastIsoYear); // true if current ISO year is 2024
  /// ```
  bool get isLastIsoYear => isLastUnit(TimeUnit.isoYear);

  /// Returns true if this date is in the last month.
  ///
  /// Example:
  /// ```dart
  /// final lastMonth = Chronos(2024, 2, 15);
  /// print(lastMonth.isLastMonth); // true if current month is March 2024
  /// ```
  bool get isLastMonth => isLastUnit(TimeUnit.month);

  /// Returns true if this date is in the last week.
  ///
  /// Example:
  /// ```dart
  /// final lastWeek = Chronos.now().subWeeks(1);
  /// print(lastWeek.isLastWeek); // true
  /// ```
  bool get isLastWeek => isLastUnit(TimeUnit.week);

  /// Returns true if this date is in the last ISO week.
  ///
  /// Example:
  /// ```dart
  /// final lastIsoWeek = Chronos.now().subUnit(TimeUnit.isoWeek);
  /// print(lastIsoWeek.isLastIsoWeek); // true
  /// ```
  bool get isLastIsoWeek => isLastUnit(TimeUnit.isoWeek);

  /// Returns true if this date is yesterday.
  ///
  /// Example:
  /// ```dart
  /// final yesterday = Chronos.now().subDays(1);
  /// print(yesterday.isLastDay); // true
  /// ```
  bool get isLastDay => isLastUnit(TimeUnit.day);

  /// Returns true if this date is in the last hour.
  ///
  /// Example:
  /// ```dart
  /// final lastHour = Chronos.now().subHours(1);
  /// print(lastHour.isLastHour); // true
  /// ```
  bool get isLastHour => isLastUnit(TimeUnit.hour);

  /// Returns true if this date is in the last minute.
  ///
  /// Example:
  /// ```dart
  /// final lastMinute = Chronos.now().subMinutes(1);
  /// print(lastMinute.isLastMinute); // true
  /// ```
  bool get isLastMinute => isLastUnit(TimeUnit.minute);

  /// Returns true if this date is in the last second.
  ///
  /// Example:
  /// ```dart
  /// final lastSecond = Chronos.now().subSeconds(1);
  /// print(lastSecond.isLastSecond); // true
  /// ```
  bool get isLastSecond => isLastUnit(TimeUnit.second);

  /// Returns true if this date is in the last millisecond.
  ///
  /// Example:
  /// ```dart
  /// final lastMs = Chronos.now().subMilliseconds(1);
  /// print(lastMs.isLastMillisecond); // true
  /// ```
  bool get isLastMillisecond => isLastUnit(TimeUnit.millisecond);

  /// Returns true if this date is in the last microsecond.
  ///
  /// Example:
  /// ```dart
  /// final lastMicro = Chronos.now().subMicroseconds(1);
  /// print(lastMicro.isLastMicrosecond); // true
  /// ```
  bool get isLastMicrosecond => isLastUnit(TimeUnit.microsecond);

  /// Returns true if this date is in the last millennium.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(1999, 12, 31); // 2nd millennium
  /// print(date.isLastMillennium); // true if current millennium is 3rd
  /// ```
  bool get isLastMillennium => isLastUnit(TimeUnit.millennium);

  /// Returns true if this date is in the last century.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(1999, 12, 31); // 20th century
  /// print(date.isLastCentury); // true if current century is 21st
  /// ```
  bool get isLastCentury => isLastUnit(TimeUnit.century);

  /// Returns true if this date is in the last decade.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2019, 12, 31); // 2010s
  /// print(date.isLastDecade); // true if current decade is 2020s
  /// ```
  bool get isLastDecade => isLastUnit(TimeUnit.decade);

  /// Returns true if this date is in the last quarter.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2023, 12, 31); // Q4 2023
  /// print(date.isLastQuarter); // true if current quarter is Q1 2024
  /// ```
  bool get isLastQuarter => isLastUnit(TimeUnit.quarter);

  bool isLastUnit(TimeUnit timeUnit) {
    Chronos now = Chronos.now();

    if (isUtc) {
      now = now.toUtc();
    }

    bool check(TimeUnit checkTimeUnit) {
      switch (checkTimeUnit) {
        case TimeUnit.microsecond:
          return isSameUnit(
            TimeUnit.microsecond,
            now.subUnit(TimeUnit.microsecond),
          );
        case TimeUnit.millisecond:
          return isSameUnit(
            TimeUnit.millisecond,
            now.subUnit(TimeUnit.millisecond),
          );
        case TimeUnit.second:
          return isSameUnit(TimeUnit.second, now.subUnit(TimeUnit.second));
        case TimeUnit.minute:
          return isSameUnit(TimeUnit.minute, now.subUnit(TimeUnit.minute));
        case TimeUnit.hour:
          return isSameUnit(TimeUnit.hour, now.subUnit(TimeUnit.hour));
        case TimeUnit.day:
          return isSameUnit(TimeUnit.day, now.subUnit(TimeUnit.day));
        case TimeUnit.week:
          return isSameUnit(TimeUnit.week, now.subUnit(TimeUnit.week));
        case TimeUnit.isoWeek:
          return isSameUnit(TimeUnit.isoWeek, now.subUnit(TimeUnit.isoWeek));
        case TimeUnit.month:
          return isSameUnit(TimeUnit.month, now.subUnit(TimeUnit.month));
        case TimeUnit.quarter:
          return isSameUnit(TimeUnit.quarter, now.subUnit(TimeUnit.quarter));
        case TimeUnit.year:
          return isSameUnit(TimeUnit.year, now.subUnit(TimeUnit.year));
        case TimeUnit.isoYear:
          return isSameUnit(TimeUnit.isoYear, now.subUnit(TimeUnit.isoYear));
        case TimeUnit.decade:
          return isSameUnit(TimeUnit.decade, now.subUnit(TimeUnit.decade));
        case TimeUnit.century:
          return isSameUnit(TimeUnit.century, now.subUnit(TimeUnit.century));
        case TimeUnit.millennium:
          return isSameUnit(
            TimeUnit.millennium,
            now.subUnit(TimeUnit.millennium),
          );
      }
    }

    return check(timeUnit);
  }

  /// Returns true if this date is a weekday (Monday to Friday).
  ///
  /// Example:
  /// ```dart
  /// final monday = Chronos(2024, 3, 18);
  /// final saturday = Chronos(2024, 3, 23);
  /// print(monday.isWeekday); // true
  /// print(saturday.isWeekday); // false
  /// ```
  bool get isWeekday => weekday <= DayOfWeek.friday.value;

  /// Returns true if this date is a weekend (Saturday or Sunday).
  ///
  /// Example:
  /// ```dart
  /// final friday = Chronos(2024, 3, 22);
  /// final saturday = Chronos(2024, 3, 23);
  /// print(friday.isWeekend); // false
  /// print(saturday.isWeekend); // true
  /// ```
  bool get isWeekend => !isWeekday;

  /// Returns true if this date is yesterday.
  ///
  /// Example:
  /// ```dart
  /// final yesterday = Chronos.now().subDays(1);
  /// final twoDaysAgo = Chronos.now().subDays(2);
  /// print(yesterday.isYesterday); // true
  /// print(twoDaysAgo.isYesterday); // false
  /// ```
  bool get isYesterday => this == Chronos.yesterday();

  /// Returns true if this date is today.
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos.now();
  /// final yesterday = now.subDays(1);
  /// print(now.isToday); // true
  /// print(yesterday.isToday); // false
  /// ```
  bool get isToday => this == Chronos.today();

  /// Returns true if this date is tomorrow.
  ///
  /// Example:
  /// ```dart
  /// final tomorrow = Chronos.now().addDays(1);
  /// final today = Chronos.now();
  /// print(tomorrow.isTomorrow); // true
  /// print(today.isTomorrow); // false
  /// ```
  bool get isTomorrow => this == Chronos.tomorrow();

  /// Returns true if this date is in the future.
  ///
  /// Example:
  /// ```dart
  /// final future = Chronos.now().addHours(1);
  /// final past = Chronos.now().subHours(1);
  /// print(future.isFuture); // true
  /// print(past.isFuture); // false
  /// ```
  bool get isFuture => this > Chronos.now();

  /// Returns true if this date is in the past.
  ///
  /// Example:
  /// ```dart
  /// final past = Chronos.now().subMinutes(30);
  /// final future = Chronos.now().addMinutes(30);
  /// print(past.isPast); // true
  /// print(future.isPast); // false
  /// ```
  bool get isPast => this < Chronos.now();

  /// Returns true if this date is now or in the future.
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos.now();
  /// final future = now.addSeconds(1);
  /// final past = now.subSeconds(1);
  /// print(future.isNowOrFuture); // true
  /// print(past.isNowOrFuture); // false
  /// ```
  bool get isNowOrFuture => this >= Chronos.now();

  /// Returns true if this date is now or in the past.
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos.now();
  /// final past = now.subSeconds(1);
  /// final future = now.addSeconds(1);
  /// print(past.isNowOrPast); // true
  /// print(future.isNowOrPast); // false
  /// ```
  bool get isNowOrPast => this <= Chronos.now();

  /// Returns true if this year is a leap year.
  ///
  /// Example:
  /// ```dart
  /// final leapYear = Chronos(2024, 1, 1);
  /// final normalYear = Chronos(2023, 1, 1);
  /// print(leapYear.isLeapYear); // true (2024 is divisible by 4)
  /// print(normalYear.isLeapYear); // false
  /// ```
  bool get isLeapYear =>
      (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);

  /// Returns true if this year has 53 weeks.
  ///
  /// Example:
  /// ```dart
  /// final longYear = Chronos(2020, 1, 1);
  /// print(longYear.isLongYear); // true if 2020 has 53 weeks
  /// ```
  bool get isLongYear => Chronos(year, 12, 28).weekOfIsoYear == 53;

  /// Returns true if this ISO year has 53 weeks.
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 1, 1);
  /// print(date.isLongIsoYear); // true if ISO year 2024 has 53 weeks
  /// ```
  bool get isLongIsoYear => Chronos(isoYear, 12, 28).weekOfIsoYear == 53;

  /// Returns true if this date is between [from] and [to] dates.
  ///
  /// [from] - The start date of the range
  /// [to] - The end date of the range
  /// [equal] - Whether to include the boundary dates (default: true)
  ///
  /// Example:
  /// ```dart
  /// final start = Chronos(2024, 3, 1);
  /// final end = Chronos(2024, 3, 31);
  /// final middle = Chronos(2024, 3, 15);
  /// final outside = Chronos(2024, 4, 1);
  ///
  /// print(middle.isBetween(start, end)); // true
  /// print(outside.isBetween(start, end)); // false
  /// print(start.isBetween(start, end, equal: false)); // false (exclusive)
  /// ```
  bool isBetween(Chronos from, Chronos to, {bool equal = true}) {
    final isAfterFrom = equal ? this >= from : this > from;
    final isBeforeTo = equal ? this <= to : this < to;

    return isAfterFrom && isBeforeTo;
  }

  /// Returns true if this date has the same month and day as [other] (birthday check).
  ///
  /// [other] - The date to compare with
  ///
  /// Example:
  /// ```dart
  /// final birthday = Chronos(1990, 3, 15);
  /// final thisYear = Chronos(2024, 3, 15);
  /// final notBirthday = Chronos(2024, 3, 16);
  ///
  /// print(thisYear.isBirthday(birthday)); // true (same month and day)
  /// print(notBirthday.isBirthday(birthday)); // false
  /// ```
  bool isBirthday(Chronos other) => month == other.month && day == other.day;

  /// Returns true if this date is the last day of the month.
  ///
  /// Example:
  /// ```dart
  /// final lastDay = Chronos(2024, 2, 29); // Last day of February 2024
  /// final notLastDay = Chronos(2024, 2, 28);
  /// print(lastDay.isLastOfMonth); // true
  /// print(notLastDay.isLastOfMonth); // false
  /// ```
  bool get isLastOfMonth => endOfMonth().isSameDay();

  bool get isStartOfDay => isStartOfUnit(TimeUnit.day);
  bool get isStartOfWeek => isStartOfUnit(TimeUnit.week);
  bool get isStartOfIsoWeek => isStartOfUnit(TimeUnit.isoWeek);
  bool get isStartOfMonth => isStartOfUnit(TimeUnit.month);
  bool get isStartOfQuarter => isStartOfUnit(TimeUnit.quarter);
  bool get isStartOfYear => isStartOfUnit(TimeUnit.year);
  bool get isStartOfIsoYear => isStartOfUnit(TimeUnit.isoYear);
  bool get isStartOfDecade => isStartOfUnit(TimeUnit.decade);
  bool get isStartOfCentury => isStartOfUnit(TimeUnit.century);
  bool get isStartOfMillennium => isStartOfUnit(TimeUnit.millennium);
  bool get isStartOfHour => isStartOfUnit(TimeUnit.hour);
  bool get isStartOfMinute => isStartOfUnit(TimeUnit.minute);
  bool get isStartOfSecond => isStartOfUnit(TimeUnit.second);
  bool get isStartOfMillisecond => isStartOfUnit(TimeUnit.millisecond);

  bool isStartOfUnit(TimeUnit timeUnit, [TimeUnit? accuracyUnit]) {
    switch (timeUnit) {
      case TimeUnit.millisecond:
        return isSameUnit(
          accuracyUnit ?? TimeUnit.microsecond,
          startOfUnit(timeUnit),
        );
      case TimeUnit.second:
        return isSameUnit(
          accuracyUnit ?? TimeUnit.millisecond,
          startOfUnit(timeUnit),
        );
      case TimeUnit.minute:
        return isSameUnit(
          accuracyUnit ?? TimeUnit.second,
          startOfUnit(timeUnit),
        );
      case TimeUnit.hour:
        return isSameUnit(
          accuracyUnit ?? TimeUnit.second,
          startOfUnit(timeUnit),
        );
      case TimeUnit.day:
        return isSameUnit(
          accuracyUnit ?? TimeUnit.second,
          startOfUnit(timeUnit),
        );
      case TimeUnit.week:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, startOfUnit(timeUnit));
      case TimeUnit.isoWeek:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, startOfUnit(timeUnit));
      case TimeUnit.month:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, startOfUnit(timeUnit));
      case TimeUnit.quarter:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, startOfUnit(timeUnit));
      case TimeUnit.year:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, startOfUnit(timeUnit));
      case TimeUnit.isoYear:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, startOfUnit(timeUnit));
      case TimeUnit.decade:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, startOfUnit(timeUnit));
      case TimeUnit.century:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, startOfUnit(timeUnit));
      case TimeUnit.millennium:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, startOfUnit(timeUnit));
      default:
        throw UnsupportedError('Unsupported unit: $timeUnit');
    }
  }

  bool get isEndOfDay => isEndOfUnit(TimeUnit.day);
  bool get isEndOfWeek => isEndOfUnit(TimeUnit.week);
  bool get isEndOfIsoWeek => isEndOfUnit(TimeUnit.isoWeek);
  bool get isEndOfMonth => isEndOfUnit(TimeUnit.month);
  bool get isEndOfQuarter => isEndOfUnit(TimeUnit.quarter);
  bool get isEndOfYear => isEndOfUnit(TimeUnit.year);
  bool get isEndOfIsoYear => isEndOfUnit(TimeUnit.isoYear);
  bool get isEndOfDecade => isEndOfUnit(TimeUnit.decade);
  bool get isEndOfCentury => isEndOfUnit(TimeUnit.century);
  bool get isEndOfMillennium => isEndOfUnit(TimeUnit.millennium);
  bool get isEndOfHour => isEndOfUnit(TimeUnit.hour);
  bool get isEndOfMinute => isEndOfUnit(TimeUnit.minute);
  bool get isEndOfSecond => isEndOfUnit(TimeUnit.second);
  bool get isEndOfMillisecond => isEndOfUnit(TimeUnit.millisecond);

  bool isEndOfUnit(TimeUnit timeUnit, [TimeUnit? accuracyUnit]) {
    switch (timeUnit) {
      case TimeUnit.millisecond:
        return isSameUnit(
          accuracyUnit ?? TimeUnit.microsecond,
          endOfUnit(timeUnit),
        );
      case TimeUnit.second:
        return isSameUnit(
          accuracyUnit ?? TimeUnit.millisecond,
          endOfUnit(timeUnit),
        );
      case TimeUnit.minute:
        return isSameUnit(accuracyUnit ?? TimeUnit.second, endOfUnit(timeUnit));
      case TimeUnit.hour:
        return isSameUnit(accuracyUnit ?? TimeUnit.second, endOfUnit(timeUnit));
      case TimeUnit.day:
        return isSameUnit(accuracyUnit ?? TimeUnit.second, endOfUnit(timeUnit));
      case TimeUnit.week:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, endOfUnit(timeUnit));
      case TimeUnit.isoWeek:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, endOfUnit(timeUnit));
      case TimeUnit.month:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, endOfUnit(timeUnit));
      case TimeUnit.quarter:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, endOfUnit(timeUnit));
      case TimeUnit.year:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, endOfUnit(timeUnit));
      case TimeUnit.isoYear:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, endOfUnit(timeUnit));
      case TimeUnit.decade:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, endOfUnit(timeUnit));
      case TimeUnit.century:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, endOfUnit(timeUnit));
      case TimeUnit.millennium:
        return isSameUnit(accuracyUnit ?? TimeUnit.day, endOfUnit(timeUnit));
      default:
        throw UnsupportedError('Unsupported unit: $timeUnit');
    }
  }

  Season get season {
    final offset = ChronosConfig().hemisphere == Hemisphere.northern ? 0 : 6;
    final shiftedMonth = (month + offset - 1) % 12 + 1;

    if (shiftedMonth >= Month.march.value && shiftedMonth <= Month.may.value) {
      return Season.spring;
    } else if (shiftedMonth >= Month.june.value &&
        shiftedMonth <= Month.august.value) {
      return Season.summer;
    } else if (shiftedMonth >= Month.september.value &&
        shiftedMonth <= Month.november.value) {
      return Season.fall;
    } else {
      return Season.winter;
    }
  }

  /// Returns true if this date is in spring season.
  ///
  /// Note: Season depends on hemisphere configuration in ChronosConfig.
  ///
  /// Example:
  /// ```dart
  /// final springDate = Chronos(2024, 4, 15); // April (Northern hemisphere)
  /// final winterDate = Chronos(2024, 1, 15); // January
  /// print(springDate.isInSpring); // true (Northern hemisphere)
  /// print(winterDate.isInSpring); // false
  /// ```
  bool get isInSpring => season == Season.spring;

  /// Returns true if this date is in summer season.
  ///
  /// Note: Season depends on hemisphere configuration in ChronosConfig.
  ///
  /// Example:
  /// ```dart
  /// final summerDate = Chronos(2024, 7, 15); // July (Northern hemisphere)
  /// final springDate = Chronos(2024, 4, 15); // April
  /// print(summerDate.isInSummer); // true (Northern hemisphere)
  /// print(springDate.isInSummer); // false
  /// ```
  bool get isInSummer => season == Season.summer;

  /// Returns true if this date is in fall/autumn season.
  ///
  /// Note: Season depends on hemisphere configuration in ChronosConfig.
  ///
  /// Example:
  /// ```dart
  /// final fallDate = Chronos(2024, 10, 15); // October (Northern hemisphere)
  /// final summerDate = Chronos(2024, 7, 15); // July
  /// print(fallDate.isInFall); // true (Northern hemisphere)
  /// print(summerDate.isInFall); // false
  /// ```
  bool get isInFall => season == Season.fall;

  /// Returns true if this date is in winter season.
  ///
  /// Note: Season depends on hemisphere configuration in ChronosConfig.
  ///
  /// Example:
  /// ```dart
  /// final winterDate = Chronos(2024, 1, 15); // January (Northern hemisphere)
  /// final fallDate = Chronos(2024, 10, 15); // October
  /// print(winterDate.isInWinter); // true (Northern hemisphere)
  /// print(fallDate.isInWinter); // false
  /// ```
  bool get isInWinter => season == Season.winter;
}
