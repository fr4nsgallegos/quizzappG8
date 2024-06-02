import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatelessWidget {
  List<Map<String, dynamic>> questionsList = [
    {"question": "¿El hombre llegó a la luna?", "asnwer": true},
    {"question": "¿Has almorzado hoy?", "asnwer": false},
    {"question": "¿Sientes frio?", "asnwer": false},
    {"question": "¿Saliste ayer?", "asnwer": false},
    {"question": "¿Has desayunado?", "asnwer": true},
  ];

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
                  "Esta es la pregunta",
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
                    Alert(
                        context: context,
                        type: AlertType.error,
                        title: "QuizApp",
                        desc: "Esta es la descipción dl quizz",
                        buttons: [
                          DialogButton(child: Text("ok"), onPressed: () {}),
                          DialogButton(child: Text("ok"), onPressed: () {}),
                          DialogButton(child: Text("ok"), onPressed: () {}),
                        ]).show();
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       title: Text("Alerta"),
                    //       content: Text("Hola este es el cuerpo de la alerta"),
                    //       actions: [
                    //         TextButton(
                    //           onPressed: () {},
                    //           child: Text("OK"),
                    //         )
                    //       ],
                    //     );
                    //   },
                    // );
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
                  onPressed: () {},
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
