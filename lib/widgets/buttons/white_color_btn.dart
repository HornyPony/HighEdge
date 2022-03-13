import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhiteColorButtonPrimaryText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double textSize;

  const WhiteColorButtonPrimaryText({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          width,
          height,
        ),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
        elevation: 0,
        primary: Colors.white,
        side: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: textSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class WhiteColorButtonAccentText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double textSize;

  const WhiteColorButtonAccentText(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.width,
      required this.height,
      required this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          width,
          height,
        ),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
        elevation: 0,
        primary: Colors.white,
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: textSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
