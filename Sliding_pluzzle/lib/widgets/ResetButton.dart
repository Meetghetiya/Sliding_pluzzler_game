import 'package:flutter/material.dart';

import '../loginpage and homescreen/pallete.dart';

class ResetButton extends StatelessWidget {
  final void Function()? reset;
  String text;

  ResetButton(this.reset, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: reset,
        child: Text(
          "Reset",
          style: TextStyle(color: Pallete.borderColor),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ))));
  }
}
