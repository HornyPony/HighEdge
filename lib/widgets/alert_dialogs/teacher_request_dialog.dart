import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/widgets/buttons/primary_color_btn.dart';
import 'package:high_edge_hack/widgets/buttons/white_color_btn.dart';
import 'package:high_edge_hack/widgets/constants.dart';

class TeacherRequestDialog extends StatefulWidget {
  @override
  State<TeacherRequestDialog> createState() => _ChatInsertCodeDialogState();
}

class _ChatInsertCodeDialogState extends State<TeacherRequestDialog> {
  bool isUserInsertedCode = false;
  bool isUserRated = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        width: 230.w,
        height: 260.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 14.w,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  'У вас 1 заявка на регистрацию',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 55.h,
                decoration: BoxDecoration(
                  color: CustomColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Container(
                          width: 40.h,
                          height: 40.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/profile_photo.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Александра Чижова',
                              style: TextStyle(
                                color: Color(0xFF6F6F6F),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'г. Москва, МБОУ СОШ №1',
                              style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 6.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryColorButton(
                    text: 'Принять',
                    onPressed: () {},
                    width: 87.w,
                    height: 15.h,
                    textSize: 8.sp,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Отклонить',
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Samsung-Sans',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: Color(0xFFE8E8E8),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(
                        87.w,
                        15.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
