import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_database/loginpage%20and%20homescreen/pallete.dart';

import '../database/mydatabase.dart';

class tests extends StatefulWidget {
  const tests({super.key});

  @override
  State<tests> createState() => _testsState();
}

class _testsState extends State<tests> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder<bool>(
        future: MyDatabase().copyPasteAssetFileToRoot(),
        // ignore: missing_return
        builder: (context, snapshot1) {
          if (snapshot1.hasData) {
            return FutureBuilder<List<Map<String, Object?>>>(
              future: MyDatabase().getStudentinfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      color: Pallete.backgroundColor,
                      width: 400,
                      height: 300,
                      child: PageView.builder(
                        // controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 350,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    '${index + 3}*${index + 3}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          "win game",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          snapshot.data![index]['wingame']
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      )
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          "Best Time",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          snapshot.data![index]['besttime']
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      )
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          "Best Moves",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          snapshot.data![index]['bestmoves']
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      )
                                    ])
                              ],
                            ),
                          );
                          // return Container(
                          //   width: 420, // Width of each item
                          //   height: 70, // Height of each item
                          //   margin: EdgeInsets.all(1.0),
                          //   color: Colors.blue,
                          //   child: Center(
                          //     child: Text(
                          //         snapshot.data![index]['id'].toString()),
                          //   ),
                          // );
                        },
                      ));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CircularProgressIndicator(); // Display loading spinner
                }
              },
            );

            // return FutureBuilder<List<Map<String, Object?>>>(
            //   future: MyDatabase().getStudentinfo(),
            //   // ignore: missing_return
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Expanded(
            //         child: ListView.builder(
            //           scrollDirection: Axis.vertical,
            //           itemCount: snapshot.data!.length,
            //           itemBuilder: (context, index) {
            //             return _studentinfo(index, snapshot, context);
            //           },
            //         ),
            //       );
            //     } else {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //   },
            // );
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
