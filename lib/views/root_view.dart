import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/controllers/root.dart';
import 'package:remixicon/remixicon.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: controller.currentPage,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.changePage(index);
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Remix.search_line),
                label: 'さがす',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Remix.suitcase_line),
                label: 'お仕事',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: 32.h,
                      width: 50.w,
                    ),
                    Positioned(
                      top: -24.h,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(250, 170, 20, 1),
                              Color.fromRGBO(255, 215, 141, 1),
                            ],
                          ),
                        ),
                        child: Icon(
                          Remix.qr_scan_2_line,
                          color: Colors.white,
                          size: 32.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                label: '打刻する',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Remix.chat_3_line),
                label: 'チャット',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Remix.user_line),
                label: 'マイページ',
              ),
            ],
          ),
        );
      },
    );
  }
}
