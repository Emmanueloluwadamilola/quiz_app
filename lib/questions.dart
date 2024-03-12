import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/model/quiz_question.dart';
import 'package:quiz_app/result_page.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  // List questionIndex = questions;

  void answeredQuestion(String selectedAswer) {
    widget.onSelectedAnswer(selectedAswer);
    setState(() {
           currentQuestionIndex++;        
    });
  }

  void restartQuestion() {
    setState(() {
      currentQuestionIndex = 0;
    });
  }

  // void answeredQuestion() {
  //   List<QuizQuestion> printedQuestions = [];

  //   while (questionIndex.isNotEmpty) {
  //     int randomIndex = Random().nextInt(questionIndex.length);
  //     QuizQuestion randomQuestion = questionIndex[randomIndex];

  //     printedQuestions.add(randomQuestion);
  //     questionIndex.remove(randomQuestion);
  //     currentQuestionIndex = randomIndex;
  //   }
  //   showDialog(
  //       context: context,
  //       builder: (content) {
  //         return AlertDialog(
  //           content: const SizedBox(
  //             height: 40,
  //             width: 80,
  //             child: Center(
  //               child: Text("Thank You"),
  //             ),
  //           ),
  //           actions: [
  //             InkWell(
  //               onTap: restartQuestion,
  //               child: const Text('OK'),
  //             )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answeredQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
