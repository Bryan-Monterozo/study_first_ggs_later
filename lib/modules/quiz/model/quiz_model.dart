// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizModel {
  final String quizTitle;
  final String quizDesc;
  final String quizId;

  QuizModel(
      {required this.quizTitle, required this.quizDesc, required this.quizId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quizTitle': quizTitle,
      'quizDesc': quizDesc,
      'quizId': quizId,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      quizTitle: map['quizTitle'] as String,
      quizDesc: map['quizDesc'] as String,
      quizId: map['quizId'] as String,
    );
  }
}

class QuestionModel {
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String quizId;
  final String questionId;

  QuestionModel({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.quizId,
    required this.questionId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'quizId': quizId,
      'questionId': questionId,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] as String,
      option1: map['option1'] as String,
      option2: map['option2'] as String,
      option3: map['option3'] as String,
      option4: map['option4'] as String,
      quizId: map['quizId'] as String,
      questionId: map['questionId'] as String,
    );
  }
}

class OptionModel {
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? correctOption;
  bool? answered;
  OptionModel({
    this.question,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.correctOption,
    this.answered,
  });
}
