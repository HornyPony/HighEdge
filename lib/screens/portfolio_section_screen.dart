import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/screens/add_portfolio_screen.dart';
import 'package:high_edge_hack/widgets/app_bar.dart';
import 'package:high_edge_hack/widgets/constants.dart';

class PortfolioSectionScreen extends StatefulWidget {
  final String appbarTitle;

  const PortfolioSectionScreen({Key? key, required this.appbarTitle})
      : super(key: key);

  @override
  State<PortfolioSectionScreen> createState() => _PortfolioSectionScreenState();
}

class _PortfolioSectionScreenState extends State<PortfolioSectionScreen> {
  bool isShow2020 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbars.backIconAppBar(context, widget.appbarTitle),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddPortfolioScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            portfolioItemDropDown('2022 год', () {}),
            portfolioItemDropDown('2021 год', () {}),
            portfolioItemDropDown('2020 год', () {
              setState(() {
                isShow2020 = !isShow2020;
              });
            }),
            SizedBox(
              height: 16.h,
            ),
            isShow2020
                ? Row(
                    children: [
                      portfolioItem(
                        'assets/images/portfolio_1.png',
                        'Диплом 2 степени  Отборочный тур олимпиады по математике СПГУ',
                      ),
                      SizedBox(
                        width: 27.w,
                      ),
                      portfolioItem(
                        'assets/images/portfolio_2.png',
                        'Похвальная грамота Отборочный тур олимпиады по русскому языку Похвальная грамота Отборочный тур олимпиады по русскому языку Похвальная грамота Отборочный тур олимпиады по русскому языку',
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  portfolioItemDropDown(
    String title,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 32.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Container(
                height: 32.h,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.w,
                      color: Color(0xFFD3D2D2),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF707070),
                      ),
                    ),
                    isShow2020
                        ? Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Color(0xFFD3D2D2),
                            size: 18,
                          )
                        : Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xFFD3D2D2),
                            size: 18,
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget portfolioItem(String image, String text) {
    return Container(
      width: 141.w,
      height: 236.h,
      decoration: BoxDecoration(
        color: CustomColors.lightGreyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Column(
          children: [
            Container(
              width: 98.w,
              height: 140.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
            Flexible(
              child: Text(
                text,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF6F6F6F),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
