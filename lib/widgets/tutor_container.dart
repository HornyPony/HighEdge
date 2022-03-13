import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/screens/tutor_screen.dart';
import 'package:high_edge_hack/widgets/constants.dart';

class TutorContainer extends StatelessWidget {
  final String image;
  final String name;
  final double rating;
  final int reviews;

  const TutorContainer(
      {Key? key,
      required this.image,
      required this.name,
      required this.rating,
      required this.reviews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push((MaterialPageRoute(builder: (context) => TutorScreen())));
      },
      child: Container(
        margin: EdgeInsets.only(top: 14.h, right: 6.w),
        width: 320.w,
        height: 84.h,
        decoration: BoxDecoration(
          color: CustomColors.lightGreyColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            tutorImage(image),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.darkGreyColor,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      tutorRating(),
                      SizedBox(
                        width: 30.w,
                      ),
                      tutorReview(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tutorImage(String image) {
    return Container(
      width: 70.h,
      height: 70.h,
      margin: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
  }

  Widget tutorRating() {
    return Row(
      children: [
        Container(
          width: 17.w,
          height: 15.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/rating_star.png'),
            ),
          ),
        ),
        Text(
          rating.toString(),
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: CustomColors.darkGreyColor,
          ),
        ),
      ],
    );
  }

  Widget tutorReview() {
    return Row(
      children: [
        Container(
          width: 15.w,
          height: 15.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/chat.png'),
            ),
          ),
        ),
        Text(
          reviews.toString(),
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: CustomColors.darkGreyColor,
          ),
        ),
      ],
    );
  }
}
