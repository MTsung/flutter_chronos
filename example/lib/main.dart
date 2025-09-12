import 'package:flutter_chronos/flutter_chronos.dart';

void main() {
  // 1. Creating Chronos instances (Multiple ways)
  print('1. Creating Chronos instances:');
  final now = Chronos.now();
  final birthday = Chronos(1990, 5, 15, 10, 30);
  final fromTimestamp = Chronos.fromTimestamp(1640995200);
  final parsed = Chronos.parse('2024-12-25 10:30:00');
  final utcDate = Chronos.utc(2024, 3, 15, 14, 30, 45);
  final fromDateTime = Chronos.fromDateTime(DateTime.now());
  final today = Chronos.today();
  final tomorrow = Chronos.tomorrow();
  final yesterday = Chronos.yesterday();

  print('Current time: $now');
  print('Birthday: $birthday');
  print('From timestamp: $fromTimestamp');
  print('Parsed string: $parsed');
  print('UTC date: $utcDate');
  print('fromDateTime: $fromDateTime');
  print('Today: $today');
  print('Tomorrow: $tomorrow');
  print('Yesterday: $yesterday\n');

  // 2. Date arithmetic (All time units)
  print('2. Date arithmetic operations:');
  print('Add microseconds: ${now.addMicroseconds(1000)}');
  print('Add milliseconds: ${now.addMilliseconds(500)}');
  print('Add seconds: ${now.addSeconds(30)}');
  print('Add minutes: ${now.addMinutes(15)}');
  print('Add hours: ${now.addHours(2)}');
  print('Add days: ${now.addDays(7)}');
  print('Add weeks: ${now.addWeeks(2)}');
  print('Add months: ${now.addMonths(3)}');
  print('Add quarters: ${now.addQuarters(1)}');
  print('Add years: ${now.addYears(1)}');
  print('Add decades: ${now.addDecades(1)}');
  print('Add centuries: ${now.addCenturies(1)}');
  print('Add millennia: ${now.addMillennia(1)}');
  print('Add weekdays: ${now.addWeekdays(5)}');
  print('Add unit (month): ${now.addUnit(TimeUnit.month, 2)}\n');

  // 3. Date properties and getters
  print('3. Date properties and getters:');
  print('Year: ${now.year}');
  print('Month: ${now.month}');
  print('Day: ${now.day}');
  print('Hour: ${now.hour}');
  print('Minute: ${now.minute}');
  print('Second: ${now.second}');
  print('Millisecond: ${now.millisecond}');
  print('Microsecond: ${now.microsecond}');
  print('Quarter: ${now.quarter}');
  print('Week: ${now.week}');
  print('ISO Week: ${now.isoWeek}');
  print('Weekday: ${now.weekday}');
  print('ISO Day of Week: ${now.isoDayOfWeek}');
  print('Day of Week: ${now.dayOfWeek}');
  print('Day of Year: ${now.dayOfYear}');
  print('Decade: ${now.decade}');
  print('Century: ${now.century}');
  print('Millennium: ${now.millennium}');
  print('Timestamp: ${now.timestamp}');
  print('Is UTC: ${now.isUtc}');
  print('Is Local: ${now.isLocal}');
  print('Is DST: ${now.isDst}\n');

  // 4. Boundary calculations (All time units)
  print('4. Boundary calculations:');
  print('Start of microsecond: ${now.startOfMillisecond()}');
  print('Start of second: ${now.startOfSecond()}');
  print('Start of minute: ${now.startOfMinute()}');
  print('Start of hour: ${now.startOfHour()}');
  print('Start of day: ${now.startOfDay()}');
  print('Start of week: ${now.startOfWeek()}');
  print('Start of ISO week: ${now.startOfIsoWeek()}');
  print('Start of month: ${now.startOfMonth()}');
  print('Start of quarter: ${now.startOfQuarter()}');
  print('Start of year: ${now.startOfYear()}');
  print('Start of decade: ${now.startOfDecade()}');
  print('Start of century: ${now.startOfCentury()}');
  print('Start of millennium: ${now.startOfMillennium()}');
  print('End of day: ${now.endOfDay()}');
  print('End of month: ${now.endOfMonth()}');
  print('End of year: ${now.endOfYear()}\n');

  // 5. Comprehensive comparisons
  print('5. Date comparisons:');
  print('Is Monday: ${now.isMonday}');
  print('Is Tuesday: ${now.isTuesday}');
  print('Is Wednesday: ${now.isWednesday}');
  print('Is Thursday: ${now.isThursday}');
  print('Is Friday: ${now.isFriday}');
  print('Is Saturday: ${now.isSaturday}');
  print('Is Sunday: ${now.isSunday}');
  print('Is weekday: ${now.isWeekday}');
  print('Is weekend: ${now.isWeekend}');
  print('Is today: ${now.isToday}');
  print('Is yesterday: ${now.isYesterday}');
  print('Is tomorrow: ${now.isTomorrow}');
  print('Is current year: ${now.isCurrentYear}');
  print('Is current month: ${now.isCurrentMonth}');
  print('Is current week: ${now.isCurrentWeek}');
  print('Is current day: ${now.isCurrentDay}');
  print('Is next year: ${now.isNextYear}');
  print('Is last year: ${now.isLastYear}');
  print('Same year as birthday: ${birthday.isSameYear(now)}');
  print('Same month as birthday: ${birthday.isSameMonth(now)}');
  print('Same day as birthday: ${birthday.isSameDay(now)}\n');

  // 6. Extensive formatting options
  print('6. Formatting options:');
  print('Standard format: ${now.format('yyyy-MM-dd HH:mm:ss')}');
  print('Friendly format: ${now.format('EEEE, MMMM d, yyyy')}');
  print('Date string: ${now.toDateString()}');
  print('Time string: ${now.toTimeString()}');
  print('DateTime string: ${now.toDateTimeString()}');
  print('Formatted date: ${now.toFormattedDateString()}');
  print('Day date time: ${now.toDayDateTimeString()}');
  print('Local string: ${now.toDateTimeLocalString()}');
  print('RFC 822: ${now.toRfc822String()}');
  print('RFC 1123: ${now.toRfc1123String()}');
  print('RFC 2822: ${now.toRfc2822String()}');
  print('RFC 3339: ${now.toRfc3339String()}');
  print('RFC 7231: ${now.toRfc7231String()}');
  print('RSS format: ${now.toRssString()}');
  print('W3C format: ${now.toW3cString()}');
  print('Atom format: ${now.toAtomString()}');
  print('Cookie format: ${now.toCookieString()}');
  print('Relative time: ${birthday.diffForHumans()}');
  print('Relative time (Chinese): ${birthday.diffForHumans(locale: 'zh_tw')}');
  print('Relative time (Spanish): ${birthday.diffForHumans(locale: 'es')}');
  print('Relative time (French): ${birthday.diffForHumans(locale: 'fr')}\n');

  // 7. Timezone operations
  print('7. Timezone operations:');
  print('Local time: ${now.toLocal()}');
  print('UTC time: ${now.toUtc()}');
  print('Timezone name: ${now.getTimeZone()}');
  print('Timezone offset: ${now.getTimeZonOffset()}');
  print('Is UTC: ${now.isUtc}');
  print('Is Local: ${now.isLocal}');
  print('Is DST: ${now.isDst}\n');

  // 8. Comprehensive difference calculations
  print('8. Time differences:');
  final diff = now.diff(birthday);
  print('Duration difference: $diff');
  print('Microseconds: ${now.diffInMicroseconds(birthday)}');
  print('Milliseconds: ${now.diffInMilliseconds(birthday)}');
  print('Seconds: ${now.diffInSeconds(birthday)}');
  print('Minutes: ${now.diffInMinutes(birthday)}');
  print('Hours: ${now.diffInHours(birthday)}');
  print('Days: ${now.diffInDays(birthday)}');
  print('Weeks: ${now.diffInWeeks(birthday)}');
  print('Months: ${now.diffInMonths(birthday)}');
  print('Quarters: ${now.diffInQuarters(birthday)}');
  print('Years: ${now.diffInYears(birthday)}');
  print('Decades: ${now.diffInDecade(birthday)}');
  print('Centuries: ${now.diffInCentury(birthday)}');
  print('Millennia: ${now.diffInMillennium(birthday)}');
  print('Weekdays: ${now.diffInWeekdays(birthday)}');
  print('Weekend days: ${now.diffInWeekend(birthday)}\n');

  // 9. Position within time units
  print('9. Position within time units:');
  print('Microsecond of second: ${now.microsecondOfSecond}');
  print('Millisecond of second: ${now.millisecondOfSecond}');
  print('Second of minute: ${now.secondOfMinute}');
  print('Minute of hour: ${now.minuteOfHour}');
  print('Hour of day: ${now.hourOfDay}');
  print('Day of month: ${now.dayOfMonth}');
  print('Day of year: ${now.dayOfYear}');
  print('Week of year: ${now.week}');
  print('Month of year: ${now.month}');
  print('Quarter of year: ${now.quarter}');
  print('Microsecond of day: ${now.microsecondOfDay}');
  print('Second of day: ${now.secondOfDay}');
  print('Minute of day: ${now.minuteOfDay}');
  print('Hour of year: ${now.hourOfYear}');
  print('Day of decade: ${now.dayOfDecade}');
  print('Day of century: ${now.dayOfCentury}');
  print('Day of millennium: ${now.dayOfMillennium}\n');

  // 10. Rounding operations
  print('10. Rounding operations:');
  final testDate = Chronos(2024, 3, 15, 14, 30, 45, 123, 456);
  print('Original: $testDate');
  print('Ceil second: ${testDate.ceilSecond()}');
  print('Floor second: ${testDate.floorSecond()}');
  print('Round second: ${testDate.roundSecond()}');
  print('Ceil minute: ${testDate.ceilMinute()}');
  print('Floor minute: ${testDate.floorMinute()}');
  print('Round minute: ${testDate.roundMinute()}');
  print('Ceil hour: ${testDate.ceilHour()}');
  print('Floor hour: ${testDate.floorHour()}');
  print('Round hour: ${testDate.roundHour()}');
  print('Ceil day: ${testDate.ceilDay()}');
  print('Floor day: ${testDate.floorDay()}');
  print('Round day: ${testDate.roundDay()}');
  print('Round to 15 minutes: ${testDate.roundMinutes(15)}');
  print('Round to 6 hours: ${testDate.roundHours(6)}\n');

  // 11. Setting specific values
  print('11. Setting specific values:');
  print('Set year to 2025: ${now.setYear(2025)}');
  print('Set month to December: ${now.setMonth(12)}');
  print('Set day to 25: ${now.setDay(25)}');
  print('Set hour to 9: ${now.setHour(9)}');
  print('Set minute to 30: ${now.setMinute(30)}');
  print('Set second to 0: ${now.setSecond(0)}');
  print('Set time: ${now.setTime(hour: 15, minute: 45, second: 30)}');
  print('Set date: ${now.setDate(2025, month: 12, day: 25)}\n');

  // 12. Operator overloads
  print('12. Operator overloads:');
  final date1 = Chronos(2024, 3, 15, 10, 0);
  final date2 = Chronos(2024, 3, 15, 14, 0);
  final duration = Duration(hours: 2);

  print('Date1: $date1');
  print('Date2: $date2');
  print('Date1 < Date2: ${date1 < date2}');
  print('Date1 > Date2: ${date1 > date2}');
  print('Date1 <= Date2: ${date1 <= date2}');
  print('Date1 >= Date2: ${date1 >= date2}');
  print('Date1 + 2 hours: ${date1 + duration}');
  print('Date2 - 2 hours: ${date2 - duration}\n');

  // 13. ChronosRange operations
  print('13. ChronosRange operations:');
  final workStart = Chronos(2024, 3, 15, 9, 0);
  final workEnd = Chronos(2024, 3, 15, 17, 0);
  final workDay = ChronosRange(workStart, workEnd);

  final lunchStart = Chronos(2024, 3, 15, 12, 0);
  final lunchEnd = Chronos(2024, 3, 15, 13, 0);
  final lunchBreak = ChronosRange(lunchStart, lunchEnd);

  final meetingTime = Chronos(2024, 3, 15, 14, 30);

  print('Work day: $workDay');
  print('Lunch break: $lunchBreak');
  print('Work day duration: ${workDay.duration}');
  print('Is lunch in work day: ${workDay.contains(lunchStart)}');
  print('Is meeting in work day: ${workDay.contains(meetingTime)}');
  print('Do work and lunch overlap: ${workDay.overlaps(lunchBreak)}');
  print('Work-lunch intersection: ${workDay.intersect(lunchBreak)}\n');

  // 14. Advanced date manipulations
  print('14. Advanced date manipulations:');
  print('First Monday of month: ${now.firstOfMonth(IsoDayOfWeek.monday)}');
  print('Last Friday of month: ${now.lastOfMonth(IsoDayOfWeek.friday)}');
  print(
    'First Tuesday of quarter: ${now.firstOfQuarter(IsoDayOfWeek.tuesday)}',
  );
  print('Last Sunday of year: ${now.lastOfYear(IsoDayOfWeek.sunday)}');
  print('Next weekday: ${now.nextWeekday()}');
  print('Previous weekday: ${now.previousWeekday()}');
  print('Next weekend day: ${now.nextWeekendDay()}');
  print('Previous weekend day: ${now.previousWeekendDay()}');
  print('Set week 26: ${now.setWeek(26)}');
  print('Set ISO week 26: ${now.setIsoWeek(26)}');
  print('Set day of week (Monday): ${now.setDayOfWeek(1)}');
  print('Set ISO day of week (Friday): ${now.setIsoDayOfWeek(5)}');
  print('Copy with changes: ${now.copyWith(year: 2025, month: 12, day: 25)}');
  print('Clone: ${now.clone()}\n');

  // 15. Subtraction operations
  print('15. Subtraction operations:');
  print('Sub microseconds: ${now.subMicroseconds(1000)}');
  print('Sub milliseconds: ${now.subMilliseconds(500)}');
  print('Sub seconds: ${now.subSeconds(30)}');
  print('Sub minutes: ${now.subMinutes(15)}');
  print('Sub hours: ${now.subHours(2)}');
  print('Sub days: ${now.subDays(7)}');
  print('Sub weeks: ${now.subWeeks(2)}');
  print('Sub months: ${now.subMonths(3)}');
  print('Sub quarters: ${now.subQuarters(1)}');
  print('Sub years: ${now.subYears(1)}');
  print('Sub weekdays: ${now.subWeekdays(5)}');
  print('Sub unit (month): ${now.subUnit(TimeUnit.month, 2)}\n');

  // 16. Type conversions
  print('16. Type conversions:');
  final dateTime = DateTime.now();
  final convertedChronos = dateTime.toChronos();
  print('DateTime to Chronos: $convertedChronos');
  print(
    'Are equal: ${convertedChronos.millisecondsSinceEpoch == dateTime.millisecondsSinceEpoch}\n',
  );

  // 17. Utility methods
  print('17. Utility methods:');
  print('Is leap year: ${Chronos(2024, 1, 1).year % 4 == 0}');
  print(
    'Days in month: ${Chronos(2024, 2, 1).endOfMonth().day}',
  ); // February 2024
  print('Is same moment: ${now.isAtSameMomentAs(now)}');
  print('Is after: ${now.isAfter(birthday)}');
  print('Is before: ${now.isBefore(birthday)}');
  print('Hash code: ${now.hashCode}');
  print('String representation: ${now.toString()}\n');

  // 18. Advanced utility methods
  print('18. Advanced utility methods:');
  final startDate = Chronos(2024, 1, 1);
  final endDate = Chronos(2024, 12, 31);
  final midDate = Chronos(2024, 6, 15);

  print('Linear interpolation (50%): ${startDate.lerp(endDate, 0.5)}');
  print('Midpoint between dates: ${startDate.mid(endDate)}');
  print('Closest to mid date: ${midDate.closest(startDate, endDate)}');
  print('Farthest from mid date: ${midDate.farthest(startDate, endDate)}');
  print('Minimum date: ${midDate.min(startDate, [endDate])}');
  print('Maximum date: ${midDate.max(startDate, [endDate])}');
  print('Set from date: ${now.setDateFrom(birthday)}');
  print('Set from time: ${now.setTimeFrom(birthday)}');
  print('Set timestamp: ${now.setTimestamp(1640995200)}\n');

  // 19. Comprehensive enum usage
  print('19. Enum usage examples:');
  print('Monday enum: ${IsoDayOfWeek.monday}');
  print('January enum: ${Month.january}');
  print('Q1 enum: ${Quarter.q1}');
  print('Spring season: ${Season.spring}');
  print('Day time unit: ${TimeUnit.day}');
  print('Northern hemisphere: ${Hemisphere.northern}\n');
}
