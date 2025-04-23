class Question {
  final String question;
  final String type;
  final List<String>? options;
  final dynamic answer;

  Question({
    required this.question,
    required this.type,
    this.options,
    this.answer,
  });
}
