class PremadeDeck {
  premadeDeckName(int x) {
    switch (x) {
      case 1:
        return 'Random';
      case 2:
        return 'Math';
      case 3:
        return 'Science';
      case 4:
        return 'Geography';
      default:
        return 'Deck Name';
    }
  }

  premadeDeckDesc(int x) {
    switch (x) {
      case 1:
        return 'This is a randomized topic flash cards';
      case 2:
        return 'This is a mathematics topic flash cards';
      case 3:
        return 'This is a science topic flash cards';
      case 4:
        return 'This is a geography topic flash cards';
      default:
        return 'Deck Description';
    }
  }

  premadeCardFront(int x) {
    switch (x) {
      case 101:
        return 'What is the capital of Australia?';
      case 102:
        return 'Who painted the Mona Lisa?';
      case 103:
        return 'Which planet is known as the "Red Planet"?';
      case 104:
        return 'What is the value of pi?';
      case 105:
        return 'Value of cos 360°? ';
      case 201:
        return 'How many digits are there in the hindu-arabic system?';
      case 202:
        return 'An integer that is divisible by 2 is called?';
      case 203:
        return 'What is the formula for finding the perimeter of a rectangle?';
      case 204:
        return 'What is the formula for calculating the area of a rectangle?';
      case 205:
        return 'It is the numerical value or ratio expressed as a fraction of 100.';
      case 301:
        return 'Which stage in the scientific method uses background knowledge to provide a temporary explanation of a problem?';
      case 302:
        return 'It is the standard unit of measurement for temperature';
      case 303:
        return 'In which layer of the atmosphere do weather disturbances probably occur?';
      case 304:
        return 'Which instrument is used to measure such earthquake movement?';
      case 305:
        return 'It is the branch of science concerned with classification, especially of organisms; systematics.';
      case 401:
        return 'What is the only continent with land in all four hemispheres?';
      case 402:
        return 'Which river flows through the Grand Canyon?';
      case 403:
        return 'Where is Angel Falls, the world’s largest waterfall, located?';
      case 404:
        return 'What is the state capital of New York?';
      case 405:
        return 'On what continent would you find the world’s largest desert?';
      default:
        return 'Card Front';
    }
  }

  premadeCardBack(int x) {
    switch (x) {
      case 101:
        return 'Canberra';
      case 102:
        return 'Leonardo da Vinci';
      case 103:
        return 'Mars';
      case 104:
        return '3.14159';
      case 105:
        return '1';
      case 201:
        return '10 - 0 1 2 3 4 5 6 7 8 9';
      case 202:
        return 'Even number';
      case 203:
        return '2(l+w); l = length; w = width';
      case 204:
        return 'l x w; l = length; w = width';
      case 205:
        return 'Percentage';
      case 301:
        return 'Hypothesis';
      case 302:
        return 'Kelvin';
      case 303:
        return 'Troposphere';
      case 304:
        return 'Richter Scale';
      case 305:
        return 'Taxonomy';
      case 401:
        return 'Africa';
      case 402:
        return 'Colorado River';
      case 403:
        return 'Venezuela';
      case 404:
        return 'Albany';
      case 405:
        return 'Antarctica';
      default:
        return 'Card Back';
    }
  }
}