import 'package:flutter/material.dart';
import 'package:flutter_driving_quiz/components/radioBtns.dart';
import 'package:flutter_driving_quiz/models/data.dart';
import 'answerBtns.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard(this.question, this.radioFlag);
  bool radioFlag;
  Question question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                offset: const Offset(0, 0),
                blurRadius: 10.0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.question.hasImage == true) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(widget.question.Q_imagePath),
            )
          ],
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 15),
              Flexible(
                  child: Text(widget.question.Q_text,
                      textAlign: TextAlign.justify)),
              const SizedBox(width: 15)
            ],
          ),
          const SizedBox(height: 10),

          widget.radioFlag
              ? RadioBtns(widget.question.Q_answers)
              : buttonGroup(answers: widget.question.Q_answers)
          //radiobtns
        ],
      ),
    );
  }
}
