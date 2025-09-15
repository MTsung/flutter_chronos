<p align="center">
  <img src="https://raw.githubusercontent.com/MTsung/flutter_chronos/refs/heads/main/img/dash_logo.png" width="100%" alt="Flutter Chronos" />
</p>

<p align="center">
  <a href="https://pub.dev/packages/flutter_chronos">
    <img src="https://img.shields.io/pub/v/flutter_chronos.svg" alt="Pub Version">
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT">
  </a>
</p>

Language: English | [繁體中文](https://github.com/MTsung/flutter_chronos/blob/main/README-ZH.md)

-----

## Introduction

Have you ever been looking for these features? Now, with Chronos, you can handle them effortlessly!

```dart
dt.ceilMinutes(5); // Ceil to the nearest 5 minutes ✅
dt.floorHours(6); // Floor to the nearest 6 hours ✅
dt.roundDays(3); // Round to the nearest 3 days ✅
dt.lerp(end, 0.5); // Get the midpoint between dt and end ✅
dt.firstOfMonth(IsoDayOfWeek.friday); // Get the first Friday of the month ✅
dt.toDateTimeString(); // "2024-02-29 14:30:45" ✅
dt.diffForHumans(); // "3 days ago" ✅
dt.isDst; // Check if in daylight saving time ✅
dt.isLeapYear; // Check if leap year ✅
dt.isLongYear; // Check if ISO long year ✅
dt.season; // Get the season ✅
dt > dt1; // Check if dt is later than dt1 ✅
dt.startOfCentury(); // Get the start of the current century ✅
dt.endOfMonth(); // Get the end of the current month ✅
dt.subMonths(3); // Subtract 3 months (without overflow) ✅
dt.addWeekdays(6); // Add 6 working days ✅
dt.addWeeks(2); // Add 2 weeks ✅
dt.isBetween(start, end); // Check if within a range ✅
range.overlaps(range1); // Check if time ranges overlap ✅
dt.max(dt1); // Get the later time ✅
dt.min(dt1); // Get the earlier time ✅
dt.diffInYear(dt1); // Calculate the difference in years (float) ✅
dt.setYear(2026); // Set the year ✅
dt.daysInMonth; // Number of days in the month ✅
dt.secondOfDay; // Number of seconds passed in the day ✅
dt.setDay(25).setHour(8); // Fluent interface ✅
```

Chronos extends Dart's native DateTime, providing you with more intuitive time manipulation methods, flexible week and month handling, convenient time formatting, and powerful time difference calculations in addition to the original basic functionality. This allows developers to complete complex date-time logic more quickly, reducing manual calculations and errors.

## Features

- featuring 700+ methods for add, sub, ceil, floor, round, is, of, in, diff, format, human format, set, mid, max, lerp, next, last, operator, overlaps, contains...
- Support for [ISO Week Calendar](https://en.wikipedia.org/wiki/ISO_week_date)
- Support for millennia, centuries, decades, years, ISO years, quarters, seasons (configurable for northern/southern hemispheres), weeks, ISO weeks, days, hours, minutes, seconds, milliseconds, microseconds.
- Get or set ISO weeks, week numbers, quarters, year positions; calculate specific weekdays in months, first/last days in quarters, etc.
- Support various unit time comparisons, range judgments, past/future checks, leap year checks, weekend/weekday checks, birthday checks, etc.
- Provide business day addition/subtraction, find next/previous business days or weekends for convenient business calendar calculations.
- Support fluent interface, allowing addition, subtraction, boundary setting, formatting operations to be completed in one line for more concise and readable code.
- Support common string formatting, integrating `intl` for direct display (date, time, datetime), ISO, RFC series standard formats, while preserving custom and localized formatting capabilities.
- Support time difference display, integrating `timeago` for direct relative time difference display like "5 minutes ago", "2 days later", convenient for presenting readable time information in UI.
- Provide complete time unit reading and setting methods, quickly get years, quarters, week numbers, days, hours, minutes, seconds, milliseconds, microseconds, and set specific units or copy from other dates.
- Direct use of operators for judgment and arithmetic operations, improving code readability and accelerating development.
- Get time unit positions like "what day of the week is today", "what microsecond of the month", supporting all units.
- Determine local time or UTC, timezone names, timezone offsets, daylight saving time for convenient cross-timezone applications.
- Set current time (Fake Now) for more convenient unit testing.

---

# Instantiation

## Basic Constructors

```dart
// Create specific date time
Chronos date = Chronos(2023, 12, 25);
Chronos dateTime = Chronos(2023, 12, 25, 14, 30, 45);

// UTC time
Chronos utcDate = Chronos.utc(2023, 12, 25, 12, 0);

// Create from milliseconds
Chronos fromMs = Chronos.fromMillisecondsSinceEpoch(1703505600000);

// Create from microseconds
Chronos fromMicro = Chronos.fromMicrosecondsSinceEpoch(1703505600000000);
```

## Static Methods

```dart
// Parse string
Chronos parsed = Chronos.parse('2023-12-25T14:30:00');
Chronos? tryParsed = Chronos.tryParse('2023-12-25T14:30:00');
Chronos parseTime = Chronos.parseTime('14:30:00');
Chronos? tryParseTime = Chronos.tryParseTime('14:30:00');

// Create from Unix timestamp
Chronos fromTimestamp = Chronos.fromTimestamp(1703505600);

// Convert from DateTime
Chronos fromDateTime = Chronos.fromDateTime(DateTime.now());

// Get current time
Chronos now = Chronos.now();
Chronos today = Chronos.today();      // Today 00:00:00
Chronos tomorrow = Chronos.tomorrow(); // Tomorrow 00:00:00
Chronos yesterday = Chronos.yesterday(); // Yesterday 00:00:00
```

# Getters

## Basic Properties

```dart
Chronos date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750); // Leap year February 29th

// Basic time units
print(date.year);        // 2024
print(date.month);       // 2
print(date.day);         // 29
print(date.hour);        // 14
print(date.minute);      // 30
print(date.second);      // 45
print(date.millisecond); // 500
print(date.microsecond); // 750

// Week related
print(date.weekday);     // 4 (ISO weekday, 1=Monday, 7=Sunday)
print(date.dayOfWeek);   // 4 (weekday, 0=Sunday, 6=Saturday)
print(date.isoDayOfWeek); // 4 (same as weekday)

// Other time units
print(date.quarter);     // 1 (first quarter)
print(date.week);        // 9 (9th week of year)
print(date.isoWeek);     // 9 (ISO week number)
print(date.decade);      // 203 (203rd decade)
print(date.century);     // 21 (21st century)
print(date.millennium);  // 3 (3rd millennium)

// Timestamp related
print(date.timestamp);           // 1709188245 (Unix timestamp, seconds)
print(date.millisecondsSinceEpoch); // 1709188245500 (millisecond timestamp)
print(date.microsecondsSinceEpoch);  // 1709188245500750 (microsecond timestamp)
```

## Timezone Related

```dart
print(date.getTimeZone());     // "CST" (timezone name)
print(date.getTimeZoneOffset()); // 8:00:00.000000 (timezone offset)
print(date.isUtc);             // false (is UTC)
print(date.isLocal);           // true (is local time)
print(date.isDst);             // false (is daylight saving time)
```

## Weekday Checks

```dart
print(date.isSunday);    // false (is Sunday)
print(date.isMonday);    // false (is Monday)
print(date.isTuesday);   // false (is Tuesday)
print(date.isWednesday); // false (is Wednesday)
print(date.isThursday);  // true (is Thursday)
print(date.isFriday);    // false (is Friday)
print(date.isSaturday);  // false (is Saturday)
print(date.isWeekday);   // true (is weekday)
print(date.isWeekend);   // false (is weekend)
```

## Time Checks

```dart
print(date.isToday);      // false (is today, assuming today is not 2024/2/29)
print(date.isTomorrow);   // false (is tomorrow)
print(date.isYesterday);  // false (is yesterday)
print(date.isFuture);     // false (is future, assuming now is after 2024)
print(date.isPast);       // true (is past)
print(date.isLeapYear);   // true (is leap year, 2024 is leap year)
```

## Season Related

```dart
print(date.season);       // Season.winter (season, February is winter in northern hemisphere)
print(date.isInSpring);   // false (is spring)
print(date.isInSummer);   // false (is summer)
print(date.isInFall);     // false (is fall)
print(date.isInWinter);   // true (is winter)
```

# Setters

## Setting Date Time

```dart
Chronos date = Chronos.now();

// Set complete date
Chronos newDate = date.setDate(2023, month: 12, day: 25);

// Set time
Chronos newTime = date.setTime(hour: 14, minute: 30, second: 45);

// Copy date/time from other Chronos
Chronos other = Chronos(2023, 1, 1, 12, 0);
Chronos copyDate = date.setDateFrom(other);
Chronos copyTime = date.setTimeFrom(other);

// Set individual units
Chronos setYear = date.setYear(2024);
Chronos setMonth = date.setMonth(6);
Chronos setDay = date.setDay(15);
Chronos setHour = date.setHour(9);
Chronos setMinute = date.setMinute(30);
Chronos setSecond = date.setSecond(0);
Chronos setMs = date.setMillisecond(500);
Chronos setMicro = date.setMicrosecond(750);

// Set timestamp
Chronos setTimestamp = date.setTimestamp(1703505600);

// Set week related
Chronos setWeek = date.setWeek(25);           // Set week of year
Chronos setIsoWeek = date.setIsoWeek(25);     // Set ISO week
Chronos setDayOfWeek = date.setDayOfWeek(3);  // Set day of week
Chronos setIsoDayOfWeek = date.setIsoDayOfWeek(3); // Set ISO day of week
```

# Week Related Features

## Week Start and End

```dart
Chronos date = Chronos.now();

// Week boundaries (Sunday as week start)
Chronos startOfWeek = date.startOfWeek();     // Sunday 00:00:00
Chronos endOfWeek = date.endOfWeek();         // Saturday 23:59:59

// ISO week boundaries (Monday as week start)
Chronos startOfIsoWeek = date.startOfIsoWeek(); // Monday 00:00:00
Chronos endOfIsoWeek = date.endOfIsoWeek();     // Sunday 23:59:59
```

## Week Number Calculations

```dart
print(date.week);        // 9 (9th week of year)
print(date.isoWeek);     // 9 (ISO week number)
print(date.weekOfYear);  // 9 (week of year)
print(date.weekOfMonth); // 5 (5th week of month)
```

## Weekday Operations

```dart
// Next/previous weekday
Chronos nextWorkday = date.nextWeekday();
Chronos prevWorkday = date.previousWeekday();

// Next/previous weekend
Chronos nextWeekend = date.nextWeekendDay();
Chronos prevWeekend = date.previousWeekendDay();

// Add/subtract weekdays
Chronos addWorkdays = date.addWeekdays(5);  // Add 5 weekdays
Chronos subWorkdays = date.subWeekdays(3);  // Subtract 3 weekdays
```

## Specific Weekdays in Month

```dart
// First Monday of month
Chronos firstMonday = date.firstOfMonth(IsoDayOfWeek.monday);

// Last Friday of month
Chronos lastFriday = date.lastOfMonth(IsoDayOfWeek.friday);

// First Wednesday of quarter
Chronos firstWed = date.firstOfQuarter(IsoDayOfWeek.wednesday);

// Last Sunday of year
Chronos lastSun = date.lastOfYear(IsoDayOfWeek.sunday);
```

# Fluent Interface

Chronos supports method chaining for more concise and readable code:

```dart
Chronos result = Chronos.now()
    .startOfDay()
    .addDays(7)
    .setHour(14)
    .setMinute(30);

Chronos complex = Chronos(2023, 1, 1)
    .addMonths(6)
    .startOfMonth()
    .addWeeks(2)
    .endOfWeek();
```

# String Formatting

## Basic Formats

```dart
Chronos date = Chronos(2024, 2, 29, 14, 30, 45);

// Basic formats
print(date.toDateString());           // "2024-02-29"
print(date.toTimeString());           // "14:30:45"
print(date.toDateTimeString());       // "2024-02-29 14:30:45"
print(date.toFormattedDateString());  // "Feb 29, 2024"
print(date.toFormattedDayDateString()); // "Thu, Feb 29, 2024"
print(date.toDayDateTimeString());    // "Thu, Feb 29, 2024 2:30 PM"
```

## Standard Formats

```dart
// ISO 8601 and other standard formats (requires UTC time)
Chronos utcDate = Chronos.utc(2024, 2, 29, 14, 30, 45);
print(utcDate.toIso8601String());        // "2024-02-29T14:30:45.000Z"
print(utcDate.toDateTimeLocalString());  // "2024-02-29T14:30:45"
print(utcDate.toRfc3339String());        // "2024-02-29T14:30:45+00:00"
print(utcDate.toRfc822String());         // "Thu, 29 Feb 24 14:30:45 +0000"
print(utcDate.toRfc850String());         // "Thursday, 29-Feb-24 14:30:45 UTC"
print(utcDate.toRfc1036String());        // "Thu, 29 Feb 24 14:30:45 +0000"
print(utcDate.toRfc1123String());        // "Thu, 29 Feb 2024 14:30:45 +0000"
print(utcDate.toRfc2822String());        // "Thu, 29 Feb 2024 14:30:45 +0000"
print(utcDate.toRfc7231String());        // "Thu, 29 Feb 2024 14:30:45 GMT"
print(utcDate.toAtomString());           // "2024-02-29T14:30:45+00:00"
print(utcDate.toW3cString());            // "2024-02-29T14:30:45+00:00"
print(utcDate.toRssString());            // "Thu, 29 Feb 2024 14:30:45 +0000"
print(utcDate.toCookieString());         // "Thursday, 29-Feb-2024 14:30:45 UTC"
```

## Common formats

```dart
final toStringChronos = Chronos(2023, 12, 25, 14, 30, 45);

await Chronos.initI18n(); // init i18n for format

print(toStringChronos.toString_d()); // 25
print(toStringChronos.toString_E()); // Mon
print(toStringChronos.toString_EEEE()); // Monday
print(toStringChronos.toString_EEEEE()); // M
print(toStringChronos.toString_LLL()); // Dec
print(toStringChronos.toString_LLLL()); // December
print(toStringChronos.toString_M()); // 12
print(toStringChronos.toString_Md()); // 12/25
print(toStringChronos.toString_MEd()); // Mon, 12/25
print(toStringChronos.toString_MMM()); // Dec
print(toStringChronos.toString_MMMd()); // Dec 25
print(toStringChronos.toString_MMMEd()); // Mon, Dec 25
print(toStringChronos.toString_MMMM()); // December
print(toStringChronos.toString_MMMMd()); // December 25
print(toStringChronos.toString_MMMMEEEEd()); // Monday, December 25
print(toStringChronos.toString_QQQ()); // Q4
print(toStringChronos.toString_QQQQ()); // 4th quarter
print(toStringChronos.toString_y()); // 2023
print(toStringChronos.toString_yM()); // 12/2023
print(toStringChronos.toString_yMd()); // 12/25/2023
print(toStringChronos.toString_yMEd()); // Mon, 12/25/2023
print(toStringChronos.toString_yMMM()); // Dec 2023
print(toStringChronos.toString_yMMMd()); // Dec 25, 2023
print(toStringChronos.toString_yMMMEd()); // Mon, Dec 25, 2023
print(toStringChronos.toString_yMMMM()); // December 2023
print(toStringChronos.toString_yMMMMd()); // December 25, 2023
print(toStringChronos.toString_yMMMMEEEEd()); // Monday, December 25, 2023
print(toStringChronos.toString_yQQQ()); // Q4 2023
print(toStringChronos.toString_yQQQQ()); // 4th quarter 2023
print(toStringChronos.toString_H()); // 14
print(toStringChronos.toString_Hm()); // 14:30
print(toStringChronos.toString_Hms()); // 14:30:45
print(toStringChronos.toString_j()); // 2 PM
print(toStringChronos.toString_jm()); // 2:30 PM
print(toStringChronos.toString_jms()); // 2:30:45 PM
print(toStringChronos.toString_m()); // 30
print(toStringChronos.toString_ms()); // 30:45
print(toStringChronos.toString_s()); // 45
```

## Custom Formatting

Chronos uses the [intl](https://pub.dev/packages/intl) package for more formatting options.

```dart
import 'package:intl/intl.dart';

Chronos date = Chronos(2024, 2, 29, 14, 30, 45);

// Custom formats
String formatted1 = date.format('yyyy-MM-dd HH:mm:ss'); // "2024-02-29 14:30:45"
String formatted2 = date.format('yyyy年MM月dd日');        // "2024年02月29日"
String formatted3 = date.format('EEEE, MMMM d, y');     // "Thursday, February 29, 2024"

// Localized formats
await Chronos.initI18n(); // init i18n for format
String zhTW = date.format('yyyy年MM月dd日 EEEE', 'zh_TW'); // "2024年02月29日 星期四"

```

# Operator Overloading

Chronos supports standard comparison and arithmetic operators:

```dart
Chronos date1 = Chronos(2024, 2, 28);  // February 28, 2024
Chronos date2 = Chronos(2024, 2, 29);  // February 29, 2024 (leap day)

// Comparison operators
print(date1 < date2);   // true (less than)
print(date1 <= date2);  // true (less than or equal)
print(date1 > date2);   // false (greater than)
print(date1 >= date2);  // false (greater than or equal)
print(date1 == date2);  // false (equal)

// Arithmetic operators
Chronos futureDate = date1 + Duration(days: 7);    // 2024-03-06 (addition)
Chronos pastDate = date1 - Duration(hours: 2);     // 2024-02-27 22:00:00 (subtraction)

// Chained operations
Chronos result = Chronos(2024, 2, 29) + Duration(days: 1) - Duration(hours: 3); // 2024-02-29 21:00:00.000
```
# Comparisons

## Same Unit Comparisons

```dart
Chronos date1 = Chronos(2024, 2, 29, 14, 30);  // February 29, 2024 14:30
Chronos date2 = Chronos(2024, 2, 29, 16, 45);  // February 29, 2024 16:45

// Compare if same time unit
print(date1.isSameYear(date2));         // true (same year)
print(date1.isSameIsoYear(date2));      // true (same ISO year)
print(date1.isSameMonth(date2));        // true (same month)
print(date1.isSameWeek(date2));         // true (same week)
print(date1.isSameIsoWeek(date2));      // true (same ISO week)
print(date1.isSameDay(date2));          // true (same day)
print(date1.isSameHour(date2));         // false (different hour)
print(date1.isSameMinute(date2));       // false (different minute)
print(date1.isSameSecond(date2));       // false (different second)
print(date1.isSameMillisecond(date2));  // false (different millisecond)
print(date1.isSameMicrosecond(date2));  // false (different microsecond)
print(date1.isSameQuarter(date2));      // true (same quarter, first quarter)
print(date1.isSameDecade(date2));       // true (same decade, 2021s)
print(date1.isSameCentury(date2));      // true (same century, 21st century)
print(date1.isSameMillennium(date2));   // true (same millennium, 3rd millennium)

// Compare with current time (assuming now is March 15, 2025)
print(date1.isCurrentYear);        // false (is current year)
print(date1.isCurrentIsoYear);     // false (is current ISO year)
print(date1.isCurrentMonth);       // false (is current month)
print(date1.isCurrentWeek);        // false (is current week)
print(date1.isCurrentIsoWeek);     // false (is current ISO week)
print(date1.isCurrentDay);         // false (is today)
print(date1.isCurrentHour);        // false (is current hour)
print(date1.isCurrentMinute);      // false (is current minute)
print(date1.isCurrentSecond);      // false (is current second)
print(date1.isCurrentQuarter);     // false (is current quarter)
print(date1.isCurrentDecade);      // true (is current decade, 2021s)
print(date1.isCurrentCentury);     // true (is current century, 21st century)
print(date1.isCurrentMillennium);  // true (is current millennium, 3rd millennium)

// Next time unit (relative to February 29, 2024)
print(date1.isNextYear);           // false (is next year, 2025)
print(date1.isNextMonth);          // false (is next month, March)
print(date1.isNextWeek);           // false (is next week)
print(date1.isNextDay);            // false (is tomorrow, March 1)
print(date1.isNextHour);           // false (is next hour, 15:00)

// Previous time unit (relative to February 29, 2024)
print(date1.isLastYear);           // false (is last year, 2023)
print(date1.isLastMonth);          // false (is last month, January)
print(date1.isLastWeek);           // false (is last week)
print(date1.isLastDay);            // false (is yesterday, February 28)
print(date1.isLastHour);           // false (is last hour, 13:00)
```

## Time Range Comparisons

```dart
Chronos start = Chronos(2024, 1, 1);     // January 1, 2024
Chronos end = Chronos(2024, 12, 31);     // December 31, 2024
Chronos check = Chronos(2024, 2, 29);    // February 29, 2024 (leap day)

// Check if within range
print(check.isBetween(start, end));           // true (within range)
print(check.isBetween(start, end, equal: false)); // true (excluding boundaries, but still within range)

// Birthday comparison
Chronos birthday = Chronos(1996, 2, 29); // Born February 29, 1996
print(check.isBirthday(birthday));            // true (same month and day, both February 29)
```
## Boundary Checks

```dart
Chronos date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);

// Check if start of time unit
print(date.isStartOfDay);         // false (not 00:00:00)
print(date.isStartOfWeek);        // false (not Sunday 00:00:00)
print(date.isStartOfIsoWeek);     // false (not Monday 00:00:00)
print(date.isStartOfMonth);       // false (not February 1 00:00:00)
print(date.isStartOfQuarter);     // false (not January 1 00:00:00)
print(date.isStartOfYear);        // false (not January 1 00:00:00)
print(date.isStartOfIsoYear);     // false (not ISO year start)
print(date.isStartOfDecade);      // false (not January 1, 2021 00:00:00)
print(date.isStartOfCentury);     // false (not January 1, 2001 00:00:00)
print(date.isStartOfMillennium);  // false (not January 1, 2001 00:00:00)
print(date.isStartOfHour);        // false (not 14:00:00)
print(date.isStartOfMinute);      // false (not 14:30:00)
print(date.isStartOfSecond);      // false (not 14:30:45.000)
print(date.isStartOfMillisecond); // false (not 14:30:45.500000)

// Check if end of time unit
print(date.isEndOfDay);           // false (not 23:59:59.999)
print(date.isEndOfWeek);          // false (not Saturday 23:59:59.999)
print(date.isEndOfIsoWeek);       // false (not Sunday 23:59:59.999)
print(date.isEndOfMonth);         // true (February 29 is last day of February)
print(date.isEndOfQuarter);       // false (not March 31 23:59:59.999)
print(date.isEndOfYear);          // false (not December 31 23:59:59.999)
print(date.isEndOfIsoYear);       // false (not ISO year end)
print(date.isEndOfDecade);        // false (not December 31, 2030 23:59:59.999)
print(date.isEndOfCentury);       // false (not December 31, 2100 23:59:59.999)
print(date.isEndOfMillennium);    // false (not December 31, 3000 23:59:59.999)
print(date.isEndOfHour);          // false (not 14:59:59.999)
print(date.isEndOfMinute);        // false (not 14:30:59.999)
print(date.isEndOfSecond);        // false (not 14:30:45.999)
print(date.isEndOfMillisecond);   // false (not 14:30:45.500999)
print(date.isLastOfMonth);        // true (February 29 is last day of February)

// Other special checks
print(date.isLongYear);           // false (2024 has 52 weeks, not 53)
print(date.isLongIsoYear);        // false (2024 ISO year has 52 weeks, not 53)
print(date.isNowOrFuture);        // false (assuming now is 2025, so it's past)
print(date.isNowOrPast);          // true (assuming now is 2025, so it's past or now)
```

# Addition and Subtraction

## Single Unit Operations

```dart
Chronos date = Chronos.now();

// Addition (singular)
Chronos addMicro = date.addMicrosecond();    // Add 1 microsecond
Chronos addMilli = date.addMillisecond();    // Add 1 millisecond
Chronos addSec = date.addSecond();           // Add 1 second
Chronos addMin = date.addMinute();           // Add 1 minute
Chronos addHour = date.addHour();            // Add 1 hour
Chronos addDay = date.addDay();              // Add 1 day
Chronos addWeek = date.addWeek();            // Add 1 week
Chronos addMonth = date.addMonth();          // Add 1 month
Chronos addYear = date.addYear();            // Add 1 year

// Subtraction (singular)
Chronos subDay = date.subDay();              // Subtract 1 day
Chronos subWeek = date.subWeek();            // Subtract 1 week
Chronos subMonth = date.subMonth();          // Subtract 1 month
Chronos subYear = date.subYear();            // Subtract 1 year
```

## Multiple Unit Operations

```dart
// Addition (plural)
Chronos add5Days = date.addDays(5);          // Add 5 days
Chronos add3Weeks = date.addWeeks(3);        // Add 3 weeks
Chronos add6Months = date.addMonths(6);      // Add 6 months
Chronos add2Years = date.addYears(2);        // Add 2 years

// Subtraction (plural)
Chronos sub10Days = date.subDays(10);        // Subtract 10 days
Chronos sub2Months = date.subMonths(2);      // Subtract 2 months
Chronos sub5Years = date.subYears(5);        // Subtract 5 years
```
## Special Unit Operations

```dart
// Quarter operations
Chronos addQuarter = date.addQuarter();      // Add 1 quarter
Chronos add2Quarters = date.addQuarters(2);  // Add 2 quarters

// Decades, centuries, millennia
Chronos addDecade = date.addDecade();        // Add 10 years
Chronos addCentury = date.addCentury();      // Add 100 years
Chronos addMillennium = date.addMillennium(); // Add 1000 years

// ISO related
Chronos addIsoWeek = date.addIsoWeek();      // Add 1 ISO week
Chronos addIsoYear = date.addIsoYear();      // Add 1 ISO year
```

## Generic Unit Operations

```dart
// Use TimeUnit enum for addition
Chronos result1 = date.addUnit(TimeUnit.day, 5);         // Add 5 days
Chronos result2 = date.addUnit(TimeUnit.month, 3);       // Add 3 months
Chronos result3 = date.addUnit(TimeUnit.hour, 12);       // Add 12 hours
Chronos result4 = date.addUnit(TimeUnit.quarter, 2);     // Add 2 quarters
Chronos result5 = date.addUnit(TimeUnit.decade, 1);      // Add 1 decade

// Use TimeUnit enum for subtraction
Chronos result6 = date.subUnit(TimeUnit.week, 2);        // Subtract 2 weeks
Chronos result7 = date.subUnit(TimeUnit.year, 5);        // Subtract 5 years
Chronos result8 = date.subUnit(TimeUnit.century, 1);     // Subtract 1 century

// Generic unit difference calculation
double diff1 = date1.diffInUnit(TimeUnit.day, date2);    // Day difference
double diff2 = date1.diffInUnit(TimeUnit.hour, date2);   // Hour difference
double diff3 = date1.diffInUnit(TimeUnit.month, date2);  // Month difference
```

# Difference Calculations

## Basic Differences

```dart
Chronos date1 = Chronos(2023, 1, 1);
Chronos date2 = Chronos(2023, 12, 31);

// Basic difference calculation
Duration diff = date1.diff(date2);           // Get Duration
Duration difference = date1.difference(date2); // Same as above

// Various unit differences
double years = date1.diffInYears(date2);         // Year difference
double months = date1.diffInMonths(date2);       // Month difference
double weeks = date1.diffInWeeks(date2);         // Week difference
double days = date1.diffInDays(date2);           // Day difference
double hours = date1.diffInHours(date2);         // Hour difference
double minutes = date1.diffInMinutes(date2);     // Minute difference
double seconds = date1.diffInSeconds(date2);     // Second difference
double millis = date1.diffInMilliseconds(date2); // Millisecond difference
double micros = date1.diffInMicroseconds(date2); // Microsecond difference
```

## Special Difference Calculations

```dart
// Quarters and larger units
double quarters = date1.diffInQuarters(date2);   // Quarter difference
double decades = date1.diffInDecade(date2);      // Decade difference
double centuries = date1.diffInCentury(date2);   // Century difference
double millennia = date1.diffInMillennium(date2); // Millennium difference

// Weekday differences
int weekdays = date1.diffInWeekdays(date2);      // Weekday difference
int weekends = date1.diffInWeekend(date2);       // Weekend day difference

// Filtered day differences
int filteredDays = date1.diffInDaysFiltered(date2, (d) => d.isWeekday);
```
## Time Unit Positions

```dart
Chronos date = Chronos.now();

// Microsecond level positions (based on 2024-02-29 14:30:45.500750)
print(date.microsecondOfMillisecond); // 750 (750th microsecond of millisecond)
print(date.microsecondOfSecond);      // 500750 (500750th microsecond of second)
print(date.microsecondOfMinute);      // 45500750 (45500750th microsecond of minute)
print(date.microsecondOfHour);        // 1845500750 (1845500750th microsecond of hour)
print(date.microsecondOfDay);         // 52245500750 (52245500750th microsecond of day)
print(date.microsecondOfWeek);        // 397845500750 (397845500750th microsecond of week)
print(date.microsecondOfMonth);       // 2471445500750 (2471445500750th microsecond of month)
print(date.microsecondOfQuarter);     // 5149845500750 (5149845500750th microsecond of quarter)
print(date.microsecondOfYear);        // 5149845500750 (5149845500750th microsecond of year)
print(date.microsecondOfIsoYear);     // 5149845500750 (5149845500750th microsecond of ISO year)
print(date.microsecondOfDecade);      // (microseconds in decade)
print(date.microsecondOfCentury);     // 730909845500750 (microseconds in century)
print(date.microsecondOfMillennium);  // 730909845500750 (microseconds in millennium)

// Millisecond level positions (based on 2024-02-29 14:30:45.500)
print(date.millisecondOfSecond);      // 500 (500th millisecond of second)
print(date.millisecondOfMinute);      // 45500 (45500th millisecond of minute)
print(date.millisecondOfHour);        // 1845500 (1845500th millisecond of hour)
print(date.millisecondOfDay);         // 52245500 (52245500th millisecond of day)
print(date.millisecondOfWeek);        // 365919500 (365919500th millisecond of week)
print(date.millisecondOfMonth);       // 2505645500 (2505645500th millisecond of month)
print(date.millisecondOfQuarter);     // 5097645500 (5097645500th millisecond of quarter)
print(date.millisecondOfYear);        // 5097645500 (5097645500th millisecond of year)
print(date.millisecondOIsofYear);     // 5097645500 (5097645500th millisecond of ISO year)
print(date.millisecondOfDecade);      // (milliseconds in decade)
print(date.millisecondOfCentury);     // 757785645500 (milliseconds in century)
print(date.millisecondOfMillennium);  // 63745785645500 (milliseconds in millennium)

// Second level positions (based on 2024-02-29 14:30:45)
print(date.secondOfMinute);           // 45 (45th second of minute)
print(date.secondOfHour);             // 1845 (1845th second of hour)
print(date.secondOfDay);              // 52245 (52245th second of day)
print(date.secondOfWeek);             // 365919 (365919th second of week)
print(date.secondOfMonth);            // 2505645 (2505645th second of month)
print(date.secondOfQuarter);          // 5097645 (5097645th second of quarter)
print(date.secondOfYear);             // 5097645 (5097645th second of year)
print(date.secondOfIsoYear);          // 5097645 (5097645th second of ISO year)
print(date.secondOfDecade);           // (seconds in decade)
print(date.secondOfCentury);          // 757785645 (seconds in century)
print(date.secondOfMillennium);       // 63745785645 (seconds in millennium)

// Minute level positions (based on 2024-02-29 14:30)
print(date.minuteOfHour);             // 30 (30th minute of hour)
print(date.minuteOfDay);              // 870 (870th minute of day)
print(date.minuteOfWeek);             // 6099 (6099th minute of week)
print(date.minuteOfMonth);            // 41760 (41760th minute of month)
print(date.minuteOfQuarter);          // 84960 (84960th minute of quarter)
print(date.minuteOfYear);             // 84960 (84960th minute of year)
print(date.minuteOfIsoYear);          // 84960 (84960th minute of ISO year)
print(date.minuteOfDecade);           // (minutes in decade)
print(date.minuteOfCentury);          // 12629760 (minutes in century)
print(date.minuteOfMillennium);       // 1062429760 (minutes in millennium)

// Hour level positions (based on 2024-02-29 14:30)
print(date.hourOfDay);                // 14 (14th hour of day)
print(date.hourOfWeek);               // 110 (110th hour of week)
print(date.hourOfMonth);              // 694 (694th hour of month)
print(date.hourOfQuarter);            // 1414 (1414th hour of quarter)
print(date.hourOfYear);               // 1414 (1414th hour of year)
print(date.hourOfIsoYear);            // 1414 (1414th hour of ISO year)
print(date.hourOfDecade);             // (hours in decade)
print(date.hourOfCentury);            // 210496 (hours in century)
print(date.hourOfMillennium);         // 17707496 (hours in millennium)

// Day level positions (based on 2024-02-29)
print(date.dayOfWeek);                // 4 (4th day of week, Thursday)
print(date.dayOfMonth);               // 29 (29th day of month)
print(date.dayOfQuarter);             // 60 (60th day of quarter)
print(date.dayOfYear);                // 60 (60th day of year)
print(date.dayOfIsoYear);             // 60 (60th day of ISO year)
print(date.dayOfDecade);              // (day of decade)
print(date.dayOfCentury);             // 8791 (8791st day of century)
print(date.dayOfMillennium);          // 737791 (737791st day of millennium)

// Week level positions
print(date.weekOfMonth);              // 5 (5th week of month)
print(date.weekOfQuarter);            // Week of quarter
print(date.weekOfYear);               // 9 (9th week of year)
print(date.weekOfIsoYear);            // 9 (9th week of ISO year)
print(date.weekOfDecade);             // Week of decade
print(date.weekOfCentury);            // Week of century
print(date.weekOfMillennium);         // Week of millennium

// Month level positions
print(date.monthOfQuarter);           // 2 (2nd month of quarter)
print(date.monthOfYear);              // 2 (2nd month of year)
print(date.monthOfIsoYear);           // 2 (2nd month of ISO year)
print(date.monthOfDecade);            // Month of decade
print(date.monthOfCentury);           // Month of century
print(date.monthOfMillennium);        // Month of millennium

// Quarter level positions
print(date.quarterOfYear);            // 1 (1st quarter of year)
print(date.quarterOfIsoYear);         // 1 (1st quarter of ISO year)
print(date.quarterOfDecade);          // Quarter of decade
print(date.quarterOfCentury);         // Quarter of century
print(date.quarterOfMillennium);      // Quarter of millennium

// Year level positions
print(date.yearOfDecade);             // 5 (5th year of decade, 2024 in 2020s)
print(date.yearOfCentury);            // 24 (24th year of century)
print(date.yearOfMillennium);         // 24 (24th year of millennium)

// Decade level positions
print(date.decadeOfCentury);          // Decade of century
print(date.decadeOfMillennium);       // Decade of millennium

// Century level positions
print(date.centuryOfMillennium);      // Century of millennium
```
## Time Unit Capacities

```dart
// Microsecond capacities
print(date.microsecondsInMillisecond); // Microseconds in millisecond (1000)
print(date.microsecondsInSecond);      // Microseconds in second (1,000,000)
print(date.microsecondsInMinute);      // Microseconds in minute
print(date.microsecondsInHour);        // Microseconds in hour
print(date.microsecondsInDay);         // Microseconds in day
print(date.microsecondsInWeek);        // Microseconds in week
print(date.microsecondsInMonth);       // Microseconds in month
print(date.microsecondsInQuarter);     // Microseconds in quarter
print(date.microsecondsInYear);        // Microseconds in year
print(date.microsecondsInDecade);      // Microseconds in decade
print(date.microsecondsInCentury);     // Microseconds in century
print(date.microsecondsInMillennium);  // Microseconds in millennium

// Millisecond capacities
print(date.millisecondsInSecond);      // Milliseconds in second (1000)
print(date.millisecondsInMinute);      // Milliseconds in minute
print(date.millisecondsInHour);        // Milliseconds in hour
print(date.millisecondsInDay);         // Milliseconds in day
print(date.millisecondsInWeek);        // Milliseconds in week
print(date.millisecondsInMonth);       // Milliseconds in month
print(date.millisecondsInQuarter);     // Milliseconds in quarter
print(date.millisecondsInYear);        // Milliseconds in year
print(date.millisecondsInDecade);      // Milliseconds in decade
print(date.millisecondsInCentury);     // Milliseconds in century
print(date.millisecondsInMillennium);  // Milliseconds in millennium

// Second capacities
print(date.secondsInMinute);           // Seconds in minute (60)
print(date.secondsInHour);             // Seconds in hour (3600)
print(date.secondsInDay);              // Seconds in day
print(date.secondsInWeek);             // Seconds in week
print(date.secondsInMonth);            // Seconds in month
print(date.secondsInQuarter);          // Seconds in quarter
print(date.secondsInYear);             // Seconds in year
print(date.secondsInDecade);           // Seconds in decade
print(date.secondsInCentury);          // Seconds in century
print(date.secondsInMillennium);       // Seconds in millennium

// Minute capacities (based on 2024-02-29, leap year February)
print(date.minutesInHour);             // 60 (minutes in hour)
print(date.minutesInDay);              // 1440 (minutes in day)
print(date.minutesInWeek);             // 10080 (minutes in week)
print(date.minutesInMonth);            // 41760 (minutes in February 2024, 29 days)
print(date.minutesInQuarter);          // 131040 (minutes in Q1 2024)
print(date.minutesInYear);             // 527040 (minutes in 2024, leap year)
print(date.minutesInDecade);           // 5260320 (minutes in 2020s)
print(date.minutesInCentury);          // 52596000 (minutes in 21st century)
print(date.minutesInMillennium);       // 525949920 (minutes in 3rd millennium)

// Hour capacities (based on 2024-02-29, leap year February)
print(date.hoursInDay);                // 24 (hours in day)
print(date.hoursInWeek);               // 168 (hours in week)
print(date.hoursInMonth);              // 696 (hours in February 2024, 29 days)
print(date.hoursInQuarter);            // 2184 (hours in Q1 2024)
print(date.hoursInYear);               // 8784 (hours in 2024, leap year)
print(date.hoursInDecade);             // 87672 (hours in 2020s)
print(date.hoursInCentury);            // 876600 (hours in 21st century)
print(date.hoursInMillennium);         // 8765832 (hours in 3rd millennium)

// Day capacities (based on 2024-02-29, leap year February)
print(date.daysInWeek);                // 7 (days in week)
print(date.daysInMonth);               // 29 (days in February 2024, leap year)
print(date.daysInQuarter);             // 91 (days in Q1 2024)
print(date.daysInYear);                // 366 (days in 2024, leap year)
print(date.daysInDecade);              // 3653 (days in 2020s)
print(date.daysInCentury);             // 36525 (days in 21st century)
print(date.daysInMillennium);          // 365243 (days in 3rd millennium)

// Week capacities
print(date.weeksInMonth);              // Weeks in month
print(date.weeksInQuarter);            // Weeks in quarter
print(date.weeksInYear);               // Weeks in year
print(date.weeksInDecade);             // Weeks in decade
print(date.weeksInCentury);            // Weeks in century
print(date.weeksInMillennium);         // Weeks in millennium

// Month capacities
print(date.monthsInQuarter);           // Months in quarter (3)
print(date.monthsInYear);              // Months in year (12)
print(date.monthsInDecade);            // Months in decade
print(date.monthsInCentury);           // Months in century
print(date.monthsInMillennium);        // Months in millennium

// Quarter capacities
print(date.quartersInYear);            // Quarters in year (4)
print(date.quartersInDecade);          // Quarters in decade
print(date.quartersInCentury);         // Quarters in century
print(date.quartersInMillennium);      // Quarters in millennium

// Year capacities
print(date.yearsInDecade);             // Years in decade (10)
print(date.yearsInCentury);            // Years in century (100)
print(date.yearsInMillennium);         // Years in millennium (1000)

// Decade capacities
print(date.decadesInCentury);          // Decades in century (10)
print(date.decadesInMillennium);       // Decades in millennium (100)

// Century capacities
print(date.centuriesInMillennium);     // Centuries in millennium (10)
```
# Time Difference Display

Chronos uses the [timeago](https://pub.dev/packages/timeago) package to provide time difference display functionality.

## Basic Usage

```dart
Chronos past = Chronos(2024, 2, 26);     // 3 days ago (assuming today is 2024/2/29)
Chronos future = Chronos(2024, 2, 29, 16, 30); // 2 hours later (assuming now is 14:30)

// Basic humanized display (default English)
print(past.diffForHumans());     // "3 days ago"
print(future.diffForHumans());   // "in 2 hours"

// Specify language - Traditional Chinese
print(past.diffForHumans(locale: 'zh_TW'));     // "3天前"
print(future.diffForHumans(locale: 'zh_TW'));   // "2小時後"

// Specify language - Simplified Chinese
print(past.diffForHumans(locale: 'zh_CN'));        // "3天前"
print(future.diffForHumans(locale: 'zh_CN'));      // "2小時后"
```

## Advanced Settings

```dart
Chronos someTime = Chronos(2024, 2, 28, 10, 30);
Chronos referenceTime = Chronos(2024, 2, 29, 14, 30);

// Specify reference time point (instead of using current time)
print(someTime.diffForHumans(clock: referenceTime)); // "a day ago"

// Allow showing "from now" (future time)
print(future.diffForHumans(allowFromNow: true));     // "about a year ago"

print(someTime.diffForHumans(
  locale: 'zh_TW',
  clock: referenceTime,
  allowFromNow: true
)); // "約1天 前"
```

## Supported Languages

The timeago package supports multiple languages, commonly used ones include:

```dart
// English (default)
print(date.diffForHumans());                    // "3 days ago"

// Traditional Chinese
print(date.diffForHumans(locale: 'zh_TW'));     // "3天前"

// Simplified Chinese  
print(date.diffForHumans(locale: 'zh'));        // "3天前"

// Japanese
print(date.diffForHumans(locale: 'ja'));        // "3日前"

// Korean
print(date.diffForHumans(locale: 'ko'));        // "3일 전"

// For other languages, please refer to timeago package documentation
```

## Common Time Difference Examples

```dart
Chronos now = Chronos.now();

// Seconds ago/later
Chronos seconds = now.subSeconds(30);
print(seconds.diffForHumans(locale: 'zh_TW'));  // "30秒前"

// Minutes ago/later  
Chronos minutes = now.subMinutes(15);
print(minutes.diffForHumans(locale: 'zh_TW'));  // "15分鐘前"

// Hours ago/later
Chronos hours = now.subHours(3);
print(hours.diffForHumans(locale: 'zh_TW'));    // "3小時前"

// Days ago/later
Chronos days = now.subDays(5);
print(days.diffForHumans(locale: 'zh_TW'));     // "5天前"

// Weeks ago/later
Chronos weeks = now.subWeeks(2);
print(weeks.diffForHumans(locale: 'zh_TW'));    // "2週前"

// Months ago/later
Chronos months = now.subMonths(3);
print(months.diffForHumans(locale: 'zh_TW'));   // "3個月前"

// Years ago/later
Chronos years = now.subYears(2);
print(years.diffForHumans(locale: 'zh_TW'));    // "2年前"
```

## Practical Application Examples

```dart
// Social media post time
Chronos postTime = Chronos(2024, 2, 28, 15, 30);
String timeAgo = postTime.diffForHumans(locale: 'zh_TW');
print('Posted $timeAgo'); // "Posted 1天前"

// File modification time
Chronos fileModified = Chronos(2024, 2, 29, 10, 0);
String modifiedTime = fileModified.diffForHumans(locale: 'zh_TW');
print('File modified: $modifiedTime'); // "File modified: 4小時前"

// Event countdown
Chronos eventTime = Chronos(2024, 3, 1, 18, 0);
String countdown = eventTime.diffForHumans(
  locale: 'zh_TW',
  allowFromNow: true
);
print('Event starts: $countdown'); // "Event starts: 1天後"
```
# Time Range (ChronosRange)

The ChronosRange class provides time range operation functionality, allowing you to define a time period and perform various range-related operations.

## Creating Time Ranges

```dart
// Create work hours range (9:00 AM - 5:00 PM)
final workDay = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),   // 9:00 AM
  Chronos(2024, 3, 15, 17, 0),  // 5:00 PM
);

// Create meeting time range
final meeting = ChronosRange(
  Chronos(2024, 3, 15, 14, 0),  // 2:00 PM
  Chronos(2024, 3, 15, 15, 30), // 3:30 PM
);

// Create instant range (start and end time are the same)
final instant = ChronosRange(
  Chronos(2024, 3, 15, 12, 0),
  Chronos(2024, 3, 15, 12, 0),
);
```

## Range Properties

```dart
final range = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),
  Chronos(2024, 3, 15, 17, 0),
);

// Get range duration
print(range.duration); // 8:00:00.000000 (8 hours)

// Check if range is empty (start time equals end time)
print(range.isEmpty); // false

// Get start and end times
print(range.start); // 2024-03-15 09:00:00.000
print(range.end);   // 2024-03-15 17:00:00.000
```

## Contains Check

```dart
final businessHours = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),   // 9:00 AM
  Chronos(2024, 3, 15, 17, 0),  // 5:00 PM
);

final lunchTime = Chronos(2024, 3, 15, 12, 30); // 12:30 PM
final evening = Chronos(2024, 3, 15, 19, 0);    // 7:00 PM
final startTime = Chronos(2024, 3, 15, 9, 0);   // 9:00 AM (boundary)

// Check if time is within range (including boundaries)
print(businessHours.contains(lunchTime)); // true (within business hours)
print(businessHours.contains(evening));   // false (after business hours)
print(businessHours.contains(startTime)); // true (boundary time is also included)
```

## Range Overlap Check

```dart
final morning = ChronosRange(
  Chronos(2024, 3, 15, 8, 0),   // 8:00 AM
  Chronos(2024, 3, 15, 12, 0),  // 12:00 PM
);

final afternoon = ChronosRange(
  Chronos(2024, 3, 15, 12, 0),  // 12:00 PM
  Chronos(2024, 3, 15, 17, 0),  // 5:00 PM
);

final lunch = ChronosRange(
  Chronos(2024, 3, 15, 11, 30), // 11:30 AM
  Chronos(2024, 3, 15, 13, 0),  // 1:00 PM
);

// Check if ranges overlap (default excludes endpoints)
print(morning.overlaps(afternoon));        // false (only touching at endpoints)
print(morning.overlaps(afternoon, false)); // true (including endpoint contact)
print(morning.overlaps(lunch));            // true (actual overlap)
print(lunch.overlaps(afternoon));          // true (spans across noon time)
```

## Range Intersection

```dart
final meeting1 = ChronosRange(
  Chronos(2024, 3, 15, 10, 0),  // 10:00 AM
  Chronos(2024, 3, 15, 12, 0),  // 12:00 PM
);

final meeting2 = ChronosRange(
  Chronos(2024, 3, 15, 11, 0),  // 11:00 AM
  Chronos(2024, 3, 15, 14, 0),  // 2:00 PM
);

// Calculate intersection of two ranges
final conflict = meeting1.intersect(meeting2);
if (conflict != null) {
  print(conflict); // 2024-03-15 11:00:00.000 ~ 2024-03-15 12:00:00.000
  print('Meeting conflict time: ${conflict.duration}'); // Meeting conflict time: 1:00:00.000000
}

// No overlapping ranges
final noOverlap = ChronosRange(
  Chronos(2024, 3, 15, 15, 0),  // 3:00 PM
  Chronos(2024, 3, 15, 16, 0),  // 4:00 PM
);

final noConflict = meeting1.intersect(noOverlap);
print(noConflict); // null (no intersection)
```

## Practical Application Examples

```dart
// Work scheduling system
final workShift = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),
  Chronos(2024, 3, 15, 17, 0),
);

final breakTime = ChronosRange(
  Chronos(2024, 3, 15, 12, 0),
  Chronos(2024, 3, 15, 13, 0),
);

// Check if break time is within work hours
if (workShift.contains(breakTime.start) && workShift.contains(breakTime.end)) {
  print('Break time is properly scheduled');
}

// Meeting room booking system
final existingBooking = ChronosRange(
  Chronos(2024, 3, 15, 14, 0),
  Chronos(2024, 3, 15, 16, 0),
);

final newBooking = ChronosRange(
  Chronos(2024, 3, 15, 15, 0),
  Chronos(2024, 3, 15, 17, 0),
);

if (existingBooking.overlaps(newBooking)) {
  final overlap = existingBooking.intersect(newBooking);
  print('Booking conflict! Overlap time: $overlap');
} else {
  print('Booking successful!');
}

// Event time management
final event = ChronosRange(
  Chronos(2024, 3, 15, 19, 0),  // 7:00 PM
  Chronos(2024, 3, 15, 22, 0),  // 10:00 PM
);

final now = Chronos.now();
if (event.contains(now)) {
  print('Event is in progress');
} else if (now < event.start) {
  final timeUntil = event.start.diff(now);
  print('Event starts in ${timeUntil.inHours} hours');
} else {
  print('Event has ended');
}
```

## String Representation

```dart
final range = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),
  Chronos(2024, 3, 15, 17, 0),
);

// Default string format
print(range.toString());
// Output: 2024-03-15 09:00:00.000 ~ 2024-03-15 17:00:00.000

// Can combine with Chronos formatting functionality
print('Work hours: ${range.start.format('HH:mm')} - ${range.end.format('HH:mm')}');
// Output: Work hours: 09:00 - 17:00
```

## Period List

```dart
final range = ChronosRange(Chronos(2025, 1, 1), Chronos(2025, 1, 5));
print(range.period(TimeUnit.day));        // Get List
print(range.period(TimeUnit.day, 2));     // Get List
print(range.period(TimeUnit.hour, 23));   // Get List
```

# Modifiers

## Boundary Modifiers

```dart
Chronos date = Chronos.now();

// Start boundaries
Chronos startDay = date.startOfDay();         // Today 00:00:00
Chronos startWeek = date.startOfWeek();       // Sunday 00:00:00
Chronos startMonth = date.startOfMonth();     // Beginning of month 00:00:00
Chronos startYear = date.startOfYear();       // Beginning of year 00:00:00
Chronos startHour = date.startOfHour();       // Top of hour 00:00
Chronos startMinute = date.startOfMinute();   // Top of minute 00 seconds

// End boundaries
Chronos endDay = date.endOfDay();             // Today 23:59:59.999
Chronos endWeek = date.endOfWeek();           // Saturday 23:59:59.999
Chronos endMonth = date.endOfMonth();         // End of month 23:59:59.999
Chronos endYear = date.endOfYear();           // End of year 23:59:59.999

// Season boundaries
Chronos startSeason = date.startOfSeason();   // Season start
Chronos endSeason = date.endOfSeason();       // Season end

// Generic boundary methods
Chronos startUnit = date.startOfUnit(TimeUnit.month);
Chronos endUnit = date.endOfUnit(TimeUnit.quarter);
```

## Copy and Clone

```dart
// Copy instance
Chronos copy1 = date.copy();
Chronos copy2 = date.clone();  // Same as copy()

// Copy with parameters
Chronos modified = date.copyWith(
  year: 2024,
  month: 6,
  day: 15,
  hour: 12
);
```

## Utility Modifiers

```dart
Chronos date1 = Chronos(2023, 6, 15, 14, 30);
Chronos date2 = Chronos(2023, 8, 20, 16, 45);

// Linear interpolation
Chronos middle = date1.lerp(date2, 0.5);     // Midpoint between two times
Chronos quarter = date1.lerp(date2, 0.25);   // 1/4 position

// Midpoint calculation
Chronos mid = date1.mid(date2);              // Same as lerp(date2, 0.5)

// Closest/farthest
Chronos now = Chronos.now();
Chronos closest = now.closest(date1, date2);   // Closest to now
Chronos farthest = now.farthest(date1, date2); // Farthest from now

// Min/max
Chronos min = date1.min(date2);              // Earlier time
Chronos max = date1.max(date2);              // Later time

// Multiple time comparisons
Chronos earliest = date1.min(date2, [now, Chronos(2023, 1, 1)]);
Chronos latest = date1.max(date2, [now, Chronos(2023, 12, 31)]);
```

# Rounding

## Basic Rounding

```dart
Chronos date = Chronos(2023, 6, 15, 14, 37, 42, 567, 890);

// Ceiling (ceil) - all time units
Chronos ceilMicro = date.ceilMicrosecond();      // Ceil microsecond
Chronos ceilMilli = date.ceilMillisecond();      // Ceil millisecond
Chronos ceilSec = date.ceilSecond();             // Ceil second
Chronos ceilMin = date.ceilMinute();             // Ceil minute
Chronos ceilHour = date.ceilHour();              // Ceil hour
Chronos ceilDay = date.ceilDay();                // Ceil day
Chronos ceilWeek = date.ceilWeek();              // Ceil week
Chronos ceilMonth = date.ceilMonth();            // Ceil month
Chronos ceilQuarter = date.ceilQuarter();        // Ceil quarter
Chronos ceilYear = date.ceilYear();              // Ceil year
Chronos ceilDecade = date.ceilDecade();          // Ceil decade
Chronos ceilCentury = date.ceilCentury();        // Ceil century
Chronos ceilMillennium = date.ceilMillennium();  // Ceil millennium

// Floor - all time units
Chronos floorMicro = date.floorMicrosecond();      // Floor microsecond
Chronos floorMilli = date.floorMillisecond();      // Floor millisecond
Chronos floorSec = date.floorSecond();             // Floor second
Chronos floorMin = date.floorMinute();             // Floor minute
Chronos floorHour = date.floorHour();              // Floor hour
Chronos floorDay = date.floorDay();                // Floor day
Chronos floorWeek = date.floorWeek();              // Floor week
Chronos floorMonth = date.floorMonth();            // Floor month
Chronos floorQuarter = date.floorQuarter();        // Floor quarter
Chronos floorYear = date.floorYear();              // Floor year
Chronos floorDecade = date.floorDecade();          // Floor decade
Chronos floorCentury = date.floorCentury();        // Floor century
Chronos floorMillennium = date.floorMillennium();  // Floor millennium

// Round - all time units
Chronos roundMicro = date.roundMicrosecond();      // Round microsecond
Chronos roundMilli = date.roundMillisecond();      // Round millisecond
Chronos roundSec = date.roundSecond();             // Round second
Chronos roundMin = date.roundMinute();             // Round minute
Chronos roundHour = date.roundHour();              // Round hour
Chronos roundDay = date.roundDay();                // Round day
Chronos roundWeek = date.roundWeek();              // Round week
Chronos roundMonth = date.roundMonth();            // Round month
Chronos roundQuarter = date.roundQuarter();        // Round quarter
Chronos roundYear = date.roundYear();              // Round year
Chronos roundDecade = date.roundDecade();          // Round decade
Chronos roundCentury = date.roundCentury();        // Round century
Chronos roundMillennium = date.roundMillennium();  // Round millennium
```

## Precision Rounding

```dart
// Ceiling to specified precision (ceil) - all time units
Chronos ceilMicros = date.ceilMicroseconds(100);    // Ceil to 100 microsecond precision
Chronos ceilMillis = date.ceilMilliseconds(50);     // Ceil to 50 millisecond precision
Chronos ceilSecs = date.ceilSeconds(30);            // Ceil to 30 second precision
Chronos ceil10Min = date.ceilMinutes(10);           // Ceil to 10 minute precision
Chronos ceil4Hour = date.ceilHours(4);              // Ceil to 4 hour precision
Chronos ceil3Days = date.ceilDays(3);               // Ceil to 3 day precision
Chronos ceil2Weeks = date.ceilWeeks(2);             // Ceil to 2 week precision
Chronos ceil3Months = date.ceilMonths(3);           // Ceil to 3 month precision
Chronos ceil2Quarters = date.ceilQuarters(2);       // Ceil to 2 quarter precision
Chronos ceil5Years = date.ceilYears(5);             // Ceil to 5 year precision
Chronos ceil2Decades = date.ceilDecades(2);         // Ceil to 2 decade precision
Chronos ceil5Centuries = date.ceilCenturies(5);     // Ceil to 5 century precision
Chronos ceil2Millennia = date.ceilMillennia(2);     // Ceil to 2 millennium precision

// Floor to specified precision (floor) - all time units
Chronos floorMicros = date.floorMicroseconds(500);  // Floor to 500 microsecond precision
Chronos floorMillis = date.floorMilliseconds(100);  // Floor to 100 millisecond precision
Chronos floorSecs = date.floorSeconds(15);          // Floor to 15 second precision
Chronos floor30Min = date.floorMinutes(30);         // Floor to 30 minute precision
Chronos floor2Hour = date.floorHours(2);            // Floor to 2 hour precision
Chronos floor7Days = date.floorDays(7);             // Floor to 7 day precision
Chronos floor4Weeks = date.floorWeeks(4);           // Floor to 4 week precision
Chronos floor6Months = date.floorMonths(6);         // Floor to 6 month precision
Chronos floor1Quarter = date.floorQuarters(1);      // Floor to 1 quarter precision
Chronos floor10Years = date.floorYears(10);         // Floor to 10 year precision
Chronos floor3Decades = date.floorDecades(3);       // Floor to 3 decade precision
Chronos floor2Centuries = date.floorCenturies(2);   // Floor to 2 century precision
Chronos floor1Millennium = date.floorMillennia(1);  // Floor to 1 millennium precision

// Round to specified precision (round) - all time units
Chronos roundMicros = date.roundMicroseconds(250);  // Round to 250 microsecond precision
Chronos roundMillis = date.roundMilliseconds(25);   // Round to 25 millisecond precision
Chronos roundSecs = date.roundSeconds(10);          // Round to 10 second precision
Chronos round5Min = date.roundMinutes(5);           // Round to 5 minute precision
Chronos round15Min = date.roundMinutes(15);         // Round to 15 minute precision
Chronos round6Hour = date.roundHours(6);            // Round to 6 hour precision
Chronos round2Days = date.roundDays(2);             // Round to 2 day precision
Chronos round3Weeks = date.roundWeeks(3);           // Round to 3 week precision
Chronos round4Months = date.roundMonths(4);         // Round to 4 month precision
Chronos round2Quarters = date.roundQuarters(2);     // Round to 2 quarter precision
Chronos round5Years = date.roundYears(5);           // Round to 5 year precision
Chronos round2Decades = date.roundDecades(2);       // Round to 2 decade precision
Chronos round3Centuries = date.roundCenturies(3);   // Round to 3 century precision
Chronos round1Millennium = date.roundMillennia(1);  // Round to 1 millennium precision
```

# Constants

## Time Unit Enums

```dart
// TimeUnit enum contains all time units
TimeUnit.microsecond    // Microsecond
TimeUnit.millisecond    // Millisecond
TimeUnit.second         // Second
TimeUnit.minute         // Minute
TimeUnit.hour           // Hour
TimeUnit.day            // Day
TimeUnit.week           // Week
TimeUnit.isoWeek        // ISO week
TimeUnit.month          // Month
TimeUnit.quarter        // Quarter
TimeUnit.year           // Year
TimeUnit.isoYear        // ISO year
TimeUnit.decade         // Decade
TimeUnit.century        // Century
TimeUnit.millennium     // Millennium
```

## Weekday Enums

```dart
// DayOfWeek enum (0=Sunday)
DayOfWeek.sunday        // Sunday (0)
DayOfWeek.monday        // Monday (1)
DayOfWeek.tuesday       // Tuesday (2)
DayOfWeek.wednesday     // Wednesday (3)
DayOfWeek.thursday      // Thursday (4)
DayOfWeek.friday        // Friday (5)
DayOfWeek.saturday      // Saturday (6)

// IsoDayOfWeek enum (1=Monday)
IsoDayOfWeek.monday     // Monday (1)
IsoDayOfWeek.tuesday    // Tuesday (2)
IsoDayOfWeek.wednesday  // Wednesday (3)
IsoDayOfWeek.thursday   // Thursday (4)
IsoDayOfWeek.friday     // Friday (5)
IsoDayOfWeek.saturday   // Saturday (6)
IsoDayOfWeek.sunday     // Sunday (7)
```

## Month Enums

```dart
// Month enum
Month.january           // January (1)
Month.february          // February (2)
Month.march             // March (3)
Month.april             // April (4)
Month.may               // May (5)
Month.june              // June (6)
Month.july              // July (7)
Month.august            // August (8)
Month.september         // September (9)
Month.october           // October (10)
Month.november          // November (11)
Month.december          // December (12)
```

## Other Enums

```dart
// Quarter enum
Quarter.q1              // First quarter
Quarter.q2              // Second quarter
Quarter.q3              // Third quarter
Quarter.q4              // Fourth quarter

// Season enum
Season.spring           // Spring
Season.summer           // Summer
Season.autumn           // Autumn
Season.winter           // Winter

// Hemisphere enum
Hemisphere.northern     // Northern hemisphere
Hemisphere.southern     // Southern hemisphere


```

# Testing Utilities

## Time Mocking

```dart
// Set fake current time for testing (using leap day)
Chronos fakeNow = Chronos(2024, 2, 29, 12, 0);
ChronosConfig().setFakeNow(fakeNow);

// Now Chronos.now() will return the set fake time
print(Chronos.now()); // 2024-02-29 12:00:00.000 (leap day noon)

// Clear fake time
ChronosConfig().resetFakeNow();

// Or set directly to null
ChronosConfig().fakeNow = null;
```

## Timezone Settings

```dart
// Set hemisphere (affects season calculation)
ChronosConfig().setHemisphere(Hemisphere.southern);

// Now seasons will be calculated based on southern hemisphere
Chronos date = Chronos(2024, 2, 29); // February is summer in southern hemisphere
print(date.season); // Season.summer (southern hemisphere summer)

// Reset to northern hemisphere
ChronosConfig().resetHemisphere();

// Or set directly
ChronosConfig().hemisphere = Hemisphere.northern;
print(date.season); // Season.winter (northern hemisphere winter)
```

## Type Conversions

```dart
// DateTime to Chronos
DateTime dateTime = DateTime.now();
Chronos chronos = dateTime.toChronos();

// Timezone conversions
Chronos utc = chronos.toUtc();
Chronos local = chronos.toLocal();
```



---

Inspired by PHP [Carbon](https://carbon.nesbot.com/)