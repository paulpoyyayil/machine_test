import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/utils/colors.dart';
import 'package:remixicon/remixicon.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isClicked = false;

  String getRandomImage() {
    if (widget.index % 2 == 0) {
      return 'assets/images/1.png';
    } else {
      return 'assets/images/2.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  getRandomImage(),
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 8.h,
                    left: -4,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.kBadgeColor,
                          borderRadius: BorderRadius.circular(2.43.r)),
                      child: Text(
                        '本日まで',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.kBackgroundColor,
                          fontSize: 10.sp,
                        ),
                      ),
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(238, 171, 64, 0.1),
                        ),
                        child: Text(
                          '介護付き有料老人ホーム',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                      Text(
                        '¥ 6,000',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.kTextColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '5月 31日（水）08 : 00 ~ 17 : 00',
                    style: TextStyle(
                      color: AppColors.kTextColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '北海道札幌市東雲町3丁目916番地17号',
                    style: TextStyle(
                      color: AppColors.kTextColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '交通費 300円',
                    style: TextStyle(
                      color: AppColors.kTextColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '住宅型有料老人ホームひまわり倶楽部',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(48, 48, 48, 0.35),
                          fontSize: 10.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (mounted) {
                            setState(() {
                              isClicked = !isClicked;
                            });
                          }
                        },
                        child: isClicked
                            ? const Icon(
                                Remix.heart_fill,
                                size: 36,
                                color: AppColors.kLikeColor,
                              )
                            : const Icon(
                                Remix.heart_line,
                                size: 36,
                                color: Color.fromRGBO(48, 48, 48, 0.35),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
