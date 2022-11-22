import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format([String pattern = 'MM/dd/yyyy']) {
    final String locale = Intl.getCurrentLocale();
    initializeDateFormatting(locale);
    return DateFormat(pattern, locale).format(this);
  }
}
