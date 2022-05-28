import 'question.dart';

class QuizzerBrain {
  int _index = 0;

  final List<Question> _questionBank = [
    Question(content: "Question 1", answer: true),
    Question(content: "Question 2", answer: false),
    Question(content: "Question 3", answer: true),
    Question(content: "Question 4", answer: false),
    Question(content: "Question 5", answer: false),
    Question(content: "Question 6", answer: true),
    Question(content: "Question 7", answer: false),
    Question(content: "Question 8", answer: true),
    Question(content: "Question 9", answer: true),
    Question(content: "Question 10", answer: false),
  ];

  bool isLastQuestion() {
    return _index == _questionBank.length - 1;
  }

  void nextQuestion() {
    _index++;
  }

  void resetIndex() {
    _index = 0;
  }

  String getQuestionContent() => _questionBank[_index].content;

  bool getQuestionAnswer() => _questionBank[_index].answer;
}
