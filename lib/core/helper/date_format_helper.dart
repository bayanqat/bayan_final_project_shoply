class DateFormatHelper {
  static const List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  /// Oct 15, 2026
  static String shortDate(DateTime? date) {
    if (date == null) return '';
    return '${_months[date.month - 1].substring(0, 3)} ${date.day}, ${date.year}';
  }

  /// October 15, 2026
  static String longDate(DateTime? date) {
    if (date == null) return '';
    return '${_months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
