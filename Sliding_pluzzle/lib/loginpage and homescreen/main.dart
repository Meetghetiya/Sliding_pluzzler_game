import 'package:flutter/material.dart';
import 'package:my_database/loginpage%20and%20homescreen/pallete.dart';
import 'package:my_database/loginpage%20and%20homescreen/signin_screen.dart';

// import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: const SigninScreen(),
    );
  }
}
