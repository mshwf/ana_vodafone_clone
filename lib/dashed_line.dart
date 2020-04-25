import 'package:flutter/material.dart';

/*
How to use in flutter
DashedLine(
                    color: Colors.white.withOpacity(0.3),
                  )
*/

class DashedLine extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;
  const DashedLine(
      {this.height = 1, this.color = Colors.black, this.dashWidth = 5.0});

  DashedLine.defaultDash()
      : color = Colors.black.withOpacity(.3),
        dashWidth = 3,
        height = 1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();
      final dashHeight = height;
      final dashCount = (boxWidth / (2 * dashWidth)).floor();
      return Flex(
        children: List.generate(dashCount, (index) {
          return SizedBox(
            width: dashWidth,
            height: dashHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          );
        }),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        direction: Axis.horizontal,
      );
    });
  }
}
