import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';

class QuestionsScreen extends StatefulWidget {
  final Function(int, List<Map<String, Object>>) onQuizComplete;
  
  const QuestionsScreen(this.onQuizComplete, {super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  List<String> userAnswers = [];

  void answerQuestion(String answer) {
    userAnswers.add(answer);
    if (currentQuestionIndex + 1 < questions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Quiz is complete
      int score = calculateScore();
      widget.onQuizComplete(score, getQuestionAnswers());
    }
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].answers[questions[i].correctAnswerIndex] ==
          userAnswers[i]) {
        score++;
      }
    }
    return score;
  }

  List<Map<String, Object>> getQuestionAnswers() {
    List<Map<String, Object>> questionAnswers = [];
    for (int i = 0; i < questions.length; i++) {
      questionAnswers.add({
        'question': questions[i].text,
        'userAnswer': userAnswers[i],
        'correctAnswer':
            questions[i].answers[questions[i].correctAnswerIndex],
      });
    }
    return questionAnswers;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: const Color.fromARGB(255, 78, 13, 151),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 20),
            ...currentQuestion.answers.map((answer) {
              return ElevatedButton(
                onPressed: () => answerQuestion(answer),
                child: Text(
                  answer,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
