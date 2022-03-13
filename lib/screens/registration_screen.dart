import 'package:flutter/material.dart';
import 'package:high_edge_hack/screens/request_sent_screen.dart';
import 'package:high_edge_hack/utils.dart';
import 'package:high_edge_hack/widgets/auth_global_widgets/auth_screen_title.dart';
import 'package:high_edge_hack/widgets/constants.dart';
import 'package:high_edge_hack/widgets/global_widgets/custom_input_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String regionValue = 'Республика Татарстан (Татарстан)';
  final List regions = ItemsDropdown.regionsItems;
  final List tatarstanCities = ItemsDropdown.tatarstanCities;
  final List kazanSchools = ItemsDropdown.kazanSchools;
  final List classrooomTeacher = ItemsDropdown.classroomTeachers;
  int _selectedRadioValue = 1;
  bool _isShowClassroomTeacher = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              const AuthScreenTitle(
                title: 'РЕГИСТРАЦИЯ',
              ),
              SizedBox(
                height: 30.h,
              ),
              secondNameForm(),
              SizedBox(
                height: 11.h,
              ),
              firstNameForm(),
              SizedBox(
                height: 11.h,
              ),
              phoneNumberForm(),
              SizedBox(
                height: 11.h,
              ),
              regionSearchField(),
              SizedBox(
                height: 11.h,
              ),
              citySearchField(),
              SizedBox(
                height: 11.h,
              ),
              schoolsSearchFields(),
              SizedBox(
                height: 10.h,
              ),
              radioButtonsColumn(),
              SizedBox(
                height: 10.h,
              ),
              _isShowClassroomTeacher
                  ? classroomTeacherSearchFields()
                  : SizedBox(),
              SizedBox(
                height: 20.h,
              ),
              nextBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget secondNameForm() {
    return Form(
      //key: _passwordForm,
      child: TextFormField(
        style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
        keyboardType: TextInputType.name,
        decoration: Styling.roundedWhiteInputDec('Фамилия'),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget firstNameForm() {
    return Form(
      //key: _passwordForm,
      child: TextFormField(
        style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
        keyboardType: TextInputType.name,
        decoration: Styling.roundedWhiteInputDec('Имя'),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget phoneNumberForm() {
    return Form(
      //key: _passwordForm,
      child: TextFormField(
        style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
        keyboardType: TextInputType.number,
        decoration: Styling.roundedWhiteInputDec('Номер телефона'),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget regionNameForm() {
    return Form(
      //key: _passwordForm,
      child: TextFormField(
        style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
        keyboardType: TextInputType.name,
        decoration: Styling.roundedWhiteInputDec('Регион'),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget cityNameForm() {
    return Form(
      //key: _passwordForm,
      child: TextFormField(
        style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
        keyboardType: TextInputType.name,
        decoration: Styling.roundedWhiteInputDec('Регион'),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget schoolNameForm() {
    return Form(
      //key: _passwordForm,
      child: TextFormField(
        style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
        keyboardType: TextInputType.name,
        decoration: Styling.roundedWhiteInputDec('Регион'),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget radioButtonsColumn() {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.white,
      ),
      child: Column(
        children: [
          radioButton(
            radioBtnValue: 1,
            radioText: 'Ученик',
          ),
          radioButton(
            radioBtnValue: 2,
            radioText: 'Учитель',
          ),
          radioButton(
            radioBtnValue: 3,
            radioText: 'Родитель',
          ),
        ],
      ),
    );
  }

  Widget radioButton({required int radioBtnValue, required String radioText}) {
    return Row(
      children: [
        Radio(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: radioBtnValue,
          splashRadius: 0,
          visualDensity: VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          activeColor: Colors.white,
          groupValue: _selectedRadioValue,
          onChanged: (_) {
            setState(() {
              _selectedRadioValue = radioBtnValue;
              if (_selectedRadioValue == 2) {
                _isShowClassroomTeacher = false;
              } else {
                _isShowClassroomTeacher = true;
              }
            });
          },
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          radioText,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget regionSearchField() {
    return SearchField<String>(
      searchInputDecoration: Styling.roundedWhiteInputDec('Регион'),
      suggestions: regions
          .map(
            (e) => SearchFieldListItem<String>(
              e,
              item: e,
            ),
          )
          .toList(),
    );
  }

  Widget citySearchField() {
    return SearchField<String>(
      searchInputDecoration: Styling.roundedWhiteInputDec('Город'),
      suggestions: tatarstanCities
          .map(
            (e) => SearchFieldListItem<String>(
              e,
              item: e,
            ),
          )
          .toList(),
    );
  }

  Widget schoolsSearchFields() {
    return SearchField<String>(
      searchInputDecoration: Styling.roundedWhiteInputDec('Школа'),
      suggestions: kazanSchools
          .map(
            (e) => SearchFieldListItem<String>(
              e,
              item: e,
            ),
          )
          .toList(),
    );
  }

  Widget classroomTeacherSearchFields() {
    return SearchField<String>(
      searchInputDecoration:
          Styling.roundedWhiteInputDec('ФИО классного руководителя'),
      suggestions: classrooomTeacher
          .map(
            (e) => SearchFieldListItem<String>(
              e,
              item: e,
            ),
          )
          .toList(),
    );
  }

  Widget nextBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => RequestSentScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          180.w,
          32.h,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
        primary: Colors.white,
      ),
      child: Text(
        'Далее',
        style: TextStyle(
          color: Color(0xFF6F6F6F),
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
