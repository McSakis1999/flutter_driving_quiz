import 'package:flutter/material.dart';
import 'package:flutter_driving_quiz/main.dart';
import '../models/data.dart';

// mporei na givei staless
class ResultPage extends StatefulWidget {
  Map<Question, bool> results = {};
  String success = "Επιτυχία!";
  String fail = "Δυστυχώς αποτύχατε..";

  ResultPage({Key? key, required this.results}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

List<Widget> createListTiles(Map map) {
  List<Widget> _tileList = [];
  map.entries.forEach((entry) {
    _tileList.add(ResultItem(item: entry.key, isTrue: entry.value));
  });
  return _tileList;
}

int getTotalCorrectAnswers(Map map) {
  int _totalCorrect = 0;
  map.values.forEach((value) {
    if (value == true) _totalCorrect++;
  });
  return _totalCorrect;
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      splashRadius: 25,
                      onPressed: () => Navigator.of(context)
                          .popUntil((route) => route.isFirst),
                      icon: Icon(Icons.arrow_back,
                          color: Theme.of(context).colorScheme.primary)),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "${getTotalCorrectAnswers(widget.results) >= 29 ? widget.success : widget.fail}",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: getTotalCorrectAnswers(widget.results) >= 29
                      ? Colors.green
                      : Colors.red),
            ),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Row(children: [
                const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                ),
                Text(" : ${getTotalCorrectAnswers(widget.results)}")
              ]),
              Row(
                children: [
                  const Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                  Text(" : ${30 - getTotalCorrectAnswers(widget.results)}")
                ],
              )
            ]),
            const SizedBox(height: 20),
            if (widget.results.length != 0)
              Expanded(
                child: ListView(
                  children: [...createListTiles(widget.results)],
                ),
              ),
            if (widget.results.length == 0)
              const Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.timer_off_outlined,
                    size: 120,
                    color: Color.fromARGB(255, 202, 201, 201),
                  ))
          ],
        ),
      ),
    );
  }
}

class ResultItem extends StatefulWidget {
  bool isTrue;
  Question item;
  ResultItem({Key? key, required this.item, required this.isTrue})
      : super(key: key);

  @override
  State<ResultItem> createState() => _ResultItemState();
}

class _ResultItemState extends State<ResultItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (widget.isTrue == true) ...[
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                    )
                  ] else ...[
                    const Icon(
                      Icons.clear,
                      color: Colors.red,
                    )
                  ]
                ],
              ),
              const SizedBox(height: 10),
              Text("Ερώτηση : ${widget.item.Q_text}"),
              const SizedBox(height: 10),
              Text("Σωστή απάντηση : ${widget.item.getRightAnswer()}")
            ],
          ),
        ),
      ),
    );
  }
}
