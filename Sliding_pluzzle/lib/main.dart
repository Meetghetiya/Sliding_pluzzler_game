import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Board.dart';
import 'homescreen.dart';
import 'loginpage and homescreen/pallete.dart';
import 'loginpage and homescreen/signin_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(SlidingPuzzle());
}

class SlidingPuzzle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      title: "Sliding Puzzle",
      debugShowCheckedModeBanner: false,
      // home: Board(),
      // home: SigninScreen(),
      home: homescreen(),
    );
  }
}
