import 'package:flutter/material.dart';
import '../models/data.dart';
import '../components/questionCard.dart';
import '../components/timer.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //Variables
  final int _totalQuestions = 30;
  int _questionIndex = 0;
  List answerCatalog = [];

  //int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  timer(),
                  Row(
                    children: [
                      const Icon(Icons.assignment_turned_in_outlined),
                      Text("  ${_questionIndex + 1}/${_totalQuestions}")
                    ],
                  ),
                ],
              ) /* time & num of questions */,
              const SizedBox(height: 15),
              // card
              QuestionCard(questions[_questionIndex], _questionIndex)
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (questions.length > 1) ...[
                    Expanded(
                      child: OutlinedButton(
                        child: const Text('Skip'),
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                            primary: Colors.white,
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiary,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)))),
                        onPressed: () {
                          var _tempQuestion = questions[_questionIndex];
                          questions.remove(questions[_questionIndex]);
                          questions.add(_tempQuestion);
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        child: const Text('Submit'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          primary: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                        ),
                        onPressed: () {
                          questions.remove(questions[_questionIndex]);
                          setState(() {});
                        },
                      ),
                    ),
                  ] else if (questions.length == 1) ...[
                    Expanded(
                      child: OutlinedButton(
                        child: const Text('Submit'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          primary: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                        ),
                        onPressed: () {
                          questions.remove(questions[_questionIndex]);
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ] /*2 buttons*/,
              ),
              const SizedBox(height: 20),
            ],
          )
        ],
      ),
    );
  }
}
