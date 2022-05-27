import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Quizzler",
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

  Icon trueIcon() {
    return const Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Icon falseIcon() {
    return const Icon(
      Icons.check,
      color: Colors.red,
    );
  }

  void init() {
    setState(() {
      scoreKeeper = [];
    });
  }

  void addTrueIconToScoreKeeper() {
    setState(() {
      scoreKeeper.add(trueIcon());
    });
  }

  void addFalseIconToScoreKeeper() {
    setState(() {
      scoreKeeper.add(falseIcon());
    });
  }

  void onTruePressed() {
    addTrueIconToScoreKeeper();
  }

  void onFalsePressed() {
    addFalseIconToScoreKeeper();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 17,
          child: Container(
            // height: double.infinity,
            // width: double.infinity,
            color: Colors.blueGrey,
            child: const Center(
              child: Text(
                "Question content",
                style: TextStyle(
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
                padding: EdgeInsets.all(0),
                onPressed: () {},
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
                padding: EdgeInsets.all(0),
                onPressed: () {},
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
