import 'package:intl/intl.dart';

class DateTimeHelper {
  static String getDateByFormatter(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(
      date,
    );
  }
}
