import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/utils/colors.dart';

class DateCard extends StatefulWidget {
  const DateCard({
    Key? key,
    required this.text,
    required this.date,
    required this.isSelected,
  }) : super(key: key);

  final String text;
  final String date;
  final bool isSelected;

  @override
  State<DateCard> createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 12.w,
      ),
      decoration: BoxDecoration(
        color: widget.isSelected
            ? AppColors.kPrimaryColor
            : AppColors.kBackgroundColor,
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: Column(
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 17.sp,
              color: widget.isSelected
                  ? AppColors.kBackgroundColor
                  : AppColors.kTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            widget.date,
            style: TextStyle(
              fontSize: 17.sp,
              color: widget.isSelected
                  ? AppColors.kBackgroundColor
                  : AppColors.kTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class Time {
  String text;
  String date;
  bool isSelected;

  Time({required this.text, required this.date, required this.isSelected});
}
