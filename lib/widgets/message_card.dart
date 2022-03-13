import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/screens/chat_screen.dart';
import 'package:high_edge_hack/widgets/constants.dart';

class MessageCard extends StatelessWidget {
  final String messageSenderImage;
  final String messageSenderName;
  final String message;
  final String role;

  MessageCard({
    required this.messageSenderName,
    required this.message,
    required this.messageSenderImage,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 9.w,
          right: 14.w,
          top: 9.h,
        ),
        height: 105.h,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MessageSenderPhoto(
              messageSenderImage: messageSenderImage,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 7.h,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFD3D2D2),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _MessageSenderName(
                                  senderName: messageSenderName,
                                ),
                                _MessageTimeRow(),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    message,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  role,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Color(0xFF525252),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageSenderPhoto extends StatelessWidget {
  final String messageSenderImage;

  _MessageSenderPhoto({
    required this.messageSenderImage,
  });

  @override
  Widget build(BuildContext context) {
    return _MessageSenderPhotoWithoutCar(
      messageSenderImage: messageSenderImage,
    );
  }
}

class _MessageSenderPhotoWithoutCar extends StatelessWidget {
  final String messageSenderImage;

  _MessageSenderPhotoWithoutCar({
    required this.messageSenderImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 65.w,
      margin: EdgeInsets.only(
        left: 15.w,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: 35.r,
              backgroundImage: messageSenderImage == null
                  ? AssetImage(
                      'assets/images/no_photo.png',
                    )
                  : AssetImage(messageSenderImage),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageSenderPhotoWithCar extends StatelessWidget {
  final bool isVerified;
  final String messageSenderImage;
  final String carImage;

  _MessageSenderPhotoWithCar({
    required this.isVerified,
    required this.messageSenderImage,
    required this.carImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 82.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 63.w,
              height: 63.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: AssetImage(carImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: CircleAvatar(
              radius: 19.r,
              backgroundImage: AssetImage(messageSenderImage),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageSenderName extends StatelessWidget {
  final String senderName;

  _MessageSenderName({required this.senderName});

  @override
  Widget build(BuildContext context) {
    return Text(
      senderName,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class _MessageTimeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.errorFieldColor,
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          '18:07',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}
