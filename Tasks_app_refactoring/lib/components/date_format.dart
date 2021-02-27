
import 'package:intl/intl.dart';

class MyDateFormat {
   
 MyDateFormat(this.val);
 String val;

   static String dateFormat(val) {
    final dateTimeString = val;
    final dateTime = DateTime.parse(dateTimeString);
    final format = DateFormat('dd MMM yyyy');
    final clockString = format.format(dateTime);
    return clockString;
  }
}
