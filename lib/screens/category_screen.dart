import 'package:flutter/material.dart';
import 'package:quizapp/data/app_data.dart';
import 'package:quizapp/screens/quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // _categoryCard(context, Colors.green, 'Sports Quiz'),
          for (int i = 0; i < categoriesList.length; i++)
            _categoryCard(context, categoriesList[i]),
        ],
      ),
    );
  }

  Widget _categoryCard(BuildContext context, Map<String, dynamic> category) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => QuizScreen(category: category),
            ),
          );
        },
        child: Container(
          color: category['categoryColor'],
          height: 100,
          child: Center(
            child: Text(
              category['categoryName'],
              style: const TextStyle(fontSize: 24, fontFamily: 'Palatino'),
            ),
          ),
        ),
      ),
    );
  }
}
