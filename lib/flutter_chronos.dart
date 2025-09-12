/// A powerful and intuitive date and time utilities library for Flutter.
///
/// This library provides the [Chronos] class, which extends [DateTime] with
/// additional functionality for date and time manipulation, formatting, and
/// calculations. It includes utilities for working with date ranges, time zones,
/// and human-readable time differences.
///
/// ## Features
///
/// - Extended DateTime functionality with the [Chronos] class
/// - Date range operations with [ChronosRange]
/// - Human-readable time formatting
/// - Timezone utilities and conversions
/// - Date arithmetic and comparisons
/// - Boundary calculations (start/end of day, week, month, etc.)
///
/// ## Usage
///
/// ```dart
/// import 'package:flutter_chronos/flutter_chronos.dart';
///
/// // Create a Chronos instance
/// final now = Chronos.now();
/// final birthday = Chronos(1990, 5, 15);
///
/// // Perform date operations
/// final tomorrow = now.addDay();
/// final lastWeek = now.subWeek();
///
/// // Format dates
/// final formatted = now.format('yyyy-MM-dd HH:mm:ss');
///
/// // Calculate differences
/// final age = now.diff(birthday);
/// ```
library;

export 'src/chronos.dart';
export 'src/chronos_config.dart';
export 'src/chronos_range.dart';
export 'src/enum/enums.dart';
export 'src/extension/boundaries.dart';
export 'src/extension/comparison.dart';
export 'src/extension/converter.dart';
export 'src/extension/difference.dart';
export 'src/extension/human.dart';
export 'src/extension/modifiers.dart';
export 'src/extension/operator.dart';
export 'src/extension/type_casting.dart';
export 'src/extension/rounding.dart';
