import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_database/profile.dart/profile.dart';

// import 'package:mind_game/Board.dart';
// import 'package:mind_game/profile.dart/profile.dart';

import 'Board.dart';
import 'loginpage and homescreen/pallete.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage("assets/wood_image.jfif"),
      //       fit: BoxFit.cover,
      //       repeat: ImageRepeat.repeat),
      // ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text("sliding game"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Profile();
                    },
                  ));
                },
                icon: Icon(Icons.person))
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 1, left: 20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        int index = 3;
                        return Board(index);
                      },
                    ));
                  },
                  child: Text(
                    "3*3",
                    style: TextStyle(fontSize: 19),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Pallete.backgroundColor),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 140, vertical: 24),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide(color: Colors.white, width: 2),
                    )),
                    // Other style properties here
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        int index = 4;
                        return Board(index);
                      },
                    ));
                  },
                  child: Text(
                    "4*4",
                    style: TextStyle(fontSize: 19),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Pallete.backgroundColor),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 140, vertical: 24),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide(color: Colors.white, width: 2),
                    )),
                    // Other style properties here
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        int index = 5;
                        return Board(index);
                      },
                    ));
                  },
                  child: Text(
                    "5*5",
                    style: TextStyle(fontSize: 19),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Pallete.backgroundColor),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 140, vertical: 24),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide(color: Colors.white, width: 2),
                    )),
                    // Other style properties here
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        int index = 6;
                        return Board(index);
                      },
                    ));
                  },
                  child: Text(
                    "6*6",
                    style: TextStyle(fontSize: 19),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Pallete.backgroundColor),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 140, vertical: 24),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide(color: Colors.white, width: 2),
                    )),
                    // Other style properties here
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
