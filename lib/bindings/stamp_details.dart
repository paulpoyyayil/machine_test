import 'package:get/get.dart';
import 'package:machine_test/controllers/stamp_details.dart';

class StampDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StampDetailsController());
  }
}
