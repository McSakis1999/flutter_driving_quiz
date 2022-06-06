import 'package:flutter/material.dart';
import '../models/data.dart';

String currentAnswer = "0"; // kano to id string giati exei thema

class RadioBtns extends StatefulWidget {
  RadioBtns(this.answers);
  List<Answer> answers;
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
                  });
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(child: Text(answer.A_text)),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
