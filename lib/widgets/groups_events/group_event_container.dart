import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/screens/event_screen.dart';
import 'package:high_edge_hack/screens/group_screen.dart';
import 'package:high_edge_hack/widgets/constants.dart';

class GroupEventContainer extends StatelessWidget {
  final bool isEvent;
  final String image;
  final String name;
  final String info;

  const GroupEventContainer(
      {Key? key,
      required this.image,
      required this.name,
      required this.info,
      required this.isEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isEvent
            ? Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EventScreen(
                    image: image,
                    isTeacherScreen: false,
                    name: name,
                  ),
                ),
              )
            : Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GroupScreen(
                    image: image,
                    isTeacherScreen: false,
                    name: name,
                  ),
                ),
              );
        ;
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
            groupEventImage(image),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  groupEventTitle(),
                  SizedBox(
                    height: 6.h,
                  ),
                  groupEventDate(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget groupEventImage(String image) {
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

  Widget groupEventTitle() {
    return Text(
      name,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: CustomColors.darkGreyColor,
      ),
    );
  }

  Widget groupEventDate() {
    return Text(
      info,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFFAFAFAF),
      ),
    );
  }
}
