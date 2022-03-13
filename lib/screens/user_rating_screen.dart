import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/widgets/app_bar.dart';

class UserRatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbars.backIconAppBar(context, 'Рейтинг'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 14.h,
            ),
            Container(
              width: 95.w,
              height: 88.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rating_star.png'),
                ),
              ),
            ),
            Text(
              '5.6',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: 320.w,
              height: 134.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/statistics.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Глобальный рейтинг',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Icon(Icons.sort)
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 315.w,
              height: 81.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/global_rating.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
