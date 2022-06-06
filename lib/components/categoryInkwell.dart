import 'package:flutter/material.dart';
import 'package:flutter_driving_quiz/models/data.dart';
import 'package:flutter_driving_quiz/screens/cat_quiz_template.dart';

class CategoryCard extends StatelessWidget {
  String imagePath = '';
  String categoryTitle = '';
  List<Question> data = [];
  CategoryCard(
      {Key? key,
      required this.imagePath,
      required this.categoryTitle,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CatQuiz(questions: data)),
          )
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(10.0), top: Radius.circular(10.0)),
          child: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                        color: Theme.of(context).colorScheme.background,
                        padding: const EdgeInsets.all(15),
                        child: Image(
                          image: AssetImage(imagePath),
                          height: 50,
                        ))),
                const SizedBox(height: 15),
                Text(
                  categoryTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.assignment_turned_in_outlined),
                    Text(': ${data.length} ερωτήσεις')
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
