import 'package:flutter_demo/core/base/base_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherController extends BaseController {
  final PageController pageController = PageController(initialPage: 0);

  final RxInt currentPage = 0.obs;
  final Rx<Timer> timer =
      Timer.periodic(Duration(seconds: 3), (Timer timer) {}).obs;

  List<Map<String, String>> bannerImagesList = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1678669701650-46851754bcef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
      'linkUrl': 'https://github.com/shakircam',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1678872537245-296b738873ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
      'linkUrl': 'https://github.com/shakircam',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1678846912726-667eda5a850f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'linkUrl': 'https://github.com/shakircam',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1678846912726-667eda5a850f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'linkUrl': 'https://github.com/shakircam',
    },
  ];

  @override
  void onInit() {
    // startTimer();
    super.onInit();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void startTimer() {
    timer.value = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage.value == bannerImagesList.length - 1) {
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  void stopTimer() {
    timer.value?.cancel();
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      print("tab vaild url");
      await launch(url);
    } else {
      print("tab not vaild");
      throw 'Could not launch $url';
    }
  }
}
