class QuizModel {
  final String quizTitle;
  final String quizDesc;
  final String quizId;

  QuizModel({
    required this.quizTitle, 
    required this.quizDesc, 
    required this.quizId
  });

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
