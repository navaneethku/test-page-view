import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class JumpPageView extends GetView<JumpPageController> {
  String tag;
  // List<Widget> children;
  JumpPageView({super.key, required this.tag});
  @override
  Widget build(BuildContext context) {
    return pageView();
  }

  Widget pageView() {
    return GetBuilder<JumpPageController>(
      builder: (_) {
        return PageView(
          controller: _.pageController,
          children: _.visiblePageViews,
        );
      },
    );
  }
}