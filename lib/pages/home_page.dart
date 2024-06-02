import 'package:flutter/material.dart';
import 'package:quizz_app/quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();
  List<Widget> score = [];

  void checkAnwer(bool userAnswer, String numberQuestion) {
    if (quizBrain.isFinished() == true) {
      Alert(
          context: context,
          type: AlertType.error,
          title: "QuizApp",
          desc: "El cuestionario ha llegado a su fin",
          buttons: [
            DialogButton(
                child: Text("Aceptar"),
                onPressed: () {
                  quizBrain.restarQuizz();
                  score.clear();
                  Navigator.pop(context);
                  setState(() {});
                }),
          ]).show();
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
    } else {
      bool correctAnswer = quizBrain.getQuestionAnswer();
      if (correctAnswer == userAnswer) {
        score.add(itemScore(numberQuestion, true));
        print("Si es correcto");
      } else {
        score.add(itemScore(numberQuestion, false));
        print("INCORRECTO");
      }
      quizBrain.nextQuestion();
      setState(() {});
    }
  }

  Widget itemScore(String numberQuestion, bool isCorrect) {
    return Row(
      children: [
        Text(
          "$numberQuestion: ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        ),
      ],
    );
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
                    checkAnwer(true, quizBrain.getAnswerNumber());
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
                    checkAnwer(false, quizBrain.getAnswerNumber());
                  },
                  color: Colors.redAccent,
                  child: Text("false"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            )
          ],
        ),
      ),
    );
  }
}
