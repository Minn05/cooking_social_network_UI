import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class DotLine extends StatelessWidget {
  const DotLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width - 20,
      child: const DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 5.0,
        dashColor: Colors.grey,
        dashRadius: 0.0,
        dashGapLength: 5.0,
        dashGapColor: Colors.transparent,
      ),
    );
  }
}
