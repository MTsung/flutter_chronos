// ignore_for_file: non_constant_identifier_names

import 'package:flutter_chronos/src/chronos.dart';
import 'package:intl/intl.dart';

/// Extension providing formatting and conversion methods for Chronos instances.
///
/// This extension allows you to format dates into various string representations
/// and convert to different standard formats.
extension ChronosConverter on Chronos {
  /// Formats the date using the specified pattern and locale.
  ///
  /// [newPattern] - Date format pattern, uses default format if null
  /// [locale] - Locale code, uses system default locale if null
  ///
  /// Common format patterns:
  /// - 'yyyy-MM-dd' - Year-Month-Day (2024-03-15)
  /// - 'dd/MM/yyyy' - Day/Month/Year (15/03/2024)
  /// - 'MMM d, yyyy' - Month Day, Year (Mar 15, 2024)
  /// - 'EEEE, MMMM d, yyyy' - Weekday, Month Day, Year (Friday, March 15, 2024)
  /// - 'HH:mm:ss' - 24-hour time format (14:30:45)
  /// - 'h:mm a' - 12-hour time format (2:30 PM)
  ///
  /// Example:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  ///
  /// // Basic formats
  /// print(date.format('yyyy-MM-dd HH:mm:ss')); // "2024-03-15 14:30:45"
  /// print(date.format('dd/MM/yyyy')); // "15/03/2024"
  /// print(date.format('MMM d, yyyy')); // "Mar 15, 2024"
  ///
  /// // Localization examples
  /// print(date.format('EEEE, MMMM d, yyyy', 'zh_TW')); // "星期五, 三月 15, 2024"
  /// print(date.format('EEEE, MMMM d, yyyy', 'es')); // "viernes, marzo 15, 2024"
  /// print(date.format('EEEE, MMMM d, yyyy', 'fr')); // "vendredi, mars 15, 2024"
  /// print(date.format('EEEE, MMMM d, yyyy', 'de')); // "Freitag, März 15, 2024"
  /// print(date.format('EEEE, MMMM d, yyyy', 'ja')); // "金曜日, 3月 15, 2024"
  ///
  /// // Time formats
  /// print(date.format('h:mm a', 'en_US')); // "2:30 PM"
  /// print(date.format('HH:mm', 'de')); // "14:30"
  /// ```
  String format([String? newPattern, String? locale]) =>
      DateFormat(newPattern, locale).format(this);

  /// Returns date as `YYYY-MM-DD`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos(2019, 2, 1);
  /// print(dt.toDateString()); // 2019-02-01
  /// ```
  String toDateString() => DateFormat('yyyy-MM-dd').format(this);

  /// Returns date as `MMM d, yyyy` (e.g., Feb 1, 2019).
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos(2019, 2, 1);
  /// print(dt.toFormattedDateString()); // Feb 1, 2019
  /// ```
  String toFormattedDateString() => DateFormat('MMM d, yyyy').format(this);

  /// Returns date with weekday: `EEE, MMM d, yyyy`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos(2019, 2, 1);
  /// print(dt.toFormattedDayDateString()); // Fri, Feb 1, 2019
  /// ```
  String toFormattedDayDateString() =>
      DateFormat('EEE, MMM d, yyyy').format(this);

  /// Returns time as `HH:mm:ss` (24-hour format).
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos(2019, 2, 1, 15, 45, 27);
  /// print(dt.toTimeString()); // 15:45:27
  /// ```
  String toTimeString() => DateFormat('HH:mm:ss').format(this);

  /// Returns date and time as `YYYY-MM-DD HH:mm:ss`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos(2019, 2, 1, 15, 45, 27);
  /// print(dt.toDateTimeString()); // 2019-02-01 15:45:27
  /// ```
  String toDateTimeString() => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  /// Returns weekday, date and time in 12-hour format: `EEE, MMM d, yyyy h:mm a`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos(2019, 2, 1, 15, 45);
  /// print(dt.toDayDateTimeString()); // Fri, Feb 1, 2019 3:45 PM
  /// ```
  String toDayDateTimeString() =>
      DateFormat('EEE, MMM d, yyyy h:mm a').format(this);

  /// Returns local date-time as ISO-like string: `YYYY-MM-DDTHH:mm:ss`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos(2019, 2, 1, 15, 45, 27);
  /// print(dt.toDateTimeLocalString()); // 2019-02-01T15:45:27
  /// ```
  String toDateTimeLocalString() =>
      DateFormat("yyyy-MM-ddTHH:mm:ss").format(this);

  /// Returns RFC 822 formatted string: `EEE, dd MMM yy HH:mm:ss ±HHMM`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toRfc822String()); // Fri, 01 Feb 19 03:45:27 +0000
  /// ```
  String toRfc822String() =>
      '${DateFormat("EEE, dd MMM yy HH:mm:ss", 'en_US').format(this)} ${_offsetString()}';

  /// Returns RFC 850 formatted string: `EEEE, dd-MMM-yy HH:mm:ss UTC`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toRfc850String()); // Friday, 01-Feb-19 03:45:27 UTC
  /// ```
  String toRfc850String() =>
      "${DateFormat("EEEE, dd-MMM-yy HH:mm:ss", 'en_US').format(toUtc())} UTC";

  /// Alias for RFC 822.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toRfc1036String()); // Fri, 01 Feb 19 03:45:27 +0000
  /// ```
  String toRfc1036String() => toRfc822String();

  /// Returns RFC 1123 formatted string: `EEE, dd MMM yyyy HH:mm:ss ±HHMM`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toRfc1123String()); // Fri, 01 Feb 2019 03:45:27 +0000
  /// ```
  String toRfc1123String() =>
      '${DateFormat("EEE, dd MMM yyyy HH:mm:ss", 'en_US').format(toUtc())} ${_offsetString()}';

  /// Alias for RFC 1123.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toRfc2822String()); // Fri, 01 Feb 2019 03:45:27 +0000
  /// ```
  String toRfc2822String() => toRfc1123String();

  /// Returns RFC 3339 formatted string: `YYYY-MM-DDTHH:mm:ss±HH:MM`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toRfc3339String()); // 2019-02-01T03:45:27+00:00
  /// ```
  String toRfc3339String() =>
      '${DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(this)}${_offsetString(':')}';

  /// Returns RFC 7231 formatted string: `EEE, dd MMM yyyy HH:mm:ss GMT`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toRfc7231String()); // Fri, 01 Feb 2019 03:45:27 GMT
  /// ```
  String toRfc7231String() =>
      "${DateFormat("EEE, dd MMM yyyy HH:mm:ss", 'en_US').format(toUtc())} GMT";

  /// Returns RSS-compatible format (same as RFC 1123).
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toRssString()); // Fri, 01 Feb 2019 03:45:27 +0000
  /// ```
  String toRssString() => toRfc1123String();

  /// Returns W3C date-time format (same as RFC 3339).
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toW3cString()); // 2019-02-01T03:45:27+00:00
  /// ```
  String toW3cString() => toRfc3339String();

  /// Returns Atom date-time format (same as RFC 3339).
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toAtomString()); // 2019-02-01T03:45:27+00:00
  /// ```
  String toAtomString() => toRfc3339String();

  /// Returns Cookie date format: `EEEE, dd-MMM-yyyy HH:mm:ss UTC`.
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos.utc(2019, 2, 1, 3, 45, 27);
  /// print(dt.toCookieString()); // Friday, 01-Feb-2019 03:45:27 UTC
  /// ```
  String toCookieString() =>
      "${DateFormat("EEEE, dd-MMM-yyyy HH:mm:ss", 'en_US').format(toUtc())} UTC";

  /// Returns timezone offset string in format ±HHMM or ±HH:MM.
  ///
  /// [join] - Optional separator between hours and minutes (default: no separator)
  ///
  /// Example:
  /// ```dart
  /// final dt = Chronos(2019, 2, 1, 15, 45, 27);
  /// print(dt._offsetString()); // "+0800" (for UTC+8)
  /// print(dt._offsetString(':')); // "+08:00" (with colon separator)
  /// ```
  String _offsetString([String join = '']) {
    final tzOffset = timeZoneOffset;
    final sign = tzOffset.isNegative ? '-' : '+';
    final hours = tzOffset.inHours.abs().toString().padLeft(2, '0');
    final minutes = (tzOffset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    return '$sign$hours$join$minutes';
  }

  /// Day of month as number
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_d()); // 25
  /// ```
  String toString_d([String? locale]) => DateFormat.d(locale).format(this);

  /// Abbreviated day of week (Mon, Tue, …)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_E()); // Mon
  /// ```
  String toString_E([String? locale]) => DateFormat.E(locale).format(this);

  /// Full day of week (Monday, Tuesday, …)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_EEEE()); // Monday
  /// ```
  String toString_EEEE([String? locale]) =>
      DateFormat.EEEE(locale).format(this);

  /// Narrow day of week (first letter, e.g., M)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_EEEEE()); // M
  /// ```
  String toString_EEEEE([String? locale]) =>
      DateFormat.EEEEE(locale).format(this);

  /// Abbreviated month (Dec)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_LLL()); // Dec
  /// ```
  String toString_LLL([String? locale]) => DateFormat.LLL(locale).format(this);

  /// Full month (December)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_LLLL()); // December
  /// ```
  String toString_LLLL([String? locale]) =>
      DateFormat.LLLL(locale).format(this);

  /// Month as number (12)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_M()); // 12
  /// ```
  String toString_M([String? locale]) => DateFormat.M(locale).format(this);

  /// Month/Day numeric (12/25)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_Md()); // 12/25
  /// ```
  String toString_Md([String? locale]) => DateFormat.Md(locale).format(this);

  /// Weekday, Month/Day (Mon, 12/25)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_MEd()); // Mon, 12/25
  /// ```
  String toString_MEd([String? locale]) => DateFormat.MEd(locale).format(this);

  /// Abbreviated month (Dec)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_MMM()); // Dec
  /// ```
  String toString_MMM([String? locale]) => DateFormat.MMM(locale).format(this);

  /// Abbreviated month + day (Dec 25)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_MMMd()); // Dec 25
  /// ```
  String toString_MMMd([String? locale]) =>
      DateFormat.MMMd(locale).format(this);

  /// Weekday, abbreviated month + day (Mon, Dec 25)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_MMMEd()); // Mon, Dec 25
  /// ```
  String toString_MMMEd([String? locale]) =>
      DateFormat.MMMEd(locale).format(this);

  /// Full month (December)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_MMMM()); // December
  /// ```
  String toString_MMMM([String? locale]) =>
      DateFormat.MMMM(locale).format(this);

  /// Full month + day (December 25)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_MMMMd()); // December 25
  /// ```
  String toString_MMMMd([String? locale]) =>
      DateFormat.MMMMd(locale).format(this);

  /// Weekday, full month + day (Monday, December 25)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_MMMMEEEEd()); // Monday, December 25
  /// ```
  String toString_MMMMEEEEd([String? locale]) =>
      DateFormat.MMMMEEEEd(locale).format(this);

  /// Quarter short (Q1, Q2, …)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_QQQ()); // Q4
  /// ```
  String toString_QQQ([String? locale]) => DateFormat.QQQ(locale).format(this);

  /// Quarter full (4th quarter)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_QQQQ()); // 4th quarter
  /// ```
  String toString_QQQQ([String? locale]) =>
      DateFormat.QQQQ(locale).format(this);

  /// Year numeric (2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_y()); // 2023
  /// ```
  String toString_y([String? locale]) => DateFormat.y(locale).format(this);

  /// Month/Year numeric (12/2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yM()); // 12/2023
  /// ```
  String toString_yM([String? locale]) => DateFormat.yM(locale).format(this);

  /// Month/Day/Year numeric (12/25/2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yMd()); // 12/25/2023
  /// ```
  String toString_yMd([String? locale]) => DateFormat.yMd(locale).format(this);

  /// Weekday, Month/Day/Year (Mon, 12/25/2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yMEd()); // Mon, 12/25/2023
  /// ```
  String toString_yMEd([String? locale]) =>
      DateFormat.yMEd(locale).format(this);

  /// Abbreviated month + year (Dec 2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yMMM()); // Dec 2023
  /// ```
  String toString_yMMM([String? locale]) =>
      DateFormat.yMMM(locale).format(this);

  /// Abbreviated month + day + year (Dec 25, 2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yMMMd()); // Dec 25, 2023
  /// ```
  String toString_yMMMd([String? locale]) =>
      DateFormat.yMMMd(locale).format(this);

  /// Weekday, abbreviated month + day + year (Mon, Dec 25, 2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yMMMEd()); // Mon, Dec 25, 2023
  /// ```
  String toString_yMMMEd([String? locale]) =>
      DateFormat.yMMMEd(locale).format(this);

  /// Full month + year (December 2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yMMMM()); // December 2023
  /// ```
  String toString_yMMMM([String? locale]) =>
      DateFormat.yMMMM(locale).format(this);

  /// Full month + day + year (December 25, 2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yMMMMd()); // December 25, 2023
  /// ```
  String toString_yMMMMd([String? locale]) =>
      DateFormat.yMMMMd(locale).format(this);

  /// Weekday, full month + day + year (Monday, December 25, 2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yMMMMEEEEd()); // Monday, December 25, 2023
  /// ```
  String toString_yMMMMEEEEd([String? locale]) =>
      DateFormat.yMMMMEEEEd(locale).format(this);

  /// Quarter + year short (Q4 2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yQQQ()); // Q4 2023
  /// ```
  String toString_yQQQ([String? locale]) =>
      DateFormat.yQQQ(locale).format(this);

  /// Quarter + year full (4th quarter 2023)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25);
  /// print(now.toString_yQQQQ()); // 4th quarter 2023
  /// ```
  String toString_yQQQQ([String? locale]) =>
      DateFormat.yQQQQ(locale).format(this);

  /// Hour in 24h format (0-23)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25, 14);
  /// print(now.toString_H()); // 14
  /// ```
  String toString_H([String? locale]) => DateFormat.H(locale).format(this);

  /// Hour:Minute 24h (14:30)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25, 14, 30);
  /// print(now.toString_Hm()); // 14:30
  /// ```
  String toString_Hm([String? locale]) => DateFormat.Hm(locale).format(this);

  /// Hour:Minute:Second 24h (14:30:45)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25, 14, 30, 45);
  /// print(now.toString_Hms()); // 14:30:45
  /// ```
  String toString_Hms([String? locale]) => DateFormat.Hms(locale).format(this);

  /// Hour in 12h format (2 PM)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25, 14);
  /// print(now.toString_j()); // 2 PM
  /// ```
  String toString_j([String? locale]) => DateFormat.j(locale).format(this);

  /// Hour:Minute 12h (2:30 PM)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25, 14, 30);
  /// print(now.toString_jm()); // 2:30 PM
  /// ```
  String toString_jm([String? locale]) => DateFormat.jm(locale).format(this);

  /// Hour:Minute:Second 12h (2:30:45 PM)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25, 14, 30, 45);
  /// print(now.toString_jms()); // 2:30:45 PM
  /// ```
  String toString_jms([String? locale]) => DateFormat.jms(locale).format(this);

  /// Minute numeric (0-59)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25, 14, 30);
  /// print(now.toString_m()); // 30
  /// ```
  String toString_m([String? locale]) => DateFormat.m(locale).format(this);

  /// Minute:Second (30:45)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25, 14, 30, 45);
  /// print(now.toString_ms()); // 30:45
  /// ```
  String toString_ms([String? locale]) => DateFormat.ms(locale).format(this);

  /// Second numeric (0-59)
  ///
  /// Example:
  /// ```dart
  /// final now = Chronos(2023, 12, 25, 14, 30, 45);
  /// print(now.toString_s()); // 45
  /// ```
  String toString_s([String? locale]) => DateFormat.s(locale).format(this);
}
