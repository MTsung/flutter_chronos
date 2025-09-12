# 1.0.1

## English

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


## 中文
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
