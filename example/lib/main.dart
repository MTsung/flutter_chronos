import 'package:flutter_chronos/flutter_chronos.dart';

void main() {
  final now = Chronos.now();
  final birthday = Chronos(1990, 5, 15, 10, 30);
  final fromTimestamp = Chronos.fromTimestamp(1640995200);
  final parsed = Chronos.parse('2024-12-25 10:30:00');
  final utcDate = Chronos.utc(2024, 3, 15, 14, 30, 45);
  final fromDateTime = Chronos.fromDateTime(DateTime.now());
  final today = Chronos.today();
  final tomorrow = Chronos.tomorrow();
  final yesterday = Chronos.yesterday();

  print('Current time: $now'); // Current time: 2025-09-13 11:23:41.703648
  print('Birthday: $birthday'); // Birthday: 1990-05-15 10:30:00.000
  print('From timestamp: $fromTimestamp'); // From timestamp: 2022-01-01 08:00:00.000
  print('Parsed string: $parsed'); // Parsed string: 2024-12-25 10:30:00.000
  print('UTC date: $utcDate'); // UTC date: 2024-03-15 14:30:45.000Z
  print('fromDateTime: $fromDateTime'); // fromDateTime: 2025-09-13 11:23:41.708196
  print('Today: $today'); // Today: 2025-09-13 00:00:00.000
  print('Tomorrow: $tomorrow'); // Tomorrow: 2025-09-14 00:00:00.000
  print('Yesterday: $yesterday'); // Yesterday: 2025-09-12 00:00:00.000
  print('Year: ${now.year}'); // Year: 2025
  print('Month: ${now.month}'); // Month: 9
  print('Day: ${now.day}'); // Day: 13
  print('Hour: ${now.hour}'); // Hour: 11
  print('Minute: ${now.minute}'); // Minute: 23
  print('Second: ${now.second}'); // Second: 41
  print('Millisecond: ${now.millisecond}'); // Millisecond: 703
  print('Microsecond: ${now.microsecond}'); // Microsecond: 648
  print('Quarter: ${now.quarter}'); // Quarter: 3
  print('Week: ${now.week}'); // Week: 37
  print('ISO Week: ${now.isoWeek}'); // ISO Week: 37
  print('Weekday: ${now.weekday}'); // Weekday: 6
  print('ISO Day of Week: ${now.isoDayOfWeek}'); // ISO Day of Week: 6
  print('Day of Week: ${now.dayOfWeek}'); // Day of Week: 6
  print('Day of Year: ${now.dayOfYear}'); // Day of Year: 256
  print('Decade: ${now.decade}'); // Decade: 203
  print('Century: ${now.century}'); // Century: 21
  print('Millennium: ${now.millennium}'); // Millennium: 3
  print('Timestamp: ${now.timestamp}'); // Timestamp: 1757733821
  print('Is UTC: ${now.isUtc}'); // Is UTC: false
  print('Is Local: ${now.isLocal}'); // Is Local: true
  print('Is DST: ${now.isDst}'); // Is DST: false

  print('Add microseconds: ${now.addMicroseconds(1000)}'); // Add microseconds: 2025-09-13 11:23:41.704648
  print('Add milliseconds: ${now.addMilliseconds(500)}'); // Add milliseconds: 2025-09-13 11:23:42.203648
  print('Add seconds: ${now.addSeconds(30)}'); // Add seconds: 2025-09-13 11:24:11.703648
  print('Add minutes: ${now.addMinutes(15)}'); // Add minutes: 2025-09-13 11:38:41.703648
  print('Add hours: ${now.addHours(2)}'); // Add hours: 2025-09-13 13:23:41.703648
  print('Add days: ${now.addDays(7)}'); // Add days: 2025-09-20 11:23:41.703648
  print('Add weeks: ${now.addWeeks(2)}'); // Add weeks: 2025-09-27 11:23:41.703648
  print('Add months: ${now.addMonths(3)}'); // Add months: 2025-12-13 11:23:41.703648
  print('Add quarters: ${now.addQuarters(1)}'); // Add quarters: 2025-12-13 11:23:41.703648
  print('Add years: ${now.addYears(1)}'); // Add years: 2026-09-13 11:23:41.703648
  print('Add decades: ${now.addDecades(1)}'); // Add decades: 2035-09-13 11:23:41.703648
  print('Add centuries: ${now.addCenturies(1)}'); // Add centuries: 2125-09-13 11:23:41.703648
  print('Add millennia: ${now.addMillennia(1)}'); // Add millennia: 3025-09-13 11:23:41.703648
  print('Add weekdays: ${now.addWeekdays(5)}'); // Add weekdays: 2025-09-19 11:23:41.703648
  print('Add unit (month): ${now.addUnit(TimeUnit.month, 2)}'); // Add unit (month): 2025-11-13 11:23:41.703648

  print('Sub microseconds: ${now.subMicroseconds(1000)}'); // Sub microseconds: 2025-09-13 11:23:41.702648
  print('Sub milliseconds: ${now.subMilliseconds(500)}'); // Sub milliseconds: 2025-09-13 11:23:41.203648
  print('Sub seconds: ${now.subSeconds(30)}'); // Sub seconds: 2025-09-13 11:23:11.703648
  print('Sub minutes: ${now.subMinutes(15)}'); // Sub minutes: 2025-09-13 11:08:41.703648
  print('Sub hours: ${now.subHours(2)}'); // Sub hours: 2025-09-13 09:23:41.703648
  print('Sub days: ${now.subDays(7)}'); // Sub days: 2025-09-06 11:23:41.703648
  print('Sub weeks: ${now.subWeeks(2)}'); // Sub weeks: 2025-08-30 11:23:41.703648
  print('Sub months: ${now.subMonths(3)}'); // Sub months: 2025-06-13 11:23:41.703648
  print('Sub quarters: ${now.subQuarters(1)}'); // Sub quarters: 2025-06-13 11:23:41.703648
  print('Sub years: ${now.subYears(1)}'); // Sub years: 2024-09-13 11:23:41.703648
  print('Sub decades: ${now.subDecades(1)}'); // Sub decades: 2015-09-13 11:23:41.703648
  print('Sub centuries: ${now.subCenturies(1)}'); // Sub centuries: 1925-09-13 11:23:41.703648
  print('Sub millennia: ${now.subMillennia(1)}'); // Sub millennia: 1025-09-13 11:23:41.703648
  print('Sub weekdays: ${now.subWeekdays(5)}'); // Sub weekdays: 2025-09-08 11:23:41.703648
  print('Sub unit (month): ${now.subUnit(TimeUnit.month, 2)}'); // Sub unit (month): 2025-07-13 11:23:41.703648

  print('Start of microsecond: ${now.startOfMillisecond()}'); // Start of microsecond: 2025-09-13 11:23:41.703
  print('Start of second: ${now.startOfSecond()}'); // Start of second: 2025-09-13 11:23:41.000
  print('Start of minute: ${now.startOfMinute()}'); // Start of minute: 2025-09-13 11:23:00.000
  print('Start of hour: ${now.startOfHour()}'); // Start of hour: 2025-09-13 11:00:00.000
  print('Start of day: ${now.startOfDay()}'); // Start of day: 2025-09-13 00:00:00.000
  print('Start of week: ${now.startOfWeek()}'); // Start of week: 2025-09-07 00:00:00.000
  print('Start of ISO week: ${now.startOfIsoWeek()}'); // Start of ISO week: 2025-09-08 00:00:00.000
  print('Start of month: ${now.startOfMonth()}'); // Start of month: 2025-09-01 00:00:00.000
  print('Start of quarter: ${now.startOfQuarter()}'); // Start of quarter: 2025-07-01 00:00:00.000
  print('Start of year: ${now.startOfYear()}'); // Start of year: 2025-01-01 00:00:00.000
  print('Start of decade: ${now.startOfDecade()}'); // Start of decade: 2020-01-01 00:00:00.000
  print('Start of century: ${now.startOfCentury()}'); // Start of century: 2001-01-01 00:00:00.000
  print('Start of millennium: ${now.startOfMillennium()}'); // Start of millennium: 2001-01-01 00:00:00.000

  print('End of microsecond: ${now.endOfMillisecond()}'); // End of microsecond: 2025-09-13 11:23:41.703999
  print('End of second: ${now.endOfSecond()}'); // End of second: 2025-09-13 11:23:41.999999
  print('End of minute: ${now.endOfMinute()}'); // End of minute: 2025-09-13 11:23:59.999999
  print('End of hour: ${now.endOfHour()}'); // End of hour: 2025-09-13 11:59:59.999999
  print('End of day: ${now.endOfDay()}'); // End of day: 2025-09-13 23:59:59.999999
  print('End of week: ${now.endOfWeek()}'); // End of week: 2025-09-13 23:59:59.999999
  print('End of ISO week: ${now.endOfIsoWeek()}'); // End of ISO week: 2025-09-14 23:59:59.999999
  print('End of month: ${now.endOfMonth()}'); // End of month: 2025-09-30 23:59:59.999999
  print('End of quarter: ${now.endOfQuarter()}'); // End of quarter: 2025-09-30 23:59:59.999999
  print('End of year: ${now.endOfYear()}'); // End of year: 2025-12-31 23:59:59.999999
  print('End of decade: ${now.endOfDecade()}'); // End of decade: 2029-12-31 23:59:59.999999
  print('End of century: ${now.endOfCentury()}'); // End of century: 2100-12-31 23:59:59.999999
  print('End of millennium: ${now.endOfMillennium()}'); // End of millennium: 3000-12-31 23:59:59.999999

  print('Is Monday: ${now.isMonday}'); // Is Monday: false
  print('Is Tuesday: ${now.isTuesday}'); // Is Tuesday: false
  print('Is Wednesday: ${now.isWednesday}'); // Is Wednesday: false
  print('Is Thursday: ${now.isThursday}'); // Is Thursday: false
  print('Is Friday: ${now.isFriday}'); // Is Friday: false
  print('Is Saturday: ${now.isSaturday}'); // Is Saturday: true
  print('Is Sunday: ${now.isSunday}'); // Is Sunday: false
  print('Is weekday: ${now.isWeekday}'); // Is weekday: false
  print('Is weekend: ${now.isWeekend}'); // Is weekend: true
  print('Is today: ${now.isToday}'); // Is today: false
  print('Is yesterday: ${now.isYesterday}'); // Is yesterday: false
  print('Is tomorrow: ${now.isTomorrow}'); // Is tomorrow: false
  print('Is current year: ${now.isCurrentYear}'); // Is current year: true
  print('Is current month: ${now.isCurrentMonth}'); // Is current month: true
  print('Is current week: ${now.isCurrentWeek}'); // Is current week: true
  print('Is current day: ${now.isCurrentDay}'); // Is current day: true
  print('Is next year: ${now.isNextYear}'); // Is next year: false
  print('Is last year: ${now.isLastYear}'); // Is last year: false
  print('Is birthday: ${now.isBirthday(birthday)}'); // Is birthday: false

  print('Standard format: ${now.format('yyyy-MM-dd HH:mm:ss')}'); // Standard format: 2025-09-13 11:23:41
  print('Friendly format: ${now.format('EEEE, MMMM d, yyyy')}'); // Friendly format: Saturday, September 13, 2025
  print('Date string: ${now.toDateString()}'); // Date string: 2025-09-13
  print('Time string: ${now.toTimeString()}'); // Time string: 11:23:41
  print('DateTime string: ${now.toDateTimeString()}'); // DateTime string: 2025-09-13 11:23:41
  print('Formatted date: ${now.toFormattedDateString()}'); // Formatted date: Sep 13, 2025
  print('Day date time: ${now.toDayDateTimeString()}'); // Day date time: Sat, Sep 13, 2025 11:23 AM
  print('Local string: ${now.toDateTimeLocalString()}'); // Local string: 2025-09-13T11:23:41
  print('RFC 822: ${now.toRfc822String()}'); // RFC 822: Sat, 13 Sep 25 03:23:41
  print('RFC 1123: ${now.toRfc1123String()}'); // RFC 1123: Sat, 13 Sep 2025 03:23:41
  print('RFC 2822: ${now.toRfc2822String()}'); // RFC 2822: Sat, 13 Sep 2025 03:23:41
  print('RFC 3339: ${now.toRfc3339String()}'); // RFC 3339: 2025-09-13T03:23:41XXX
  print('RFC 7231: ${now.toRfc7231String()}'); // RFC 7231: Sat, 13 Sep 2025 03:23:41 GMT
  print('RSS format: ${now.toRssString()}'); // RSS format: Sat, 13 Sep 2025 03:23:41
  print('W3C format: ${now.toW3cString()}'); // W3C format: 2025-09-13T03:23:41XXX
  print('Atom format: ${now.toAtomString()}'); // Atom format: 2025-09-13T03:23:41XXX
  print('Cookie format: ${now.toCookieString()}'); // Cookie format: Saturday, 13-Sep-2025 03:23:41 UTC
  print('Relative time: ${birthday.diffForHumans()}'); // Relative time: 35 years ago
  print('Relative time (Chinese): ${birthday.diffForHumans(locale: 'zh_tw')}'); // Relative time (Chinese): 約 35 年 前
  print('Relative time (Spanish): ${birthday.diffForHumans(locale: 'es')}'); // Relative time (Spanish): hace 35 años
  print('Relative time (French): ${birthday.diffForHumans(locale: 'fr')}'); // Relative time (French): il y a 35 ans

  print('Local time: ${now.toLocal()}'); // Local time: 2025-09-13 11:23:41.703648
  print('UTC time: ${now.toUtc()}'); // UTC time: 2025-09-13 03:23:41.703648Z
  print('Timezone name: ${now.getTimeZone()}'); // Timezone name: CST
  print('Timezone offset: ${now.getTimeZonOffset()}'); // Timezone offset: 8:00:00.000000

  print('Duration difference: ${now.diff(birthday)}'); // Duration difference: 309720:53:41.703648
  print('Microseconds: ${now.diffInMicroseconds(birthday)}'); // Microseconds: -1114995221703648.0
  print('Milliseconds: ${now.diffInMilliseconds(birthday)}'); // Milliseconds: -1114995221.703
  print('Seconds: ${now.diffInSeconds(birthday)}'); // Seconds: -1114995221.703648
  print('Minutes: ${now.diffInMinutes(birthday)}'); // Minutes: -18583253.6950608
  print('Hours: ${now.diffInHours(birthday)}'); // Hours: -309720.89491768
  print('Days: ${now.diffInDays(birthday)}'); // Days: -12905.037288236666
  print('Weeks: ${now.diffInWeeks(birthday)}'); // Weeks: -1843.576755462381
  print('Months: ${now.diffInMonths(birthday)}'); // Months: -423.93668671731183
  print('Quarters: ${now.diffInQuarters(birthday)}'); // Quarters: -141.3122289057706
  print('Years: ${now.diffInYears(birthday)}'); // Years: -35.33160900886758
  print('Decades: ${now.diffInDecade(birthday)}'); // Decades: -3.533160900886758
  print('Centuries: ${now.diffInCentury(birthday)}'); // Centuries: -0.3533160900886758
  print('Millennia: ${now.diffInMillennium(birthday)}'); // Millennia: -0.03533160900886758
  print('Weekdays: ${now.diffInWeekdays(birthday)}'); // Weekdays: -9219
  print('Weekend days: ${now.diffInWeekend(birthday)}'); // Weekend days: -3687

  print('Microsecond of second: ${now.microsecondOfSecond}'); // Microsecond of second: 703648
  print('Millisecond of second: ${now.millisecondOfSecond}'); // Millisecond of second: 703
  print('Second of minute: ${now.secondOfMinute}'); // Second of minute: 41
  print('Minute of hour: ${now.minuteOfHour}'); // Minute of hour: 23
  print('Hour of day: ${now.hourOfDay}'); // Hour of day: 11
  print('Day of month: ${now.dayOfMonth}'); // Day of month: 13
  print('Day of year: ${now.dayOfYear}'); // Day of year: 256
  print('Week of year: ${now.week}'); // Week of year: 37
  print('Month of year: ${now.month}'); // Month of year: 9
  print('Quarter of year: ${now.quarter}'); // Quarter of year: 3
  print('Microsecond of day: ${now.microsecondOfDay}'); // Microsecond of day: 41021703648
  print('Second of day: ${now.secondOfDay}'); // Second of day: 41021
  print('Minute of day: ${now.minuteOfDay}'); // Minute of day: 683
  print('Hour of year: ${now.hourOfYear}'); // Hour of year: 6131
  print('Day of decade: ${now.dayOfDecade}'); // Day of decade: 2083
  print('Day of century: ${now.dayOfCentury}'); // Day of century: 9022
  print('Day of millennium: ${now.dayOfMillennium}'); // Day of millennium: 9022

  final testDate = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  print('Original: $testDate'); // Original: 2024-03-15 14:30:45.123456
  print('Ceil second: ${testDate.ceilSecond()}'); // Ceil second: 2024-03-15 14:30:45.000
  print('Floor second: ${testDate.floorSecond()}'); // Floor second: 2024-03-15 14:30:44.000
  print('Round second: ${testDate.roundSecond()}'); // Round second: 2024-03-15 14:30:45.000
  print('Ceil minute: ${testDate.ceilMinute()}'); // Ceil minute: 2024-03-15 14:30:00.000
  print('Floor minute: ${testDate.floorMinute()}'); // Floor minute: 2024-03-15 14:29:00.000
  print('Round minute: ${testDate.roundMinute()}'); // Round minute: 2024-03-15 14:29:00.000
  print('Ceil hour: ${testDate.ceilHour()}'); // Ceil hour: 2024-03-15 14:00:00.000
  print('Floor hour: ${testDate.floorHour()}'); // Floor hour: 2024-03-15 13:00:00.000
  print('Round hour: ${testDate.roundHour()}'); // Round hour: 2024-03-15 13:00:00.000
  print('Ceil day: ${testDate.ceilDay()}'); // Ceil day: 2024-03-15 00:00:00.000
  print('Floor day: ${testDate.floorDay()}'); // Floor day: 2024-03-14 00:00:00.000
  print('Round day: ${testDate.roundDay()}'); // Round day: 2024-03-14 00:00:00.000
  print('Round to 15 minutes: ${testDate.roundMinutes(15)}'); // Round to 15 minutes: 2024-03-15 14:30:00.000
  print('Round to 6 hours: ${testDate.roundHours(6)}'); // Round to 6 hours: 2024-03-15 14:00:00.000

  print('Set year to 2025: ${now.setYear(2025)}'); // Set year to 2025: 2025-09-13 11:23:41.703648
  print('Set month to December: ${now.setMonth(12)}'); // Set month to December: 2025-12-13 11:23:41.703648
  print('Set day to 25: ${now.setDay(25)}'); // Set day to 25: 2025-09-25 11:23:41.703648
  print('Set hour to 9: ${now.setHour(9)}'); // Set hour to 9: 2025-09-13 09:23:41.703648
  print('Set minute to 30: ${now.setMinute(30)}'); // Set minute to 30: 2025-09-13 11:30:41.703648
  print('Set second to 0: ${now.setSecond(0)}'); // Set second to 0: 2025-09-13 11:23:00.703648
  print('Set time: ${now.setTime(hour: 15, minute: 45, second: 30)}'); // Set time: 2025-09-13 15:45:30.000
  print('Set date: ${now.setDate(2025, month: 12, day: 25)}'); // Set date: 2025-12-25 11:23:41.703648

  final date1 = Chronos(2024, 3, 15, 10, 0);
  final date2 = Chronos(2024, 3, 15, 14, 0);
  final duration = Duration(hours: 2);
  print('Date1: $date1'); // Date1: 2024-03-15 10:00:00.000
  print('Date2: $date2'); // Date2: 2024-03-15 14:00:00.000
  print('Date1 < Date2: ${date1 < date2}'); // Date1 < Date2: true
  print('Date1 > Date2: ${date1 > date2}'); // Date1 > Date2: false
  print('Date1 <= Date2: ${date1 <= date2}'); // Date1 <= Date2: true
  print('Date1 >= Date2: ${date1 >= date2}'); // Date1 >= Date2: false
  print('Date1 + 2 hours: ${date1 + duration}'); // Date1 + 2 hours: 2024-03-15 12:00:00.000
  print('Date2 - 2 hours: ${date2 - duration}'); // Date2 - 2 hours: 2024-03-15 12:00:00.000

  final workStart = Chronos(2024, 3, 15, 9, 0);
  final workEnd = Chronos(2024, 3, 15, 17, 0);
  final workDay = ChronosRange(workStart, workEnd);
  final lunchStart = Chronos(2024, 3, 15, 12, 0);
  final lunchEnd = Chronos(2024, 3, 15, 13, 0);
  final lunchBreak = ChronosRange(lunchStart, lunchEnd);
  final meetingTime = Chronos(2024, 3, 15, 14, 30);
  print('Work day: $workDay'); // Work day: 2024-03-15 09:00:00.000 ~ 2024-03-15 17:00:00.000
  print('Lunch break: $lunchBreak'); // Lunch break: 2024-03-15 12:00:00.000 ~ 2024-03-15 13:00:00.000
  print('Work day duration: ${workDay.duration}'); // Work day duration: 8:00:00.000000
  print('Is lunch in work day: ${workDay.contains(lunchStart)}'); // Is lunch in work day: true
  print('Is meeting in work day: ${workDay.contains(meetingTime)}'); // Is meeting in work day: true
  print('Do work and lunch overlap: ${workDay.overlaps(lunchBreak)}'); // Do work and lunch overlap: true
  print('Work-lunch intersection: ${workDay.intersect(lunchBreak)}'); // Work-lunch intersection: 2024-03-15 12:00:00.000 ~ 2024-03-15 13:00:00.000
  print('14. Advanced date manipulations:'); // 14. Advanced date manipulations:
  print('First Monday of month: ${now.firstOfMonth(IsoDayOfWeek.monday)}'); // First Monday of month: 2025-09-01 00:00:00.000
  print('Last Friday of month: ${now.lastOfMonth(IsoDayOfWeek.friday)}'); // Last Friday of month: 2025-09-26 00:00:00.000
  print('First Tuesday of quarter: ${now.firstOfQuarter(IsoDayOfWeek.tuesday)}'); // First Tuesday of quarter: 2025-07-01 00:00:00.000
  print('Last Sunday of year: ${now.lastOfYear(IsoDayOfWeek.sunday)}'); // Last Sunday of year: 2025-12-28 00:00:00.000
  print('Next weekday: ${now.nextWeekday()}'); // Next weekday: 2025-09-15 11:23:41.703648
  print('Previous weekday: ${now.previousWeekday()}'); // Previous weekday: 2025-09-12 11:23:41.703648
  print('Next weekend day: ${now.nextWeekendDay()}'); // Next weekend day: 2025-09-14 11:23:41.703648
  print('Previous weekend day: ${now.previousWeekendDay()}'); // Previous weekend day: 2025-09-07 11:23:41.703648
  print('Set week 26: ${now.setWeek(26)}'); // Set week 26: 2025-06-25 00:00:00.000
  print('Set ISO week 26: ${now.setIsoWeek(26)}'); // Set ISO week 26: 2025-06-23 00:00:00.000
  print('Set day of week (Monday): ${now.setDayOfWeek(1)}'); // Set day of week (Monday): 2025-09-07 00:00:00.000
  print('Set ISO day of week (Friday): ${now.setIsoDayOfWeek(5)}'); // Set ISO day of week (Friday): 2025-09-12 00:00:00.000
  print('Copy with changes: ${now.copyWith(year: 2025, month: 12, day: 25)}'); // Copy with changes: 2025-12-25 11:23:41.703648
  print('Clone: ${now.clone()}'); // Clone: 2025-09-13 11:23:41.703648

  final dateTime = DateTime.now();
  final convertedChronos = dateTime.toChronos();
  print('DateTime to Chronos: $convertedChronos'); // DateTime to Chronos: 2025-09-13 11:23:41.929690
  print('Are equal: ${convertedChronos.millisecondsSinceEpoch == dateTime.millisecondsSinceEpoch}'); // Are equal: true
  print('Is leap year: ${Chronos(2024, 1, 1).year % 4 == 0}'); // Is leap year: true
  print('Days in month: ${Chronos(2024, 2, 1).endOfMonth().day}'); // Days in month: 29
  print('Is same moment: ${now.isAtSameMomentAs(now)}'); // Is same moment: true
  print('Is after: ${now.isAfter(birthday)}'); // Is after: true
  print('Is before: ${now.isBefore(birthday)}'); // Is before: false
  print('Hash code: ${now.hashCode}'); // Hash code: 435985368
  print('String representation: ${now.toString()}'); // String representation: 2025-09-13 11:23:41.703648

  final startDate = Chronos(2024, 1, 1);
  final endDate = Chronos(2024, 12, 31);
  final midDate = Chronos(2024, 6, 15);

  print('Linear interpolation (50%): ${startDate.lerp(endDate, 0.5)}'); // Linear interpolation (50%): 2024-07-01 12:00:00.000
  print('Midpoint between dates: ${startDate.mid(endDate)}'); // Midpoint between dates: 2024-07-01 12:00:00.000
  print('Closest to mid date: ${midDate.closest(startDate, endDate)}'); // Closest to mid date: 2024-01-01 00:00:00.000
  print('Farthest from mid date: ${midDate.farthest(startDate, endDate)}'); // Farthest from mid date: 2024-12-31 00:00:00.000
  print('Minimum date: ${midDate.min(startDate, [endDate])}'); // Minimum date: 2024-01-01 00:00:00.000
  print('Maximum date: ${midDate.max(startDate, [endDate])}'); // Maximum date: 2024-12-31 00:00:00.000
  print('Set from date: ${now.setDateFrom(birthday)}'); // Set from date: 1990-05-15 11:23:41.703648
  print('Set from time: ${now.setTimeFrom(birthday)}'); // Set from time: 2025-09-13 10:30:00.000
  print('Set timestamp: ${now.setTimestamp(1640995200)}'); // Set timestamp: 2022-01-01 08:00:00.000

  print('Monday enum: ${IsoDayOfWeek.monday}'); // Monday enum: IsoDayOfWeek.monday
  print('January enum: ${Month.january}'); // January enum: Month.january
  print('Q1 enum: ${Quarter.q1}'); // Q1 enum: Quarter.q1
  print('Spring season: ${Season.spring}'); // Spring season: Season.spring
  print('Day time unit: ${TimeUnit.day}'); // Day time unit: TimeUnit.day
  print('Northern hemisphere: ${Hemisphere.northern}'); // Northern hemisphere: Hemisphere.northern
}
