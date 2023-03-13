import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../providers/date_provider.dart';
import '../../utils/helpers/string_helper.dart';
import 'nav_bar.dart';

class ModalButtom extends StatefulWidget {
  const ModalButtom({Key? key}) : super(key: key);

  @override
  State<ModalButtom> createState() => _ModalButtomState();
}

class _ModalButtomState extends State<ModalButtom> {
  DateProvider timeProvider = DateProvider();
  final DateRangePickerController _calendarController1 =
      DateRangePickerController();
  final UniqueKey _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    timeProvider = Provider.of<DateProvider>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Save",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        bottomNavigationBar: FABBottomAppBar(
          notchedShape: const CircularNotchedRectangle(),
          backgroundColor: Colors.white,
          onTabSelected: (v) {
            if (v == 0) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Center(child: Text("Pick Up Time")),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        content: SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: CupertinoDatePicker(
                                initialDateTime: timeProvider.dateEnd,
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (v) {
                                  timeProvider.editTimeStart(v);
                                })),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Center(child: Text("Done")),
                          )
                        ],
                      ));
            }
            if (v == 1) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Center(child: Text("Return Time")),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        content: SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: CupertinoDatePicker(
                                initialDateTime: timeProvider.dateEnd,
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (v) {
                                  timeProvider.editTimeEnd(v);
                                })),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Center(child: Text("Done")),
                          )
                        ],
                      ));
            }
          },
          items: [
            FABBottomAppBarItem(
                iconData: const Text(
                  "Pick up",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                text: toCustomHousr(timeProvider.dateStart)),
            FABBottomAppBarItem(
                iconData: const Text(
                  "Return",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                text: toCustomHousr(timeProvider.dateEnd)),
          ],
          centerItemText: timeProvider.dateStart.month ==
                  timeProvider.dateEnd.month
              ? '${datetimeToMonth(timeProvider.dateStart)} ${timeProvider.dateStart.day} - ${timeProvider.dateEnd.day}'
              : '${datetimeToMonth(timeProvider.dateStart)} ${timeProvider.dateStart.day} - ${datetimeToMonth(timeProvider.dateEnd)} ${timeProvider.dateEnd.day}',
          color: Colors.black,
          selectedColor: Colors.black,
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    _calendarController1.selectedRange =
                        PickerDateRange(DateTime.now(), DateTime.now());
                  },
                  child:
                      const Text('Reset', style: TextStyle(color: Colors.blue)),
                ),
              ),
              Transform.translate(
                offset: Offset(6, MediaQuery.of(context).size.height * 0.01),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: SfDateRangePicker(
                  key: _key,
                  headerHeight: 50,
                  controller: _calendarController1,
                  enableMultiView: true,
                  navigationDirection:
                      DateRangePickerNavigationDirection.vertical,
                  toggleDaySelection: true,
                  extendableRangeSelectionDirection:
                      ExtendableRangeSelectionDirection.both,
                  enablePastDates: false,
                  view: DateRangePickerView.month,
                  monthViewSettings: const DateRangePickerMonthViewSettings(
                    enableSwipeSelection: false,
                    dayFormat: 'EEE',
                  ),
                  showNavigationArrow: true,
                  navigationMode: DateRangePickerNavigationMode.snap,
                  headerStyle: const DateRangePickerHeaderStyle(
                      textAlign: TextAlign.left,
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  initialDisplayDate: DateTime.now(),
                  selectionMode: DateRangePickerSelectionMode.extendableRange,
                  onSelectionChanged: (DateRangePickerSelectionChangedArgs v) {
                    timeProvider.setDateStart(v.value.startDate);
                    v.value.endDate == null
                        ? null
                        : timeProvider.setDateEnd(v.value.endDate);
                  },
                  startRangeSelectionColor: Colors.blue,
                  rangeSelectionColor: Colors.blue.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
