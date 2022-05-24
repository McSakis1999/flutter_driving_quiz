import 'package:flutter/material.dart';

String currentAnswer = "1"; // kano to id string giati exei thema

class RadioBtns extends StatefulWidget {
  RadioBtns(this.answers);
  List answers;
  @override
  State<RadioBtns> createState() => _RadioBtnsState();
}

class _RadioBtnsState extends State<RadioBtns> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var answer in widget.answers)
          Row(
            children: [
              Radio(
                value: answer.A_id.toString(),
                groupValue: currentAnswer,
                onChanged: (value) {
                  setState(() {
                    currentAnswer = value.toString();
                    print(currentAnswer);
                  });
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Text(answer.A_text)
            ],
          )
      ],
    );
  }
}
