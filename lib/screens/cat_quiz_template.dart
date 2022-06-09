import 'package:flutter/material.dart';
import '../models/data.dart';
import '../components/questionCard.dart';

int correctCatAnswers = 0;
int falseCatAnswers = 0;
bool isSelected = false;

class CatQuiz extends StatefulWidget {
  List<Question> questions;
  CatQuiz({Key? key, required this.questions}) : super(key: key);

  @override
  State<CatQuiz> createState() => _CatQuizState();
}

class _CatQuizState extends State<CatQuiz> {
  int _questionIndex = 0;

  @override
  void initState() {
    // Ανακάτεμα λίστας ερωτήσεων
    widget.questions.shuffle();
    // Αρχικοποιήση μεταβλητών
    isSelected = false;
    correctCatAnswers = 0;
    falseCatAnswers = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          title: const Text('Τέστ ανά Κατηγορία'),
        ),
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      const SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(children: [
                              const Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.green,
                              ),
                              Text(" : ${correctCatAnswers}")
                            ]),
                            Row(
                              children: [
                                const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                                Text(" : ${falseCatAnswers}")
                              ],
                            )
                          ]),
                      const SizedBox(height: 15),
                      QuestionCard(widget.questions[_questionIndex], false),
                    ]),
                    if (widget.questions.length != _questionIndex + 1) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: (Row(
                          children: [
                            Expanded(
                                child: OutlinedButton(
                              child: const Text('Επόμενη Ερώτηση'),
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
                                if (isSelected) {
                                  _questionIndex++;
                                  isSelected = false;
                                  setState(() {});
                                } else {
                                  final snackBar = SnackBar(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      content: const Text(
                                          'Παρακαλώ επιλέξτε μια απάντηση!'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                            )),
                          ],
                        )),
                      )
                    ] else ...[
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: OutlinedButton(
                                child:
                                    const Text('Επιστροφή στην αρχική σελίδα'),
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
                                  _questionIndex = 0;
                                  isSelected = false;
                                  correctCatAnswers = 0;
                                  falseCatAnswers = 0;
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                              )),
                            ],
                          ))
                    ],
                  ],
                ))
          ]),
        ));
  }
}
