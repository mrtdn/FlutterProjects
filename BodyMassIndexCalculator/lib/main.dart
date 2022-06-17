import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => InputPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(
          0xFF0A0E21,
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.purple,
        ),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      initialRoute: '/',
    );
  }
}
