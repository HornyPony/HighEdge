import 'package:flutter/material.dart';
import 'package:high_edge_hack/screens/profile_screen.dart';
import 'package:high_edge_hack/widgets/buttons/primary_color_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestSentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/request_sent.png'),
              ),
            ),
          ),
          PrimaryColorButton(
              text: 'Хорошо',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(isTeacher: false),
                  ),
                );
              },
              width: 180.w,
              height: 32.h,
              textSize: 14.sp)
        ],
      ),
    );
  }
}
