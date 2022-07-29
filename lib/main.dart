// ignore_for_file: deprecated_member_use, prefer_const_constructors, sort_child_properties_last, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:third_app/result.dart';

import './quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

//void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite colour?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Blue', 'score': 3},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Dog', 'score': 5},
        {'text': 'Snake', 'score': 3},
      ]
    },
    {
      'questionText': 'What\'s your favorite game?',
      'answers': [
        {'text': 'Dota 2', 'score': 1},
        {'text': 'CS:GO', 'score': 2},
        {'text': 'Minecraft', 'score': 5},
        {'text': 'APEX', 'score': 3},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
