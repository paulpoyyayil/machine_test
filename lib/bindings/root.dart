import 'package:get/get.dart';
import 'package:machine_test/controllers/root.dart';
import 'package:machine_test/controllers/search_view.dart';
import 'package:machine_test/controllers/stamp_details.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootController(), permanent: true);
    Get.put(SearchViewController());
    Get.put(StampDetailsController());
  }
}
