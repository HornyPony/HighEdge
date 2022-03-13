import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  SearchWidget({
    required this.text,
    required this.hintText,
    required this.onChanged,
  });

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(
      color: Color(0xFFD1D1D1),
      fontSize: 15.sp,
    );
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 32.h,
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: 17.sp,
        ),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          fillColor: Color(0xFFF5F5F5),
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 6.h,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: style.color,
            size: 20,
          ),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide.none,
          ),
        ),
        textInputAction: TextInputAction.done,
        onChanged: widget.onChanged,
      ),
    );
  }
}
