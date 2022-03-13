import 'package:flutter/material.dart';
import 'package:high_edge_hack/widgets/add_photo_bottom_sheet.dart';
import 'package:high_edge_hack/widgets/app_bar.dart';
import 'package:high_edge_hack/widgets/buttons/primary_color_btn.dart';
import 'package:high_edge_hack/widgets/constants.dart';
import 'package:high_edge_hack/widgets/global_widgets/custom_input_text_style.dart';
import 'package:high_edge_hack/widgets/global_widgets/sections_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbars.backIconAppBar(context, 'Добавить достижение'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 23.h,
              ),
              SectionsTitle(
                title: 'Общая информация',
              ),
              SizedBox(
                height: 10.h,
              ),
              Form(
                //key: _passwordForm,
                child: TextFormField(
                  style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
                  keyboardType: TextInputType.name,
                  decoration:
                      Styling.lessRoundedGreyChatInputDec('Год проведения'),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Form(
                //key: _passwordForm,
                child: TextFormField(
                  style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
                  keyboardType: TextInputType.name,
                  decoration: Styling.lessRoundedGreyChatInputDec(
                      'Место проведения (город) '),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Form(
                //key: _passwordForm,
                child: TextFormField(
                  style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
                  keyboardType: TextInputType.name,
                  decoration: Styling.lessRoundedGreyChatInputDec(
                      'Уровень мероприятия'),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Form(
                //key: _passwordForm,
                child: TextFormField(
                  style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
                  keyboardType: TextInputType.name,
                  decoration:
                      Styling.lessRoundedGreyChatInputDec('Степень диплома'),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Form(
                //key: _passwordForm,
                child: TextFormField(
                  style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
                  keyboardType: TextInputType.name,
                  decoration: Styling.lessRoundedGreyChatInputDec(
                      'Название мероприятия'),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              SectionsTitle(
                title: 'Подтверждающие документы',
              ),
              SizedBox(
                height: 18.h,
              ),
              Center(
                child: PrimaryColorButton(
                  text: 'Загрузить файл',
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      )),
                      builder: AddPhotoBottomSheet.addPhotoBottomSheet,
                    );
                  },
                  width: 180.w,
                  height: 20.h,
                  textSize: 10.sp,
                ),
              ),
              SizedBox(
                height: 84.h,
              ),
              Center(
                child: PrimaryColorButton(
                  text: 'Сохранить',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  width: 180.w,
                  height: 32.h,
                  textSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
