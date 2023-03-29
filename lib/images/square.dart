import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  const SquareImage({super.key, required this.angle});
  final int angle;

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: angle * angle,
      child: Container(
        width: 160,
        height: 160,
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            shrinkWrap: true,
            crossAxisSpacing: 5,
            children: List.generate(
              angle * angle,
              (index) => Container(
                color: Colors.red,
                width: 20,
                height: 20,
              ),
            )),
      ),
      feedback: Container(
        width: 80,
        height: 120,
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            shrinkWrap: true,
            children: List.generate(
              angle * angle,
              (index) => Container(
                color: Colors.red,
                width: 20,
                height: 20,
              ),
            )),
      ),
      childWhenDragging: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          shrinkWrap: true,
          children: List.generate(
            angle * angle,
            (index) => Container(
              color: Colors.grey,
              width: 20,
              height: 20,
            ),
          )),
    );
  }
}
