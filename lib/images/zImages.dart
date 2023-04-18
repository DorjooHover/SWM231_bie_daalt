import 'package:flutter/material.dart';

class ZImages extends StatelessWidget {
  const ZImages({super.key, required this.angle});
  final int angle;

  @override
  Widget build(BuildContext context) {
    print(angle);
    return Draggable<int>(
      data: angle + 5,
      child: Container(
        width: 160,
        height: 160,
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            shrinkWrap: true,
            crossAxisSpacing: 5,
            children: List.generate(
              9,
              (index) {
                return index == 0 && angle != 1 && angle != 2
                    ? Container(
                        color: Colors.orange,
                        width: 20,
                        height: 20,
                      )
                    : index == 1 && angle != 3
                        ? Container(
                            color: Colors.orange,
                            width: 20,
                            height: 20,
                          )
                        : index == 2 && angle == 1
                            ? Container(
                                color: Colors.orange,
                                width: 20,
                                height: 20,
                              )
                            : index == 3 && angle != 0
                                ? Container(
                                    color: Colors.orange,
                                    width: 20,
                                    height: 20,
                                  )
                                : index == 4
                                    ? Container(
                                        color: Colors.orange,
                                        width: 20,
                                        height: 20,
                                      )
                                    : index == 5 && angle == 0
                                        ? Container(
                                            color: Colors.orange,
                                            width: 20,
                                            height: 20,
                                          )
                                        : index == 6 && angle == 2
                                            ? Container(
                                                color: Colors.orange,
                                                width: 20,
                                                height: 20,
                                              )
                                            : index == 7 && angle == 3
                                                ? Container(
                                                    color: Colors.orange,
                                                    width: 20,
                                                    height: 20,
                                                  )
                                                : SizedBox();
              },
            )),
      ),
      feedback: Container(
        width: 120,
        height: 160,
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            shrinkWrap: true,
            crossAxisSpacing: 5,
            children: List.generate(
              9,
              (index) {
                return index == 0 && angle != 1 && angle != 2
                    ? Container(
                        color: Colors.red,
                        width: 20,
                        height: 20,
                      )
                    : index == 1 && angle != 3
                        ? Container(
                            color: Colors.red,
                            width: 20,
                            height: 20,
                          )
                        : index == 2 && angle == 1
                            ? Container(
                                color: Colors.red,
                                width: 20,
                                height: 20,
                              )
                            : index == 3 && angle != 0
                                ? Container(
                                    color: Colors.red,
                                    width: 20,
                                    height: 20,
                                  )
                                : index == 4
                                    ? Container(
                                        color: Colors.red,
                                        width: 20,
                                        height: 20,
                                      )
                                    : index == 5 && angle == 0
                                        ? Container(
                                            color: Colors.red,
                                            width: 20,
                                            height: 20,
                                          )
                                        : index == 6 && angle == 2
                                            ? Container(
                                                color: Colors.red,
                                                width: 20,
                                                height: 20,
                                              )
                                            : index == 7 && angle == 3
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
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            shrinkWrap: true,
            crossAxisSpacing: 5,
            children: List.generate(
              9,
              (index) {
                return index == 0 && angle != 1 && angle != 2
                    ? Container(
                        color: Colors.grey,
                        width: 20,
                        height: 20,
                      )
                    : index == 1 && angle != 3
                        ? Container(
                            color: Colors.grey,
                            width: 20,
                            height: 20,
                          )
                        : index == 2 && angle == 1
                            ? Container(
                                color: Colors.grey,
                                width: 20,
                                height: 20,
                              )
                            : index == 3 && angle != 0
                                ? Container(
                                    color: Colors.grey,
                                    width: 20,
                                    height: 20,
                                  )
                                : index == 4
                                    ? Container(
                                        color: Colors.grey,
                                        width: 20,
                                        height: 20,
                                      )
                                    : index == 5 && angle == 0
                                        ? Container(
                                            color: Colors.grey,
                                            width: 20,
                                            height: 20,
                                          )
                                        : index == 6 && angle == 2
                                            ? Container(
                                                color: Colors.grey,
                                                width: 20,
                                                height: 20,
                                              )
                                            : index == 7 && angle == 3
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
