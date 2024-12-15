import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Map<String, Object>> questionAnswers;

  const ResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.questionAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        backgroundColor: const Color.fromARGB(255, 78, 13, 151),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You scored: $score/$totalQuestions',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: questionAnswers.length,
                itemBuilder: (ctx, index) {
                  final question = questionAnswers[index];
                  final userAnswer = question['userAnswer'] as String;
                  final correctAnswer = question['correctAnswer'] as String;
                  final isCorrect = userAnswer == correctAnswer;

                  return ListTile(
                    title: Text(
                      'Q${index + 1}: ${question['question']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Your Answer: $userAnswer\nCorrect Answer: $correctAnswer',
                      style: TextStyle(
                        color: isCorrect ? Colors.green : Colors.red,
                        fontSize: 16,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: isCorrect ? Colors.green : Colors.red,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Back to Start'),
            ),
          ],
        ),
      ),
    );
  }
}
