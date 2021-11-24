import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Utils {
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static String formatTime(String time) {
    var _time = time.substring(0, 5);
    return DateFormat.jm().format(DateFormat("hh:mm").parse(_time));
  }
}
