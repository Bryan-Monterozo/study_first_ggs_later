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
      case 101:
        return 'As part of its 25th anniversary, Johnny Bee offered a 25% discount on all its food items. Aling Julia ordered three chicken combo meals and paid Php 315.00. What is the original price of a chicken combo meal (in Php)?';
      case 102:
        return 'Decreasing a number by 40% and then decreasing the result by 30% is the same as decreasing the original number by what percent?';
      case 103:
        return 'Suppose that 48 workers can build a tower in 60 days. How many more workers should be hired so that the tower can be finished 24 days earlier?';
      case 104:
        return "Don Facundo decides to split his assets between his two sons; Egbert and Leonardo in the ratio 8 : 1 7. If Leonardo receives Php 144 000 000 more than Egbert, how much is Don Facundo's total assets?";
      case 105:
        return 'If A = {l, 3, 5, 7, 9}, B = {5, 6, 7, 8, 9}, and C = {l, 2, 3, 5, 7}, find A n B n C.';
      case 106:
        return 'Simplify: (x + x + x · x) · x';
      case 107:
        return 'The sum of two consecutive odd integers is less than 100. Find the biggest possible pair.';
      case 108:
        return "Uncle Lorenzo is 7 times as old as Pipo. In 4 years, he will be 5 times as old as Pipo. What will be Uncle Lorenzo's age next year?";
      case 109:
        return "According to Newton's Universal Law of Gravitation, the force of attraction between two objects with fixed mass is inversely proportional to the square of the distance between them. What happens to the force of attraction between the two objects if the distance between them is halved?";
      case 110:
        return 'The diagonal of a rectangle is 26 cm long. If the length of the rectangle is 4 cm more than twice its width, find its perimeter.';
      case 111:
        return 'Donkey Donuts has 7 different flavor of doughnuts. Romeo and Juliet went to Donkey Donuts to each buy a doughnut. In how many ways can they select the doughnuts to buy such that they will not pick doughnuts with the same flavor?';
      case 112:
        return 'A 4 member fact-finding committee is to be established by selecting members from a team consisting of 6 senators. In how many ways can the members of the committee be selected?';
      case 113:
        return 'Judy went on a vacation, and drove her car to Abra. At first, her car contained 50 L of gasoline. After driving for 4 hours, she found out that she had already consumed 30 L of gasoline. Which function describes the amount of gasoline remaining in the car after driving for t hours?';
      case 114:
        return 'Evaluate the sum: 1 + 2 + 4 + 8 + ... + 1024';
      case 115:
        return 'Two dice were rolled. What is the probability that the positive difference of the rolls is at least 3?';
      case 201:
        return 'The scientific method is a systematic way of solving a problem. Which stage in the scientific method uses background knowledge to provide a temporary explanation to a problem?';
      case 202:
        return 'Temperature is a measure of the average kinetic energy of the particles in a matter. What is the standard unit of measurement for temperature?';
      case 203:
        return 'How many milligrams are there in 5.78 decigrams?';
      case 204:
        return 'Significant figures are important part of scientific and mathematical calculations because they deal with the accuracy and precision of numbers. How many significant figures are there in 507.000 m/s?';
      case 205:
        return 'What is the standard form of 6.7 x 10^-5 ?';
      case 206:
        return "What do you call the branch of Science that studies the Earth's interior and composition?";
      case 207:
        return "Gas-riched magma reached Pinatubo's surface on June 15, 1991. The volcano exploded in a violent eruption that ejected more than 1 cubic mile of material. What type of rock can possibly be the classification of the debris from the last eruption of Mt. Pinatubo classified?";
      case 208:
        return 'An earthquake occurred in a city, with a reported strength of 5.7 magnitude. Which instrument is used to measure such earthquake movement?';
      case 209:
        return 'The atmosphere is an important part of what makes Earth liveable. In which layer of the atmosphere do weather disturbances probably occur?';
      case 210:
        return 'DOST researchers are planning to set up a location that will measure the relative humidity of rural regions. What instrument should they use?';
      case 211:
        return 'Energy is broadly classified into two main groups: renewable and non-renewable. Which is not an example of non-renewable Energy?';
      case 212:
        return 'An eclipse occurs when an object or any celestial body hinders the light of another illuminating object or celestial body. What do you call the type of eclipse when the Moon is in between the Earth and Sun?';
      case 213:
        return "Which is not influenced by the Earth's Revolution?";
      case 214:
        return "What do you call the fragment of a comet or an asteroid that has entered the Earth's Atmosphere?";
      case 215:
        return 'A plant cell is a eukaryotic cell that shares some characteristics with that of an animal cell. Which organelle is not included in a plant cell?';
      case 301:
        return 'Which sentence uses “famish”?';
      case 302:
        return 'Priscila _______ rather not invest her savings in the stock market.';
      case 303:
        return 'Did you have any problem ______ our house?';
      case 304:
        return "I hope you don’t mind _____ joining you.";
      case 305:
        return 'Most basketball players are 6 ____ tall or more.';
      case 306:
        return 'These children _____ how to improvise more props for the play.';
      case 307:
        return 'The company will upgrade ______ computer systems next week.';
      case 308:
        return 'Clara ___________ three thousand words for her essay.';
      case 309:
        return "You have too many _______ but few time to prove you’re right.";
      case 310:
        return 'Neither Sarah nor Tina _______ the crime yesterday.';
      case 311:
        return 'You do like going to the party alone. _____ you?';
      case 312:
        return 'We had our house _______ in yellow.';
      case 313:
        return 'He has been exercising but his immune system was steadily _________.';
      case 314:
        return 'I was ______ that the weather would be sunny and we would be able to enjoy our swimming.';
      case 315:
        return 'I think it’s not a great idea. I totally ______.';
      default:
        return 'Question';
    }
  }

  premadeOptions(int x) {
    switch (x) {
      case 101:
        return [
          '140.00',
          '120.00',
          '150.00',
          '175.00',
        ];
      case 102:
        return [
          '58',
          '70',
          '42',
          '35',
        ];
      case 103:
        return [
          '32',
          '54',
          '80',
          '120',
        ];
      case 104:
        return [
          '400 000 000',
          '500 000 000',
          '480 000 000',
          '450 000 000',
        ];
      case 105:
        return [
          '{5, 7}',
          '{1, 2, 7, 9}',
          '{1, 2, 3, 5, 6, 7, 8, 9}',
          '0',
        ];
      case 106:
        return [
          '2x^2 + x^3',
          '3x^3',
          '3x^2',
          '2x^4',
        ];
      case 107:
        return [
          '47 and 49',
          '48 and 50',
          '49 and 51',
          '51 and 53',
        ];
      case 108:
        return [
          '57',
          '56',
          '64',
          '60',
        ];
      case 109:
        return [
          'The force is quadrupled',
          'The force is doubled',
          'The force is halved',
          'The force is divided by 4',
        ];
      case 110:
        return [
          '68 cm',
          '34 cm',
          '48 cm',
          '80 cm',
        ];
      case 111:
        return [
          '42',
          '21',
          '49',
          '56',
        ];
      case 112:
        return [
          '15',
          '4',
          '360',
          '24',
        ];
      case 113:
        return [
          'f(t) = 50 - (15/2)t',
          'f(t) = 50 - 5t',
          'f(t) = 5t - 50',
          'f(t) = 50 - (1/5)t',
        ];
      case 114:
        return [
          '2047',
          '2048',
          '4096',
          '1039',
        ];
      case 115:
        return [
          '1/3',
          '1/6',
          '1/4',
          '2/3',
        ];
      case 201:
        return [
          'Hypothesis',
          'Problem',
          'Conclusion',
          'Independent Variable',
        ];
      case 202:
        return [
          'Kelvin',
          'Calories',
          'Fahrenheit',
          'Celsius',
        ];
      case 203:
        return [
          '578',
          '0.0578',
          '0.578',
          '57.8',
        ];
      case 204:
        return [
          '6',
          '2',
          '3',
          '4',
        ];
      case 205:
        return [
          '0.000067',
          '0.0067',
          '670 000',
          '670',
        ];
      case 206:
        return [
          'Geology',
          'Biology',
          'Chemistry',
          'Physics',
        ];
      case 207:
        return [
          'Igneous',
          'Metamorphic',
          'Limestone',
          'Sedimentary',
        ];
      case 208:
        return [
          'Richter Scale',
          'Intensity',
          'Mercalli Scale',
          'Seismograph',
        ];
      case 209:
        return [
          'troposphere',
          'stratosphere',
          'exosphere',
          'thermosphere',
        ];
      case 210:
        return [
          'Hygrometer',
          'Wind Vane',
          'Thermometer',
          'Anemometer',
        ];
      case 211:
        return [
          'Wind',
          'Coal',
          'Fossil Fuel',
          'Oil',
        ];
      case 212:
        return [
          'Solar',
          'Lunar',
          'Low Tide',
          'High Tide',
        ];
      case 213:
        return [
          'Occurence of day and night',
          'Occurence of 365.25 days in a year',
          'Presence of different constellation within a year',
          'Different seasons throughout the globe',
        ];
      case 214:
        return [
          'Meteor',
          'Meteorite',
          'Meteoroid',
          'Asteroid Belt',
        ];
      case 215:
        return [
          'Centriole',
          'Chloroplast',
          'Nuclear Membrane',
          'Lysosome',
        ];
      case 301:
        return [
          'After the straight exam, I felt too exhausted and famished to eat my favourite foods.',
          'I could eat a horse, I am famish now.',
          'I famished my stomach next time you treat me to a meal out.',
          'I will bring lots of pizza, that’s a famish.',
        ];
      case 302:
        return [
          'would',
          'has to',
          'could',
          'must',
        ];
      case 303:
        return [
          'searching',
          'search',
          'to search',
          'for searching',
        ];
      case 304:
        return [
          'my',
          'to be',
          'I had been',
          'that I may',
        ];
      case 305:
        return [
          'feet',
          'foot',
          'foots',
          'feets',
        ];
      case 306:
        return [
          'know',
          'knew',
          'knows',
          'known',
        ];
      case 307:
        return [
          'its',
          'there',
          'their',
          "it's",
        ];
      case 308:
        return [
          'has written',
          'have wrote',
          'has wrote',
          'have written',
        ];
      case 309:
        return [
          'hypotheses',
          'hypothesis',
          'hypothesises',
          'hypostasis',
        ];
      case 310:
        return [
          'witnessed',
          'witness',
          'witnesses',
          'Witnessing',
        ];
      case 311:
        return [
          "Don't",
          'Does',
          'Do',
          "Doesn't",
        ];
      case 312:
        return [
          'painted',
          'painting',
          'paint',
          'to paint',
        ];
      case 313:
        return [
          'weakening',
          'weak',
          'weaken',
          'weakened',
        ];
      case 314:
        return [
          'hopeful',
          'hopeless',
          'hopelike',
          'hopely',
        ];
      case 315:
        return [
          'disagree',
          'inagree',
          'unagree',
          'misagree',
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
