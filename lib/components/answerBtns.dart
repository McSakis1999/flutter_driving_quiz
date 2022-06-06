import 'package:flutter/material.dart';
import '../models/data.dart';
import 'answerButton.dart';
import '../screens/cat_quiz_template.dart';

class buttonGroup extends StatefulWidget {
  buttonGroup({Key? key, required this.answers}) : super(key: key);
  List<Answer> answers;

  @override
  State<buttonGroup> createState() => _buttonGroupState();
}

class _buttonGroupState extends State<buttonGroup> {
  void questionAnswered(bool questionIsTrue) {
    setState(() {
      isSelected = true;
      questionIsTrue ? correctCatAnswers++ : falseCatAnswers++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var answer in widget.answers)
          AnswerBtn(answer.A_text, answer.A_isTrue, () {
            questionAnswered(answer.A_isTrue);
          }),
      ],
    );
  }
}
