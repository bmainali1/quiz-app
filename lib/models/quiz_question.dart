class QuizQuestion {
  const QuizQuestion(
    this.text,
    this.answers,
    this.correctAnswerIndex,
  );

  final String text;
  final List<String> answers;
  final int correctAnswerIndex;
}
