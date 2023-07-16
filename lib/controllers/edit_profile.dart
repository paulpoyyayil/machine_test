import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  TextEditingController storeName = TextEditingController();
  TextEditingController repName = TextEditingController();
  TextEditingController phoneNumer = TextEditingController();
  TextEditingController address = TextEditingController();

  List<XFile> exteriorImages = <XFile>[].obs;
  List<XFile> interiorImages = <XFile>[].obs;
  List<XFile> foodImages = <XFile>[].obs;
  List<XFile> menuImages = <XFile>[].obs;

  List<String> workingHourList = [];
  List<String> workingHourEndList = [];
  List<String> lunchHourList = [];
  List<String> lunchHourEndList = [];

  RxString workingHourStart = '00:00'.obs;
  RxString workingHourEnd = '00:00'.obs;
  RxString lunchHourStart = '00:00'.obs;
  RxString lunchHourEnd = '00:00'.obs;

  TextEditingController budgetFrom = TextEditingController();
  TextEditingController budgeto = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController seats = TextEditingController();
  TextEditingController items = TextEditingController();

  Future<void> fromCamera(List<XFile?> imageList) async {
    if (imageList.length < 3) {
      final ImagePicker picker = ImagePicker();
      imageList.add(await picker.pickImage(source: ImageSource.camera));
    }
    update();
  }

  Future<void> removeImages(List<XFile?> imageList, int index) async {
    imageList.removeAt(index);
    update();
  }

  void generateTimeList(List timeList) {
    for (int index = 0; index < 24; index++) {
      String hour = index.toString().padLeft(2, '0');
      timeList.add('$hour:00');
    }
  }

  @override
  void onInit() {
    super.onInit();
    generateTimeList(workingHourList);
    generateTimeList(workingHourEndList);
    generateTimeList(lunchHourList);
    generateTimeList(lunchHourEndList);
  }

  @override
  void dispose() {
    super.dispose();
    storeName.dispose();
    repName.dispose();
    phoneNumer.dispose();
    address.dispose();

    exteriorImages.clear();
    interiorImages.clear();
    foodImages.clear();
    menuImages.clear();

    workingHourStart = '00:00'.obs;
    workingHourEnd = '00:00'.obs;
    lunchHourStart = '00:00'.obs;
    lunchHourEnd = '00:00'.obs;

    budgetFrom.dispose();
    budgeto.dispose();
    desc.dispose();
    seats.dispose();
    items.dispose();
  }
}
