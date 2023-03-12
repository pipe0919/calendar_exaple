import 'package:flutter/material.dart';

import 'my_custom_clipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Transform.translate(
              offset: const Offset(4.5, -138),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 310 * .3,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                height: 310,
                width: 310,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
