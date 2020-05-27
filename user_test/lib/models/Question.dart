import 'package:flutter/foundation.dart';

class Question {
  final String title;
  final List<Map> answers;

  Question({@required this.title, @required this.answers});
}

class QuestionData {
  final _data = [
    Question(
      title: 'Кем хочеш стать?',
      answers: [
        { 'answer': 'Врачом' },
        { 'answer': 'Учителем', 'isCorrect': 1 },
        { 'answer': 'Полицейским' },
        { 'answer': 'Вором' }
      ]
    ),
    Question(
      title: 'Какое любимое животное?',
      answers: [
        { 'answer': 'Кошка' },
        { 'answer': 'Собака', 'isCorrect': 1 },
        { 'answer': 'Хомяк' },
        { 'answer': 'Слон' }
      ]
    )
  ];
  List<Question> get questions => [..._data];
}