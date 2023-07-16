import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test/controllers/edit_profile.dart';
import 'package:machine_test/routes/app_routes.dart';
import 'package:machine_test/utils/colors.dart';
import 'package:machine_test/widgets/text_field.dart';
import 'package:remixicon/remixicon.dart';

class EditProfile extends GetView<EditProfileController> {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.root),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFFf4f3f2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Remix.arrow_left_s_line,
                            color: Color(0xFFbbbbbb),
                          ),
                        ),
                      ),
                      Text(
                        '店舗プロフィール編集',
                        style: TextStyle(
                          color: const Color(0xFF4B4948),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(
                            Icons.notifications_outlined,
                            size: 32,
                            color: Color(0xFF4B4948),
                          ),
                          Positioned(
                            right: 1,
                            top: 2,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.kPrimaryColor,
                              ),
                              child: const Text(
                                '99+',
                                style: TextStyle(
                                  fontSize: 6.95,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
            const Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  CustomTextField(
                    controller: controller.storeName,
                    label: '店舗名',
                    hint: '店舗名',
                    isRequired: true,
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    controller: controller.repName,
                    label: '代表担当者名',
                    hint: '代表担当者名',
                    isRequired: true,
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    controller: controller.phoneNumer,
                    label: '店舗電話番号',
                    hint: '店舗電話番号',
                    isRequired: true,
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    controller: controller.address,
                    label: '店舗住所',
                    hint: '店舗住所',
                    isRequired: true,
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '現在の獲得数',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: '（最大3枚まで）',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 14.sp,
                            color: const Color(0xFF9C9896),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Obx(() {
                    return SizedBox(
                      height: 100.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.exteriorImages.length == 3
                            ? controller.exteriorImages.length
                            : controller.exteriorImages.length < 3
                                ? 3
                                : controller.exteriorImages.length + 1,
                        itemBuilder: (context, index) {
                          if (index < controller.exteriorImages.length) {
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: SizedBox(
                                    height: 90.h,
                                    width: 90.w,
                                    child: Image.file(
                                      File(controller
                                          .exteriorImages[index].path),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: GestureDetector(
                                    onTap: () => controller.removeImages(
                                        controller.exteriorImages, index),
                                    child: const Icon(
                                      Remix.close_line,
                                      color: AppColors.kBackgroundColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return GestureDetector(
                              onTap: () => controller
                                  .fromCamera(controller.exteriorImages),
                              child: Image.asset('assets/images/thumbnail.png'),
                            );
                          }
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8.w),
                      ),
                    );
                  }),
                  const SizedBox(height: 14),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '店舗内観',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: '（1枚〜3枚ずつ追加してください）',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF9C9896),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Obx(() {
                    return SizedBox(
                      height: 100.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.interiorImages.length == 3
                            ? controller.interiorImages.length
                            : controller.interiorImages.length < 3
                                ? 3
                                : controller.interiorImages.length + 1,
                        itemBuilder: (context, index) {
                          if (index < controller.interiorImages.length) {
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: SizedBox(
                                    height: 90.h,
                                    width: 90.w,
                                    child: Image.file(
                                      File(controller
                                          .interiorImages[index].path),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: GestureDetector(
                                    onTap: () => controller.removeImages(
                                        controller.interiorImages, index),
                                    child: const Icon(
                                      Remix.close_line,
                                      color: AppColors.kBackgroundColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return GestureDetector(
                              onTap: () => controller
                                  .fromCamera(controller.interiorImages),
                              child: Image.asset('assets/images/thumbnail.png'),
                            );
                          }
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8.w),
                      ),
                    );
                  }),
                  const SizedBox(height: 14),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '料理写真',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: '（1枚〜3枚ずつ追加してください）',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 14.sp,
                            color: const Color(0xFF9C9896),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Obx(() {
                    return SizedBox(
                      height: 100.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.foodImages.length == 3
                            ? controller.foodImages.length
                            : controller.foodImages.length < 3
                                ? 3
                                : controller.foodImages.length + 1,
                        itemBuilder: (context, index) {
                          if (index < controller.foodImages.length) {
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: SizedBox(
                                    height: 90.h,
                                    width: 90.w,
                                    child: Image.file(
                                      File(controller.foodImages[index].path),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: GestureDetector(
                                    onTap: () => controller.removeImages(
                                        controller.foodImages, index),
                                    child: const Icon(
                                      Remix.close_line,
                                      color: AppColors.kBackgroundColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return GestureDetector(
                              onTap: () =>
                                  controller.fromCamera(controller.foodImages),
                              child: Image.asset('assets/images/thumbnail.png'),
                            );
                          }
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8.w),
                      ),
                    );
                  }),
                  const SizedBox(height: 14),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'メニュー写真',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: '（1枚〜3枚ずつ追加してください）',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 14.sp,
                            color: const Color(0xFF9C9896),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Obx(() {
                    return SizedBox(
                      height: 100.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.menuImages.length == 3
                            ? controller.menuImages.length
                            : controller.menuImages.length < 3
                                ? 3
                                : controller.menuImages.length + 1,
                        itemBuilder: (context, index) {
                          if (index < controller.menuImages.length) {
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: SizedBox(
                                    height: 90.h,
                                    width: 90.w,
                                    child: Image.file(
                                      File(controller.menuImages[index].path),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: GestureDetector(
                                    onTap: () => controller.removeImages(
                                        controller.menuImages, index),
                                    child: const Icon(
                                      Remix.close_line,
                                      color: AppColors.kBackgroundColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return GestureDetector(
                              onTap: () =>
                                  controller.fromCamera(controller.menuImages),
                              child: Image.asset('assets/images/thumbnail.png'),
                            );
                          }
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8.w),
                      ),
                    );
                  }),
                  const SizedBox(height: 14),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '営業時間',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Obx(
                    () => Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.kLightBorder),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: DropdownButton<String>(
                            underline: const SizedBox.shrink(),
                            value: controller.workingHourStart.value,
                            onChanged: (String? newValue) {
                              controller.workingHourStart.value = newValue!;
                            },
                            items: controller.workingHourList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          '〜',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(width: 16.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.kLightBorder),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: DropdownButton<String>(
                            underline: const SizedBox.shrink(),
                            value: controller.workingHourEnd.value,
                            onChanged: (String? newValue) {
                              controller.workingHourEnd.value = newValue!;
                            },
                            items: controller.workingHourEndList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'ランチ時間',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Obx(
                    () => Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.kLightBorder),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: DropdownButton<String>(
                            underline: const SizedBox.shrink(),
                            value: controller.lunchHourStart.value,
                            onChanged: (String? newValue) {
                              controller.lunchHourStart.value = newValue!;
                            },
                            items: controller.lunchHourList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          '〜',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(width: 16.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.kLightBorder),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: DropdownButton<String>(
                            underline: const SizedBox.shrink(),
                            value: controller.lunchHourEnd.value,
                            onChanged: (String? newValue) {
                              controller.lunchHourEnd.value = newValue!;
                            },
                            items: controller.lunchHourEndList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '定休日',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text('月'),
                              value: false,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text('火'),
                              value: false,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text('水'),
                              value: false,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text('木'),
                              value: false,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text('金'),
                              value: false,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text('土'),
                              value: true,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text('日'),
                              value: true,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text('祝'),
                              value: true,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '料理カテゴリー',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.kLightBorder),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: DropdownButton<String>(
                      underline: const SizedBox.shrink(),
                      value: '料理カテゴリー選択',
                      onChanged: null,
                      items: const [
                        DropdownMenuItem<String>(
                          value: '料理カテゴリー選択',
                          child: Text('料理カテゴリー選択'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: controller.budgetFrom,
                          label: '予算*',
                          hint: '予算*',
                          isRequired: true,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '〜',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: CustomTextField(
                          controller: controller.budgeto,
                          label: '予算*',
                          hint: '予算*',
                          isRequired: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    controller: controller.desc,
                    label: 'キャッチコピー',
                    hint: 'キャッチコピー',
                    isRequired: true,
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    controller: controller.seats,
                    label: '座席数',
                    hint: '座席数',
                    isRequired: true,
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '喫煙席',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text('有'),
                          value: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {},
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text('無'),
                          value: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '駐車場',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text('有'),
                          value: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {},
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text('無'),
                          value: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '来店プレゼント',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF4B4948),
                          ),
                        ),
                        TextSpan(
                          text: '  ⃰',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text('有（最大３枚まで）'),
                          value: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {},
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text('無'),
                          value: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {},
                        ),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/food.png'),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    controller: controller.items,
                    label: '来店プレゼント名',
                    hint: '来店プレゼント名*',
                    isRequired: true,
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(250, 170, 20, 1),
                          Color.fromRGBO(255, 215, 141, 1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '編集を保存',
                        style: TextStyle(
                          color: AppColors.kBackgroundColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
