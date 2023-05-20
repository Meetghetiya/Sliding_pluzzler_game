import 'package:flutter/material.dart';
import 'GridButton.dart';

class Grid extends StatelessWidget {
  var numbers = [];
  var size;
  Function clickGrid;
  var index;

  Grid(this.numbers, this.size, this.clickGrid, this.index);

  @override
  Widget build(BuildContext context) {
    var height = size.height * 0.66;

    return Container(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: index,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return numbers[index] != 0
                ? SizedBox(
                    height: 100,
                    child: GridButton("${numbers[index]}", () {
                      clickGrid(index);
                    }),
                  )
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
