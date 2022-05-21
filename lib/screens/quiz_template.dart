import 'package:flutter/material.dart';
import '../models/data.dart';
import '../components/answerButton.dart';
import '../components/timer.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //Variables
  int _questionIndex = 0;
  final int _totalQuestions = 30;
  int value = 0; // test gia apantiseis
  int btnIndex = 0;

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
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(10)), //here
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).colorScheme.primary,
                        offset: const Offset(0, 0),
                        blurRadius: 10.0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/1.1.png'),
                    ),
                    Text(questions[_questionIndex].Q_text),
                    for (var answer in questions[_questionIndex].Q_answers)
                      AnswerBtn(answer.A_text, btnIndex++)
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                        _questionIndex--;
                        print(_questionIndex);
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
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                      ),
                      onPressed: () {
                        _questionIndex++;
                      },
                    ),
                  ),
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
