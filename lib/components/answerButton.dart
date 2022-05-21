import 'package:flutter/material.dart';

int value = 0;

class AnswerBtn extends StatefulWidget {
  final String answerText;
  final int index;
  AnswerBtn(this.answerText, this.index);
  bool flag = false;

  @override
  State<AnswerBtn> createState() => _AnswerBtnState();
}

class _AnswerBtnState extends State<AnswerBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          widget.flag = true;
        })
        /*
        setState(() {
          value = widget.index;
        }) */
      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(
            color: widget.flag
                ? Colors.orange
                : Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          widget.answerText,
          style: const TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
