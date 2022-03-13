import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/widgets/app_bar.dart';
import 'package:high_edge_hack/widgets/bottom_nav_bars/custom_bottom_nav_bar.dart';
import 'package:high_edge_hack/widgets/groups_events/search_widget.dart';
import 'package:high_edge_hack/widgets/message_card.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<Message> messages = [];
  String query = '';

  @override
  void initState() {
    super.initState();

    messages = allMessages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Беседы',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSearch(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return buildMessage(message);
              },
            ),
            SizedBox(
              height: 35.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() {
    return SearchWidget(
      text: query,
      hintText: 'Поиск',
      onChanged: searchMessage,
    );
  }

  void searchMessage(String query) {
    final messages = allMessages.where((message) {
      final roleLower = message.role.toLowerCase();
      final senderNameLower = message.messageSenderName.toLowerCase();
      final searchLower = query.toLowerCase();

      return (roleLower.contains(searchLower) ||
          senderNameLower.contains(searchLower));
    }).toList();

    setState(() {
      this.query = query;
      this.messages = messages;
    });
  }

  Widget buildMessage(Message message) {
    return MessageCard(
      messageSenderName: message.messageSenderName,
      messageSenderImage: message.messageSenderImage,
      message: message.message,
      role: message.role,
    );
  }

  final allMessages = <Message>[
    Message(
        messageSenderName: 'Вася Пушкин',
        message: 'Спасибо, что дал списать',
        messageSenderImage: 'assets/images/profile_photo.png',
        role: 'Ученик'),
    Message(
        messageSenderName: 'Надежда Ивановна',
        message: 'С родителями в школу',
        messageSenderImage: 'assets/images/profile_photo.png',
        role: 'Учитель'),
  ];
}

class Message {
  final String messageSenderImage;
  final String messageSenderName;
  final String message;
  final String role;

  Message({
    required this.messageSenderImage,
    required this.messageSenderName,
    required this.message,
    required this.role,
  });
}
