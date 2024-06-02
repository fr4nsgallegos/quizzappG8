import 'package:quizz_app/pages/models/question_model.dart';

class QuizBrain {
  List<QuestionModel> questionList = [
    QuestionModel(question: "¿El hombre llegó a la luna?", answer: true),
    QuestionModel(question: "¿Has almorzado hoy?", answer: false),
    QuestionModel(question: "¿Sientes frio?", answer: false),
    QuestionModel(question: "¿Saliste ayer?", answer: false),
    QuestionModel(question: "¿Has desayunado?", answer: true),
  ];
  int questionIndex = 0;

  String getQuestionText() {
    return questionList[questionIndex].question;
  }

  bool getQuestionAnswer() {
    return questionList[questionIndex].answer;
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    }
  }
}