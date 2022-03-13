import 'package:flutter/material.dart';
import 'package:high_edge_hack/screens/olympiade_screen.dart';
import 'package:high_edge_hack/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/widgets/buttons/primary_color_btn.dart';
import 'package:high_edge_hack/widgets/constants.dart';
import 'package:high_edge_hack/widgets/global_widgets/sections_title.dart';

class GroupScreen extends StatefulWidget {
  final String image;
  final String name;
  final bool isTeacherScreen;

  const GroupScreen(
      {Key? key,
      required this.image,
      required this.isTeacherScreen,
      required this.name})
      : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  bool _isRequestSended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbars.backIconAppBar(context, 'Сообщества'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                children: [
                  eventNameImage(),
                  SizedBox(
                    height: 20.h,
                  ),
                  widget.isTeacherScreen ? teacherBtn() : studentParentBtn(),
                  SizedBox(
                    height: 12.h,
                  ),
                  eventDetailsRow(
                    'assets/images/location.png',
                    'МБОУ СОШ №1',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Container(
                    height: 9.h,
                    color: CustomColors.lightGreyColor,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SectionsTitle(
                    title: 'Записи:',
                  ),
                  eventContainer(
                    '12 марта',
                    'Спасибо, что никто не пришел. За занавески деньги сдайте',
                    context,
                  ),
                  eventContainer(
                    '11 марта',
                    'Завтра Веселые старты. Ждем всех родителей!',
                    context,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget eventNameImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 210.w,
          child: Text(
            widget.name,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xFF6f6f6f),
            ),
          ),
        ),
        Container(
          width: 86.h,
          height: 86.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.image),
            ),
          ),
        )
      ],
    );
  }

  Widget eventDetailsRow(String image, String text) {
    return Row(
      children: [
        Container(
          width: 19.h,
          height: 19.h,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(image),
          )),
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xFFAFAFAF),
          ),
        ),
      ],
    );
  }

  Widget eventContainer(
    String date,
    String text,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 6.h,
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Text(
            date,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xFFAFAFAF),
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: CustomColors.lightGreyColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    widget.isTeacherScreen
                        ? Column(
                            children: [
                              Icon(
                                Icons.edit,
                                color: CustomColors.darkGreyColor,
                                size: 20,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                            ],
                          )
                        : SizedBox(),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: CustomColors.darkGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget teacherBtn() {
    return PrimaryColorButton(
      text: 'Опубликовать новость',
      onPressed: () {},
      width: 316.w,
      height: 29.h,
      textSize: 14.sp,
    );
  }

  Widget studentParentBtn() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isRequestSended = !_isRequestSended;
        });
      },
      child: Text(
        !_isRequestSended ? 'Вступить' : 'Вы участник',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: _isRequestSended ? CustomColors.darkGreyColor : Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: !_isRequestSended
            ? Theme.of(context).primaryColor
            : Color(0xFFE8E8E8),
        padding: EdgeInsets.zero,
        minimumSize: Size(
          316.w,
          29.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
    );
  }

  Widget startOlimpiade() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: PrimaryColorButton(
            text: 'Начать олимпиаду',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OlympiadeScreen()));
            },
            width: 316.w,
            height: 30.h,
            textSize: 14.sp,
          ),
        ),
        Container(
          height: 9.h,
          color: CustomColors.lightGreyColor,
        ),
      ],
    );
  }
}
