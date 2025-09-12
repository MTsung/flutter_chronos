import 'package:flutter_chronos/src/chronos.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Extension providing human-readable formatting for Chronos instances.
///
/// This extension allows you to format dates in a human-friendly way,
/// showing relative time differences like "2 hours ago" or "in 3 days".
extension ChronosHuman on Chronos {
  /// Returns a human-readable string representing the time difference.
  ///
  /// [locale] - The locale to use for formatting (e.g., 'en', 'es', 'fr')
  /// [clock] - The reference time to compare against (defaults to now)
  /// [allowFromNow] - Whether to allow "from now" phrasing for future dates
  ///
  /// Example:
  /// ```dart
  /// final pastDate = Chronos.now().subHours(2);
  /// final futureDate = Chronos.now().addDays(3);
  ///
  /// print(pastDate.diffForHumans()); // "2 hours ago"
  /// print(futureDate.diffForHumans(allowFromNow: true)); // "3 days from now"
  /// print(pastDate.diffForHumans(locale: 'es')); // "hace 2 horas"
  /// print(pastDate.diffForHumans(locale: 'zh_TW')); // "約 2 小時 前"
  /// ```
  String diffForHumans({
    String? locale,
    Chronos? clock,
    bool allowFromNow = false,
  }) {
    if (locale != null) {
      final Map localeMessagesMap = {
        'am': timeago.AmMessages(),
        'am_short': timeago.AmShortMessages(),
        'ar': timeago.ArMessages(),
        'ar_short': timeago.ArShortMessages(),
        'az': timeago.AzMessages(),
        'az_short': timeago.AzShortMessages(),
        'be': timeago.BeMessages(),
        'be_short': timeago.BeShortMessages(),
        'bn': timeago.BnMessages(),
        'bn_short': timeago.BnShortMessages(),
        'bs': timeago.BsMessages(),
        'bs_short': timeago.BsShortMessages(),
        'ca': timeago.CaMessages(),
        'ca_short': timeago.CaShortMessages(),
        'cs': timeago.CsMessages(),
        'cs_short': timeago.CsShortMessages(),
        'da': timeago.DaMessages(),
        'da_short': timeago.DaShortMessages(),
        'de': timeago.DeMessages(),
        'de_short': timeago.DeShortMessages(),
        'dv': timeago.DvMessages(),
        'dv_short': timeago.DvShortMessages(),
        'en': timeago.EnMessages(),
        'en_short': timeago.EnShortMessages(),
        'es': timeago.EsMessages(),
        'es_short': timeago.EsShortMessages(),
        'et': timeago.EtMessages(),
        'et_short': timeago.EtShortMessages(),
        'fa': timeago.FaMessages(),
        'fi': timeago.FiMessages(),
        'fi_short': timeago.FiShortMessages(),
        'fr': timeago.FrMessages(),
        'fr_short': timeago.FrShortMessages(),
        'gr': timeago.GrMessages(),
        'gr_short': timeago.GrShortMessages(),
        'he': timeago.HeMessages(),
        'he_short': timeago.HeShortMessages(),
        'hi': timeago.HiMessages(),
        'hi_short': timeago.HiShortMessages(),
        'hr': timeago.HrMessages(),
        'hu': timeago.HuMessages(),
        'hu_short': timeago.HuShortMessages(),
        'id': timeago.IdMessages(),
        'id_short': timeago.IdShortMessages(),
        'it': timeago.ItMessages(),
        'it_short': timeago.ItShortMessages(),
        'ja': timeago.JaMessages(),
        'km': timeago.KmMessages(),
        'km_short': timeago.KmShortMessages(),
        'ko': timeago.KoMessages(),
        'ku': timeago.KuMessages(),
        'ku_short': timeago.KuShortMessages(),
        'lv': timeago.LvMessages(),
        'lv_short': timeago.LvShortMessages(),
        'mn': timeago.MnMessages(),
        'mn_short': timeago.MnShortMessages(),
        'ms_my': timeago.MsMyMessages(),
        'ms_my_short': timeago.MsMyShortMessages(),
        'my': timeago.MyMessages(),
        'my_short': timeago.MyShortMessages(),
        'nb_no': timeago.NbNoMessages(),
        'nb_no_short': timeago.NbNoShortMessages(),
        'nl': timeago.NlMessages(),
        'nl_short': timeago.NlShortMessages(),
        'nn_no': timeago.NnNoMessages(),
        'nn_no_short': timeago.NnNoShortMessages(),
        'pl': timeago.PlMessages(),
        'pt_br': timeago.PtBrMessages(),
        'pt_br_short': timeago.PtBrShortMessages(),
        'ro': timeago.RoMessages(),
        'ro_short': timeago.RoShortMessages(),
        'ru': timeago.RuMessages(),
        'ru_short': timeago.RuShortMessages(),
        'rw': timeago.RwMessages(),
        'rw_short': timeago.RwShortMessages(),
        'sr': timeago.SrMessages(),
        'sr_short': timeago.SrShortMessages(),
        'sv': timeago.SvMessages(),
        'sv_short': timeago.SvShortMessages(),
        'ta': timeago.TaMessages(),
        'th': timeago.ThMessages(),
        'th_short': timeago.ThShortMessages(),
        'tk': timeago.TkMessages(),
        'tr': timeago.TrMessages(),
        'tr_short': timeago.TrShortMessages(),
        'uk': timeago.UkMessages(),
        'uk_short': timeago.UkShortMessages(),
        'ur': timeago.UrMessages(),
        'vi': timeago.ViMessages(),
        'vi_short': timeago.ViShortMessages(),
        'zh_cn': timeago.ZhCnMessages(),
        'zh_tw': timeago.ZhMessages(),
      };

      if (localeMessagesMap[locale.toLowerCase()] != null) {
        timeago.setLocaleMessages(
          locale,
          localeMessagesMap[locale.toLowerCase()],
        );
      }
    }

    return timeago.format(
      this,
      locale: locale,
      clock: clock ?? Chronos.now(),
      allowFromNow: allowFromNow,
    );
  }
}
