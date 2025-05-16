import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizapp/screens/score_screen.dart';

class QuizScreen extends StatefulWidget {
  Map<String, dynamic> category;

  QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 1;
  int currentScore = 0;

  @override
  Widget build(BuildContext context) {
    int numOfQuestions =
        (widget.category['questionsAndAnswers'] as List).length;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category['categoryName']),
        backgroundColor: widget.category['categoryColor'],
        actions: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text('$currentQuestion / $numOfQuestions'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.category['questionsAndAnswers'][currentQuestion - 1]['question']}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            for (
              int i = 0;
              i <
                  widget
                      .category['questionsAndAnswers'][currentQuestion -
                          1]['answers']
                      .length;
              i++
            )
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      currentScore =
                          currentScore +
                          (widget.category['questionsAndAnswers'][currentQuestion -
                                  1]['answers'][i]['score']
                              as int);
                      print(currentScore.toString());

                      if (currentQuestion ==
                          widget.category['questionsAndAnswers'].length) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder:
                                (BuildContext context) => ScoreScreen(
                                  numOfQuestions: numOfQuestions,
                                  score: currentScore,
                                ),
                          ),
                        );
                      } else {
                        setState(() {
                          currentQuestion++;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.category['categoryColor'],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    child: Text(
                      '${widget.category['questionsAndAnswers'][currentQuestion - 1]['answers'][i]['answerText']}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
