import 'package:flutter_chronos/flutter_chronos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String Formatting - Basic', () {
    final now = Chronos.parse('2019-02-01T03:45:27Z');
    test('format method', () {
      final chronos = Chronos(2023, 12, 25, 14, 30, 45);

      final defaultFormat = chronos.format();
      expect(defaultFormat, isA<String>());
      expect(defaultFormat, isNotEmpty);

      final customFormat = chronos.format('yyyy-MM-dd HH:mm:ss');
      expect(customFormat, '2023-12-25 14:30:45');

      final localeFormat = chronos.format('MMMM d, yyyy', 'en_US');
      expect(localeFormat, contains('December'));
    });

    test('toDateTimeLocalString', () {
      expect(now.toDateTimeLocalString(), '2019-02-01T03:45:27');
    });

    test('toRfc822String', () {
      expect(now.toRfc822String(), 'Fri, 01 Feb 19 03:45:27 +0000');
    });

    test('toRfc850String', () {
      expect(now.toRfc850String(), 'Friday, 01-Feb-19 03:45:27 UTC');
    });

    test('toRfc1036String', () {
      expect(now.toRfc1036String(), 'Fri, 01 Feb 19 03:45:27 +0000');
    });

    test('toRfc1123String', () {
      expect(now.toRfc1123String(), 'Fri, 01 Feb 2019 03:45:27 +0000');
    });

    test('toRfc2822String', () {
      expect(now.toRfc2822String(), 'Fri, 01 Feb 2019 03:45:27 +0000');
    });

    test('toRfc3339String', () {
      expect(now.toRfc3339String(), '2019-02-01T03:45:27+00:00');
    });

    test('toRfc7231String', () {
      expect(now.toRfc7231String(), 'Fri, 01 Feb 2019 03:45:27 GMT');
    });

    test('toRssString', () {
      expect(now.toRssString(), 'Fri, 01 Feb 2019 03:45:27 +0000');
    });

    test('toW3cString', () {
      expect(now.toW3cString(), '2019-02-01T03:45:27+00:00');
    });

    test('toAtomString', () {
      expect(now.toAtomString(), '2019-02-01T03:45:27+00:00');
    });

    test('toCookieString', () {
      expect(now.toCookieString(), 'Friday, 01-Feb-2019 03:45:27 UTC');
    });
  });

  test('to string', () {
    final now = Chronos(2023, 12, 25, 14, 30, 45);
    expect(now.toString_d(), '25');
    expect(now.toString_E(), 'Mon');
    expect(now.toString_EEEE(), 'Monday');
    expect(now.toString_EEEEE(), 'M');
    expect(now.toString_LLL(), 'Dec');
    expect(now.toString_LLLL(), 'December');
    expect(now.toString_M(), '12');
    expect(now.toString_Md(), '12/25');
    expect(now.toString_MEd(), 'Mon, 12/25');
    expect(now.toString_MMM(), 'Dec');
    expect(now.toString_MMMd(), 'Dec 25');
    expect(now.toString_MMMEd(), 'Mon, Dec 25');
    expect(now.toString_MMMM(), 'December');
    expect(now.toString_MMMMd(), 'December 25');
    expect(now.toString_MMMMEEEEd(), 'Monday, December 25');
    expect(now.toString_QQQ(), 'Q4');
    expect(now.toString_QQQQ(), '4th quarter');
    expect(now.toString_y(), '2023');
    expect(now.toString_yM(), '12/2023');
    expect(now.toString_yMd(), '12/25/2023');
    expect(now.toString_yMEd(), 'Mon, 12/25/2023');
    expect(now.toString_yMMM(), 'Dec 2023');
    expect(now.toString_yMMMd(), 'Dec 25, 2023');
    expect(now.toString_yMMMEd(), 'Mon, Dec 25, 2023');
    expect(now.toString_yMMMM(), 'December 2023');
    expect(now.toString_yMMMMd(), 'December 25, 2023');
    expect(now.toString_yMMMMEEEEd(), 'Monday, December 25, 2023');
    expect(now.toString_yQQQ(), 'Q4 2023');
    expect(now.toString_yQQQQ(), '4th quarter 2023');
    expect(now.toString_H(), '14');
    expect(now.toString_Hm(), '14:30');
    expect(now.toString_Hms(), '14:30:45');
    expect(now.toString_j(), '2 PM');
    expect(now.toString_jm(), '2:30 PM');
    expect(now.toString_jms(), '2:30:45 PM');
    expect(now.toString_m(), '30');
    expect(now.toString_ms(), '30:45');
    expect(now.toString_s(), '45');
  });

  test('to string i18n', () async {
    await Chronos.initI18n();

    final now = Chronos(2023, 12, 25, 14, 30, 45);

    expect(now.toString_d('zh_TW'), '25日');
    expect(now.toString_E('zh_TW'), '週一');
    expect(now.toString_EEEE('zh_TW'), '星期一');
    expect(now.toString_EEEEE('zh_TW'), '一');
    expect(now.toString_LLL('zh_TW'), '12月');
    expect(now.toString_LLLL('zh_TW'), '12月');
    expect(now.toString_M('zh_TW'), '12月');
    expect(now.toString_Md('zh_TW'), '12/25');
    expect(now.toString_MEd('zh_TW'), '12/25（週一）');
    expect(now.toString_MMM('zh_TW'), '12月');
    expect(now.toString_MMMd('zh_TW'), '12月25日');
    expect(now.toString_MMMEd('zh_TW'), '12月25日 週一');
    expect(now.toString_MMMM('zh_TW'), '12月');
    expect(now.toString_MMMMd('zh_TW'), '12月25日');
    expect(now.toString_MMMMEEEEd('zh_TW'), '12月25日 星期一');
    expect(now.toString_QQQ('zh_TW'), '第4季');
    expect(now.toString_QQQQ('zh_TW'), '第4季');
    expect(now.toString_y('zh_TW'), '2023年');
    expect(now.toString_yM('zh_TW'), '2023/12');
    expect(now.toString_yMd('zh_TW'), '2023/12/25');
    expect(now.toString_yMEd('zh_TW'), '2023/12/25（週一）');
    expect(now.toString_yMMM('zh_TW'), '2023年12月');
    expect(now.toString_yMMMd('zh_TW'), '2023年12月25日');
    expect(now.toString_yMMMEd('zh_TW'), '2023年12月25日 週一');
    expect(now.toString_yMMMM('zh_TW'), '2023年12月');
    expect(now.toString_yMMMMd('zh_TW'), '2023年12月25日');
    expect(now.toString_yMMMMEEEEd('zh_TW'), '2023年12月25日 星期一');
    expect(now.toString_yQQQ('zh_TW'), '2023年第4季');
    expect(now.toString_yQQQQ('zh_TW'), '2023年第4季');
    expect(now.toString_H('zh_TW'), '14時');
    expect(now.toString_Hm('zh_TW'), '14:30');
    expect(now.toString_Hms('zh_TW'), '14:30:45');
    expect(now.toString_j('zh_TW'), '下午2時');
    expect(now.toString_jm('zh_TW'), '下午2:30');
    expect(now.toString_jms('zh_TW'), '下午2:30:45');
    expect(now.toString_m('zh_TW'), '30');
    expect(now.toString_ms('zh_TW'), '30:45');
    expect(now.toString_s('zh_TW'), '45');
  });
}
