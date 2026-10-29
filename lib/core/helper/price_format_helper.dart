class PriceFormatHelper {
  /// 120.0 -> $120, 12.5 -> $12.50
  static String format(double? price) {
    final value = price ?? 0;
    return value % 1 == 0 ? '\$${value.toStringAsFixed(0)}' : '\$${value.toStringAsFixed(2)}';
  }
}
