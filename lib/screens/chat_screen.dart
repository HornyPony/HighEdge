import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:high_edge_hack/widgets/add_photo_bottom_sheet.dart';
import 'package:high_edge_hack/widgets/bottom_nav_bars/custom_bottom_nav_bar.dart';
import 'package:high_edge_hack/widgets/constants.dart';
import 'package:high_edge_hack/widgets/widget_sizes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Чат',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: const SafeArea(
        child: ChatUserABody(),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class ChatUserABody extends StatelessWidget {
  const ChatUserABody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: ListView(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  4.w,
                  0.h,
                  0.w,
                  0.h,
                ),
                child: _ChatMessageSend(
                  onSendPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMessageSend extends StatefulWidget {
  final VoidCallback onSendPressed;

  const _ChatMessageSend({Key? key, required this.onSendPressed})
      : super(key: key);

  @override
  State<_ChatMessageSend> createState() => _ChatMessageSendState();
}

class _ChatMessageSendState extends State<_ChatMessageSend> {
  late File _imageFile;
  List<File> _addedImages = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectedImagesRow(),
          SizedBox(
            height: 8.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              addAttachmentsBtn(context),
              SizedBox(
                width: 6.w,
              ),
              Expanded(child: messageInput()),
              SizedBox(
                width: 4.w,
              ),
              sendBtn(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget addAttachmentsBtn(BuildContext context) {
    return InkWell(
      onTap: () async {
        _imageFile = await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          )),
          builder: AddPhotoBottomSheet.addPhotoBottomSheet,
        );
        _addedImages.add(_imageFile);
        setState(() {});
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget messageInput() {
    return Container(
      child: TextField(
        minLines: 1,
        maxLines: 3,
        textAlignVertical: TextAlignVertical.center,
        decoration:
            Styling.lessRoundedGreyChatInputDec('Напишите сообщение...'),
        style: TextStyle(
          fontSize: 15.sp,
        ),
      ),
    );
  }

  Widget sendBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onSendPressed,
      style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          padding: EdgeInsets.zero,
          minimumSize: Size(
            70.w,
            32.h,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0),
      child: Text(
        'Отправить',
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget selectedImagesRow() {
    return _addedImages != []
        ? _AddedPicturesRow(
            addedPicturesFiles: _addedImages,
            onDeletePressed: (deletedImage) {
              _addedImages.remove(deletedImage);
              setState(() {});
            },
          )
        : const SizedBox();
  }
}

class _AddedPicturesRow extends StatelessWidget {
  final List<File> addedPicturesFiles;
  final Function onDeletePressed;

  const _AddedPicturesRow(
      {Key? key,
      required this.addedPicturesFiles,
      required this.onDeletePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: addedPicturesFiles.map((pictureFile) {
          return SizedBox(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  width: SizesAddPictureBtn.addPictureBtnWidthHeight,
                  height: SizesAddPictureBtn.addPictureBtnWidthHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(pictureFile),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 0,
                  child: IconButton(
                    onPressed: () {
                      onDeletePressed(pictureFile);
                    },
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 20, minHeight: 20),
                    icon: const Icon(
                      Icons.clear_rounded,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
