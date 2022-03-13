import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/widgets/constants.dart';

class CustomInputTextStyle {
  static TextStyle inputDarkBlueTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 17.sp,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  static TextStyle inputBlackTextStyle() {
    return TextStyle(
      fontSize: 17.sp,
      color: Colors.black,
    );
  }
}
