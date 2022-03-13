import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/screens/profile_screen.dart';
import 'package:high_edge_hack/screens/registration_screen.dart';
import 'package:high_edge_hack/widgets/auth_global_widgets/auth_screen_title.dart';
import 'package:high_edge_hack/widgets/buttons/accent_color_btn.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 42.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              logoImage(),
              logoText(context),
              SizedBox(
                height: 37.h,
              ),
              Text(
                'ВХОД',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              AuthTextFormAndLoginBtn(),
              SizedBox(
                height: 12.h,
              ),
              _ForgotUsernamePasswordBtn(),
              SizedBox(
                height: 12.h,
              ),
              BlueColorBtn(
                text: 'Регистрация',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => RegistrationScreen()));
                },
                width: 183.w,
                height: 32.h,
                textSize: 14.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoImage() {
    return Container(
      width: 93.w,
      height: 93.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/books_logo.png'),
        ),
      ),
    );
  }

  Widget logoText(BuildContext context) {
    return Text(
      'SchoolLife',
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class AuthTextFormAndLoginBtn extends StatefulWidget {
  @override
  _AuthTextFormAndLoginBtnState createState() =>
      _AuthTextFormAndLoginBtnState();
}

class _AuthTextFormAndLoginBtnState extends State<AuthTextFormAndLoginBtn> {
  final _passwordFocusNode = FocusNode();
  final _authForm = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.sp,
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: authFieldDecoration('Номер телефона'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.sp,
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: authFieldDecoration('Пароль'),
              textInputAction: TextInputAction.done,
              focusNode: _passwordFocusNode,
            ),
            SizedBox(
              height: 20.h,
            ),
            BlueColorBtn(
              text: 'Войти',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ProfileScreen(isTeacher: false)));
              },
              width: 183.w,
              height: 32.h,
              textSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration authFieldDecoration(String labelText) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
      errorStyle: TextStyle(
        fontSize: 13.sp,
        height: 0.5.h,
      ),
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 12.h),
      isDense: true,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 12.sp,
      ),
    );
  }
}

class _ForgotUsernamePasswordBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Забыли ',
        style: TextStyle(
          fontSize: 12.sp,
          color: Color(0xFF24C2FC),
        ),
        children: [
          TextSpan(
            text: 'пароль',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('clicked');
              },
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 12.sp,
              color: Color(0xFF24C2FC),
            ),
          ),
          TextSpan(
            text: '?',
            style: TextStyle(
              fontSize: 12.sp,
              color: Color(0xFF24C2FC),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
