import 'question.dart';

class QuizzlerBrain {
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

  int _questionIndex = 0;

  void setQuestionIndex(int index) {
    _questionIndex = index;
  }

  void getNextQuestion() {
    if (_questionIndex < _questionBank.length) {
      _questionIndex++;
    }
  }

  void getQuestionContent() => _questionBank[_questionIndex];

  void getQuestionAnswer() => _questionBank[_questionIndex];
}
