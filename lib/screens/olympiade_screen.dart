import 'package:flutter/material.dart';
import 'package:high_edge_hack/widgets/app_bar.dart';
import 'package:high_edge_hack/widgets/constants.dart';
import 'package:high_edge_hack/widgets/global_widgets/custom_input_text_style.dart';
import 'package:high_edge_hack/widgets/global_widgets/sections_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OlympiadeScreen extends StatefulWidget {
  @override
  State<OlympiadeScreen> createState() => _OlympiadeScreenState();
}

class _OlympiadeScreenState extends State<OlympiadeScreen> {
  int _selectedRadioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbars.backIconAppBar(context, 'Олимпиада'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 28.h,
              ),
              SectionsTitle(title: 'Вопрос 1:'),
              SizedBox(
                height: 10.h,
              ),
              questionContainer(
                  'В современном русском языке есть особые чередования звуков,которые обозначают термином беглость гласных. Чередование каких звуковпри этом наблюдается?\nВыпишите из приведенного ниже высказывания все слова, в которых\n(при образовании у них тех или иных форм) можно обнаружить беглость гласных\nДень за днем идут года, но во всех уголках нашей необъятной Родиныпомнят о подвиге комсомольцев-молодогвардейцев.\nВ каких морфемах Вы обнаружили беглость гласных? Укажите эти морфемы.\nЧто Вы знаете о возникновении беглости гласных? (Какой фонетически процесс древнерусского языка привел к беглости гласных? Как появились беглые гласные?) '),
              SizedBox(
                height: 10.h,
              ),
              SectionsTitle(title: 'Ответ:'),
              SizedBox(
                height: 10.h,
              ),
              answerForm(context),
              SizedBox(
                height: 10.h,
              ),
              SectionsTitle(title: 'Вопрос 2:'),
              SizedBox(
                height: 10.h,
              ),
              questionContainer(
                  'Воли царевой, слова его все ждали в умилении и надежде (Ф. М. Достоевский)'),
              SizedBox(
                height: 10.h,
              ),
              SectionsTitle(title: 'Ответ:'),
              SizedBox(
                height: 10.h,
              ),
              radioButtonsColumn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget radioButtonsColumn() {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Color(0xFFAFAFAF),
      ),
      child: Column(
        children: [
          radioButton(
            radioBtnValue: 1,
            radioText: 'Да',
          ),
          radioButton(
            radioBtnValue: 2,
            radioText: 'Нет',
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
          activeColor: Color(0xFFAFAFAF),
          groupValue: _selectedRadioValue,
          onChanged: (_) {
            setState(() {
              _selectedRadioValue = radioBtnValue;
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
            color: Color(0xFFAFAFAF),
          ),
        ),
      ],
    );
  }

  Widget questionContainer(String question) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.lightGreyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          18.w,
          18.h,
          10.w,
          16.h,
        ),
        child: Text(question),
      ),
    );
  }

  Widget answerForm(BuildContext context) {
    return Form(
      //key: _passwordForm,
      child: TextFormField(
        style: CustomInputTextStyle.inputDarkBlueTextStyle(context),
        keyboardType: TextInputType.name,
        decoration: Styling.lessRoundedGreyChatInputDec('Напишите Ваш ответ'),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
