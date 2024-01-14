import 'dart:js_util';

import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';

class PremadeQuiz {
  premadeQuizName(int x) {
    switch (x) {
      case 1:
        return 'General Mathematics';
      case 2:
        return 'General Sciences';
      case 3:
        return 'English';
      default:
        return 'Quiz Name';
    }
  }

  premadeQuizDesc(int x) {
    switch (x) {
      case 1:
        return 'This is a general mathematics quiz';
      case 2:
        return 'This is a general sciences quiz';
      case 3:
        return 'This is an English quiz';
      default:
        return 'Quiz Description';
    }
  }

  premadeQuestion(int x) {
    switch (x) {
      case 1:
        return 'Johnny Bee offered a 25% discount on all its food items.';
      case 2:
        return 'Decreasing a number by 40% and then decreasing the result by 30%';
      case 3:
        return 'Suppose that 48 workers can build a tower in 60 days.';
      default:
        return 'Question';
    }
  }

  premadeOptions(int x) {
    switch (x) {
      case 1:
        return [
          '140.00',
          '120.00',
          '150.00',
          '175.00',
        ];
      case 2:
        return [
          '140.00',
          '120.00',
          '150.00',
          '175.00',
        ];
      case 3:
        return [
          '140.00',
          '120.00',
          '150.00',
          '175.00',
        ];
      default:
        return [
          'Option 1',
          'Option 2',
          'Option 3',
          'Option 4',
        ];
    }
  }
}
