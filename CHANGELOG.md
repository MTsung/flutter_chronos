# 1.0.10

- Update setMonth() and setYear() to use addMonths/addYears for overflow-safe handling
- Refactor some tests

# 1.0.9

- Corrected the spelling of `getTimeZonOffset()` → `getTimeZoneOffset()`
- Update README.md 

# 1.0.8

- Fix correct rounding logic

# 1.0.7

- Update README.md 

# 1.0.6

- Update example

# 1.0.5

- Optimized internal code for better readability and maintainability.
- Update README.md 

# 1.0.4

- Rnu dart format .

# 1.0.3

- Update example
- Update README.md 

# 1.0.2

- Remove Chinese characters from CHANGELOG.md to satisfy pub.dev
- Add example folder
- Add additional code comments


# 1.0.1

- Supports [ISO week date calendar](https://en.wikipedia.org/wiki/ISO_week_date)
- Supports millennia, centuries, decades, years, ISO years, quarters, seasons (configurable for northern/southern hemisphere), weeks, ISO weeks, days, hours, minutes, seconds, milliseconds, microseconds.
- Can get or set ISO weeks, week numbers, quarters, year positions; calculate specific weeks in a month, first/last day of a quarter, etc.
- Supports comparisons across all time units, range checks, past/future checks, leap year detection, weekend/weekday checks, birthday checks, etc.
- Provides business-day arithmetic: add/subtract working days, find the next/previous working day or weekend, making business calendar calculations easier.
- Supports fluent interface — addition, subtraction, boundary setting, formatting, etc. can be done in one line for more concise and readable code.
- Supports common string formatting, integrates with `intl` for direct display (date, time, datetime), ISO and RFC standard formats, while also preserving custom and localized formatting options.
- Supports human-readable time differences, integrates with `timeago` to directly display relative times such as "5 minutes ago", "in 2 days", making UI-friendly time messages easier.
- Provides complete getter and setter methods for time units, enabling quick access to year, quarter, week number, day, hour, minute, second, millisecond, microsecond, as well as setting specific units or cloning other dates.
- Direct operator usage for comparison and arithmetic (`==`, `+`, `-`), improving code readability and speeding up development.
- Can retrieve time unit positions, such as "today is the Nth day of the week" or "this is the Nth microsecond of the month", supporting all units.
- Supports local time or UTC, time zone names, time zone offsets, daylight saving time, making cross-time-zone applications easier.
- Supports setting "Fake Now" for more convenient unit testing.