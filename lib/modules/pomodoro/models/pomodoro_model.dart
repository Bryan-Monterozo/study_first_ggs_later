class PomodoroModel {
  String title;
  String id;
  int minutesLong;
  int minutesShort;
  int minutesRunning;
  int secondsShort;
  int secondsLong;
  int secondsRunning;
  PomodoroModel({
    required this.title,
    required this.id,
    required this.minutesLong,
    required this.minutesShort,
    required this.minutesRunning,
    required this.secondsShort,
    required this.secondsLong,
    required this.secondsRunning,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'minutesLong': minutesLong,
      'minutesShort': minutesShort,
      'minutesRunning': minutesRunning,
      'secondsShort': secondsShort,
      'secondsLong': secondsLong,
      'secondsRunning': secondsRunning,
    };
  }

  factory PomodoroModel.fromMap(Map<String, dynamic> map) {
    return PomodoroModel(
      title: map['title'] as String,
      id: map['id'] as String,
      minutesLong: map['minutesLong'] as int,
      minutesShort: map['minutesShort'] as int,
      minutesRunning: map['minutesRunning'] as int,
      secondsShort: map['secondsShort'] as int,
      secondsLong: map['secondsLong'] as int,
      secondsRunning: map['secondsRunning'] as int,
    );
  }
}
