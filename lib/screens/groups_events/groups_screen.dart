import 'package:flutter/material.dart';
import 'package:high_edge_hack/widgets/groups_events/group_event_container.dart';
import 'package:high_edge_hack/widgets/groups_events/search_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupsScreen extends StatefulWidget {
  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  String query = '';
  List<Group> groupsList = [];

  @override
  void initState() {
    groupsList = allGroups;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SearchWidget(text: query, hintText: 'Поиск', onChanged: searchGroups),
          Expanded(
            child: ListView.builder(
              itemCount: groupsList.length,
              itemBuilder: (context, index) {
                final message = groupsList[index];
                return buildGroupEventContainer(message);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGroupEventContainer(Group group) {
    return GroupEventContainer(
      image: group.groupImage,
      name: group.groupName,
      info: group.groupInfo,
      isEvent: false,
    );
  }

  final allGroups = <Group>[
    Group(
      groupImage: 'assets/images/group_ava.png',
      groupName: 'Родительский комитет 5б',
      groupInfo: '16 участников',
    ),
    Group(
      groupImage: 'assets/images/another_group_ava.png',
      groupName: 'Школа №3',
      groupInfo: '329 участников',
    ),
  ];

  void searchGroups(String query) {
    final discoveredGroups = allGroups.where((group) {
      final groupName = group.groupName.toLowerCase();
      final searchLower = query.toLowerCase();

      return (groupName.contains(searchLower));
    }).toList();

    setState(() {
      this.query = query;
      groupsList = discoveredGroups;
    });
  }
}

class Group {
  final String groupImage;
  final String groupName;
  final String groupInfo;

  Group({
    required this.groupImage,
    required this.groupName,
    required this.groupInfo,
  });
}
