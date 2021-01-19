import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

var quizBrain = QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: LamanQuiz(),
        ),
      ),
    );
  }
}

class LamanQuiz extends StatefulWidget {
  @override
  _LamanQuizState createState() => _LamanQuizState();
}

class _LamanQuizState extends State<LamanQuiz> {
  
  List<Icon> scoreKeeper = [
    Icon(
      Icons.star,
      color : Colors.amber,
    ),
    Icon(
      Icons.arrow_right,
      size: 20,
    )
  ];

  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState((){
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Udah abis!',
          desc: 'Keren ga poy aplikasi buatan saya ?.',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
        print('Benar');
        scoreKeeper.add(
          Icon(
            Icons.check,
            color : Colors.green,
          )
        );
      } else {
        print('Salah');
        scoreKeeper.add(
          Icon(
            Icons.close,
            color : Colors.red,
          )
        );
      }
      quizBrain.nexQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              child: Text('Benar'),
              color: Colors.green,
              onPressed: (){
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              child: Text('Salah'),
              color: Colors.grey,
              onPressed: (){
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}