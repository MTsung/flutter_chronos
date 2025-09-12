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
  /// Examples:
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
  String format([String? newPattern, String? locale]) => DateFormat(newPattern, locale).format(this);

  /// Converts to ISO date string format (yyyy-MM-dd).
  ///
  /// This method returns the standard ISO 8601 date format, commonly used for
  /// database storage and API data exchange. Contains only the date part,
  /// without time information.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final dateString = date.toDateString(); // "2024-03-15"
  ///
  /// // Real-world usage scenarios
  /// final today = Chronos.now();
  /// final birthday = Chronos(1990, 12, 25);
  /// print('Today is: ${today.toDateString()}'); // "Today is: 2024-03-15"
  /// print('Birthday: ${birthday.toDateString()}'); // "Birthday: 1990-12-25"
  /// ```
  String toDateString() => DateFormat('yyyy-MM-dd').format(this);

  /// Converts to formatted date string (MMM d, yyyy).
  ///
  /// Returns a human-readable date format using abbreviated month names,
  /// suitable for display in user interfaces.
  /// Format: Month abbreviation Day, Year
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final formatted = date.toFormattedDateString(); // "Mar 15, 2024"
  ///
  /// // Different months examples
  /// final newYear = Chronos(2024, 1, 1);
  /// final christmas = Chronos(2024, 12, 25);
  /// print(newYear.toFormattedDateString()); // "Jan 1, 2024"
  /// print(christmas.toFormattedDateString()); // "Dec 25, 2024"
  ///
  /// // Real-world application
  /// final events = [
  ///   Chronos(2024, 6, 15),
  ///   Chronos(2024, 9, 30),
  /// ];
  /// for (final event in events) {
  ///   print('Event date: ${event.toFormattedDateString()}');
  /// }
  /// // Output: "Event date: Jun 15, 2024", "Event date: Sep 30, 2024"
  /// ```
  String toFormattedDateString() => DateFormat('MMM d, yyyy').format(this);

  /// Converts to formatted day and date string (EEE, MMM d, yyyy).
  ///
  /// Returns a complete date format including weekday abbreviation,
  /// providing more contextual information.
  /// Format: Weekday abbreviation, Month abbreviation Day, Year
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15);
  /// final formatted = date.toFormattedDayDateString(); // "Fri, Mar 15, 2024"
  ///
  /// // Week examples
  /// final monday = Chronos(2024, 3, 11);
  /// final tuesday = Chronos(2024, 3, 12);
  /// final wednesday = Chronos(2024, 3, 13);
  /// print(monday.toFormattedDayDateString()); // "Mon, Mar 11, 2024"
  /// print(tuesday.toFormattedDayDateString()); // "Tue, Mar 12, 2024"
  /// print(wednesday.toFormattedDayDateString()); // "Wed, Mar 13, 2024"
  ///
  /// // Real-world application: Meeting scheduling
  /// final meetings = [
  ///   Chronos(2024, 3, 18),
  ///   Chronos(2024, 3, 22),
  /// ];
  /// for (final meeting in meetings) {
  ///   print('Meeting time: ${meeting.toFormattedDayDateString()}');
  /// }
  /// // Output: "Meeting time: Mon, Mar 18, 2024", "Meeting time: Fri, Mar 22, 2024"
  /// ```
  String toFormattedDayDateString() => DateFormat('EEE, MMM d, yyyy').format(this);

  /// Converts to 24-hour time string format (HH:mm:ss).
  ///
  /// Returns standard 24-hour time format including hours, minutes, and seconds.
  /// Suitable for scenarios requiring precise time display.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final timeString = date.toTimeString(); // "14:30:45"
  ///
  /// // Different time examples
  /// final morning = Chronos(2024, 3, 15, 9, 15, 30);
  /// final noon = Chronos(2024, 3, 15, 12, 0, 0);
  /// final evening = Chronos(2024, 3, 15, 18, 45, 15);
  /// final midnight = Chronos(2024, 3, 15, 0, 0, 0);
  ///
  /// print(morning.toTimeString()); // "09:15:30"
  /// print(noon.toTimeString()); // "12:00:00"
  /// print(evening.toTimeString()); // "18:45:15"
  /// print(midnight.toTimeString()); // "00:00:00"
  ///
  /// // Real-world application: Time tracking
  /// final workStart = Chronos(2024, 3, 15, 9, 0, 0);
  /// final workEnd = Chronos(2024, 3, 15, 17, 30, 0);
  /// print('Work start: ${workStart.toTimeString()}'); // "Work start: 09:00:00"
  /// print('Work end: ${workEnd.toTimeString()}'); // "Work end: 17:30:00"
  /// ```
  String toTimeString() => DateFormat('HH:mm:ss').format(this);

  /// Converts to complete date-time string format (yyyy-MM-dd HH:mm:ss).
  ///
  /// Returns a complete string containing both date and time using ISO 8601
  /// standard format. Commonly used for logging, database storage, and
  /// data exchange between systems.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final dateTimeString = date.toDateTimeString(); // "2024-03-15 14:30:45"
  ///
  /// // Different time point examples
  /// final now = Chronos.now();
  /// final specificTime = Chronos(2024, 12, 31, 23, 59, 59);
  /// final earlyMorning = Chronos(2024, 1, 1, 0, 0, 1);
  ///
  /// print(specificTime.toDateTimeString()); // "2024-12-31 23:59:59"
  /// print(earlyMorning.toDateTimeString()); // "2024-01-01 00:00:01"
  ///
  /// // Real-world application: Event logging
  /// final events = [
  ///   ('User login', Chronos(2024, 3, 15, 9, 30, 0)),
  ///   ('File upload', Chronos(2024, 3, 15, 10, 15, 30)),
  ///   ('User logout', Chronos(2024, 3, 15, 17, 45, 0)),
  /// ];
  ///
  /// for (final (action, timestamp) in events) {
  ///   print('$action: ${timestamp.toDateTimeString()}');
  /// }
  /// // Output: "User login: 2024-03-15 09:30:00"
  /// //         "File upload: 2024-03-15 10:15:30"
  /// //         "User logout: 2024-03-15 17:45:00"
  /// ```
  String toDateTimeString() => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  /// Converts to day, date and 12-hour time string (EEE, MMM d, yyyy h:mm a).
  ///
  /// Returns the most complete human-readable date-time format, including
  /// weekday, date, and AM/PM time. Suitable for displaying complete
  /// time information in user interfaces.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final formatted = date.toDayDateTimeString(); // "Fri, Mar 15, 2024 2:30 PM"
  ///
  /// // Different time examples
  /// final morning = Chronos(2024, 3, 15, 9, 15, 0);
  /// final noon = Chronos(2024, 3, 15, 12, 0, 0);
  /// final evening = Chronos(2024, 3, 15, 21, 45, 0);
  /// final midnight = Chronos(2024, 3, 16, 0, 30, 0);
  ///
  /// print(morning.toDayDateTimeString()); // "Fri, Mar 15, 2024 9:15 AM"
  /// print(noon.toDayDateTimeString()); // "Fri, Mar 15, 2024 12:00 PM"
  /// print(evening.toDayDateTimeString()); // "Fri, Mar 15, 2024 9:45 PM"
  /// print(midnight.toDayDateTimeString()); // "Sat, Mar 16, 2024 12:30 AM"
  ///
  /// // Real-world application: Appointment reminders
  /// final appointments = [
  ///   ('Doctor appointment', Chronos(2024, 3, 18, 10, 30, 0)),
  ///   ('Meeting', Chronos(2024, 3, 20, 14, 0, 0)),
  ///   ('Dinner', Chronos(2024, 3, 22, 19, 30, 0)),
  /// ];
  ///
  /// for (final (event, time) in appointments) {
  ///   print('$event: ${time.toDayDateTimeString()}');
  /// }
  /// // Output: "Doctor appointment: Mon, Mar 18, 2024 10:30 AM"
  /// //         "Meeting: Wed, Mar 20, 2024 2:00 PM"
  /// //         "Dinner: Fri, Mar 22, 2024 7:30 PM"
  /// ```
  String toDayDateTimeString() => DateFormat('EEE, MMM d, yyyy h:mm a').format(this);

  /// Converts to local date-time string format (yyyy-MM-ddTHH:mm:ss).
  ///
  /// Returns ISO 8601 local time format using 'T' to separate date and time parts.
  /// This format does not include timezone information, representing local time.
  /// Commonly used for JSON data exchange and API responses.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final localString = date.toDateTimeLocalString(); // "2024-03-15T14:30:45"
  ///
  /// // Different precision time examples
  /// final precise = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rounded = Chronos(2024, 3, 15, 14, 30, 0);
  /// final hourly = Chronos(2024, 3, 15, 14, 0, 0);
  ///
  /// print(precise.toDateTimeLocalString()); // "2024-03-15T14:30:45"
  /// print(rounded.toDateTimeLocalString()); // "2024-03-15T14:30:00"
  /// print(hourly.toDateTimeLocalString()); // "2024-03-15T14:00:00"
  ///
  /// // Real-world application: API data format
  /// final apiData = {
  ///   'created_at': Chronos.now().toDateTimeLocalString(),
  ///   'updated_at': Chronos(2024, 3, 15, 10, 0, 0).toDateTimeLocalString(),
  ///   'scheduled_at': Chronos(2024, 3, 20, 9, 0, 0).toDateTimeLocalString(),
  /// };
  ///
  /// print('API data:');
  /// apiData.forEach((key, value) => print('  $key: $value'));
  /// // Output: created_at: 2024-03-15T14:30:45
  /// //         updated_at: 2024-03-15T10:00:00
  /// //         scheduled_at: 2024-03-20T09:00:00
  /// ```
  String toDateTimeLocalString() => DateFormat("yyyy-MM-ddTHH:mm:ss").format(this);

  /// Converts to RFC 822 format string.
  ///
  /// RFC 822 is the date-time format used in email standards and RSS feeds.
  /// Format: Weekday abbreviation, Day Month abbreviation Year(2-digit) Hour:Minute:Second Timezone
  /// Time is automatically converted to UTC.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rfc822 = date.toRfc822String(); // "Fri, 15 Mar 24 14:30:45 +0000"
  ///
  /// // Different time examples
  /// final newYear = Chronos(2024, 1, 1, 0, 0, 0);
  /// final christmas = Chronos(2024, 12, 25, 12, 0, 0);
  ///
  /// print(newYear.toRfc822String()); // "Mon, 01 Jan 24 00:00:00 +0000"
  /// print(christmas.toRfc822String()); // "Wed, 25 Dec 24 12:00:00 +0000"
  ///
  /// // Real-world application: RSS feed timestamps
  /// final articles = [
  ///   ('Latest News', Chronos(2024, 3, 15, 10, 0, 0)),
  ///   ('Tech Update', Chronos(2024, 3, 14, 15, 30, 0)),
  /// ];
  ///
  /// for (final (title, pubDate) in articles) {
  ///   print('<item>');
  ///   print('  <title>$title</title>');
  ///   print('  <pubDate>${pubDate.toRfc822String()}</pubDate>');
  ///   print('</item>');
  /// }
  /// ```
  String toRfc822String() => DateFormat("EEE, dd MMM yy HH:mm:ss Z", 'en_US').format(toUtc());

  /// Converts to RFC 850 format string.
  ///
  /// RFC 850 is an older internet date format standard, now mainly used for
  /// compatibility purposes. Format: Full weekday, DD-MMM-YY HH:mm:ss UTC
  /// (uses 2-digit year). Time is automatically converted to UTC.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rfc850 = date.toRfc850String(); // "Friday, 15-Mar-24 14:30:45 UTC"
  ///
  /// // Different date examples
  /// final y2k = Chronos(2000, 1, 1, 0, 0, 0);
  /// final millennium = Chronos(2001, 1, 1, 0, 0, 0);
  ///
  /// print(y2k.toRfc850String()); // "Saturday, 01-Jan-00 00:00:00 UTC"
  /// print(millennium.toRfc850String()); // "Monday, 01-Jan-01 00:00:00 UTC"
  /// ```
  String toRfc850String() => "${DateFormat("EEEE, dd-MMM-yy HH:mm:ss", 'en_US').format(toUtc())} UTC";

  /// Converts to RFC 1036 format string.
  ///
  /// RFC 1036 is the date format standard used by Usenet newsgroups.
  /// Format is the same as RFC 822, mainly used for Network News Transfer
  /// Protocol (NNTP). Format: Weekday abbreviation, DD MMM YY HH:mm:ss +0000
  /// (uses 2-digit year)
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rfc1036 = date.toRfc1036String(); // "Fri, 15 Mar 24 14:30:45 +0000"
  ///
  /// // Historical format examples
  /// final y2k = Chronos(2000, 1, 1, 12, 0, 0);
  /// final oldDate = Chronos(1999, 12, 31, 23, 59, 59);
  ///
  /// print(y2k.toRfc1036String()); // "Sat, 01 Jan 00 12:00:00 +0000"
  /// print(oldDate.toRfc1036String()); // "Fri, 31 Dec 99 23:59:59 +0000"
  /// ```
  String toRfc1036String() => DateFormat("EEE, dd MMM yy HH:mm:ss Z", 'en_US').format(toUtc());

  /// Converts to RFC 1123 format string.
  ///
  /// RFC 1123 is the recommended date format in HTTP protocol and an updated
  /// version of RFC 822. Uses 4-digit year, widely used in HTTP headers and
  /// web servers. Format: Weekday abbreviation, DD MMM YYYY HH:mm:ss +0000
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rfc1123 = date.toRfc1123String(); // "Fri, 15 Mar 2024 14:30:45 +0000"
  ///
  /// // Real-world application: HTTP headers
  /// final lastModified = Chronos(2024, 3, 10, 8, 0, 0);
  /// final expires = Chronos(2024, 3, 20, 23, 59, 59);
  ///
  /// print('Last-Modified: ${lastModified.toRfc1123String()}');
  /// print('Expires: ${expires.toRfc1123String()}');
  /// // Output: Last-Modified: Sun, 10 Mar 2024 08:00:00 +0000
  /// //         Expires: Wed, 20 Mar 2024 23:59:59 +0000
  /// ```
  String toRfc1123String() => DateFormat("EEE, dd MMM yyyy HH:mm:ss Z", 'en_US').format(toUtc());

  /// Converts to RFC 2822 format string (same as RFC 1123).
  ///
  /// RFC 2822 is the standard for email message format, updating RFC 822.
  /// Widely used in email headers' Date field and mail servers.
  /// This method is an alias for toRfc1123String(), providing more semantic naming.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rfc2822 = date.toRfc2822String(); // "Fri, 15 Mar 2024 14:30:45 +0000"
  ///
  /// // Real-world application: Email headers
  /// final emailHeaders = {
  ///   'Date': Chronos.now().toRfc2822String(),
  ///   'From': 'sender@example.com',
  ///   'To': 'recipient@example.com',
  ///   'Subject': 'Important Notice',
  /// };
  ///
  /// print('Email headers:');
  /// emailHeaders.forEach((key, value) => print('$key: $value'));
  ///
  /// // Mail server log format
  /// final mailLogs = [
  ///   ('Mail sent', Chronos(2024, 3, 15, 10, 30, 0)),
  ///   ('Mail received', Chronos(2024, 3, 15, 10, 31, 15)),
  ///   ('Mail delivered', Chronos(2024, 3, 15, 10, 32, 0)),
  /// ];
  ///
  /// for (final (action, timestamp) in mailLogs) {
  ///   print('[$action] ${timestamp.toRfc2822String()}');
  /// }
  /// ```
  String toRfc2822String() => toRfc1123String();

  /// Converts to RFC 3339 format string (ISO 8601).
  ///
  /// RFC 3339 is the internet standard date-time format and a subset of ISO 8601.
  /// Widely used in JSON APIs, databases, and modern web applications.
  /// Format: YYYY-MM-DDTHH:mm:ssZ (Z indicates UTC time)
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rfc3339 = date.toRfc3339String(); // "2024-03-15T14:30:45Z"
  ///
  /// // Different time precision examples
  /// final precise = Chronos(2024, 3, 15, 14, 30, 45);
  /// final minute = Chronos(2024, 3, 15, 14, 30, 0);
  /// final hour = Chronos(2024, 3, 15, 14, 0, 0);
  ///
  /// print(precise.toRfc3339String()); // "2024-03-15T14:30:45Z"
  /// print(minute.toRfc3339String()); // "2024-03-15T14:30:00Z"
  /// print(hour.toRfc3339String()); // "2024-03-15T14:00:00Z"
  ///
  /// // Real-world application: JSON API response
  /// final apiResponse = {
  ///   'id': 123,
  ///   'created_at': Chronos.now().toRfc3339String(),
  ///   'updated_at': Chronos(2024, 3, 15, 10, 0, 0).toRfc3339String(),
  ///   'expires_at': Chronos(2024, 12, 31, 23, 59, 59).toRfc3339String(),
  /// };
  ///
  /// print('JSON API response:');
  /// apiResponse.forEach((key, value) => print('  "$key": "$value"'));
  /// // Output: Standard ISO 8601 timestamp format
  /// ```
  String toRfc3339String() => DateFormat("yyyy-MM-dd'T'HH:mm:ssXXX").format(toUtc());

  /// Converts to RFC 7231 format string (HTTP date format).
  ///
  /// RFC 7231 is the latest HTTP protocol date format standard, replacing RFC 1123.
  /// Uses GMT instead of numeric timezone offset, the recommended format for
  /// modern web applications. Format: Weekday abbreviation, DD MMM YYYY HH:mm:ss GMT
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rfc7231 = date.toRfc7231String(); // "Fri, 15 Mar 2024 14:30:45 GMT"
  ///
  /// // Real-world application: Modern HTTP headers
  /// final cacheControl = Chronos.now().add(Duration(hours: 24));
  /// final ifModifiedSince = Chronos(2024, 3, 1, 0, 0, 0);
  ///
  /// print('Cache-Control: max-age=86400');
  /// print('Expires: ${cacheControl.toRfc7231String()}');
  /// print('If-Modified-Since: ${ifModifiedSince.toRfc7231String()}');
  ///
  /// // Server response example
  /// final serverResponse = {
  ///   'Date': Chronos.now().toRfc7231String(),
  ///   'Last-Modified': Chronos(2024, 3, 10).toRfc7231String(),
  ///   'Expires': Chronos.now().add(Duration(days: 7)).toRfc7231String(),
  /// };
  /// ```
  String toRfc7231String() => "${DateFormat("EEE, dd MMM yyyy HH:mm:ss", 'en_US').format(toUtc())} GMT";

  /// Converts to RSS format string (same as RFC 1123).
  ///
  /// RSS (Really Simple Syndication) uses RFC 1123 date format.
  /// Specifically used for RSS feed's pubDate and lastBuildDate elements.
  /// This method is an alias for toRfc1123String(), providing more semantic naming.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final rss = date.toRssString(); // "Fri, 15 Mar 2024 14:30:45 +0000"
  ///
  /// // Real-world application: RSS feed generation
  /// final articles = [
  ///   ('New Product Launch', Chronos(2024, 3, 15, 10, 0, 0)),
  ///   ('Tech Blog Update', Chronos(2024, 3, 14, 15, 30, 0)),
  ///   ('Company News', Chronos(2024, 3, 13, 9, 0, 0)),
  /// ];
  ///
  /// print('<?xml version="1.0" encoding="UTF-8"?>');
  /// print('<rss version="2.0">');
  /// print('  <channel>');
  /// print('    <lastBuildDate>${Chronos.now().toRssString()}</lastBuildDate>');
  ///
  /// for (final (title, pubDate) in articles) {
  ///   print('    <item>');
  ///   print('      <title>$title</title>');
  ///   print('      <pubDate>${pubDate.toRssString()}</pubDate>');
  ///   print('    </item>');
  /// }
  /// print('  </channel>');
  /// print('</rss>');
  /// ```
  String toRssString() => toRfc1123String();

  /// Converts to W3C format string (same as RFC 3339).
  ///
  /// W3C (World Wide Web Consortium) recommended date-time format based on ISO 8601.
  /// Widely used in HTML5, XML Schema, and web standards.
  /// This method is an alias for toRfc3339String(), providing more semantic naming.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final w3c = date.toW3cString(); // "2024-03-15T14:30:45Z"
  ///
  /// // Real-world application: HTML5 datetime attribute
  /// final events = [
  ///   ('Meeting start', Chronos(2024, 3, 18, 10, 0, 0)),
  ///   ('Project deadline', Chronos(2024, 3, 25, 17, 0, 0)),
  /// ];
  ///
  /// for (final (title, datetime) in events) {
  ///   print('<time datetime="${datetime.toW3cString()}">$title</time>');
  /// }
  /// // Output: <time datetime="2024-03-18T10:00:00Z">Meeting start</time>
  /// //         <time datetime="2024-03-25T17:00:00Z">Project deadline</time>
  ///
  /// // XML Schema application
  /// final xmlData = '''
  /// <event>
  ///   <title>Product Launch</title>
  ///   <startTime>${Chronos(2024, 4, 1, 14, 0, 0).toW3cString()}</startTime>
  ///   <endTime>${Chronos(2024, 4, 1, 16, 0, 0).toW3cString()}</endTime>
  /// </event>
  /// ''';
  /// ```
  String toW3cString() => toRfc3339String();

  /// Converts to Atom format string (same as RFC 3339).
  ///
  /// Atom Syndication Format uses RFC 3339 date format.
  /// Used for Atom feed's updated, published, and other time elements.
  /// This method is an alias for toRfc3339String(), providing more semantic naming.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final atom = date.toAtomString(); // "2024-03-15T14:30:45Z"
  ///
  /// // Real-world application: Atom feed generation
  /// final blogPosts = [
  ///   ('Dart 3.0 New Features', Chronos(2024, 3, 15, 10, 0, 0), Chronos(2024, 3, 15, 10, 30, 0)),
  ///   ('Flutter Development Tips', Chronos(2024, 3, 14, 15, 0, 0), Chronos(2024, 3, 14, 15, 45, 0)),
  /// ];
  ///
  /// print('<?xml version="1.0" encoding="utf-8"?>');
  /// print('<feed xmlns="http://www.w3.org/2005/Atom">');
  /// print('  <title>Tech Blog</title>');
  /// print('  <updated>${Chronos.now().toAtomString()}</updated>');
  ///
  /// for (final (title, published, updated) in blogPosts) {
  ///   print('  <entry>');
  ///   print('    <title>$title</title>');
  ///   print('    <published>${published.toAtomString()}</published>');
  ///   print('    <updated>${updated.toAtomString()}</updated>');
  ///   print('  </entry>');
  /// }
  /// print('</feed>');
  ///
  /// // JSON Feed format (using same time format)
  /// final jsonFeed = {
  ///   'version': 'https://jsonfeed.org/version/1.1',
  ///   'title': 'Tech Blog',
  ///   'date_published': Chronos.now().toAtomString(),
  ///   'items': blogPosts.map((post) => {
  ///     'title': post.$1,
  ///     'date_published': post.$2.toAtomString(),
  ///     'date_modified': post.$3.toAtomString(),
  ///   }).toList(),
  /// };
  /// ```
  String toAtomString() => toRfc3339String();

  /// Converts to Cookie expiration time format string.
  ///
  /// Used for HTTP Cookie's Expires attribute, following Netscape Cookie specification.
  /// Format: Full weekday, DD-MMM-YYYY HH:mm:ss UTC
  /// Time is automatically converted to UTC.
  ///
  /// Examples:
  /// ```dart
  /// final date = Chronos(2024, 3, 15, 14, 30, 45);
  /// final cookie = date.toCookieString(); // "Friday, 15-Mar-2024 14:30:45 UTC"
  ///
  /// // Different expiration time examples
  /// final oneHour = Chronos.now().add(Duration(hours: 1));
  /// final oneDay = Chronos.now().add(Duration(days: 1));
  /// final oneWeek = Chronos.now().add(Duration(days: 7));
  /// final oneYear = Chronos.now().add(Duration(days: 365));
  ///
  /// print('1 hour later: ${oneHour.toCookieString()}');
  /// print('1 day later: ${oneDay.toCookieString()}');
  /// print('1 week later: ${oneWeek.toCookieString()}');
  /// print('1 year later: ${oneYear.toCookieString()}');
  ///
  /// // Real-world application: Setting HTTP Cookies
  /// final sessionExpiry = Chronos.now().add(Duration(hours: 2));
  /// final rememberExpiry = Chronos.now().add(Duration(days: 30));
  ///
  /// final cookies = [
  ///   'sessionId=abc123; Expires=${sessionExpiry.toCookieString()}; Path=/',
  ///   'rememberMe=true; Expires=${rememberExpiry.toCookieString()}; Path=/',
  ///   'theme=dark; Expires=${Chronos(2025, 12, 31).toCookieString()}; Path=/',
  /// ];
  ///
  /// for (final cookie in cookies) {
  ///   print('Set-Cookie: $cookie');
  /// }
  /// ```
  String toCookieString() => "${DateFormat("EEEE, dd-MMM-yyyy HH:mm:ss", 'en_US').format(toUtc())} UTC";
}
