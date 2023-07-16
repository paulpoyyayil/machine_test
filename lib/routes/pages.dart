import 'package:get/get.dart';
import 'package:machine_test/bindings/edit_profile.dart';
import 'package:machine_test/bindings/root.dart';
import 'package:machine_test/bindings/stamp_details.dart';
import 'package:machine_test/routes/app_routes.dart';
import 'package:machine_test/views/edit_profile.dart';
import 'package:machine_test/views/root_view.dart';
import 'package:machine_test/views/stamp_details.dart';

class AppPages {
  static const initial = Routes.root;

  static final routes = [
    GetPage(
      name: Routes.root,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: Routes.stampDetails,
      page: () => const StampDetails(),
      binding: StampDetailsBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfile(),
      binding: EditProfileBinding(),
    ),
  ];
}
