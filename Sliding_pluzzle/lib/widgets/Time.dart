import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  int secondsPassed;

  Time(this.secondsPassed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        "Time:${formatDuration(secondsPassed)}",
        // "Time: ${secondsPassed}",
        style: TextStyle(
          fontSize: 18,
          decoration: TextDecoration.none,
          color: Colors.white,
        ),
      ),
    );
  }

  String formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    seconds %= 3600;
    int minutes = seconds ~/ 60;
    seconds %= 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
