import 'package:calendar_example/views/widgets/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/date_provider.dart';
import '../../utils/clipper/my_custom_clipper.dart';
import '../../utils/clipper/my_custom_shape_border.dart';
import '../../utils/helpers/string_helper.dart';
import '../widgets/modal_buttom.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateProvider timeProvider = DateProvider();
  @override
  Widget build(BuildContext context) {
    timeProvider = Provider.of<DateProvider>(context);
    return Scaffold(
      body: body(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Text(
          "GO",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: const AppBarCustom(),
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
                child: GestureDetector(
                  onTap: () {
                    showButtonModal();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                      ),
                      Text(timeProvider.dateStart.toString().substring(0, 10),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
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
                      const Icon(
                        Icons.timer_outlined,
                        size: 16,
                      ),
                      Text(toCustomHousr(timeProvider.dateStart),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(width: 5),
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
                const Center(
                  child: Text('Reservation ends',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
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
                child: GestureDetector(
                  onTap: () {
                    showButtonModal();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                      ),
                      Text(timeProvider.dateEnd.toString().substring(0, 10),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
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
                      const Icon(
                        Icons.timer_outlined,
                        size: 16,
                      ),
                      Text(toCustomHousr(timeProvider.dateEnd),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(width: 5),
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

  void showButtonModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        elevation: 20,
        anchorPoint: const Offset(0.6, 0.6),
        shape: MyCustomShapeBorder(MyCustomClipper()),
        builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) =>
                const ModalButtom()));
  }
}
