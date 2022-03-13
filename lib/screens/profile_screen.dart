import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/screens/portfolio_screen.dart';
import 'package:high_edge_hack/screens/portfolio_section_screen.dart';
import 'package:high_edge_hack/screens/user_rating_screen.dart';
import 'package:high_edge_hack/widgets/alert_dialogs/teacher_request_dialog.dart';
import 'package:high_edge_hack/widgets/bottom_nav_bars/custom_bottom_nav_bar.dart';
import 'package:high_edge_hack/widgets/constants.dart';
import 'package:high_edge_hack/widgets/global_widgets/sections_title.dart';
import 'package:high_edge_hack/widgets/user_profile_photo.dart';

class ProfileScreen extends StatelessWidget {
  final bool isTeacher;

  const ProfileScreen({Key? key, required this.isTeacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 113.h,
                    color: Theme.of(context).primaryColor,
                  ),
                  isTeacher
                      ? Positioned(
                          bottom: 30.h,
                          left: 60.w,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return TeacherRequestDialog();
                                  });
                            },
                            child: Container(
                              width: 20.h,
                              height: 20.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/warning_icon.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  Align(
                    child: UserProfilePhoto(),
                    alignment: Alignment.center,
                  ),
                  isTeacher
                      ? Positioned(
                          bottom: 0.h,
                          right: 40.w,
                          child: Column(
                            children: [
                              Container(
                                width: 43.h,
                                height: 43.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/tutor_rating_icon.png',
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '10.0',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 17.h,
                  ),
                  SectionsTitle(
                    title: 'Личная информация',
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  profileDataContainer('Василий'),
                  SizedBox(
                    height: 10.h,
                  ),
                  profileDataContainer('Пушкин'),
                  SizedBox(
                    height: 10.h,
                  ),
                  profileDataContainer(
                    'МБОУ СОШ №3 с углубленным изучением отдельных предметов г. Мегиона',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SectionsTitle(title: isTeacher ? 'Учитель' : 'Ученик'),
                  profileSectionsList(context),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }

  Widget profileDataContainer(String info) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.lightGreyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: CustomColors.darkGreyColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget profileSectionsList(BuildContext context) {
    final List<ProfileSectionTitle> profileSectionList = [
      ProfileSectionTitle(sectionText: 'Одноклассники', onPressed: () {}),
      ProfileSectionTitle(sectionText: 'Расписание', onPressed: () {}),
      ProfileSectionTitle(sectionText: 'Оценки', onPressed: () {}),
      ProfileSectionTitle(
          sectionText: 'Портфолио',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PortfolioScreen(
                  isTeacher: false,
                ),
              ),
            );
          }),
      ProfileSectionTitle(
          sectionText: 'Рейтинг',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserRatingScreen(),
              ),
            );
          }),
    ];

    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: profileSectionList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: profileSectionList[index].onPressed,
            child: Container(
              height: 40.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Container(
                      height: 40.h,
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
                            profileSectionList[index].sectionText,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFF707070),
                            ),
                          ),
                          Icon(
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
        });
  }
}

class ProfileSectionTitle {
  final String sectionText;
  final VoidCallback onPressed;

  ProfileSectionTitle({required this.sectionText, required this.onPressed});
}
