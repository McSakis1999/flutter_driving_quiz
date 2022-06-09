import 'package:flutter/material.dart';
import 'questionCard.dart';
import 'answerBtns.dart';
import '../screens/cat_quiz_template.dart';

class AnswerBtn extends StatefulWidget {
  AnswerBtn(this.answerText, this.isTrue, this.answerTapped);
  final String answerText;
  final bool isTrue;
  final VoidCallback answerTapped;
  @override
  State<AnswerBtn> createState() => _AnswerBtnState();
}

class _AnswerBtnState extends State<AnswerBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.answerTapped,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected
              ? widget.isTrue
                  ? Colors.green
                  : Colors.red
              : Theme.of(context).colorScheme.background,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          widget.answerText,
          style: const TextStyle(
              //fontSize: 15.0,
              ),
        ),
      ),
    );
  }
}
