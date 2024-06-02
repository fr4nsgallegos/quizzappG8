import 'package:flutter/material.dart';
import 'package:quizz_app/quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();

  void checkAnwer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    if (correctAnswer == userAnswer) {
      print("Si es correcto");
    } else {
      print("INCORRECTO");
    }
    quizBrain.nextQuestion();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B2E42),
      appBar: AppBar(
        title: Text("Quizz App"),
        centerTitle: true,
        backgroundColor: Color(0xff2B2E42),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    checkAnwer(true);
                    // Alert(
                    //     context: context,
                    //     type: AlertType.error,
                    //     title: "QuizApp",
                    //     desc: "Esta es la descipción dl quizz",
                    //     buttons: [
                    //       DialogButton(child: Text("ok"), onPressed: () {}),
                    //       DialogButton(child: Text("ok"), onPressed: () {}),
                    //       DialogButton(child: Text("ok"), onPressed: () {}),
                    //     ]).show();
                    // // showDialog(
                    // //   context: context,
                    // //   builder: (BuildContext context) {
                    // //     return AlertDialog(
                    // //       title: Text("Alerta"),
                    // //       content: Text("Hola este es el cuerpo de la alerta"),
                    // //       actions: [
                    // //         TextButton(
                    // //           onPressed: () {},
                    // //           child: Text("OK"),
                    // //         )
                    // //       ],
                    // //     );
                    // //   },
                    // // );
                  },
                  color: Colors.greenAccent,
                  child: Text("Verdadero"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    checkAnwer(false);
                  },
                  color: Colors.redAccent,
                  child: Text("false"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
