import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'configurations/routes.dart';
import 'services/loadingService.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopBox Task',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFD6E2EA),
        accentColor: Color.fromRGBO(160, 92, 147, 1.0),
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(160, 92, 147, 1.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: const Color(0xff4E4E4E),
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: const Color(0xff4E4E4E),
          ),
          bodyText1: TextStyle(
            color: const Color(0xff4E4E4E),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: TextStyle(fontSize: 16),
          button: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: '/login',
      builder: EasyLoading.init(),
    );
  }
}
