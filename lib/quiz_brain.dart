import 'question.dart';

class QuizBrain{

  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(text: 'Masjid pertama yang dibangun Rasulullah adalah Masjid Nabawi', answer:false),
    Question(text: 'A Slug\'s blood is green', answer:false),
    Question(text: '2(x+y) = 2x+2y', answer:true),
    Question(text: 'Yang termasuk Rasul Ulul Azmi adalah Nabi Nuh, Ibrahim, Musa, Isa, dan Muhammad', answer:true),
    Question(text: 'Luas Persegi Panjang adalah Panjang x Lebar', answer:true),
    Question(text: 'Tanggal lahir saya adalah 9 Agustus', answer:false),
    Question(text: 'Mengkerutnya kulit ketika berenang terlalu lama dinamanakan Krenasi', answer:true),
    Question(text: 'Presiden pertama Indonesia adalah Soeharto', answer:false),
  ];

  void nexQuestion(){
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      _questionBank.length;
    }
    print(_questionNumber);
    print(_questionBank.length);
  }

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished(){
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    } 
  }

  void reset(){
    _questionNumber = 0;
  }

}