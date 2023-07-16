import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/views/search_view.dart';

class RootController extends GetxController {
  final selectedIndex = 0.obs;

  List<Widget> pages = [
    const SearchView(),
  ];

  Widget get currentPage {
    if (selectedIndex.value == 0) {
      return const SearchView();
    }
    return Container();
  }

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
