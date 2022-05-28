import 'package:flutter/material.dart';
import 'quizzer_brain.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Quizzer",
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> scoreKeeper = [];
  QuizzerBrain questionBrain = QuizzerBrain();

  Icon TrueIcon() {
    return const Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Icon FalseIcon() {
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  void onReset() {
    setState(() {
      // questionBrain.resetIndex();
      scoreKeeper = [];
    });
  }

  void addTrueIconToScoreKeeper() {
    setState(() {
      scoreKeeper.add(TrueIcon());
    });
  }

  void addFalseIconToScoreKeeper() {
    setState(() {
      scoreKeeper.add(FalseIcon());
    });
  }

  void onProcessDisplayAnswer({required bool userAnswer}) {
    bool result = onCheckUserAnswer(userAnswer: userAnswer);
    result ? addTrueIconToScoreKeeper() : addFalseIconToScoreKeeper();
  }

  void onButtonPressed({required bool userAnswer}) {
    if (!questionBrain.isLastQuestion()) {
      onProcessDisplayAnswer(userAnswer: userAnswer);
      questionBrain.nextQuestion();
    } else {
      onProcessDisplayAnswer(userAnswer: userAnswer);
      questionBrain.resetIndex();
    }
    if (scoreKeeper.length == 10) {
      onReset();
    }
  }

  bool onCheckUserAnswer({required bool userAnswer}) {
    bool theAnswer = questionBrain.getQuestionAnswer();
    return userAnswer == theAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 17,
          child: Container(
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                questionBrain.getQuestionContent(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(children: [
            Expanded(
              flex: 1,
              child: FlatButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  onButtonPressed(userAnswer: true);
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "True",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  onButtonPressed(userAnswer: false);
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
