import 'dart:async';
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

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> values = List.generate(81, (index) => false);
  List<int> xSizes = List.generate(81, (index) => (index + 1) * 40);
  List<int> ySizes = List.generate(81, (index) => (index + 1) * 40);
  List<Model> images = [];
  int point = 0;
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 20);
  @override
  void initState() {
    changeImages();
    startTimer();
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void setCountDown() async {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Хожигдлоо"),
                  content: Text("Оноо: $point"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          values = List.generate(81, (index) => false);
                          startTimer();
                          changeImages();
                          Navigator.pop(context);
                          myDuration = Duration(seconds: 20);
                        },
                        child: Text('Тоглох'))
                  ],
                ));
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  void changeImages() {
    List<Model> randomImages = List.generate(1, (index) {
      int image = Random().nextInt(100);
      int angle = Random().nextInt(100);
      return Model(
          angle: image % 8 > 4 ? angle % 4 : angle % 2, image: image % 8);
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
    var y = ySizes.indexWhere((cs) => cs >= dy - 160);
    try {
      switch (num) {
        case 1:
          setState(() {
            values[y * 9 + x] = true;
          });
          changeImages();
          break;
        case 2:
          if (!values[y * 9 + x] && !values[y * 9 + x + 9]) {
            setState(() {
              values[y * 9 + x] = true;
              values[y * 9 + x + 9] = true;
            });
            changeImages();
          }
          break;
        case 3:
          if (!values[y * 9 + x] && !values[y * 9 + x + 1]) {
            setState(() {
              values[y * 9 + x] = true;
              values[y * 9 + x + 1] = true;
            });
            changeImages();
          }
          break;
        case 4:
          if (!values[y * 9 + x] &&
              !values[y * 9 + x + 1] &&
              !values[y * 9 + x + 9] &&
              !values[y * 9 + x + 10]) {
            setState(() {
              values[y * 9 + x] = true;
              values[y * 9 + x + 1] = true;
              values[y * 9 + x + 9] = true;
              values[y * 9 + x + 10] = true;
            });
            changeImages();
          }
          break;
        case 5:
          if (!values[y * 9 + x] &&
              !values[y * 9 + x + 1] &&
              !values[y * 9 + x + 10] &&
              !values[y * 9 + x + 11]) {
            setState(() {
              values[y * 9 + x] = true;
              values[y * 9 + x + 1] = true;
              values[y * 9 + x + 11] = true;
              values[y * 9 + x + 10] = true;
            });
            changeImages();
          }
          break;
        case 6:
          if (!values[y * 9 + x + 9] &&
              !values[y * 9 + x + 1] &&
              !values[y * 9 + x + 2] &&
              !values[y * 9 + x + 10]) {
            setState(() {
              values[y * 9 + x + 9] = true;
              values[y * 9 + x + 1] = true;
              values[y * 9 + x + 2] = true;
              values[y * 9 + x + 10] = true;
            });
            changeImages();
          }
          break;
        case 7:
          if (!values[y * 9 + x + 9] &&
              !values[y * 9 + x + 1] &&
              !values[y * 9 + x + 10] &&
              !values[y * 9 + x + 18]) {
            setState(() {
              values[y * 9 + x + 9] = true;
              values[y * 9 + x + 1] = true;
              values[y * 9 + x + 18] = true;
              values[y * 9 + x + 10] = true;
            });
            changeImages();
          }
          break;
        case 8:
          if (!values[y * 9 + x] &&
              !values[y * 9 + x + 9] &&
              !values[y * 9 + x + 19] &&
              !values[y * 9 + x + 10]) {
            setState(() {
              values[y * 9 + x] = true;
              values[y * 9 + x + 9] = true;
              values[y * 9 + x + 19] = true;
              values[y * 9 + x + 10] = true;
            });
            changeImages();
          }
          break;
      }
      checkPoint();
    } catch (e) {}
  }

  void checkPoint() {
    setState(() {
      myDuration = Duration(seconds: 20);
    });
    bool x = false, y = false;
    for (int i = 0; i < 9; i++) {
      x = true;
      y = true;
      for (int j = i * 9; j < i * 9 + 9; j++) {
        if (values[j] && x) {
          x = true;
        } else {
          x = false;
        }
      }
      if (x) {
        for (int j = i * 9; j < i * 9 + 9; j++) {
          values[j] = false;
          setState(() {
            point += 100;
          });
        }
      }
      for (int j = i; j < 81; j += 9) {
        if (values[j] && y) {
          y = true;
        } else {
          y = false;
        }
      }
      if (y) {
        for (int j = i; j < 81; j += 9) {
          values[j] = false;
          setState(() {
            point += 100;
          });
        }
      }
    }
    print('x: $x');
    print('y: $y');
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final seconds = strDigits(myDuration.inSeconds.remainder(60));
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
            Center(
              child: Text(
                '$seconds',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            DragTarget<int>(
                onAccept: (data) => {},
                onAcceptWithDetails: (details) {
                  dragImage(details.offset.dx, details.offset.dy, details.data);
                },
                builder: (context, candidateData, rejectedData) => Container(
                      width: 360,
                      height: 360,
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
                child: images.first.image == 0
                    ? RectangleImage(angle: images.first.angle + 2)
                    : images.first.image == 1
                        ? SquareImage(angle: images.first.angle + 1)
                        : ZImages(angle: images.first.angle))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
