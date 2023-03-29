import 'dart:math';

import 'package:b20fa1709/images/images.dart';
import 'package:b20fa1709/model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SWM231',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Бие даалт'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> values = List.generate(81, (index) => false);
  List<int> xSizes = List.generate(81, (index) => (index + 1) * 41);
  List<int> ySizes = List.generate(81, (index) => 90 + (index + 1) * 41);
  List<Model> images = [];
  int point = 0;

  @override
  void initState() {
    // TODO: implement initState
    changleImages();

    super.initState();
  }

  void changleImages() {
    List<Model> randomImages = List.generate(8, (index) {
      int image = Random().nextInt(100);
      int angle = Random().nextInt(100);
      return Model(
          angle: angle % 2 == 0 ? 0 : 1, image: image % 2 == 0 ? 0 : 1);
    });
    setState(() {
      images = randomImages;
    });
  }

  void dragImage(
    double dx,
    double dy,
    int num,
  ) {
    var x = xSizes.indexWhere((cs) => cs >= dx);
    var y = ySizes.indexWhere((cs) => cs >= dy);
    switch (num) {
      case 1:
        setState(() {
          values[y * 9 + x] = true;
        });
        break;
      case 2:
        if (!values[y * 9 + x] && !values[y * 9 + x + 9]) {
          setState(() {
            values[y * 9 + x] = true;
            values[y * 9 + x + 9] = true;
          });
        }
        break;
      case 3:
        if (!values[y * 9 + x] && !values[y * 9 + x + 1]) {
          setState(() {
            values[y * 9 + x] = true;
            values[y * 9 + x + 1] = true;
          });
        }
        break;
      case 4:
        if (!values[y * 9 + x] &&
            !values[y * 9 + x + 1] &&
            !values[y * 9 + x + 9] &&
            !values[y * 9 + x + 10])
          setState(() {
            values[y * 9 + x] = true;
            values[y * 9 + x + 1] = true;
            values[y * 9 + x + 9] = true;
            values[y * 9 + x + 10] = true;
          });
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
    }
    checkPoint();
  }

  void checkPoint() {
    int rowCount = 0, colBeforeIndex = 0, colCount = 0;
    values.asMap().forEach((index, value) {
      bool rowBeforeValue = true;
      if (value) {
        if (colBeforeIndex + 9 == index) {
          print(index);
          colCount++;
          print(colCount);
          if (colCount >= 8) {
            setState(() {
              point += 900;
            });
            for (int i = colBeforeIndex + 9; i >= 0; i -= 9) {
              setState(() {
                values[i] = false;
              });
            }
          }
          colBeforeIndex = index;
        } else {
          if (colBeforeIndex == 0 && index < 9) {
            colBeforeIndex = index;
          }
        }
      }
      if (value) {
        if ((index + 1) % 9 == 0 || rowBeforeValue) {
          rowCount++;
          if ((index + 1) % 9 == 0 && rowCount >= 9) {
            setState(() {
              point += 900;
            });
            for (int i = index; i >= index - 8; i--) {
              setState(() {
                values[i] = false;
              });
            }
          }
          rowBeforeValue = value;
        }
      } else {
        rowCount = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DragTarget<int>(
                onAccept: (data) => {},
                onAcceptWithDetails: (details) {
                  dragImage(details.offset.dx, details.offset.dy, details.data);
                },
                builder: (context, candidateData, rejectedData) => Container(
                      width: 370,
                      height: 370,
                      child: GridView.count(
                        crossAxisCount: 9,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        children: List.generate(
                          81,
                          (index) => Container(
                            width: 20,
                            color: values[index] ? Colors.red : Colors.amber,
                            height: 20,
                          ),
                        ),
                      ),
                    )),
            SizedBox(
              height: 30,
            ),
            Text(
              'Point: $point',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              flex: 2,
              child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    ...images.map((e) {
                      if (e.image == 0) {
                        return RectangleImage(angle: e.angle + 2);
                      } else {
                        return SquareImage(angle: e.angle + 1);
                      }
                    })
                  ]),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
