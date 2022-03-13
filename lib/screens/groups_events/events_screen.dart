import 'package:flutter/material.dart';
import 'package:high_edge_hack/widgets/groups_events/group_event_container.dart';
import 'package:high_edge_hack/widgets/groups_events/search_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  String query = '';
  List<Event> eventsList = [];

  @override
  void initState() {
    eventsList = allEvents;
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
              itemCount: eventsList.length,
              itemBuilder: (context, index) {
                final message = eventsList[index];
                return buildGroupEventContainer(message);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGroupEventContainer(Event event) {
    return GroupEventContainer(
      image: event.eventImage,
      name: event.eventName,
      info: event.eventInfo,
      isEvent: true,
    );
  }

  final allEvents = <Event>[
    Event(
      eventImage: 'assets/images/group_ava.png',
      eventName: 'Олимпиада по русскому языку среди 11 классов',
      eventInfo: 'Дата: 18 марта',
    ),
    Event(
      eventImage: 'assets/images/another_group_ava.png',
      eventName: '8 марта',
      eventInfo: 'Дата: 5 марта',
    ),
  ];

  void searchGroups(String query) {
    final discoveredEvents = allEvents.where((event) {
      final eventNameLow = event.eventName.toLowerCase();
      final searchLower = query.toLowerCase();

      return (eventNameLow.contains(searchLower));
    }).toList();

    setState(() {
      this.query = query;
      eventsList = discoveredEvents;
    });
  }
}

class Event {
  final String eventImage;
  final String eventName;
  final String eventInfo;

  Event({
    required this.eventImage,
    required this.eventName,
    required this.eventInfo,
  });
}
