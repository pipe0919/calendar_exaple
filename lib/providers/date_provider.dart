import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  DateTime _dateStart = DateTime.now();

  DateTime get dateStart => _dateStart;

  void setDateStart(DateTime date) {
    _dateStart = DateTime(
        date.year, date.month, date.day, _dateStart.hour, _dateStart.minute);
    notifyListeners();
  }

  DateTime _dateEnd = DateTime.now();

  DateTime get dateEnd => _dateEnd;

  void setDateEnd(DateTime date) {
    _dateEnd = DateTime(
        date.year, date.month, date.day, _dateEnd.hour, _dateEnd.minute);
    notifyListeners();
  }

  void editTimeStart(DateTime time) {
    _dateStart = DateTime(_dateStart.year, _dateStart.month, _dateStart.day,
        time.hour, time.minute);

    notifyListeners();
  }

  void editTimeEnd(DateTime time) {
    _dateEnd = DateTime(
        _dateEnd.year, _dateEnd.month, _dateEnd.day, time.hour, time.minute);

    notifyListeners();
  }
}
