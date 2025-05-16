import 'package:flutter/material.dart';

List<Map<String, dynamic>> categoriesList = [
  {
    "categoryName": 'Sports Quiz',
    "categoryColor": Colors.pink,
    "questionsAndAnswers": [
      {
        "question": "Which country has won the most FIFA World Cups?",
        "answers": [
          {"answerText": "Brazil", "score": 1},
          {"answerText": "Germany", "score": 0},
          {"answerText": "Italy", "score": 0},
          {"answerText": "Argentina", "score": 0},
        ],
      },
      {
        "question": "Which country won the FIFA World Cup in 2018?",
        "answers": [
          {"answerText": "Germany", "score": 0},
          {"answerText": "Brazil", "score": 0},
          {"answerText": "France", "score": 1},
          {"answerText": "Argentina", "score": 0},
        ],
      },
      {
        "question":
            "How many players are there in a basketball team on the court?",
        "answers": [
          {"answerText": "5", "score": 1},
          {"answerText": "6", "score": 0},
          {"answerText": "7", "score": 0},
          {"answerText": "4", "score": 0},
        ],
      },
      {
        "question": "Who holds the record for most Olympic gold medals?",
        "answers": [
          {"answerText": "Usain Bolt", "score": 0},
          {"answerText": "Michael Phelps", "score": 1},
          {"answerText": "Carl Lewis", "score": 0},
          {"answerText": "Mark Spitz", "score": 0},
        ],
      },
      {
        "question": "Which sport is associated with Wimbledon?",
        "answers": [
          {"answerText": "Cricket", "score": 0},
          {"answerText": "Tennis", "score": 1},
          {"answerText": "Football", "score": 0},
          {"answerText": "Golf", "score": 0},
        ],
      },
      {
        "question": "In which sport do teams compete for the Stanley Cup?",
        "answers": [
          {"answerText": "Baseball", "score": 0},
          {"answerText": "Ice Hockey", "score": 1},
          {"answerText": "Basketball", "score": 0},
          {"answerText": "American Football", "score": 0},
        ],
      },
      {
        "question": "Which country hosts the Grand Prix in Monaco?",
        "answers": [
          {"answerText": "Italy", "score": 0},
          {"answerText": "France", "score": 0},
          {"answerText": "Monaco", "score": 1},
          {"answerText": "Spain", "score": 0},
        ],
      },
    ],
  },
  {
    "categoryName": 'IQ Quiz',
    "categoryColor": Colors.lightGreen,
    "questionsAndAnswers": [
      {
        "question": "What comes next in the sequence: 2, 4, 8, 16, ?",
        "answers": [
          {"answerText": "18", "score": 0},
          {"answerText": "24", "score": 0},
          {"answerText": "32", "score": 1},
          {"answerText": "30", "score": 0},
        ],
      },
      {
        "question": "Which shape has the most sides?",
        "answers": [
          {"answerText": "Triangle", "score": 0},
          {"answerText": "Hexagon", "score": 0},
          {"answerText": "Octagon", "score": 1},
          {"answerText": "Pentagon", "score": 0},
        ],
      },
      {
        "question":
            "If all Bloops are Razzies, and all Razzies are Lazzies, then all Bloops are definitely:",
        "answers": [
          {"answerText": "Razzies", "score": 0},
          {"answerText": "Lazzies", "score": 1},
          {"answerText": "Bloops", "score": 0},
          {"answerText": "Not sure", "score": 0},
        ],
      },
      {
        "question": "Which number is the odd one out: 11, 13, 17, 19, 21?",
        "answers": [
          {"answerText": "13", "score": 0},
          {"answerText": "17", "score": 0},
          {"answerText": "21", "score": 1},
          {"answerText": "11", "score": 0},
        ],
      },
      {
        "question": "Which word is the odd one out?",
        "answers": [
          {"answerText": "Book", "score": 0},
          {"answerText": "Pen", "score": 0},
          {"answerText": "Paper", "score": 0},
          {"answerText": "Chair", "score": 1},
        ],
      },
    ],
  },
  {
    "categoryName": 'Maths Quiz',
    "categoryColor": Colors.yellow,
    "questionsAndAnswers": [
      {
        "question": "What is 12 × 8?",
        "answers": [
          {"answerText": "96", "score": 1},
          {"answerText": "88", "score": 0},
          {"answerText": "102", "score": 0},
          {"answerText": "108", "score": 0},
        ],
      },
      {
        "question": "What is the square root of 144?",
        "answers": [
          {"answerText": "11", "score": 0},
          {"answerText": "12", "score": 1},
          {"answerText": "13", "score": 0},
          {"answerText": "14", "score": 0},
        ],
      },
      {
        "question": "What is 15% of 200?",
        "answers": [
          {"answerText": "30", "score": 1},
          {"answerText": "25", "score": 0},
          {"answerText": "35", "score": 0},
          {"answerText": "20", "score": 0},
        ],
      },
      {
        "question": "Solve: 3² + 4² = ?",
        "answers": [
          {"answerText": "12", "score": 0},
          {"answerText": "25", "score": 1},
          {"answerText": "18", "score": 0},
          {"answerText": "20", "score": 0},
        ],
      },
      {
        "question": "What is the value of π (pi) rounded to 2 decimal places?",
        "answers": [
          {"answerText": "3.12", "score": 0},
          {"answerText": "3.14", "score": 1},
          {"answerText": "3.15", "score": 0},
          {"answerText": "3.10", "score": 0},
        ],
      },
    ],
  },
  {
    "categoryName": 'Science Quiz',
    "categoryColor": Colors.lightBlue,
    "questionsAndAnswers": [
      {
        "question": "What planet is known as the Red Planet?",
        "answers": [
          {"answerText": "Earth", "score": 0},
          {"answerText": "Mars", "score": 1},
          {"answerText": "Jupiter", "score": 0},
          {"answerText": "Venus", "score": 0},
        ],
      },
      {
        "question": "What gas do plants absorb from the atmosphere?",
        "answers": [
          {"answerText": "Oxygen", "score": 0},
          {"answerText": "Carbon Dioxide", "score": 1},
          {"answerText": "Nitrogen", "score": 0},
          {"answerText": "Hydrogen", "score": 0},
        ],
      },
      {
        "question": "What is the chemical symbol for water?",
        "answers": [
          {"answerText": "H2O", "score": 1},
          {"answerText": "O2", "score": 0},
          {"answerText": "CO2", "score": 0},
          {"answerText": "HO", "score": 0},
        ],
      },
      {
        "question": "Which part of the cell contains genetic material?",
        "answers": [
          {"answerText": "Cytoplasm", "score": 0},
          {"answerText": "Mitochondria", "score": 0},
          {"answerText": "Nucleus", "score": 1},
          {"answerText": "Ribosome", "score": 0},
        ],
      },
      {
        "question": "What is the boiling point of water at sea level?",
        "answers": [
          {"answerText": "100°C", "score": 1},
          {"answerText": "90°C", "score": 0},
          {"answerText": "80°C", "score": 0},
          {"answerText": "120°C", "score": 0},
        ],
      },
    ],
  },
];
