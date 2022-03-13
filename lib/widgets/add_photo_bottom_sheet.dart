import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/widgets/bottom_sheets/bottom_sheets_global_widgets.dart';
import 'package:high_edge_hack/widgets/buttons/primary_color_btn.dart';
import 'package:high_edge_hack/widgets/buttons/white_color_btn.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoBottomSheet {
  static Widget addPhotoBottomSheet(context) {
    return Container(
      height: 269.h,
      padding: EdgeInsets.only(
        left: 19.w,
        right: 19.w,
        top: 16.h,
      ),
      child: _AddPhotoBottomSheetBody(),
    );
  }
}

class _AddPhotoBottomSheetBody extends StatefulWidget {
  @override
  State<_AddPhotoBottomSheetBody> createState() =>
      _AddPhotoBottomSheetBodyState();
}

class _AddPhotoBottomSheetBodyState extends State<_AddPhotoBottomSheetBody> {
  late File _imageFile;
  bool _isImageSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: BottomSheetGlobalWidgets.bottomSheetMainTitle(
            context,
            'Выберите фотографию',
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        PrimaryColorButton(
          text: 'Сделать фотографию',
          onPressed: () async {
            /* final UserProfilePhotoProvider provider =
                Provider.of<UserProfilePhotoProvider>(context, listen: false);
            await provider.pickCamera();
            Navigator.of(context).pop(_imageFile);*/
            final image =
                await ImagePicker().pickImage(source: ImageSource.camera);

            if (image == null) {
              return;
            }

            _imageFile = File(image.path);

            Navigator.of(context).pop(_imageFile);
          },
          width: double.infinity,
          height: 53.h,
          textSize: 19.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        PrimaryColorButton(
          text: 'Выбрать из галереи',
          onPressed: () async {
            /*final UserProfilePhotoProvider provider =
                Provider.of<UserProfilePhotoProvider>(context, listen: false);
            await provider.pickGallery();
            Navigator.of(context).pop(_imageFile);*/
            final image =
                await ImagePicker().pickImage(source: ImageSource.gallery);

            if (image == null) {
              return;
            }

            _imageFile = File(image.path);

            Navigator.of(context).pop(_imageFile);
          },
          width: double.infinity,
          height: 53.h,
          textSize: 19.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        WhiteColorButtonPrimaryText(
          text: 'Отмена',
          onPressed: () {
            Navigator.of(context).pop();
          },
          width: double.infinity,
          height: 53.h,
          textSize: 14.sp,
        ),
      ],
    );
  }
}
