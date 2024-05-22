import 'package:get/get.dart';

import 'package:flutter/material.dart';

class JumpPageController extends GetxController {
  var visiblePageViews = <Widget>[];
  late final List<Widget> pages;
  PageController pageController = PageController();
  int pageCurrent = 0;
  // final controller = Get.find<AIDietLogController>();

  JumpPageController({required this.pages}) {
    visiblePageViews.assignAll(List<Widget>.from(pages));
  }

  double? get page => pageController.page;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void refreshPageController() {
    // pageController.dispose(); // Dispose the old controller
    // pageController = PageController(keepPage: ); // Create a new controller
  }

  // void setPages(List<Widget> pageChildren) {
  //   pages = pageChildren;
  //   visiblePageViews.assignAll(List<Widget>.from(pages));
  // }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void swapChildren(int pageCurrent, int pageTarget) {
    List<Widget> newVisiblePageViews = List<Widget>.from(pages);
    if (pageTarget > pageCurrent) {
      newVisiblePageViews[pageCurrent + 1] = visiblePageViews[pageTarget];
    } else if (pageTarget < pageCurrent) {
      newVisiblePageViews[pageCurrent - 1] = visiblePageViews[pageTarget];
    }

    visiblePageViews.assignAll(newVisiblePageViews);
    update();
  }

  // Future quickJump(int pageCurrent, int pageTarget) async {
  //   int quickJumpTarget =
  //       pageTarget > pageCurrent ? pageCurrent + 1 : pageCurrent - 1;
  //   pageController.jumpToPage(quickJumpTarget);
  // }

  void flashToPage(int i) async {
    int pageTarget = i;
    // int pageCurrent = page!.round().toInt();
    // print("PippyUser $pageCurrent");
    // print("PippyTarget $pageTarget");
    print("PippySystem $page");
    // if (ListEquality().equals(visiblePageViews, pages)) {
    //   print("Pippy true");
    // }
    if (pageCurrent == pageTarget) {
      return;
    }
    if(!((pageCurrent - pageTarget).abs()==1)) {
      swapChildren(pageCurrent, pageTarget);
    }
    // quickJump(pageCurrent, pageTarget);
    if (pageCurrent < pageTarget) {
      print("Pippy forward");
      await pageController.nextPage(
        curve: Curves.easeIn,
        duration: Duration(seconds: 1),
      );
    } else {
      print("Pippy reverse");
      await pageController.previousPage(
        curve: Curves.easeIn,
        duration: Duration(seconds: 1),
      );
    }
    pageCurrent = pageTarget;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      visiblePageViews.assignAll(List<Widget>.from(pages));
      // refreshPageController();
      update();
      // pageController.jumpToPage(pageCurrent);
      print("PippyUpdate $page");
    });
  }
}