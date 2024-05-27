import 'dart:convert';

import 'package:animate_middle_page_issue_page_view/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'app/modules/home/controllers/home_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends GetView<JumpPageController> {
  MyApp({super.key});
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Get.put(JumpPageController(pages: [
      Text("Page 1", style: TextStyle(color: Colors.red)),
      Text("Page 2", style: TextStyle(color: Colors.blue)),
      Text("Page 3", style: TextStyle(color: Colors.green)),
      Text("Page 4", style: TextStyle(color: Colors.yellow)),
      Text("Page 5", style: TextStyle(color: Colors.orange)),
      Text("Page 6", style: TextStyle(color: Colors.purple)),
      Text("Page 7", style: TextStyle(color: Colors.pink)),
      Text("Page 8", style: TextStyle(color: Colors.teal)),
      Text("Page 9", style: TextStyle(color: Colors.indigo)),
      Text("Page 10", style: TextStyle(color: Colors.brown)),
      Text("Page 11", style: TextStyle(color: Colors.grey)),
    ]));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Stack(children: [
        JumpPageView(tag: 'JumpPageView'),
        Center(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.flashToPage(selectedIndex);
                },
                child: Text('Button'),
              ),
            ),
          ),
        Positioned(
            top: 500,
            child: ToggleSwitch(
              onToggle: (index) {
                selectedIndex = index ?? 0;
              },
              totalSwitches: 11,
              activeFgColor: Colors.white,
              inactiveFgColor: Colors.white,
              labels:
                  List<String>.generate(11, (index) => (index + 1).toString()),
            ))
      ]),
    );
  }
}
