import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_database/profile.dart/profile.dart';
import 'database/mydatabase.dart';
import 'homescreen.dart';
import 'loginpage and homescreen/pallete.dart';
import 'widgets/Menu.dart';
import 'widgets/MyTitle.dart';
import 'widgets/Grid.dart';
import 'package:lottie/lottie.dart';

class Board extends StatefulWidget {
  late int index;

  Board(this.index);
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<int> numbers = [];

  int move = 0;

  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = false;
  Timer? timer;
  int secondsPassed3 = 0;
  int secondsPassed4 = 0;
  int secondsPassed5 = 0;
  int secondsPassed6 = 0;
  int move3 = 0;
  int move4 = 0;
  int move5 = 0;
  int move6 = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < (widget.index * widget.index); i++) {
      numbers.add(i);
    }
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        startTime();
      });
    }

    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage("assets/wood_tylish.jfif"),
      //       fit: BoxFit.cover,
      //       repeat: ImageRepeat.repeat),
      // ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Sliding puzzle"),
          actions: [
            IconButton(
                // onPressed: () async {
                //   final id = 0;
                //   Map<String, dynamic>? data = await MyDatabase().getById(id);
                //   if (data != null) {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) {
                //         return Profile();
                //       },
                //     ));
                //   }
                // },
                onPressed: () {
                  if (widget.index == 3) {
                    secondsPassed3 = secondsPassed;
                    move3 = move;
                  } else if (widget.index == 4) {
                    secondsPassed4 = secondsPassed;
                    move4 = move;
                  } else if (widget.index == 5) {
                    secondsPassed5 = secondsPassed;
                    move4 = move;
                  } else if (widget.index == 6) {
                    secondsPassed6 = secondsPassed;
                    move6 = move;
                  }

                  // checkWin();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                icon: Icon(Icons.person)),
          ],
          backgroundColor: Pallete.backgroundColor,
        ),
        body: Container(
          height: size.height,
          // color: Pallete.backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MyTitle(size),
                Menu(reset, move, secondsPassed, size),
                Grid(numbers, size, clickGrid, widget.index),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }

    if (widget.index == 5) {
      if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 5 != 0 ||
          index + 1 < 25 && numbers[index + 1] == 0 && (index + 1) % 5 != 0 ||
          (index - 5 >= 0 && numbers[index - 5] == 0) ||
          (index + 5 < 25 && numbers[index + 5] == 0)) {
        setState(() {
          move++;
          numbers[numbers.indexOf(0)] = numbers[index];
          numbers[index] = 0;
        });
      }
    }

    if (widget.index == 6) {
      if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 6 != 0 ||
          index + 1 < 36 && numbers[index + 1] == 0 && (index + 1) % 6 != 0 ||
          (index - 6 >= 0 && numbers[index - 6] == 0) ||
          (index + 6 < 36 && numbers[index + 6] == 0)) {
        setState(() {
          move++;
          numbers[numbers.indexOf(0)] = numbers[index];
          numbers[index] = 0;
        });
      }
    }

    if (widget.index == 4) {
      if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
          index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
          (index - 4 >= 0 && numbers[index - 4] == 0) ||
          (index + 4 < 16 && numbers[index + 4] == 0)) {
        setState(() {
          move++;
          numbers[numbers.indexOf(0)] = numbers[index];
          numbers[index] = 0;
        });
      }
    }

    if (widget.index == 3) {
      if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 3 != 0 ||
          index + 1 < 9 && numbers[index + 1] == 0 && (index + 1) % 3 != 0 ||
          (index - 3 >= 0 && numbers[index - 3] == 0) ||
          (index + 3 < 9 && numbers[index + 3] == 0)) {
        setState(() {
          move++;
          numbers[numbers.indexOf(0)] = numbers[index];
          numbers[index] = 0;
        });
      }
    }
    checkWin();
  }

  void startTime() {
    if (mounted) {
      if (isActive) {
        setState(() {
          secondsPassed = secondsPassed + 1;
        });
      }
    }
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  int totalwingame = 0;
  int win3game = 0;
  int win4 = 0;
  int win5 = 0;
  int win6 = 0;

  void checkWin() async {
    if (isSorted(numbers)) {
      if (widget.index == 3) {
        Game? game = await MyDatabase().getGame(0);
        if (game != null) {
          game.wingame = game.wingame + 1;
          if (secondsPassed < game.besttime || game.besttime == 0) {
            game.besttime = secondsPassed;
          }
          if (move < game.bestmoves || game.bestmoves == 0) {
            game.bestmoves = move;
          }
          await MyDatabase().updateGame(game);
        }
      }

      if (widget.index == 4) {
        Game? game = await MyDatabase().getGame(1);
        if (game != null) {
          game.wingame = game.wingame + 1;
          if (secondsPassed < game.besttime || game.besttime == 0) {
            game.besttime = secondsPassed;
          }
          if (move < game.bestmoves || game.bestmoves == 0) {
            game.bestmoves = move;
          }
          await MyDatabase().updateGame(game);
        }
      }

      if (widget.index == 5) {
        Game? game = await MyDatabase().getGame(2);
        if (game != null) {
          game.wingame = game.wingame + 1;
          if (secondsPassed < game.besttime || game.besttime == 0) {
            game.besttime = secondsPassed;
          }
          if (move < game.bestmoves || game.bestmoves == 0) {
            game.bestmoves = move;
          }
          await MyDatabase().updateGame(game);
        }
      }

      if (widget.index == 6) {
        Game? game = await MyDatabase().getGame(3);
        if (game != null) {
          game.wingame = game.wingame + 1;
          if (secondsPassed < game.besttime || game.besttime == 0) {
            game.besttime = secondsPassed;
          }
          if (move < game.bestmoves || game.bestmoves == 0) {
            game.bestmoves = move;
          }
          await MyDatabase().updateGame(game);
        }
      }

      Game2? game2 = await MyDatabase().getGame2(0);
      if (game2 != null) {
        game2.total = game2.total + 1;

        await MyDatabase().updateGame2(game2);
      }
      isActive = false;

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Stack(children: [
              Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                  // color: Colors.white,
                  height: 290,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You Win!!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        // Container(
                        //   // color: Colors.white, // Set the background color to blue
                        //   child: ColorFiltered(
                        //     colorFilter:
                        //         ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        //     child: Image.asset("assets/3.jpg"),
                        //   ),
                        // ),
                        Container(
                          width: 300,
                          height: 150,
                          color: Colors.white,
                          // color: Color.fromARGB(255, 243, 243, 243),
                          // child: Image.asset("assets/4.png"),
                          child: Lottie.asset('assets/annimation/trophy.json'),
                        ),
                        Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return homescreen();
                                      },
                                    ));
                                  },
                                  child: Text(
                                    "New game",
                                    style: TextStyle(
                                      color: Pallete.backgroundColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    // backgroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    reset();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "continue",
                                    style: TextStyle(
                                      color: Pallete.backgroundColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Lottie.asset("assets/annimation/confetti.json"),
              ),
              Container(
                child: Lottie.asset("assets/annimation/looping.json"),
              ),
            ]);

            // );
          });
    }
  }
}

class Game2 {
  int id; // ID field
  int total; // Total win count

  Game2({required this.id, required this.total});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
    };
  }

  factory Game2.fromMap(Map<String, dynamic> map) {
    return Game2(
      id: map['id'],
      total: map['total'],
    );
  }
}

class Game {
  int id;
  int wingame;
  int besttime;
  int bestmoves;

  Game(
      {required this.id,
      required this.wingame,
      required this.besttime,
      required this.bestmoves});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'wingame': wingame,
      'besttime': besttime,
      'bestmoves': bestmoves,
    };
  }

  static Game fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'],
      wingame: map['wingame'],
      besttime: map['besttime'],
      bestmoves: map['bestmoves'],
    );
  }
}
