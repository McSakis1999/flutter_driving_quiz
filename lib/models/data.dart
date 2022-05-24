class Answer {
  static int _nextId = 0;
  int id = -1;
  String text = '';
  bool isTrue = false;

  //getters
  String get A_text {
    return text;
  }

  int get A_id {
    return id;
  }

  bool get A_isTrue {
    return isTrue;
  }

  //constructor
  Answer(String text, bool isTrue) {
    this.id = ++_nextId;
    this.text = text;
    this.isTrue = isTrue;
  }
}

class Question {
  //fields
  static int _nextId = 0;
  int id = -1;
  String category = '-1';
  String text = '';
  List<Answer> answers = [];

  //getters
  String get Q_text {
    return text;
  }

  String? get Q_category {
    return _categories[category];
  }

  String get Raw_category {
    return category;
  }

  int get Q_id {
    return id;
  }

  List get Q_answers {
    return answers;
  }

  //constructors
  Question(String category, String text, List<Answer> answers) {
    this.id = ++_nextId; // Αυτόματη αύξηση id για προστασία από λογικά λάθη
    this.category = category;
    this.text = text;
    this.answers = answers;
  }
}

final _categories = {"-1": "Δεν βρέθηκε κατηγορια", "1": "Όργανα του οχήματος"};

var questions = [
  Question(
      '1',
      'Το δικτυωτό σκαρίφημα στο μοχλό αλλαγής των ταχυτήτων είναι όμοιο σε όλα τα οχήματα:',
      [Answer('ΝΑΙ', false), Answer('ΟΧΙ', true)]),
  Question(
      '1', 'Μεταξύ των οργάνων της αναρτήσεως, οι αποσβεστήρες(αμορτισέρ):', [
    Answer('Εξασφαλίζουν μόνο την άνεση των επιβατών', false),
    Answer('Εγγυώνται κυρίως τη σωστή επαφή των τροχών με το οδόστρωμα', true)
  ])
];
