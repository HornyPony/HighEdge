import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetGlobalWidgets {
  static Widget bottomSheetMainTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Widget bottomSheetHeader(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 9.h,
        ),
        Center(
          child: Container(
            width: 41.w,
            height: 2.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: const Color(0xFFB5B5B5),
            ),
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
      ],
    );
  }

  static Widget claimingUserPhoto() {
    return Container(
      width: 94.w,
      height: 94.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/profile_image.png',
          ),
        ),
      ),
    );
  }

  static Widget bottomSheetSubtitle(BuildContext context, String subtitle) {
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: 17.sp,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
