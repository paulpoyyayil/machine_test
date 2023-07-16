import 'package:get/get.dart';
import 'package:machine_test/controllers/edit_profile.dart';

class EditProfileBinding extends Bindings{
    @override
  void dependencies() {
    Get.put(EditProfileController());
  }
}