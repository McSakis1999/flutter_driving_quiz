import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(10.0), top: Radius.circular(10.0)),
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Κατηγορία X',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Icon(Icons.assignment_turned_in_outlined),
                  Text(': X ερωτήσεις')
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
