import 'package:flutter/material.dart';
import 'package:flutter_driving_quiz/components/radioBtns.dart';
import 'package:flutter_driving_quiz/screens/results.dart';
import '../models/data.dart';
import '../components/questionCard.dart';
import '../components/timer.dart';

Map<Question, bool> answerCatalog = {};

class Quiz extends StatefulWidget {
  List<Question> questions = [];
  Quiz({Key? key, required this.questions}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  void initState() {
    answerCatalog = {};
    super.initState();
  }

  //Variables
  final int _totalQuestions = 30;
  int _questionIndex = 0;

  //int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        title: const Text('Τέστ Υπουργείου'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const timer(),
                        Row(
                          children: [
                            const Icon(Icons.assignment_turned_in_outlined),
                            Text(
                                "  ${_totalQuestions - answerCatalog.length}/${_totalQuestions}")
                          ],
                        ),
                      ],
                    ) /* time & num of questions */,
                    const SizedBox(height: 15),
                  ],
                ),
                // card
                QuestionCard(widget.questions[_questionIndex], true)
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (widget.questions.length > 1) ...[
                      Expanded(
                        child: OutlinedButton(
                          child: const Text('Προσπέραση'),
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
                            var _tempQuestion =
                                widget.questions[_questionIndex];
                            widget.questions
                                .remove(widget.questions[_questionIndex]);
                            widget.questions.add(_tempQuestion);
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: OutlinedButton(
                          child: const Text('Επιβεβαίωση'),
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
                            if (currentAnswer != "0") {
                              answerCatalog[widget.questions[_questionIndex]] =
                                  widget.questions[_questionIndex]
                                      .checkIfTrue(currentAnswer);
                              widget.questions
                                  .remove(widget.questions[_questionIndex]);
                              currentAnswer = "0";
                            } else {
                              final snackBar = SnackBar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  duration: const Duration(milliseconds: 1500),
                                  content: const Text(
                                      'Παρακαλώ επιλέξτε μια απάντηση!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            setState(() {});
                          },
                        ),
                      ),
                    ] else if (widget.questions.length == 1) ...[
                      Expanded(
                        child: OutlinedButton(
                          child: const Text('Επιβεβαίωση'),
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
                            if (currentAnswer != "0") {
                              answerCatalog[widget.questions[_questionIndex]] =
                                  widget.questions[_questionIndex]
                                      .checkIfTrue(currentAnswer);
                              widget.questions
                                  .remove(widget.questions[_questionIndex]);
                              currentAnswer = "0";
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResultPage(results: answerCatalog)),
                            );
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
      ),
    );
  }
}
