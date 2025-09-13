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

Language: [English](https://github.com/MTsung/flutter_chronos/blob/main/README.md) | 繁體中文

-----

## 前言

你是否曾經在找這些功能？現在只要使用 Chronos，就能輕鬆處理！

```
dt.ceilMinutes(5); // 每 5 分鐘為一區間無條件進位 ✅
dt.floorHours(6); // 每 6 小時為一區間無條件捨去 ✅
dt.roundDays(3); // 每 3 天為一區間四捨五入 ✅
dt.lerp(end, 0.5); // 取 dt 與 end 的中間時間 ✅
dt.firstOfMonth(IsoDayOfWeek.friday) // 取該月第 1 個週五 ✅
dt.toDateTimeString() // "2024-02-29 14:30:45" ✅
dt.diffForHumans(); // "3 days ago" ✅
dt.isDst; // 是否在夏令時間 ✅
dt.isLeapYear; // 是否閏年 ✅
dt.isLongYear; // 是否為 ISO 長年 ✅
dt.season; // 取得季節 ✅
dt > dt1; // 是否 dt 比 dt1 晚 ✅
dt.startOfCentury() // 取的本世紀的起始 ✅
dt.endOfMonth() // 取的本世紀的起始 ✅
dt.subMonths(3); // 減 3 個月（不溢位） ✅
dt.addWeekdays(6); // 加 6 個工作天 ✅
dt.addWeeks(2); // 加 2 週 ✅
dt.isBetween(start, end); // 介於區間之間 ✅
range.overlaps(range1) // 時間區間是否重疊 ✅
dt.max(dt1); // 取較晚時間 ✅
dt.min(dt1); // 取較早時間 ✅
dt.diffInYear(dt1); // 計算相差年數（浮點數） ✅
dt.setYear(2026); // 改年份 ✅
dt.daysInMonth; // 該月份有幾天 ✅
dt.secondOfDay; // 現在過了一天中的幾秒 ✅
dt.setDay(25).setHour(8); // 流暢介面 ✅
```

Chronos 繼承自 Dart 原生 DateTime，讓你除了原本的基本功能之外，還有更直覺的時間操作方法、靈活的週與月份處理、方便的時間格式化以及強大的時間差計算，讓開發者能更快速地完成複雜的日期時間邏輯，減少手動計算與錯誤。

## 功能特色

- 提供了 700 種 Method，add、sub、ceil、floor、round、is、of、in、diff、format、humans format、set、mid、max、lerp、next、last、operator、overlaps、contains...
- 支援 [ISO 週日曆](https://zh.wikipedia.org/zh-tw/ISO%E9%80%B1%E6%97%A5%E6%9B%86)
- 支援千年、世紀、十年、年、ISO 年、季度、季節（可設定南北半球）、週、ISO 週、天、時、分、秒、毫秒、微秒。
- 可取得或設定 ISO 週、週數、季度、年份位置；計算月份中的特定星期、季度中的第一/最後一天等。
- 支援各種單位的時間比較、範圍判斷、是否在過去/未來、是否為閏年、是否為週末/工作日、生日檢查等。
- 提供加減工作日、尋找下一個/上一個工作日或週末，方便商業日曆計算。
- 支援流式接口（Fluent Interface），加法、減法、邊界設定、格式化等操作可一行完成，程式碼更簡潔可讀。
- 支援常用字串格式化（Format），整合 `intl` 直接顯示（日期、時間、日期時間）、ISO、RFC 系列標準格式，也保留自訂與本地化格式化功能。
- 支援時間差顯示，整合 `timeago` 可直接顯示相對時間差，例如「5 分鐘前」、「2 天後」，方便在 UI 上呈現易讀的時間訊息。
- 提供完整時間單位的讀取與設定方法，可快速取得年份、季度、週數、天、時、分、秒、毫秒、微秒，以及設定特定單位或複製其他日期。
- 直接使用運算子（Operator）判斷與加減，提高程式碼可讀性，加速開發。
- 可取得時間單位的位置，如「今天是這週的第幾天」、「這個月的第幾微秒」，支援所有單位。
- 可判斷本地時間或 UTC、時區名稱、時區偏移、夏令時間，方便跨時區應用。
- 可設定現在時間（Fake Now），讓單元測試（Unit Testing）更方便撰寫。

---

# 實例化

## 基本建構子

```dart
// 建立指定日期時間
Chronos date = Chronos(2023, 12, 25);
Chronos dateTime = Chronos(2023, 12, 25, 14, 30, 45);

// UTC 時間
Chronos utcDate = Chronos.utc(2023, 12, 25, 12, 0);

// 從毫秒建立
Chronos fromMs = Chronos.fromMillisecondsSinceEpoch(1703505600000);

// 從微秒建立
Chronos fromMicro = Chronos.fromMicrosecondsSinceEpoch(1703505600000000);
```

## 靜態方法

```dart
// 解析字串
Chronos parsed = Chronos.parse('2023-12-25T14:30:00');
Chronos? tryParsed = Chronos.tryParse('2023-12-25T14:30:00');

// 從 Unix 時間戳建立
Chronos fromTimestamp = Chronos.fromTimestamp(1703505600);

// 從 DateTime 轉換
Chronos fromDateTime = Chronos.fromDateTime(DateTime.now());

// 取得當前時間
Chronos now = Chronos.now();
Chronos today = Chronos.today();      // 今天 00:00:00
Chronos tomorrow = Chronos.tomorrow(); // 明天 00:00:00
Chronos yesterday = Chronos.yesterday(); // 昨天 00:00:00
```

# 取值器 (Getters)

## 基本屬性

```dart
Chronos date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750); // 閏年2月29日

// 基本時間單位
print(date.year);        // 2024
print(date.month);       // 2
print(date.day);         // 29
print(date.hour);        // 14
print(date.minute);      // 30
print(date.second);      // 45
print(date.millisecond); // 500
print(date.microsecond); // 750

// 星期相關
print(date.weekday);     // 4 (ISO 星期，1=週一, 7=週日)
print(date.dayOfWeek);   // 4 (星期，0=週日, 6=週六)
print(date.isoDayOfWeek); // 4 (同 weekday)

// 其他時間單位
print(date.quarter);     // 1 (第一季)
print(date.week);        // 9 (年中第9週)
print(date.isoWeek);     // 9 (ISO 週數)
print(date.decade);      // 203 (第203個十年)
print(date.century);     // 21 (21世紀)
print(date.millennium);  // 3 (第3千年)

// 時間戳相關
print(date.timestamp);           // 1709188245 (Unix 時間戳，秒)
print(date.millisecondsSinceEpoch); // 1709188245500 (毫秒時間戳)
print(date.microsecondsSinceEpoch);  // 1709188245500750 (微秒時間戳)
```

## 時區相關

```dart
print(date.getTimeZone());     // "CST" (時區名稱)
print(date.getTimeZoneOffset()); // 8:00:00.000000 (時區偏移)
print(date.isUtc);             // false (是否為 UTC)
print(date.isLocal);           // true (是否為本地時間)
print(date.isDst);             // false (是否為夏令時間)
```

## 星期判斷

```dart
print(date.isSunday);    // false (是否為週日)
print(date.isMonday);    // false (是否為週一)
print(date.isTuesday);   // false (是否為週二)
print(date.isWednesday); // false (是否為週三)
print(date.isThursday);  // true (是否為週四)
print(date.isFriday);    // false (是否為週五)
print(date.isSaturday);  // false (是否為週六)
print(date.isWeekday);   // true (是否為工作日)
print(date.isWeekend);   // false (是否為週末)
```

## 時間判斷

```dart
print(date.isToday);      // false (是否為今天，假設今天不是2024/2/29)
print(date.isTomorrow);   // false (是否為明天)
print(date.isYesterday);  // false (是否為昨天)
print(date.isFuture);     // false (是否為未來，假設現在是2024年之後)
print(date.isPast);       // true (是否為過去)
print(date.isLeapYear);   // true (是否為閏年，2024是閏年)
```

## 季節相關

```dart
print(date.season);       // Season.winter (季節，北半球2月為冬季)
print(date.isInSpring);   // false (是否為春季)
print(date.isInSummer);   // false (是否為夏季)
print(date.isInFall);     // false (是否為秋季)
print(date.isInWinter);   // true (是否為冬季)
```

# 設定器 (Setters)

## 設定日期時間

```dart
Chronos date = Chronos.now();

// 設定完整日期
Chronos newDate = date.setDate(2023, month: 12, day: 25);

// 設定時間
Chronos newTime = date.setTime(hour: 14, minute: 30, second: 45);

// 從其他 Chronos 複製日期/時間
Chronos other = Chronos(2023, 1, 1, 12, 0);
Chronos copyDate = date.setDateFrom(other);
Chronos copyTime = date.setTimeFrom(other);

// 設定個別單位
Chronos setYear = date.setYear(2024);
Chronos setMonth = date.setMonth(6);
Chronos setDay = date.setDay(15);
Chronos setHour = date.setHour(9);
Chronos setMinute = date.setMinute(30);
Chronos setSecond = date.setSecond(0);
Chronos setMs = date.setMillisecond(500);
Chronos setMicro = date.setMicrosecond(750);

// 設定時間戳
Chronos setTimestamp = date.setTimestamp(1703505600);

// 設定週相關
Chronos setWeek = date.setWeek(25);           // 設定年中第幾週
Chronos setIsoWeek = date.setIsoWeek(25);     // 設定 ISO 週
Chronos setDayOfWeek = date.setDayOfWeek(3);  // 設定星期幾
Chronos setIsoDayOfWeek = date.setIsoDayOfWeek(3); // 設定 ISO 星期幾
```

# 週相關功能

## 週的開始和結束

```dart
Chronos date = Chronos.now();

// 週的邊界 (週日為一週開始)
Chronos startOfWeek = date.startOfWeek();     // 週日 00:00:00
Chronos endOfWeek = date.endOfWeek();         // 週六 23:59:59

// ISO 週的邊界 (週一為一週開始)
Chronos startOfIsoWeek = date.startOfIsoWeek(); // 週一 00:00:00
Chronos endOfIsoWeek = date.endOfIsoWeek();     // 週日 23:59:59
```

## 週數計算

```dart
print(date.week);        // 9 (年中第9週)
print(date.isoWeek);     // 9 (ISO 週數)
print(date.weekOfYear);  // 9 (年中週數)
print(date.weekOfMonth); // 5 (月中第5週)
```

## 工作日操作

```dart
// 下一個/上一個工作日
Chronos nextWorkday = date.nextWeekday();
Chronos prevWorkday = date.previousWeekday();

// 下一個/上一個週末
Chronos nextWeekend = date.nextWeekendDay();
Chronos prevWeekend = date.previousWeekendDay();

// 加減工作日
Chronos addWorkdays = date.addWeekdays(5);  // 加 5 個工作日
Chronos subWorkdays = date.subWeekdays(3);  // 減 3 個工作日
```

## 月份中的特定星期

```dart
// 月份中第一個週一
Chronos firstMonday = date.firstOfMonth(IsoDayOfWeek.monday);

// 月份中最後一個週五
Chronos lastFriday = date.lastOfMonth(IsoDayOfWeek.friday);

// 季度中第一個週三
Chronos firstWed = date.firstOfQuarter(IsoDayOfWeek.wednesday);

// 年份中最後一個週日
Chronos lastSun = date.lastOfYear(IsoDayOfWeek.sunday);
```

# 流暢介面 (Fluent Interface)

Chronos 支援鏈式調用，讓程式碼更簡潔易讀：

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

# 字串格式化

## 基本格式

```dart
Chronos date = Chronos(2024, 2, 29, 14, 30, 45);

// 基本格式
print(date.toDateString());           // "2024-02-29"
print(date.toTimeString());           // "14:30:45"
print(date.toDateTimeString());       // "2024-02-29 14:30:45"
print(date.toFormattedDateString());  // "Feb 29, 2024"
print(date.toFormattedDayDateString()); // "Thu, Feb 29, 2024"
print(date.toDayDateTimeString());    // "Thu, Feb 29, 2024 2:30 PM"
```

## 標準格式

```dart
// ISO 8601 和其他標準格式 (需要 UTC 時間)
Chronos utcDate = Chronos.utc(2024, 2, 29, 14, 30, 45);
print(utcDate.toIso8601String());        // "2024-02-29T14:30:45.000Z"
print(date.toDateTimeLocalString());     // "2024-02-29T14:30:45"
print(utcDate.toRfc3339String());        // "2024-02-29T14:30:45XXX"
print(utcDate.toRfc822String());         // "Thu, 29 Feb 24 14:30:45 "
print(utcDate.toRfc850String());         // "Thursday, 29-Feb-24 14:30:45 UTC"
print(utcDate.toRfc1036String());        // "Thu, 29 Feb 24 14:30:45 "
print(utcDate.toRfc1123String());        // "Thu, 29 Feb 2024 14:30:45 "
print(utcDate.toRfc2822String());        // "Thu, 29 Feb 2024 14:30:45 "
print(utcDate.toRfc7231String());        // "Thu, 29 Feb 2024 14:30:45 GMT"
print(utcDate.toAtomString());           // "2024-02-29T14:30:45XXX"
print(utcDate.toW3cString());            // "2024-02-29T14:30:45XXX"
print(utcDate.toRssString());            // "Thu, 29 Feb 2024 14:30:45 "
print(utcDate.toCookieString());         // "Thursday, 29-Feb-2024 14:30:45 UTC"
```

## 自訂格式化

Chronos 使用 [intl](https://pub.dev/packages/intl) 套件，提供更多格式化選項。

```dart
import 'package:intl/intl.dart';

Chronos date = Chronos(2024, 2, 29, 14, 30, 45);

// 自訂格式
String formatted1 = date.format('yyyy-MM-dd HH:mm:ss'); // "2024-02-29 14:30:45"
String formatted2 = date.format('yyyy年MM月dd日');        // "2024年02月29日"
String formatted3 = date.format('EEEE, MMMM d, y');     // "Thursday, February 29, 2024"

// 本地化格式
String zhTW = date.format('yyyy年MM月dd日 EEEE', 'zh_TW'); // "2024年02月29日 星期四"

```

# 運算子重載

Chronos 支援標準的比較和算術運算子：

```dart
Chronos date1 = Chronos(2024, 2, 28);  // 2024年2月28日
Chronos date2 = Chronos(2024, 2, 29);  // 2024年2月29日 (閏日)

// 比較運算子
print(date1 < date2);   // true (小於)
print(date1 <= date2);  // true (小於等於)
print(date1 > date2);   // false (大於)
print(date1 >= date2);  // false (大於等於)
print(date1 == date2);  // false (等於)

// 算術運算子
Chronos futureDate = date1 + Duration(days: 7);    // 2024-03-06 (加法)
Chronos pastDate = date1 - Duration(hours: 2);     // 2024-02-27 22:00:00 (減法)

// 鏈式運算
Chronos result = Chronos(2024, 2, 29) + Duration(days: 1) - Duration(hours: 3); // 2024-03-01 21:00:00
```

# 比較

## 相同單位比較

```dart
Chronos date1 = Chronos(2024, 2, 29, 14, 30);  // 2024年2月29日 14:30
Chronos date2 = Chronos(2024, 2, 29, 16, 45);  // 2024年2月29日 16:45

// 比較是否為相同的時間單位
print(date1.isSameYear(date2));         // true (同年)
print(date1.isSameIsoYear(date2));      // true (同 ISO 年)
print(date1.isSameMonth(date2));        // true (同月)
print(date1.isSameWeek(date2));         // true (同週)
print(date1.isSameIsoWeek(date2));      // true (同 ISO 週)
print(date1.isSameDay(date2));          // true (同日)
print(date1.isSameHour(date2));         // false (不同小時)
print(date1.isSameMinute(date2));       // false (不同分鐘)
print(date1.isSameSecond(date2));       // false (不同秒)
print(date1.isSameMillisecond(date2));  // false (不同毫秒)
print(date1.isSameMicrosecond(date2));  // false (不同微秒)
print(date1.isSameQuarter(date2));      // true (同季度，第一季)
print(date1.isSameDecade(date2));       // true (同十年，2021年代)
print(date1.isSameCentury(date2));      // true (同世紀，21世紀)
print(date1.isSameMillennium(date2));   // true (同千年，第21千年)

// 與當前時間比較 (假設現在是2025年3月15日)
print(date1.isCurrentYear);        // false (是否為今年)
print(date1.isCurrentIsoYear);     // false (是否為當前 ISO 年)
print(date1.isCurrentMonth);       // false (是否為本月)
print(date1.isCurrentWeek);        // false (是否為本週)
print(date1.isCurrentIsoWeek);     // false (是否為當前 ISO 週)
print(date1.isCurrentDay);         // false (是否為今天)
print(date1.isCurrentHour);        // false (是否為當前小時)
print(date1.isCurrentMinute);      // false (是否為當前分鐘)
print(date1.isCurrentSecond);      // false (是否為當前秒)
print(date1.isCurrentQuarter);     // false (是否為當前季度)
print(date1.isCurrentDecade);      // true (是否為當前十年，2021年代)
print(date1.isCurrentCentury);     // true (是否為當前世紀，21世紀)
print(date1.isCurrentMillennium);  // true (是否為當前千年，第3千年)

// 下一個時間單位 (相對於2024年2月29日)
print(date1.isNextYear);           // false (是否為明年，2025)
print(date1.isNextMonth);          // false (是否為下個月，3月)
print(date1.isNextWeek);           // false (是否為下週)
print(date1.isNextDay);            // false (是否為明天，3月1日)
print(date1.isNextHour);           // false (是否為下個小時，15:00)

// 上一個時間單位 (相對於2024年2月29日)
print(date1.isLastYear);           // false (是否為去年，2023)
print(date1.isLastMonth);          // false (是否為上個月，1月)
print(date1.isLastWeek);           // false (是否為上週)
print(date1.isLastDay);            // false (是否為昨天，2月28日)
print(date1.isLastHour);           // false (是否為上個小時，13:00)
```

## 時間範圍比較

```dart
Chronos start = Chronos(2024, 1, 1);     // 2024年1月1日
Chronos end = Chronos(2024, 12, 31);     // 2024年12月31日
Chronos check = Chronos(2024, 2, 29);    // 2024年2月29日 (閏日)

// 檢查是否在範圍內
print(check.isBetween(start, end));           // true (在範圍內)
print(check.isBetween(start, end, equal: false)); // true (不包含邊界，但仍在範圍內)

// 生日比較
Chronos birthday = Chronos(1996, 2, 29); // 1996年2月29日出生
print(check.isBirthday(birthday));            // true (同月同日，都是2月29日)
```

## 邊界檢查

```dart
Chronos date = Chronos(2024, 2, 29, 14, 30, 45, 500, 750);

// 檢查是否為時間單位的開始
print(date.isStartOfDay);         // false (不是00:00:00)
print(date.isStartOfWeek);        // false (不是週日00:00:00)
print(date.isStartOfIsoWeek);     // false (不是週一00:00:00)
print(date.isStartOfMonth);       // false (不是2月1日00:00:00)
print(date.isStartOfQuarter);     // false (不是1月1日00:00:00)
print(date.isStartOfYear);        // false (不是1月1日00:00:00)
print(date.isStartOfIsoYear);     // false (不是ISO年開始)
print(date.isStartOfDecade);      // false (不是2021年1月1日00:00:00)
print(date.isStartOfCentury);     // false (不是2001年1月1日00:00:00)
print(date.isStartOfMillennium);  // false (不是2001年1月1日00:00:00)
print(date.isStartOfHour);        // false (不是14:00:00)
print(date.isStartOfMinute);      // false (不是14:30:00)
print(date.isStartOfSecond);      // false (不是14:30:45.000)
print(date.isStartOfMillisecond); // false (不是14:30:45.500000)

// 檢查是否為時間單位的結束
print(date.isEndOfDay);           // false (不是23:59:59.999)
print(date.isEndOfWeek);          // false (不是週六23:59:59.999)
print(date.isEndOfIsoWeek);       // false (不是週日23:59:59.999)
print(date.isEndOfMonth);         // true (2月29日是2月最後一天)
print(date.isEndOfQuarter);       // false (不是3月31日23:59:59.999)
print(date.isEndOfYear);          // false (不是12月31日23:59:59.999)
print(date.isEndOfIsoYear);       // false (不是ISO年結束)
print(date.isEndOfDecade);        // false (不是2030年12月31日23:59:59.999)
print(date.isEndOfCentury);       // false (不是2100年12月31日23:59:59.999)
print(date.isEndOfMillennium);    // false (不是3000年12月31日23:59:59.999)
print(date.isEndOfHour);          // false (不是14:59:59.999)
print(date.isEndOfMinute);        // false (不是14:30:59.999)
print(date.isEndOfSecond);        // false (不是14:30:45.999)
print(date.isEndOfMillisecond);   // false (不是14:30:45.500999)
print(date.isLastOfMonth);        // true (2月29日是2月最後一天)

// 其他特殊檢查
print(date.isLongYear);           // false (2024年有52週，不是53週)
print(date.isLongIsoYear);        // false (2024 ISO年有52週，不是53週)
print(date.isNowOrFuture);        // false (假設現在是2025年，所以是過去)
print(date.isNowOrPast);          // true (假設現在是2025年，所以是過去或現在)
```

# 加法和減法

## 單一單位操作

```dart
Chronos date = Chronos.now();

// 加法 (單數)
Chronos addMicro = date.addMicrosecond();    // 加 1 微秒
Chronos addMilli = date.addMillisecond();    // 加 1 毫秒
Chronos addSec = date.addSecond();           // 加 1 秒
Chronos addMin = date.addMinute();           // 加 1 分鐘
Chronos addHour = date.addHour();            // 加 1 小時
Chronos addDay = date.addDay();              // 加 1 天
Chronos addWeek = date.addWeek();            // 加 1 週
Chronos addMonth = date.addMonth();          // 加 1 月
Chronos addYear = date.addYear();            // 加 1 年

// 減法 (單數)
Chronos subDay = date.subDay();              // 減 1 天
Chronos subWeek = date.subWeek();            // 減 1 週
Chronos subMonth = date.subMonth();          // 減 1 月
Chronos subYear = date.subYear();            // 減 1 年
```

## 複數單位操作

```dart
// 加法 (複數)
Chronos add5Days = date.addDays(5);          // 加 5 天
Chronos add3Weeks = date.addWeeks(3);        // 加 3 週
Chronos add6Months = date.addMonths(6);      // 加 6 月
Chronos add2Years = date.addYears(2);        // 加 2 年

// 減法 (複數)
Chronos sub10Days = date.subDays(10);        // 減 10 天
Chronos sub2Months = date.subMonths(2);      // 減 2 月
Chronos sub5Years = date.subYears(5);        // 減 5 年
```

## 特殊單位操作

```dart
// 季度操作
Chronos addQuarter = date.addQuarter();      // 加 1 季
Chronos add2Quarters = date.addQuarters(2);  // 加 2 季

// 十年、世紀、千年
Chronos addDecade = date.addDecade();        // 加 10 年
Chronos addCentury = date.addCentury();      // 加 100 年
Chronos addMillennium = date.addMillennium(); // 加 1000 年

// ISO 相關
Chronos addIsoWeek = date.addIsoWeek();      // 加 1 ISO 週
Chronos addIsoYear = date.addIsoYear();      // 加 1 ISO 年
```

## 通用單位操作

```dart
// 使用 TimeUnit 枚舉進行加法
Chronos result1 = date.addUnit(TimeUnit.day, 5);         // 加 5 天
Chronos result2 = date.addUnit(TimeUnit.month, 3);       // 加 3 月
Chronos result3 = date.addUnit(TimeUnit.hour, 12);       // 加 12 小時
Chronos result4 = date.addUnit(TimeUnit.quarter, 2);     // 加 2 季
Chronos result5 = date.addUnit(TimeUnit.decade, 1);      // 加 1 十年

// 使用 TimeUnit 枚舉進行減法
Chronos result6 = date.subUnit(TimeUnit.week, 2);        // 減 2 週
Chronos result7 = date.subUnit(TimeUnit.year, 5);        // 減 5 年
Chronos result8 = date.subUnit(TimeUnit.century, 1);     // 減 1 世紀

// 通用單位差異計算
double diff1 = date1.diffInUnit(TimeUnit.day, date2);    // 天數差異
double diff2 = date1.diffInUnit(TimeUnit.hour, date2);   // 小時差異
double diff3 = date1.diffInUnit(TimeUnit.month, date2);  // 月份差異
```

# 差異計算

## 基本差異

```dart
Chronos date1 = Chronos(2023, 1, 1);
Chronos date2 = Chronos(2023, 12, 31);

// 基本差異計算
Duration diff = date1.diff(date2);           // 取得 Duration
Duration difference = date1.difference(date2); // 同上

// 各種單位的差異
double years = date1.diffInYears(date2);         // 年差
double months = date1.diffInMonths(date2);       // 月差
double weeks = date1.diffInWeeks(date2);         // 週差
double days = date1.diffInDays(date2);           // 天差
double hours = date1.diffInHours(date2);         // 小時差
double minutes = date1.diffInMinutes(date2);     // 分鐘差
double seconds = date1.diffInSeconds(date2);     // 秒差
double millis = date1.diffInMilliseconds(date2); // 毫秒差
double micros = date1.diffInMicroseconds(date2); // 微秒差
```

## 特殊差異計算

```dart
// 季度和更大單位
double quarters = date1.diffInQuarters(date2);   // 季差
double decades = date1.diffInDecade(date2);      // 十年差
double centuries = date1.diffInCentury(date2);   // 世紀差
double millennia = date1.diffInMillennium(date2); // 千年差

// 工作日差異
int weekdays = date1.diffInWeekdays(date2);      // 工作日差異
int weekends = date1.diffInWeekend(date2);       // 週末天數差異

// 過濾條件的天數差異
int filteredDays = date1.diffInDaysFiltered(date2, (d) => d.isWeekday);
```

## 時間單位內的位置

```dart
Chronos date = Chronos.now();

// 微秒級位置 (基於 2024-02-29 14:30:45.500750)
print(date.microsecondOfMillisecond); // 750 (毫秒中第750微秒)
print(date.microsecondOfSecond);      // 500750 (秒中第500750微秒)
print(date.microsecondOfMinute);      // 45500750 (分鐘中第45500750微秒)
print(date.microsecondOfHour);        // 1845500750 (小時中第1845500750微秒)
print(date.microsecondOfDay);         // 52245500750 (天中第52245500750微秒)
print(date.microsecondOfWeek);        // 397845500750 (週中第397845500750微秒)
print(date.microsecondOfMonth);       // 2471445500750 (月中第2471445500750微秒)
print(date.microsecondOfQuarter);     // 5149845500750 (季中第5149845500750微秒)
print(date.microsecondOfYear);        // 5149845500750 (年中第5149845500750微秒)
print(date.microsecondOfIsoYear);     // 5149845500750 (ISO年中第5149845500750微秒)
print(date.microsecondOfDecade);      //  (十年中微秒數)
print(date.microsecondOfCentury);     // 730909845500750 (世紀中微秒數)
print(date.microsecondOfMillennium);  // 730909845500750 (千年中微秒數)

// 毫秒級位置 (基於 2024-02-29 14:30:45.500)
print(date.millisecondOfSecond);      // 500 (秒中第500毫秒)
print(date.millisecondOfMinute);      // 45500 (分鐘中第45500毫秒)
print(date.millisecondOfHour);        // 1845500 (小時中第1845500毫秒)
print(date.millisecondOfDay);         // 52245500 (天中第52245500毫秒)
print(date.millisecondOfWeek);        // 365919500 (週中第365919500毫秒)
print(date.millisecondOfMonth);       // 2505645500 (月中第2505645500毫秒)
print(date.millisecondOfQuarter);     // 5097645500 (季中第5097645500毫秒)
print(date.millisecondOfYear);        // 5097645500 (年中第5097645500毫秒)
print(date.millisecondOIsofYear);     // 5097645500 (ISO年中第5097645500毫秒)
print(date.millisecondOfDecade);      //  (十年中毫秒數)
print(date.millisecondOfCentury);     // 757785645500 (世紀中毫秒數)
print(date.millisecondOfMillennium);  // 63745785645500 (千年中毫秒數)

// 秒級位置 (基於 2024-02-29 14:30:45)
print(date.secondOfMinute);           // 45 (分鐘中第45秒)
print(date.secondOfHour);             // 1845 (小時中第1845秒)
print(date.secondOfDay);              // 52245 (天中第52245秒)
print(date.secondOfWeek);             // 365919 (週中第365919秒)
print(date.secondOfMonth);            // 2505645 (月中第2505645秒)
print(date.secondOfQuarter);          // 5097645 (季中第5097645秒)
print(date.secondOfYear);             // 5097645 (年中第5097645秒)
print(date.secondOfIsoYear);          // 5097645 (ISO年中第5097645秒)
print(date.secondOfDecade);           //  (十年中秒數)
print(date.secondOfCentury);          // 757785645 (世紀中秒數)
print(date.secondOfMillennium);       // 63745785645 (千年中秒數)

// 分鐘級位置 (基於 2024-02-29 14:30)
print(date.minuteOfHour);             // 30 (小時中第30分鐘)
print(date.minuteOfDay);              // 870 (天中第870分鐘)
print(date.minuteOfWeek);             // 6099 (週中第6099分鐘)
print(date.minuteOfMonth);            // 41760 (月中第41760分鐘)
print(date.minuteOfQuarter);          // 84960 (季中第84960分鐘)
print(date.minuteOfYear);             // 84960 (年中第84960分鐘)
print(date.minuteOfIsoYear);          // 84960 (ISO年中第84960分鐘)
print(date.minuteOfDecade);           //  (十年中分鐘數)
print(date.minuteOfCentury);          // 12629760 (世紀中分鐘數)
print(date.minuteOfMillennium);       // 1062429760 (千年中分鐘數)

// 小時級位置 (基於 2024-02-29 14:30)
print(date.hourOfDay);                // 14 (天中第14小時)
print(date.hourOfWeek);               // 110 (週中第110小時)
print(date.hourOfMonth);              // 694 (月中第694小時)
print(date.hourOfQuarter);            // 1414 (季中第1414小時)
print(date.hourOfYear);               // 1414 (年中第1414小時)
print(date.hourOfIsoYear);            // 1414 (ISO年中第1414小時)
print(date.hourOfDecade);             //  (十年中小時數)
print(date.hourOfCentury);            // 210496 (世紀中小時數)
print(date.hourOfMillennium);         // 17707496 (千年中小時數)

// 天級位置 (基於 2024-02-29)
print(date.dayOfWeek);                // 4 (週中第4天，週四)
print(date.dayOfMonth);               // 29 (月中第29天)
print(date.dayOfQuarter);             // 60 (季中第60天)
print(date.dayOfYear);                // 60 (年中第60天)
print(date.dayOfIsoYear);             // 60 (ISO年中第60天)
print(date.dayOfDecade);              //  (十年中第1521天)
print(date.dayOfCentury);             // 8791 (世紀中第8791天)
print(date.dayOfMillennium);          // 737791 (千年中第737791天)

// 週級位置
print(date.weekOfMonth);              // 5 (月中第5週)
print(date.weekOfQuarter);            // 季中第幾週
print(date.weekOfYear);               // 9 (年中第9週)
print(date.weekOfIsoYear);            // 9 (ISO年中第9週)
print(date.weekOfDecade);             // 十年中第幾週
print(date.weekOfCentury);            // 世紀中第幾週
print(date.weekOfMillennium);         // 千年中第幾週

// 月級位置
print(date.monthOfQuarter);           // 2 (季中第2月)
print(date.monthOfYear);              // 2 (年中第2月)
print(date.monthOfIsoYear);           // 2 (ISO年中第2月)
print(date.monthOfDecade);            // 十年中第幾月
print(date.monthOfCentury);           // 世紀中第幾月
print(date.monthOfMillennium);        // 千年中第幾月

// 季度級位置
print(date.quarterOfYear);            // 1 (年中第1季)
print(date.quarterOfIsoYear);         // 1 (ISO年中第1季)
print(date.quarterOfDecade);          // 十年中第幾季
print(date.quarterOfCentury);         // 世紀中第幾季
print(date.quarterOfMillennium);      // 千年中第幾季

// 年級位置
print(date.yearOfDecade);             // 5 (十年中第5年，2024在2021年代)
print(date.yearOfCentury);            // 24 (世紀中第24年)
print(date.yearOfMillennium);         // 24 (千年中第24年)

// 十年級位置
print(date.decadeOfCentury);          // 世紀中第幾十年
print(date.decadeOfMillennium);       // 千年中第幾十年

// 世紀級位置
print(date.centuryOfMillennium);      // 千年中第幾世紀
```

## 時間單位容量

```dart
// 微秒容量
print(date.microsecondsInMillisecond); // 一毫秒微秒數 (1000)
print(date.microsecondsInSecond);      // 一秒微秒數 (1,000,000)
print(date.microsecondsInMinute);      // 一分鐘微秒數
print(date.microsecondsInHour);        // 一小時微秒數
print(date.microsecondsInDay);         // 一天微秒數
print(date.microsecondsInWeek);        // 一週微秒數
print(date.microsecondsInMonth);       // 一月微秒數
print(date.microsecondsInQuarter);     // 一季微秒數
print(date.microsecondsInYear);        // 一年微秒數
print(date.microsecondsInDecade);      // 一十年微秒數
print(date.microsecondsInCentury);     // 一世紀微秒數
print(date.microsecondsInMillennium);  // 一千年微秒數

// 毫秒容量
print(date.millisecondsInSecond);      // 一秒毫秒數 (1000)
print(date.millisecondsInMinute);      // 一分鐘毫秒數
print(date.millisecondsInHour);        // 一小時毫秒數
print(date.millisecondsInDay);         // 一天毫秒數
print(date.millisecondsInWeek);        // 一週毫秒數
print(date.millisecondsInMonth);       // 一月毫秒數
print(date.millisecondsInQuarter);     // 一季毫秒數
print(date.millisecondsInYear);        // 一年毫秒數
print(date.millisecondsInDecade);      // 一十年毫秒數
print(date.millisecondsInCentury);     // 一世紀毫秒數
print(date.millisecondsInMillennium);  // 一千年毫秒數

// 秒容量
print(date.secondsInMinute);           // 一分鐘秒數 (60)
print(date.secondsInHour);             // 一小時秒數 (3600)
print(date.secondsInDay);              // 一天秒數
print(date.secondsInWeek);             // 一週秒數
print(date.secondsInMonth);            // 一月秒數
print(date.secondsInQuarter);          // 一季秒數
print(date.secondsInYear);             // 一年秒數
print(date.secondsInDecade);           // 一十年秒數
print(date.secondsInCentury);          // 一世紀秒數
print(date.secondsInMillennium);       // 一千年秒數

// 分鐘容量 (基於 2024-02-29，閏年2月)
print(date.minutesInHour);             // 60 (一小時分鐘數)
print(date.minutesInDay);              // 1440 (一天分鐘數)
print(date.minutesInWeek);             // 10080 (一週分鐘數)
print(date.minutesInMonth);            // 41760 (2024年2月分鐘數，29天)
print(date.minutesInQuarter);          // 131040 (2024年第一季分鐘數)
print(date.minutesInYear);             // 527040 (2024年分鐘數，閏年)
print(date.minutesInDecade);           // 5260320 (2021年代分鐘數)
print(date.minutesInCentury);          // 52596000 (21世紀分鐘數)
print(date.minutesInMillennium);       // 525949920 (第3千年分鐘數)

// 小時容量 (基於 2024-02-29，閏年2月)
print(date.hoursInDay);                // 24 (一天小時數)
print(date.hoursInWeek);               // 168 (一週小時數)
print(date.hoursInMonth);              // 696 (2024年2月小時數，29天)
print(date.hoursInQuarter);            // 2184 (2024年第一季小時數)
print(date.hoursInYear);               // 8784 (2024年小時數，閏年)
print(date.hoursInDecade);             //  (2021年代小時數)
print(date.hoursInCentury);            // 876600 (21世紀小時數)
print(date.hoursInMillennium);         // 8765832 (第3千年小時數)

// 天容量 (基於 2024-02-29，閏年2月)
print(date.daysInWeek);                // 7 (一週天數)
print(date.daysInMonth);               // 29 (2024年2月天數，閏年)
print(date.daysInQuarter);             // 91 (2024年第一季天數)
print(date.daysInYear);                // 366 (2024年天數，閏年)
print(date.daysInDecade);              //  (2021年代天數)
print(date.daysInCentury);             // 36525 (21世紀天數)
print(date.daysInMillennium);          // 365243 (第21千年天數)

// 週容量
print(date.weeksInMonth);              // 一月週數
print(date.weeksInQuarter);            // 一季週數
print(date.weeksInYear);               // 一年週數
print(date.weeksInDecade);             // 一十年週數
print(date.weeksInCentury);            // 一世紀週數
print(date.weeksInMillennium);         // 一千年週數

// 月容量
print(date.monthsInQuarter);           // 一季月數 (3)
print(date.monthsInYear);              // 一年月數 (12)
print(date.monthsInDecade);            // 一十年月數
print(date.monthsInCentury);           // 一世紀月數
print(date.monthsInMillennium);        // 一千年月數

// 季度容量
print(date.quartersInYear);            // 一年季數 (4)
print(date.quartersInDecade);          // 一十年季數
print(date.quartersInCentury);         // 一世紀季數
print(date.quartersInMillennium);      // 一千年季數

// 年容量
print(date.yearsInDecade);             // 一十年年數 (10)
print(date.yearsInCentury);            // 一世紀年數 (100)
print(date.yearsInMillennium);         // 一千年年數 (1000)

// 十年容量
print(date.decadesInCentury);          // 一世紀十年數 (10)
print(date.decadesInMillennium);       // 一千年十年數 (100)

// 世紀容量
print(date.centuriesInMillennium);     // 一千年世紀數 (10)
```

# 時間差異顯示

Chronos 使用 [timeago](https://pub.dev/packages/timeago) 套件提供時間差異顯示功能。

## 基本用法

```dart
Chronos past = Chronos(2024, 2, 26);     // 3天前 (假設今天是2024/2/29)
Chronos future = Chronos(2024, 2, 29, 16, 30); // 2小時後 (假設現在是14:30)

// 基本人性化顯示 (預設英文)
print(past.diffForHumans());     // "3 days ago"
print(future.diffForHumans());   // "in 2 hours"

// 指定語言 - 繁體中文
print(past.diffForHumans(locale: 'zh_TW'));     // "3天前"
print(future.diffForHumans(locale: 'zh_TW'));   // "2小時後"

// 指定語言 - 簡體中文
print(past.diffForHumans(locale: 'zh_CN'));        // "3天前"
print(future.diffForHumans(locale: 'zh_CN'));      // "2小時后"
```

## 進階設定

```dart
Chronos someTime = Chronos(2024, 2, 28, 10, 30);
Chronos referenceTime = Chronos(2024, 2, 29, 14, 30);

// 指定參考時間點 (而非使用當前時間)
print(someTime.diffForHumans(clock: referenceTime)); // "a day ago"

// 允許顯示 "from now" (未來時間)
print(future.diffForHumans(allowFromNow: true));     // "about a year ago"

print(someTime.diffForHumans(
  locale: 'zh_TW',
  clock: referenceTime,
  allowFromNow: true
)); // "約1天 前"
```

## 支援的語言

timeago 套件支援多種語言，常用的包括：

```dart
// 英文 (預設)
print(date.diffForHumans());                    // "3 days ago"

// 繁體中文
print(date.diffForHumans(locale: 'zh_TW'));     // "3天前"

// 簡體中文  
print(date.diffForHumans(locale: 'zh'));        // "3天前"

// 日文
print(date.diffForHumans(locale: 'ja'));        // "3日前"

// 韓文
print(date.diffForHumans(locale: 'ko'));        // "3일 전"

// 其他語言請參考 timeago 套件文件
```

## 常見時間差異範例

```dart
Chronos now = Chronos.now();

// 幾秒前/後
Chronos seconds = now.subSeconds(30);
print(seconds.diffForHumans(locale: 'zh_TW'));  // "30秒前"

// 幾分鐘前/後  
Chronos minutes = now.subMinutes(15);
print(minutes.diffForHumans(locale: 'zh_TW'));  // "15分鐘前"

// 幾小時前/後
Chronos hours = now.subHours(3);
print(hours.diffForHumans(locale: 'zh_TW'));    // "3小時前"

// 幾天前/後
Chronos days = now.subDays(5);
print(days.diffForHumans(locale: 'zh_TW'));     // "5天前"

// 幾週前/後
Chronos weeks = now.subWeeks(2);
print(weeks.diffForHumans(locale: 'zh_TW'));    // "2週前"

// 幾個月前/後
Chronos months = now.subMonths(3);
print(months.diffForHumans(locale: 'zh_TW'));   // "3個月前"

// 幾年前/後
Chronos years = now.subYears(2);
print(years.diffForHumans(locale: 'zh_TW'));    // "2年前"
```

## 實際應用範例

```dart
// 社群媒體貼文時間
Chronos postTime = Chronos(2024, 2, 28, 15, 30);
String timeAgo = postTime.diffForHumans(locale: 'zh_TW');
print('發布於 $timeAgo'); // "發布於 1天前"

// 檔案修改時間
Chronos fileModified = Chronos(2024, 2, 29, 10, 0);
String modifiedTime = fileModified.diffForHumans(locale: 'zh_TW');
print('檔案修改：$modifiedTime'); // "檔案修改：4小時前"

// 活動倒數
Chronos eventTime = Chronos(2024, 3, 1, 18, 0);
String countdown = eventTime.diffForHumans(
  locale: 'zh_TW',
  allowFromNow: true
);
print('活動開始：$countdown'); // "活動開始：1天後"
```

# 時間範圍 (ChronosRange)

ChronosRange 類別提供時間範圍操作功能，讓您可以定義一個時間段並進行各種範圍相關的操作。

## 建立時間範圍

```dart
// 建立工作時間範圍 (9:00 AM - 5:00 PM)
final workDay = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),   // 上午 9:00
  Chronos(2024, 3, 15, 17, 0),  // 下午 5:00
);

// 建立會議時間範圍
final meeting = ChronosRange(
  Chronos(2024, 3, 15, 14, 0),  // 下午 2:00
  Chronos(2024, 3, 15, 15, 30), // 下午 3:30
);

// 建立瞬間範圍 (開始和結束時間相同)
final instant = ChronosRange(
  Chronos(2024, 3, 15, 12, 0),
  Chronos(2024, 3, 15, 12, 0),
);
```

## 範圍屬性

```dart
final range = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),
  Chronos(2024, 3, 15, 17, 0),
);

// 取得範圍的持續時間
print(range.duration); // 8:00:00.000000 (8 小時)

// 檢查範圍是否為空 (開始時間等於結束時間)
print(range.isEmpty); // false

// 取得開始和結束時間
print(range.start); // 2024-03-15 09:00:00.000
print(range.end);   // 2024-03-15 17:00:00.000
```

## 包含檢查

```dart
final businessHours = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),   // 上午 9:00
  Chronos(2024, 3, 15, 17, 0),  // 下午 5:00
);

final lunchTime = Chronos(2024, 3, 15, 12, 30); // 中午 12:30
final evening = Chronos(2024, 3, 15, 19, 0);    // 晚上 7:00
final startTime = Chronos(2024, 3, 15, 9, 0);   // 上午 9:00 (邊界)

// 檢查時間是否在範圍內 (包含邊界)
print(businessHours.contains(lunchTime)); // true (在營業時間內)
print(businessHours.contains(evening));   // false (超過營業時間)
print(businessHours.contains(startTime)); // true (邊界時間也包含)
```

## 範圍重疊檢查

```dart
final morning = ChronosRange(
  Chronos(2024, 3, 15, 8, 0),   // 上午 8:00
  Chronos(2024, 3, 15, 12, 0),  // 中午 12:00
);

final afternoon = ChronosRange(
  Chronos(2024, 3, 15, 12, 0),  // 中午 12:00
  Chronos(2024, 3, 15, 17, 0),  // 下午 5:00
);

final lunch = ChronosRange(
  Chronos(2024, 3, 15, 11, 30), // 上午 11:30
  Chronos(2024, 3, 15, 13, 0),  // 下午 1:00
);

// 檢查範圍是否重疊 (預設排除端點)
print(morning.overlaps(afternoon));        // false (只在端點相接)
print(morning.overlaps(afternoon, false)); // true (包含端點接觸)
print(morning.overlaps(lunch));            // true (實際重疊)
print(lunch.overlaps(afternoon));          // true (跨越中午時間)
```

## 範圍交集

```dart
final meeting1 = ChronosRange(
  Chronos(2024, 3, 15, 10, 0),  // 上午 10:00
  Chronos(2024, 3, 15, 12, 0),  // 中午 12:00
);

final meeting2 = ChronosRange(
  Chronos(2024, 3, 15, 11, 0),  // 上午 11:00
  Chronos(2024, 3, 15, 14, 0),  // 下午 2:00
);

// 計算兩個範圍的交集
final conflict = meeting1.intersect(meeting2);
if (conflict != null) {
  print(conflict); // 2024-03-15 11:00:00.000 ~ 2024-03-15 12:00:00.000
  print('會議衝突時間：${conflict.duration}'); // 會議衝突時間：1:00:00.000000
}

// 沒有重疊的範圍
final noOverlap = ChronosRange(
  Chronos(2024, 3, 15, 15, 0),  // 下午 3:00
  Chronos(2024, 3, 15, 16, 0),  // 下午 4:00
);

final noConflict = meeting1.intersect(noOverlap);
print(noConflict); // null (沒有交集)
```

## 實際應用範例

```dart
// 工作排程系統
final workShift = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),
  Chronos(2024, 3, 15, 17, 0),
);

final breakTime = ChronosRange(
  Chronos(2024, 3, 15, 12, 0),
  Chronos(2024, 3, 15, 13, 0),
);

// 檢查休息時間是否在工作時間內
if (workShift.contains(breakTime.start) && workShift.contains(breakTime.end)) {
  print('休息時間安排合理');
}

// 會議室預訂系統
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
  print('預訂衝突！重疊時間：$overlap');
} else {
  print('預訂成功！');
}

// 活動時間管理
final event = ChronosRange(
  Chronos(2024, 3, 15, 19, 0),  // 晚上 7:00
  Chronos(2024, 3, 15, 22, 0),  // 晚上 10:00
);

final now = Chronos.now();
if (event.contains(now)) {
  print('活動進行中');
} else if (now < event.start) {
  final timeUntil = event.start.diff(now);
  print('活動將在 ${timeUntil.inHours} 小時後開始');
} else {
  print('活動已結束');
}
```

## 字串表示

```dart
final range = ChronosRange(
  Chronos(2024, 3, 15, 9, 0),
  Chronos(2024, 3, 15, 17, 0),
);

// 預設字串格式
print(range.toString());
// 輸出: 2024-03-15 09:00:00.000 ~ 2024-03-15 17:00:00.000

// 可以結合 Chronos 的格式化功能
print('工作時間：${range.start.format('HH:mm')} - ${range.end.format('HH:mm')}');
// 輸出: 工作時間：09:00 - 17:00
```


## 區間 List

```dart
final range = ChronosRange(Chronos(2025, 1, 1), Chronos(2025, 1, 5));
print(range.period(TimeUnit.day));        // Get List
print(range.period(TimeUnit.day, 2));     // Get List
print(range.period(TimeUnit.hour, 23));   // Get List
```

# 修改器

## 邊界修改器

```dart
Chronos date = Chronos.now();

// 開始邊界
Chronos startDay = date.startOfDay();         // 當天 00:00:00
Chronos startWeek = date.startOfWeek();       // 週日 00:00:00
Chronos startMonth = date.startOfMonth();     // 月初 00:00:00
Chronos startYear = date.startOfYear();       // 年初 00:00:00
Chronos startHour = date.startOfHour();       // 整點 00:00
Chronos startMinute = date.startOfMinute();   // 整分 00 秒

// 結束邊界
Chronos endDay = date.endOfDay();             // 當天 23:59:59.999
Chronos endWeek = date.endOfWeek();           // 週六 23:59:59.999
Chronos endMonth = date.endOfMonth();         // 月末 23:59:59.999
Chronos endYear = date.endOfYear();           // 年末 23:59:59.999

// 季節邊界
Chronos startSeason = date.startOfSeason();   // 季節開始
Chronos endSeason = date.endOfSeason();       // 季節結束

// 通用邊界方法
Chronos startUnit = date.startOfUnit(TimeUnit.month);
Chronos endUnit = date.endOfUnit(TimeUnit.quarter);
```

## 複製和克隆

```dart
// 複製實例
Chronos copy1 = date.copy();
Chronos copy2 = date.clone();  // 同 copy()

// 帶參數複製
Chronos modified = date.copyWith(
  year: 2024,
  month: 6,
  day: 15,
  hour: 12
);
```

## 實用修改器

```dart
Chronos date1 = Chronos(2023, 6, 15, 14, 30);
Chronos date2 = Chronos(2023, 8, 20, 16, 45);

// 線性插值
Chronos middle = date1.lerp(date2, 0.5);     // 兩時間中點
Chronos quarter = date1.lerp(date2, 0.25);   // 1/4 位置

// 中點計算
Chronos mid = date1.mid(date2);              // 同 lerp(date2, 0.5)

// 最近/最遠
Chronos now = Chronos.now();
Chronos closest = now.closest(date1, date2);   // 離現在最近的
Chronos farthest = now.farthest(date1, date2); // 離現在最遠的

// 最大/最小
Chronos min = date1.min(date2);              // 較早的時間
Chronos max = date1.max(date2);              // 較晚的時間

// 多個時間比較
Chronos earliest = date1.min(date2, [now, Chronos(2023, 1, 1)]);
Chronos latest = date1.max(date2, [now, Chronos(2023, 12, 31)]);
```

# 四捨五入

## 基本四捨五入

```dart
Chronos date = Chronos(2023, 6, 15, 14, 37, 42, 567, 890);

// 向上取整 (ceil) - 所有時間單位
Chronos ceilMicro = date.ceilMicrosecond();      // 微秒向上取整
Chronos ceilMilli = date.ceilMillisecond();      // 毫秒向上取整
Chronos ceilSec = date.ceilSecond();             // 秒向上取整
Chronos ceilMin = date.ceilMinute();             // 分鐘向上取整
Chronos ceilHour = date.ceilHour();              // 小時向上取整
Chronos ceilDay = date.ceilDay();                // 天向上取整
Chronos ceilWeek = date.ceilWeek();              // 週向上取整
Chronos ceilMonth = date.ceilMonth();            // 月向上取整
Chronos ceilQuarter = date.ceilQuarter();        // 季度向上取整
Chronos ceilYear = date.ceilYear();              // 年向上取整
Chronos ceilDecade = date.ceilDecade();          // 十年向上取整
Chronos ceilCentury = date.ceilCentury();        // 世紀向上取整
Chronos ceilMillennium = date.ceilMillennium();  // 千年向上取整

// 向下取整 (floor) - 所有時間單位
Chronos floorMicro = date.floorMicrosecond();      // 微秒向下取整
Chronos floorMilli = date.floorMillisecond();      // 毫秒向下取整
Chronos floorSec = date.floorSecond();             // 秒向下取整
Chronos floorMin = date.floorMinute();             // 分鐘向下取整
Chronos floorHour = date.floorHour();              // 小時向下取整
Chronos floorDay = date.floorDay();                // 天向下取整
Chronos floorWeek = date.floorWeek();              // 週向下取整
Chronos floorMonth = date.floorMonth();            // 月向下取整
Chronos floorQuarter = date.floorQuarter();        // 季度向下取整
Chronos floorYear = date.floorYear();              // 年向下取整
Chronos floorDecade = date.floorDecade();          // 十年向下取整
Chronos floorCentury = date.floorCentury();        // 世紀向下取整
Chronos floorMillennium = date.floorMillennium();  // 千年向下取整

// 四捨五入 (round) - 所有時間單位
Chronos roundMicro = date.roundMicrosecond();      // 微秒四捨五入
Chronos roundMilli = date.roundMillisecond();      // 毫秒四捨五入
Chronos roundSec = date.roundSecond();             // 秒四捨五入
Chronos roundMin = date.roundMinute();             // 分鐘四捨五入
Chronos roundHour = date.roundHour();              // 小時四捨五入
Chronos roundDay = date.roundDay();                // 天四捨五入
Chronos roundWeek = date.roundWeek();              // 週四捨五入
Chronos roundMonth = date.roundMonth();            // 月四捨五入
Chronos roundQuarter = date.roundQuarter();        // 季度四捨五入
Chronos roundYear = date.roundYear();              // 年四捨五入
Chronos roundDecade = date.roundDecade();          // 十年四捨五入
Chronos roundCentury = date.roundCentury();        // 世紀四捨五入
Chronos roundMillennium = date.roundMillennium();  // 千年四捨五入
```

## 精度四捨五入

```dart
// 向上取整到指定精度 (ceil) - 所有時間單位
Chronos ceilMicros = date.ceilMicroseconds(100);    // 100微秒精度向上取整
Chronos ceilMillis = date.ceilMilliseconds(50);     // 50毫秒精度向上取整
Chronos ceilSecs = date.ceilSeconds(30);            // 30秒精度向上取整
Chronos ceil10Min = date.ceilMinutes(10);           // 10分鐘精度向上取整
Chronos ceil4Hour = date.ceilHours(4);              // 4小時精度向上取整
Chronos ceil3Days = date.ceilDays(3);               // 3天精度向上取整
Chronos ceil2Weeks = date.ceilWeeks(2);             // 2週精度向上取整
Chronos ceil3Months = date.ceilMonths(3);           // 3月精度向上取整
Chronos ceil2Quarters = date.ceilQuarters(2);       // 2季度精度向上取整
Chronos ceil5Years = date.ceilYears(5);             // 5年精度向上取整
Chronos ceil2Decades = date.ceilDecades(2);         // 2十年精度向上取整
Chronos ceil5Centuries = date.ceilCenturies(5);     // 5世紀精度向上取整
Chronos ceil2Millennia = date.ceilMillennia(2);     // 2千年精度向上取整

// 向下取整到指定精度 (floor) - 所有時間單位
Chronos floorMicros = date.floorMicroseconds(500);  // 500微秒精度向下取整
Chronos floorMillis = date.floorMilliseconds(100);  // 100毫秒精度向下取整
Chronos floorSecs = date.floorSeconds(15);          // 15秒精度向下取整
Chronos floor30Min = date.floorMinutes(30);         // 30分鐘精度向下取整
Chronos floor2Hour = date.floorHours(2);            // 2小時精度向下取整
Chronos floor7Days = date.floorDays(7);             // 7天精度向下取整
Chronos floor4Weeks = date.floorWeeks(4);           // 4週精度向下取整
Chronos floor6Months = date.floorMonths(6);         // 6月精度向下取整
Chronos floor1Quarter = date.floorQuarters(1);      // 1季度精度向下取整
Chronos floor10Years = date.floorYears(10);         // 10年精度向下取整
Chronos floor3Decades = date.floorDecades(3);       // 3十年精度向下取整
Chronos floor2Centuries = date.floorCenturies(2);   // 2世紀精度向下取整
Chronos floor1Millennium = date.floorMillennia(1);  // 1千年精度向下取整

// 四捨五入到指定精度 (round) - 所有時間單位
Chronos roundMicros = date.roundMicroseconds(250);  // 250微秒精度四捨五入
Chronos roundMillis = date.roundMilliseconds(25);   // 25毫秒精度四捨五入
Chronos roundSecs = date.roundSeconds(10);          // 10秒精度四捨五入
Chronos round5Min = date.roundMinutes(5);           // 5分鐘精度四捨五入
Chronos round15Min = date.roundMinutes(15);         // 15分鐘精度四捨五入
Chronos round6Hour = date.roundHours(6);            // 6小時精度四捨五入
Chronos round2Days = date.roundDays(2);             // 2天精度四捨五入
Chronos round3Weeks = date.roundWeeks(3);           // 3週精度四捨五入
Chronos round4Months = date.roundMonths(4);         // 4月精度四捨五入
Chronos round2Quarters = date.roundQuarters(2);     // 2季度精度四捨五入
Chronos round5Years = date.roundYears(5);           // 5年精度四捨五入
Chronos round2Decades = date.roundDecades(2);       // 2十年精度四捨五入
Chronos round3Centuries = date.roundCenturies(3);   // 3世紀精度四捨五入
Chronos round1Millennium = date.roundMillennia(1);  // 1千年精度四捨五入
```

# 常數

## 時間單位枚舉

```dart
// TimeUnit 枚舉包含所有時間單位
TimeUnit.microsecond    // 微秒
TimeUnit.millisecond    // 毫秒
TimeUnit.second         // 秒
TimeUnit.minute         // 分鐘
TimeUnit.hour           // 小時
TimeUnit.day            // 天
TimeUnit.week           // 週
TimeUnit.isoWeek        // ISO 週
TimeUnit.month          // 月
TimeUnit.quarter        // 季度
TimeUnit.year           // 年
TimeUnit.isoYear        // ISO 年
TimeUnit.decade         // 十年
TimeUnit.century        // 世紀
TimeUnit.millennium     // 千年
```

## 星期枚舉

```dart
// DayOfWeek 枚舉 (0=週日)
DayOfWeek.sunday        // 週日 (0)
DayOfWeek.monday        // 週一 (1)
DayOfWeek.tuesday       // 週二 (2)
DayOfWeek.wednesday     // 週三 (3)
DayOfWeek.thursday      // 週四 (4)
DayOfWeek.friday        // 週五 (5)
DayOfWeek.saturday      // 週六 (6)

// IsoDayOfWeek 枚舉 (1=週一)
IsoDayOfWeek.monday     // 週一 (1)
IsoDayOfWeek.tuesday    // 週二 (2)
IsoDayOfWeek.wednesday  // 週三 (3)
IsoDayOfWeek.thursday   // 週四 (4)
IsoDayOfWeek.friday     // 週五 (5)
IsoDayOfWeek.saturday   // 週六 (6)
IsoDayOfWeek.sunday     // 週日 (7)
```

## 月份枚舉

```dart
// Month 枚舉
Month.january           // 一月 (1)
Month.february          // 二月 (2)
Month.march             // 三月 (3)
Month.april             // 四月 (4)
Month.may               // 五月 (5)
Month.june              // 六月 (6)
Month.july              // 七月 (7)
Month.august            // 八月 (8)
Month.september         // 九月 (9)
Month.october           // 十月 (10)
Month.november          // 十一月 (11)
Month.december          // 十二月 (12)
```

## 其他枚舉

```dart
// Quarter 枚舉
Quarter.q1              // 第一季
Quarter.q2              // 第二季
Quarter.q3              // 第三季
Quarter.q4              // 第四季

// Season 枚舉
Season.spring           // 春季
Season.summer           // 夏季
Season.autumn           // 秋季
Season.winter           // 冬季

// Hemisphere 枚舉
Hemisphere.northern     // 北半球
Hemisphere.southern     // 南半球


```

# 測試輔助

## 時間模擬

```dart
// 設定假的當前時間用於測試 (使用閏日)
Chronos fakeNow = Chronos(2024, 2, 29, 12, 0);
ChronosConfig().setFakeNow(fakeNow);

// 現在 Chronos.now() 會回傳設定的假時間
print(Chronos.now()); // 2024-02-29 12:00:00.000 (閏日中午)

// 清除假時間
ChronosConfig().resetFakeNow();

// 或者直接設定為 null
ChronosConfig().fakeNow = null;
```

## 時區設定

```dart
// 設定半球 (影響季節計算)
ChronosConfig().setHemisphere(Hemisphere.southern);

// 現在季節會根據南半球計算
Chronos date = Chronos(2024, 2, 29); // 2月在南半球是夏季
print(date.season); // Season.summer (南半球的夏季)

// 重置為北半球
ChronosConfig().resetHemisphere();

// 或者直接設定
ChronosConfig().hemisphere = Hemisphere.northern;
print(date.season); // Season.winter (北半球的冬季)
```

## 類型轉換

```dart
// DateTime 轉 Chronos
DateTime dateTime = DateTime.now();
Chronos chronos = dateTime.toChronos();

// 時區轉換
Chronos utc = chronos.toUtc();
Chronos local = chronos.toLocal();
```



---

靈感來自 PHP 的 [Carbon](https://carbon.nesbot.com/)