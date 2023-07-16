import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/widgets/date_card.dart';

class SearchViewController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  List<Time> timeList = <Time>[
    Time(text: '木', date: '26', isSelected: true),
    Time(text: '金', date: '27', isSelected: false),
    Time(text: '土', date: '28', isSelected: false),
    Time(text: '日', date: '29', isSelected: false),
    Time(text: '月', date: '30', isSelected: false),
    Time(text: '火', date: '31', isSelected: false),
    Time(text: '水', date: '1', isSelected: false),
    Time(text: '木', date: '2', isSelected: false),
    Time(text: '金', date: '3', isSelected: false),
    Time(text: '土', date: '4', isSelected: false),
    Time(text: '日', date: '5', isSelected: false),
    Time(text: '月', date: '6', isSelected: false),
    Time(text: '火', date: '7', isSelected: false),
    Time(text: '水', date: '8', isSelected: false),
    Time(text: '木', date: '9', isSelected: false),
    Time(text: '金', date: '10', isSelected: false),
    Time(text: '土', date: '11', isSelected: false),
    Time(text: '日', date: '12', isSelected: false),
    Time(text: '月', date: '13', isSelected: false),
    Time(text: '火', date: '14', isSelected: false),
    Time(text: '水', date: '15', isSelected: false),
  ].obs;

  void updateSelectedTime(String selectedDate) {
    for (var time in timeList) {
      time.isSelected = time.date == selectedDate;
    }
    refresh();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
