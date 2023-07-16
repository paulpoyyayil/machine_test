import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.isRequired,
  });
  final TextEditingController controller;
  final String label, hint;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextField(
          controller: controller,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: AppColors.kMediumText,
          ),
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.kMediumText,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 8.h,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColors.kLightText,
            ),
            counterText: '',
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.kLightBorder),
              borderRadius: BorderRadius.circular(12.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.kLightBorder),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        Positioned(
          left: 6.w,
          top: -24.0.h,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(
                    fontFamily: 'NotoSansJP',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: const Color(0xFF4B4948),
                  ),
                ),
                if (isRequired)
                  TextSpan(
                    text: '  ⃰',
                    style: TextStyle(
                      fontFamily: 'NotoSansJP',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.red,
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
