import 'package:flutter/material.dart';
import 'package:quizapp/screens/preview_screen.dart';

class QuizScreen extends StatefulWidget {
  Map<String, dynamic> category;

  QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 1;
  int currentScore = 0;

  Map<String, dynamic> selectedAnswers = {};
  // Adding/updating a value
  void updateAnswer(String question, dynamic answer) {
    selectedAnswers[question] = answer;
  }

  @override
  Widget build(BuildContext context) {
    int numOfQuestions =
        (widget.category['questionsAndAnswers'] as List).length;
    bool isQuestionAnswered = selectedAnswers.containsKey(
      widget.category['questionsAndAnswers'][currentQuestion - 1]['question'],
    );

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
            Center(
              child:
                  isQuestionAnswered
                      ? Icon(
                        // Show checkmark if answered
                        Icons.check_circle,
                        color: Colors.green,
                        size: MediaQuery.of(context).size.width * 0.1,
                      )
                      : Icon(
                        // Show warning if unanswered
                        Icons.warning,
                        color: Colors.yellow[700],
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),

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
                    onPressed: () async {
                      // 1. Update current answer and score
                      updateAnswer(
                        widget.category['questionsAndAnswers'][currentQuestion -
                            1]['question'],
                        widget.category['questionsAndAnswers'][currentQuestion -
                            1]['answers'][i]['answerText'],
                      );

                      setState(() {
                        currentScore +=
                            widget.category['questionsAndAnswers'][currentQuestion -
                                    1]['answers'][i]['score']
                                as int;
                      });

                      // 2. Check if this is the final question
                      if (currentQuestion ==
                          widget.category['questionsAndAnswers'].length) {
                        // 3. Validate all questions are answered
                        if (selectedAnswers.length != numOfQuestions) {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: Text("Incomplete Quiz"),
                                  content: Text(
                                    "You haven't answered all questions yet.",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed:
                                          () => Navigator.pop(
                                            context,
                                          ), 
                                      child: const Text("Return"),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pop(
                                          context,
                                        ); 
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => PreviewScreen(
                                                  selectedAnswers:
                                                      selectedAnswers,
                                                  score: currentScore,
                                                ),
                                          ),
                                        );
                                      },
                                      child: const Text("Continue Anyway"),
                                    ),
                                  ],
                                ),
                          );
                          return; 
                        }

                        // 4. All questions answered - proceed to preview
                        final updatedData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PreviewScreen(
                                  selectedAnswers: selectedAnswers,
                                  score: currentScore,
                                ),
                          ),
                        );

                        if (updatedData != null) {
                          setState(() {
                            currentScore = updatedData['score'] ?? currentScore;
                            selectedAnswers =
                                updatedData['answers'] ?? selectedAnswers;
                            currentQuestion =
                                updatedData['currentQuestion'] ??
                                currentQuestion;
                          });
                        }
                      } else {
                        // Not final question - just move to next
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed:
                      () => {
                        if (currentQuestion > 1)
                          setState(() {
                            currentQuestion--;
                          }),
                      },
                  label: Text('Previous'),
                  icon: Icon(Icons.arrow_back),
                ),
                ElevatedButton.icon(
                  onPressed:
                      () => {
                        if (currentQuestion < numOfQuestions)
                          setState(() {
                            currentQuestion++;
                          }),
                      },
                  label: Text('Next'),
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
