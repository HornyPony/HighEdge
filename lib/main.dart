import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:high_edge_hack/screens/add_portfolio_screen.dart';
import 'package:high_edge_hack/screens/chat_screen.dart';
import 'package:high_edge_hack/screens/event_screen.dart';
import 'package:high_edge_hack/screens/login_screen.dart';
import 'package:high_edge_hack/screens/main_screen.dart';
import 'package:high_edge_hack/screens/messages_screen.dart';
import 'package:high_edge_hack/screens/olympiade_screen.dart';
import 'package:high_edge_hack/screens/portfolio_screen.dart';
import 'package:high_edge_hack/screens/portfolio_section_screen.dart';
import 'package:high_edge_hack/screens/profile_screen.dart';
import 'package:high_edge_hack/screens/registration_screen.dart';
import 'package:high_edge_hack/screens/request_sent_screen.dart';
import 'package:high_edge_hack/screens/tabs/tabs_groups_events.dart';
import 'package:high_edge_hack/screens/tutor_screen.dart';
import 'package:high_edge_hack/screens/tutors_search_screen.dart';
import 'package:high_edge_hack/screens/user_rating_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const AppProviders(
      child: MyApp(),
    ),
  );
}

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quick Alarms',
        theme: ThemeData(
          primaryColor: const Color(0xFF21C2FD),
          fontFamily: 'Comfortaa',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFF396776),
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
