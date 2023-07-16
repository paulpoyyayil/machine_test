import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/utils/colors.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '2021 / 11 / 18',
          style: TextStyle(
            color: AppColors.kLightText,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'スタンプを獲得しました。',
              style: TextStyle(
                color: AppColors.kLightText,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            Text(
              '1 個',
              style: TextStyle(
                color: AppColors.kLightText,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
