import 'package:flutter/material.dart';
import 'package:quizapp/screens/category_screen.dart';
import 'package:quizapp/screens/login_screen.dart';

class ScoreScreen extends StatelessWidget {
  int score;
  int numOfQuestions;
  ScoreScreen({super.key, required this.numOfQuestions, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your final score is',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Palatino',
                    color: Colors.grey[800],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '$score / $numOfQuestions',
                    style: TextStyle(
                      fontSize: 65,
                      fontFamily: 'Palatino',
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[500],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[600],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryScreen()),
                    );
                  },
                  child: Text(
                    'Play Again',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red[100],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
