import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfilePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174.w,
      height: 174.w,
      margin: EdgeInsets.only(top: 21.h),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 174.w,
              height: 174.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: Color(0xFFC0EDFE),
                  width: 3.w,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipOval(
              child: Container(
                width: 160.w,
                height: 160.w,
                child: Stack(
                  children: [
                    Container(
                      width: 160.w,
                      height: 160.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/profile_photo.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
