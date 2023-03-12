import 'package:calendar_example/home_page.dart';
import 'package:calendar_example/widgets/nav_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'my_custom_clipper.dart';
import 'my_custom_shape_border.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home(),
      //home: HomePage(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showButtonModal();
        },
        child: const Text(
          "GO",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: AppBarCustom(),
      backgroundColor: Colors.white,
    );
  }

  Widget body(context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            width: size.width * 0.7,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 70,
                ),
                const Center(
                  child: Text('Reservation starts',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ],
            ),
          ),
          Container(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.arrow_circle_right_rounded,
                size: 50,
              ),
              Container(
                width: size.width * 0.4,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                    ),
                    Text('2021-08-01',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showMyPicker();
                },
                child: Container(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 16,
                      ),
                      Text('12:20 PM',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.7,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 70,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 3,
                    height: double.infinity,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: const Center(
                    child: Text('Reservation ends',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.arrow_circle_left_rounded,
                size: 50,
              ),
              Container(
                width: size.width * 0.4,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                    ),
                    Text('2021-08-01',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showMyPicker();
                },
                child: Container(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 16,
                      ),
                      Text('12:20 PM',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showMyPicker() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(child: const Text("Pick Up Time")),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: Container(
                  height: 150,
                  width: double.infinity,
                  child: CupertinoDatePicker(onDateTimeChanged: (v) {
                    print(v);
                  })),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Center(child: const Text("Done")),
                )
              ],
            ));
  }

  void showButtonModal2() {
    showModalBottomSheet(
        anchorPoint: Offset(0.6, 0.6),
        context: context,
        isScrollControlled: true,
        elevation: 20,
        shape: MyCustomShapeBorder(MyCustomClipper()),
        builder: (_) {
          final controller = DateRangePickerController();

          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [Text("data2")],
              ),
            ),
          );
        });
  }

  void showButtonModal() {
    showModalBottomSheet(
        anchorPoint: Offset(0.6, 0.6),
        context: context,
        isScrollControlled: true,
        elevation: 20,
        shape: MyCustomShapeBorder(MyCustomClipper()),
        builder: (context) {
          DateRangePickerController _controller = DateRangePickerController();
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                bottomNavigationBar: FABBottomAppBar(
                  notchedShape: CircularNotchedRectangle(),
                  backgroundColor: Colors.white,
                  onTabSelected: (v) {},
                  items: [
                    FABBottomAppBarItem(
                        iconData: const Text(
                          "Pick up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        text: '12:00 PM'),
                    FABBottomAppBarItem(
                        iconData: Text(
                          "Return",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        text: '12:00 PM'),
                  ],
                  centerItemText: '',
                  color: Colors.black,
                  selectedColor: Colors.black,
                ),
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(65),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: TextButton(
                            onPressed: () {
                              _controller.selectedRanges = [];
                              setState(() {});
                            },
                            child: Text('Reset',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(6, -25),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                              size: 50,
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
                      SfDateRangePicker(
                        controller: _controller,
                        view: DateRangePickerView.month,
                        monthViewSettings: DateRangePickerMonthViewSettings(
                          enableSwipeSelection: false,
                          dayFormat: 'EEE',
                        ),
                        showNavigationArrow: false,
                        navigationMode: DateRangePickerNavigationMode.snap,
                        headerStyle: const DateRangePickerHeaderStyle(
                            textAlign: TextAlign.left,
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        initialDisplayDate: DateTime(2022, 12, 14),
                        selectionMode: DateRangePickerSelectionMode.multiRange,
                        onSelectionChanged: (v) {},
                        startRangeSelectionColor: Colors.blue,
                        initialSelectedRanges: [
                          PickerDateRange(
                              DateTime(2022, 12, 14), DateTime(2022, 12, 30)),
                        ],
                        rangeSelectionColor: Colors.blue.withOpacity(0.3),
                      ),
                      SfDateRangePicker(
                        view: DateRangePickerView.month,
                        monthViewSettings: DateRangePickerMonthViewSettings(
                          enableSwipeSelection: false,
                          dayFormat: 'EEE',
                        ),
                        initialDisplayDate: DateTime(2023, 01, 01),
                        showNavigationArrow: false,
                        navigationMode: DateRangePickerNavigationMode.snap,
                        headerStyle: const DateRangePickerHeaderStyle(
                            textAlign: TextAlign.left,
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        selectionMode: DateRangePickerSelectionMode.multiRange,
                        onSelectionChanged: (v) {},
                        startRangeSelectionColor: Colors.blue,
                        rangeSelectionColor: Colors.blue.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}

class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width * 0.3, 0)
      ..lineTo(size.width * 0.3, 50)
      ..lineTo(size.width * 0.7, 50)
      ..lineTo(size.width * 0.7, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
