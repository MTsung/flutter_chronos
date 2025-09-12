import 'package:flutter_chronos/src/chronos.dart';
import 'package:flutter_chronos/src/enum/enums.dart';

/// Global configuration class for Chronos library settings.
///
/// This singleton class manages global settings that affect the behavior
/// of Chronos date/time operations throughout the application. It provides
/// functionality to set fake time for testing purposes and configure
/// hemisphere settings for seasonal calculations.
///
/// Example:
/// ```dart
/// final config = ChronosConfig();
/// config.setFakeNow(Chronos(2024, 6, 15));
/// config.setHemisphere(Hemisphere.southern);
/// ```
class ChronosConfig {
  static final ChronosConfig _singleton = ChronosConfig._init();

  /// Returns the singleton instance of ChronosConfig.
  ///
  /// This ensures that all parts of the application share the same
  /// configuration settings.
  ///
  /// Example:
  /// ```dart
  /// final config1 = ChronosConfig();
  /// final config2 = ChronosConfig();
  /// print(identical(config1, config2)); // true
  /// ```
  factory ChronosConfig() => _singleton;
  ChronosConfig._init();

  Chronos? _fakeNow;

  /// Returns the currently set fake time, or null if not set.
  ///
  /// When a fake time is set, it can be used by Chronos methods that
  /// need to reference "now" for testing purposes. This allows for
  /// predictable testing of time-dependent functionality.
  ///
  /// Example:
  /// ```dart
  /// final config = ChronosConfig();
  /// print(config.fakeNow); // null initially
  ///
  /// config.setFakeNow(Chronos(2024, 3, 15));
  /// print(config.fakeNow); // 2024-03-15 00:00:00.000
  /// ```
  Chronos? get fakeNow => _fakeNow;

  /// Sets a fake "now" time for testing purposes.
  ///
  /// This method allows you to override the current time used by Chronos
  /// methods that depend on "now". This is particularly useful for testing
  /// time-dependent functionality where you need predictable results.
  ///
  /// [fakeNow] The Chronos instance to use as the fake current time.
  ///
  /// Example:
  /// ```dart
  /// final config = ChronosConfig();
  /// final testTime = Chronos(2024, 6, 15, 10, 30);
  ///
  /// config.setFakeNow(testTime);
  ///
  /// // Now methods like isToday, isTomorrow will use this fake time
  /// final today = Chronos(2024, 6, 15);
  /// print(today.isToday); // true (using fake time as reference)
  /// ```
  void setFakeNow(Chronos fakeNow) => _fakeNow = fakeNow;

  /// Resets the fake time back to null.
  ///
  /// After calling this method, Chronos methods will use the actual
  /// current time instead of a fake time. This is useful for cleaning
  /// up after tests or when you want to return to normal time behavior.
  ///
  /// Example:
  /// ```dart
  /// final config = ChronosConfig();
  /// config.setFakeNow(Chronos(2024, 1, 1));
  /// print(config.fakeNow); // 2024-01-01 00:00:00.000
  ///
  /// config.resetFakeNow();
  /// print(config.fakeNow); // null
  /// ```
  void resetFakeNow() => _fakeNow = null;

  Hemisphere _hemisphere = Hemisphere.northern;

  /// Returns the currently configured hemisphere.
  ///
  /// The hemisphere setting affects seasonal calculations in Chronos.
  /// By default, it's set to northern hemisphere. When set to southern
  /// hemisphere, seasonal calculations will be inverted (e.g., June
  /// becomes winter instead of summer).
  ///
  /// Example:
  /// ```dart
  /// final config = ChronosConfig();
  /// print(config.hemisphere); // Hemisphere.northern (default)
  ///
  /// config.setHemisphere(Hemisphere.southern);
  /// print(config.hemisphere); // Hemisphere.southern
  /// ```
  Hemisphere get hemisphere => _hemisphere;

  /// Sets the hemisphere for seasonal calculations.
  ///
  /// This setting affects how seasons are calculated throughout the
  /// Chronos library. In the northern hemisphere, June is summer,
  /// while in the southern hemisphere, June is winter.
  ///
  /// [hemisphere] The hemisphere to use for seasonal calculations.
  ///
  /// Example:
  /// ```dart
  /// final config = ChronosConfig();
  /// final juneDate = Chronos(2024, 6, 21); // Summer solstice
  ///
  /// // Northern hemisphere (default)
  /// config.setHemisphere(Hemisphere.northern);
  /// print(juneDate.season); // Season.summer
  ///
  /// // Southern hemisphere
  /// config.setHemisphere(Hemisphere.southern);
  /// print(juneDate.season); // Season.winter
  /// ```
  void setHemisphere(Hemisphere hemisphere) => _hemisphere = hemisphere;

  /// Resets the hemisphere setting back to northern hemisphere.
  ///
  /// This method restores the default hemisphere setting, which is
  /// northern hemisphere. This is useful for cleaning up after tests
  /// or when you want to return to the default behavior.
  ///
  /// Example:
  /// ```dart
  /// final config = ChronosConfig();
  /// config.setHemisphere(Hemisphere.southern);
  /// print(config.hemisphere); // Hemisphere.southern
  ///
  /// config.resetHemisphere();
  /// print(config.hemisphere); // Hemisphere.northern
  /// ```
  void resetHemisphere() => _hemisphere = Hemisphere.northern;
}
