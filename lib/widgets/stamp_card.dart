import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/utils/colors.dart';

class StampCard extends StatelessWidget {
  const StampCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.kBackgroundColor,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 8,
            spreadRadius: 0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 15,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 20.2,
          vertical: 25.h,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemBuilder: (context, index) =>
            Image.asset('assets/icons/checkmark.png'),
      ),
    );
  }
}
