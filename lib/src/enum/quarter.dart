enum Quarter {
  /// First quarter - 1 (Jan-Mar)
  q1(1),

  /// Second quarter - 2 (Apr-Jun)
  q2(2),

  /// Third quarter - 3 (Jul-Sep)
  q3(3),

  /// Fourth quarter - 4 (Oct-Dec)
  q4(4);

  const Quarter(this.value);
  final int value;
}
