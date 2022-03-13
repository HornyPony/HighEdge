import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryColorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double textSize;

  PrimaryColorButton({
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
          fontFamily: 'Samsung-Sans',
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: Theme.of(context).primaryColor,
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
