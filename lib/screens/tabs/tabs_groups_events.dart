import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/screens/groups_events/events_screen.dart';
import 'package:high_edge_hack/screens/groups_events/groups_screen.dart';
import 'package:high_edge_hack/widgets/bottom_nav_bars/custom_bottom_nav_bar.dart';

class TabsGroupsEvents extends StatefulWidget {
  final int initialIndex;

  TabsGroupsEvents({this.initialIndex = 0});

  @override
  _TabsGroupsEventsState createState() => _TabsGroupsEventsState();
}

class _TabsGroupsEventsState extends State<TabsGroupsEvents> {
  bool isShipmentsAdded = false;
  bool isTripsAdded = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialIndex,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          /* title: AppbarTitleBold(
            title: 'CrowdSender',
          ),*/
          centerTitle: true,
          bottom: TabBar(
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                text: 'Сообщества',
              ),
              Tab(
                text: 'Мероприятия',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              GroupsScreen(),
              EventsScreen(),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
