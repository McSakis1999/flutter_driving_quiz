import 'package:flutter/material.dart';
import 'dart:async';
import '../screens/results.dart';
import '../screens/quiz_template.dart';

class timer extends StatefulWidget {
  const timer({Key? key}) : super(key: key);

  @override
  State<timer> createState() => _timerState();
}

class _timerState extends State<timer> {
  int _seconds = 1800; //1800
  Timer? timer;
  final _secondsFormated = <int, String>{
    0: "00",
    1: "01",
    2: "02",
    3: "03",
    4: "04",
    5: "05",
    6: "06",
    7: "07",
    8: "08",
    9: "09"
  };

  void startTimer() {
    bool _endFlag = false;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (_seconds > 0) {
          if (mounted) setState(() => _seconds--);
        } else {
          if (_endFlag == false) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(results: answerCatalog)),
            );
            print('1');
            _endFlag = true;
          }
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.timer),
        Text(
            "  ${(_seconds ~/ 60)}:${(_seconds % 60) < 10 ? _secondsFormated[(_seconds % 60)] : (_seconds % 60)}"),
      ],
    );
  }
}
