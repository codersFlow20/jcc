import 'package:intl/intl.dart';

class Conversion {
  static String formatDate(DateTime timeStamp) =>
      DateFormat('E, dd MMM yyyy, hh:mm a').format(timeStamp);
}
