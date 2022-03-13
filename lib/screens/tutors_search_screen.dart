import 'package:flutter/material.dart';
import 'package:high_edge_hack/widgets/app_bar.dart';
import 'package:high_edge_hack/widgets/bottom_nav_bars/custom_bottom_nav_bar.dart';
import 'package:high_edge_hack/widgets/groups_events/group_event_container.dart';
import 'package:high_edge_hack/widgets/groups_events/search_widget.dart';
import 'package:high_edge_hack/widgets/tutor_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TutorsSearchScreen extends StatefulWidget {
  @override
  State<TutorsSearchScreen> createState() => _TutorsSearchScreenState();
}

class _TutorsSearchScreenState extends State<TutorsSearchScreen> {
  String query = '';
  List<Tutor> tutorsList = [];

  @override
  void initState() {
    tutorsList = allTutors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Репетиторы',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SearchWidget(
                text: query, hintText: 'Поиск', onChanged: searchGroups),
            Expanded(
              child: ListView.builder(
                itemCount: tutorsList.length,
                itemBuilder: (context, index) {
                  final message = tutorsList[index];
                  return buildTutors(message);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTutors(Tutor tutor) {
    return TutorContainer(
      image: tutor.tutorImage,
      name: tutor.tutorName,
      rating: tutor.tutorRating,
      reviews: tutor.tutorReviews,
    );
  }

  final allTutors = <Tutor>[
    Tutor(
        tutorImage: 'assets/images/group_ava.png',
        tutorName: 'Хатипова Наталья',
        tutorRating: 9,
        tutorReviews: 14),
    Tutor(
      tutorImage: 'assets/images/another_group_ava.png',
      tutorName: 'Зиннур Гизатуллин',
      tutorRating: 8.5,
      tutorReviews: 13,
    ),
  ];

  void searchGroups(String query) {
    final discoveredTutors = allTutors.where((tutor) {
      final tutorNameLow = tutor.tutorName.toLowerCase();
      final searchLower = query.toLowerCase();

      return (tutorNameLow.contains(searchLower));
    }).toList();

    setState(() {
      this.query = query;
      tutorsList = discoveredTutors;
    });
  }
}

class Tutor {
  final String tutorImage;
  final String tutorName;
  final double tutorRating;
  final int tutorReviews;

  Tutor({
    required this.tutorImage,
    required this.tutorName,
    required this.tutorRating,
    required this.tutorReviews,
  });
}
