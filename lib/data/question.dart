import 'package:quiz_app/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    "What is the capital of France?",
    ['Berlin', 'Madrid', 'Paris', 'Rome'],
    2, // Correct answer is Paris
  ),
  QuizQuestion(
    "What is the largest planet in our solar system?",
    ['Earth', 'Jupiter', 'Saturn', 'Mars'],
    1, // Correct answer is Jupiter
  ),
  QuizQuestion(
    "What is the square root of 64?",
    ['6', '7', '8', '9'],
    2, // Correct answer is 8
  ),
  QuizQuestion(
    "What is the boiling point of water?",
    ['90°C', '100°C', '110°C', '120°C'],
    1, // Correct answer is 100°C
  ),
  QuizQuestion(
    "Who wrote 'Macbeth'?",
    ['Shakespeare', 'Dickens', 'Hemingway', 'Austen'],
    0, // Correct answer is Shakespeare
  ),
  QuizQuestion(
    "What is the chemical symbol for gold?",
    ['Au', 'Ag', 'Pb', 'Fe'],
    0, // Correct answer is Au
  ),
];
