import 'package:intl/intl.dart';

class DateIntl {
  static DateFormat _brDate(String format) => DateFormat(format, 'pt_Br');

  static String stringToDateHome(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);
    final String dayName = _brDate('EEEE').format(dateTime);
    final int dayOfMonth = dateTime.day;
    final String monthName = _brDate('MMMM').format(dateTime);
    final int year = dateTime.year;

    return '$dayName, $dayOfMonth, $monthName, $year';
  }
}
