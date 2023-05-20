import 'package:flutter/material.dart';

import '../loginpage and homescreen/pallete.dart';

class GridButton extends StatelessWidget {
  final void Function()? click; // Good
  // Function click;
  String text;

  GridButton(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
          onPressed: click,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Pallete.borderColor),
          ),
          style: ButtonStyle(
              // minimumSize:
              //     MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )))),
    );
  }
}
