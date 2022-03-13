import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlueColorBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double textSize;

  BlueColorBtn({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: Color(0xFF29B1E2),
        padding: EdgeInsets.zero,
        minimumSize: Size(
          width,
          height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
    );
  }
}
