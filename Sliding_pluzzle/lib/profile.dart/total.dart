import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_database/Board.dart';
import 'package:my_database/loginpage%20and%20homescreen/pallete.dart';

import '../database/mydatabase.dart';

class total extends StatefulWidget {
  const total({super.key});

  @override
  State<total> createState() => _totalState();
}

class _totalState extends State<total> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder<bool>(
        future: MyDatabase().copyPasteAssetFileToRoot(),
        // ignore: missing_return
        builder: (context, snapshot1) {
          if (snapshot1.hasData) {
            return FutureBuilder<Game2?>(
              future: MyDatabase().getGame2(0),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: 420,
                    height: 70,
                    margin: EdgeInsets.all(1.0),
                    color: Colors.blue,
                    child: Center(
                      child: Text(snapshot.data!.total.toString()),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }

  Widget _studentinfo(int index, Snapshot, context) {
    return PageView.builder(
      // controller: _pageController,
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 400,
          height: 70,
          margin: EdgeInsets.all(10.0),
          color: Colors.blue,
          child: Center(
            child: Text(
              'Slide $index Item $index',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await MyDatabase().getStudentinfo();
    setState(() {});
  }
}
