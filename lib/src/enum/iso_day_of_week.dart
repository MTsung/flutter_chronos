enum IsoDayOfWeek {
  /// Monday - 1 (ISO 8601 standard)
  monday(1),

  /// Tuesday - 2 (ISO 8601 standard)
  tuesday(2),

  /// Wednesday - 3 (ISO 8601 standard)
  wednesday(3),

  /// Thursday - 4 (ISO 8601 standard)
  thursday(4),

  /// Friday - 5 (ISO 8601 standard)
  friday(5),

  /// Saturday - 6 (ISO 8601 standard)
  saturday(6),

  /// Sunday - 7 (ISO 8601 standard)
  sunday(7);

  const IsoDayOfWeek(this.value);
  final int value;
}
