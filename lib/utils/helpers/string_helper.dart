// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

String toCustomHousr(DateTime time) {
  return "${time.hour}:${time.minute} ${time.hour >= 12 ? 'PM' : 'AM'}";
}

String datetimeToMonth(DateTime time) {
  return DateFormat('MMM').format(time);
}
