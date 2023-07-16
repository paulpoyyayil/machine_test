import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test/controllers/search_view.dart';
import 'package:machine_test/routes/app_routes.dart';
import 'package:machine_test/utils/colors.dart';
import 'package:machine_test/widgets/date_card.dart';
import 'package:machine_test/widgets/news_card.dart';
import 'package:remixicon/remixicon.dart';

class SearchView extends GetView<SearchViewController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 12.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.kFillColor,
                      borderRadius: BorderRadius.circular(16.5.r),
                    ),
                    child: TextFormField(
                      controller: controller.searchController,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.rotate(
                      angle: 3.14 / 2,
                      child: Icon(
                        Remix.equalizer_line,
                        size: 28.sp,
                        color: AppColors.kGreyColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Remix.heart_line,
                      size: 28.sp,
                      color: AppColors.kLikeColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFAAA14),
                  Color(0xFFFFD78D),
                ],
              ),
            ),
            child: Text(
              '2022年 5月 26日（木）',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32.h),
          Expanded(
            flex: 1,
            child: GetBuilder<SearchViewController>(
              builder: (controller) {
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: controller.timeList.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        controller
                            .updateSelectedTime(controller.timeList[i].date);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: i == 0 ? 24.w : 0,
                          right: i == controller.timeList.length - 1 ? 24.w : 0,
                        ),
                        child: DateCard(
                          text: controller.timeList[i].text,
                          date: controller.timeList[i].date,
                          isSelected: controller.timeList[i].isSelected,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 6.w),
                );
              },
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    if (i % 2 == 0) {
                      Get.toNamed(Routes.editProfile);
                    } else {
                      Get.toNamed(Routes.stampDetails);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: i == 0 ? 32.h : 0,
                      bottom: i == 4 ? 32.h : 0,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: NewsCard(index: i),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 24.h),
            ),
          ),
        ],
      ),
    );
  }
}
