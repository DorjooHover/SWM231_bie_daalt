import 'package:flutter/material.dart';

class RectangleImage extends StatelessWidget {
  const RectangleImage({super.key, required this.angle});
  final int angle;

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: angle,
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
              angle == 2 ? 4 : 2,
              (index) {
                return index % 2 == 0 || angle == 3
                    ? Container(
                        color: Colors.red,
                        width: 20,
                        height: 20,
                      )
                    : SizedBox();
              },
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
              angle == 2 ? 4 : 2,
              (index) {
                return index % 2 == 0 || angle == 3
                    ? Container(
                        color: Colors.red,
                        width: 20,
                        height: 20,
                      )
                    : SizedBox();
              },
            )),
      ),
      childWhenDragging: Container(
        width: 160,
        height: 160,
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            shrinkWrap: true,
            crossAxisSpacing: 5,
            children: List.generate(
              angle == 2 ? 4 : 2,
              (index) {
                return index % 2 == 0 || angle == 3
                    ? Container(
                        color: Colors.grey,
                        width: 20,
                        height: 20,
                      )
                    : SizedBox();
              },
            )),
      ),
    );
  }
}
