import 'package:intl/intl.dart';

class Conversion {
  static String formatDateTime(DateTime timeStamp) =>
      DateFormat('E, dd MMM yyyy, hh:mm a').format(timeStamp);

  static String formatDate(String time) {
    DateTime timeStamp = DateTime.parse(time);
    return DateFormat('dd MMM').format(timeStamp);
  }

}
