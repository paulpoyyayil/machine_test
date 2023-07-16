import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test/controllers/stamp_details.dart';
import 'package:machine_test/routes/app_routes.dart';
import 'package:machine_test/utils/colors.dart';
import 'package:machine_test/widgets/history_card.dart';
import 'package:machine_test/widgets/stamp_card.dart';
import 'package:remixicon/remixicon.dart';

class StampDetails extends GetView<StampDetailsController> {
  const StampDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFa8b1ff),
      body: Column(
        children: [
          SizedBox(height: 48.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.root),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Color(0xFF949eff),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Remix.arrow_left_s_line,
                          color: AppColors.kBackgroundColor,
                        ),
                      ),
                    ),
                    Text(
                      'スタンプカード詳細',
                      style: TextStyle(
                        color: AppColors.kBackgroundColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.remove_circle_outline,
                      color: AppColors.kBackgroundColor,
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mer キッチン',
                      style: TextStyle(
                        color: AppColors.kBackgroundColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '現在の獲得数',
                              style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: AppColors.kBackgroundColor,
                              ),
                            ),
                            TextSpan(
                              text: '30',
                              style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                fontWeight: FontWeight.w600,
                                fontSize: 28.sp,
                                color: AppColors.kBackgroundColor,
                              ),
                            ),
                            TextSpan(
                              text: '個',
                              style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: AppColors.kBackgroundColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.r),
                  topRight: Radius.circular(22.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: CarouselSlider(
                            items: const [
                              StampCard(),
                              StampCard(),
                            ],
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              aspectRatio: 1.75,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '2 / 2枚目',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'スタンプ獲得履歴',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) =>
                                const HistoryCard(),
                            separatorBuilder: (context, index) => const Divider(
                              thickness: 1.5,
                            ),
                            itemCount: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
