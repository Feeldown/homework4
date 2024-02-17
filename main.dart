import 'package:flutter/material.dart';

/// สร้างข้อมูลของเลขตั้งแต่ 00 ถึง 99
List<List<List<bool>>> digitSegments3D = [];

void main() {
  // เรียกใช้ฟังก์ชัน generateDigitSegments3D เพื่อสร้างข้อมูลเลข
  generateDigitSegments3D();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFD3BBFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF6F43C0),
          title: const Center(
            child: Text(
              'CP-SP LED MATRIX',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: LEDDisplay(),
      ),
    );
  }
}


class LEDDisplay extends StatefulWidget {
  @override
  _LEDDisplayState createState() => _LEDDisplayState();
}

class _LEDDisplayState extends State<LEDDisplay> {
  int number = 0;

  void increment() {
    setState(() {
      if (number < 99) {
        number++;
      } else {
        number = 0; // เมื่อค่าเป็น 99 ให้กลับไปเป็น 0
      }
    });
  }

  void decrement() {
    setState(() {
      if (number > 0) {
        number--;
      } else {
        number = 99; // เมื่อค่าเป็น 0 ให้กลับไปเป็น 99
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: increment,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(Icons.keyboard_arrow_up),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLEDWithBackground(number ~/ 10),
            _buildLEDWithBackground(number % 10),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: decrement,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLEDWithBackground(int digit) {
    return Container(
      //color: Colors.white,
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20),
        child: LEDDigit(digitSegments3D[digit]),
      ),
    );
  }
}

class LEDDigit extends StatelessWidget {
  final List<List<bool>> digit;

  LEDDigit(this.digit);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(7, (rowIndex) {
        return _buildRow(digit[rowIndex]);
      }),
    );
  }

  Widget _buildRow(List<bool> row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (colIndex) {
        return _buildDot(row[colIndex]);
      }),
    );
  }

  Widget _buildDot(bool isOn) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isOn ? Colors.green : Color.fromARGB(255, 117, 115, 115),
      ),
    );
  }
}

void generateDigitSegments3D() {
  for (int i = 0; i < 10; i++) {
    List<List<bool>> digitSegments = List.generate(7, (index) => List.filled(5, false));
    if (i == 0) {
      digitSegments = [
        [false, true, true, true, false],
        [true, false, false, false, true],
        [true, false, false, false, true],
        [true, false, false, false, true],
        [true, false, false, false, true],
        [true, false, false, false, true],
        [false, true, true, true, false],
      ];
    } else if (i == 1) {
      digitSegments = [
        [false, false, true, false, false],
        [false, true, true, false, false],
        [false, false, true, false, false],
        [false, false, true, false, false],
        [false, false, true, false, false],
        [false, false, true, false, false],
        [false, true, true, true, false],
      ];
    } else if (i == 2) {
      digitSegments = [
        [false, true, true, true, false],
        [true, false, false, false, true],
        [false, false, false, false, true],
        [false, false, false, true, false],
        [false, false, true, false, false],
        [false, true, false, false, false],
        [true, true, true, true, true],
      ];
    } else if (i == 3) {
      digitSegments = [
        [false, true, true, true, false],
        [true, false, false, false, true],
        [false, false, false, false, true],
        [false, true, true, true, false],
        [false, false, false, false, true],
        [true, false, false, false, true],
        [false, true, true, true, false],
      ];
    } else if (i == 4) {
      digitSegments = [
        [false, false, false, true, false],
        [false, false, true, true, false],
        [false, true, false, true, false],
        [true, false, false, true, false],
        [true, true, true, true, true],
        [false, false, false, true, false],
        [false, false, false, true, false],
      ];
    } else if (i == 5) {
      digitSegments = [
        [true, true, true, true, true],
        [true, false, false, false, false],
        [true, true, true, true, false],
        [false, false, false, false, true],
        [false, false, false, false, true],
        [true, false, false, false, true],
        [false, true, true, true, false],
      ];
    } else if (i == 6) {
      digitSegments = [
        [false, true, true, true, false],
        [true, false, false, false, true],
        [true, false, false, false, false],
        [true, true, true, true, false],
        [true, false, false, false, true],
        [true, false, false, false, true],
        [false, true, true, true, false],
      ];
    } else if (i == 7) {
      digitSegments = [
        [true, true, true, true, true],
        [false, false, false, false, true],
        [false, false, false, true, false],
        [false, false, true, false, false],
        [false, true, false, false, false],
        [false, true, false, false, false],
        [false, true, false, false, false],
      ];
    } else if (i == 8) {
      digitSegments = [
        [false, true, true, true, false],
        [true, false, false, false, true],
        [true, false, false, false, true],
        [false, true, true, true, false],
        [true, false, false, false, true],
        [true, false, false, false, true],
        [false, true, true, true, false],
      ];
    } else if (i == 9) {
      digitSegments = [
        [false, true, true, true, false],
        [true, false, false, false, true],
        [true, false, false, false, true],
        [false, true, true, true, false],
        [false, false, false, false, true],
        [true, false, false, false, true],
        [false, true, true, true, false],
      ];
    }

    digitSegments3D.add(digitSegments);
  }
}