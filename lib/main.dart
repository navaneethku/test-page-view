import 'package:animate_middle_page_issue_page_view/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/home/controllers/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JumpPageController(pages: [
      Container(
        color: Colors.red,
        child: Column(
          children: [
            const Center(
              child: Text("Page 1", style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Button'),
            )
          ],
        ),
      ),
      Container(
        color: Colors.green,
        child: const Center(
            child: Text("Page 2", style: TextStyle(color: Colors.black))),
      ),
      Container(
        color: Colors.blue,
        child: const Center(
            child: Text("Page 3", style: TextStyle(color: Colors.black))),
      ),
      Container(
        color: Colors.yellow,
        child: const Center(
            child: Text("Page 4", style: TextStyle(color: Colors.black))),
      ),
      Container(
        color: Colors.orange,
        child: const Center(
            child: Text("Page 5", style: TextStyle(color: Colors.black))),
      ),
      Container(
        color: Colors.pink,
        child: const Center(
            child: Text("Page 6", style: TextStyle(color: Colors.black))),
      ),
      Container(
        color: Colors.purple,
        child: const Center(
            child: Text("Page 7", style: TextStyle(color: Colors.black))),
      ),
      Container(
        color: Colors.brown,
        child: const Center(
            child: Text("Page 8", style: TextStyle(color: Colors.black))),
      ),
      Container(
        color: Colors.grey,
        child: const Center(
            child: Text("Page 9", style: TextStyle(color: Colors.black))),
      ),
      Container(
        color: Colors.cyan,
        child: const Center(
            child: Text("Page 10", style: TextStyle(color: Colors.black))),
      ),
      Container(
        color: Colors.lime,
        child: const Center(
            child: Text("Page 11", style: TextStyle(color: Colors.black))),
      ),
    ]));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Stack(children: [
        JumpPageView(tag: 'JumpPageView')
        
        ]),
    );
  }
}
