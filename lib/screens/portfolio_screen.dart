import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/screens/portfolio_section_screen.dart';
import 'package:high_edge_hack/widgets/app_bar.dart';
import 'package:high_edge_hack/widgets/bottom_nav_bars/custom_bottom_nav_bar.dart';

class PortfolioScreen extends StatelessWidget {
  final bool isTeacher;

  const PortfolioScreen({Key? key, required this.isTeacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbars.backIconAppBar(context, 'Портфолио'),
      body: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 30.h,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20.w,
          crossAxisSpacing: 20.w,
          children: [
            portfolioContainer(
              'Олимпиады',
              0,
              context,
            ),
            portfolioContainer(
              'Общественная деятельность',
              5,
              context,
            ),
            portfolioContainer(
              isTeacher ? 'Повышение квалификации' : 'Спортивные достижения',
              0,
              context,
            ),
            portfolioContainer(
              isTeacher ? 'Научные работы' : 'Активность',
              0,
              context,
            ),
            portfolioContainer(
              'Интернет - олимпиады',
              0,
              context,
            ),
            portfolioContainer(
              'Другое',
              0,
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget portfolioContainer(
    String portfolioTitle,
    int progress,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PortfolioSectionScreen(
              appbarTitle: portfolioTitle,
            ),
          ),
        );
      },
      child: Container(
        width: 160.w,
        height: 160.w,
        color: Theme.of(context).primaryColor,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                portfolioTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 5,
              child: Text(
                progress.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
