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
  bool hasImage = false;
  int id = -1;
  String category = '-1';
  String text = '';
  List<Answer> answers = [];

  //getters
  String get Q_text {
    return text;
  }

  bool get Q_hasImage {
    return hasImage;
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
  Question(String category, bool hasImage, String text, List<Answer> answers) {
    this.id = ++_nextId; // Αυτόματη αύξηση id για προστασία από λογικά λάθη
    this.category = category;
    this.hasImage = hasImage;
    this.text = text;
    this.answers = answers;
  }
}

final _categories = {
  "-1": "Δεν βρέθηκε κατηγορια",
  "1": "ΤΑ ΚΥΡΙΑ ΟΡΓΑΝΑ ΤΟΥ ΟΧΗΜΑΤΟΣ ΚΑΙ ΤΑ ΧΕΙΡΙΣΤΗΡΙΑ ΣΤΟ ΧΩΡΟ ΟΔΗΓΗΣΕΩΣ",
  "2": "Η ΕΓΚΑΤΑΣΤΑΣΗ ΣΤΗ ΘΕΣΗ ΤΟΥ ΟΔΗΓΟΥ",
  "3": "Η ΣΗΜΑΝΣΗ",
  "4": "ΟΙ ΔΙΑΣΤΑΥΡΩΣΕΙΣ",
  "5": "Η ΤΑΧΥΤΗΤΑ",
  "6": "Η ΘΕΣΗ ΣΤΟ ΟΔΟΣΤΡΩΜΑ",
  "7": "ΟΙ ΑΠΟΣΤΑΣΕΙΣ ΑΣΦΑΛΕΙΑΣ",
  "8": "ΣΤΑΣΗ ΚΑΙ ΣΤΑΘΜΕΥΣΗ",
  "9": "ΔΙΑΣΤΑΥΡΩΝΕΣΤΕ, ΠΡΟΣΠΕΡΝΑΤΕ, ΣΑΣ ΠΡΟΣΠΕΡΝΟΥΝ",
  "10": "ΟΙ ΣΤΡΟΦΕΣ",
  "11": "Η ΣΥΝΗΠΑΡΞΗ ΜΕ ΤΟΥΣ ΑΛΛΟΥΣ ΧΡΗΣΤΕΣ ΤΗΣ ΟΔΟΥ",
  "12": "ΑΚΟΛΟΥΘΩΝΤΑΣ ΜΙΑ ΔΙΑΔΡΟΜΗ",
  "13": "ΤΟ ΑΛΚΟΟΛ ΚΑΙ ΑΛΛΕΣ ΧΗΜΙΚΕΣ ΟΥΣΙΕΣ, ΦΑΡΜΑΚΑ",
  "14": "Η ΕΙΣΟΔΟΣ ΣΤΗΝ ΚΥΚΛΟΦΟΡΙΑ",
  "15": "Ο ΑΥΤΟΚΙΝΗΤΟΔΡΟΜΟΣ",
  "16": "Η ΟΔΗΓΗΣΗ ΜΕ ΠΕΡΙΟΡΙΣΜΕΝΗ ΟΡΑΤΟΤΗΤΑ",
  "17": "ΟΔΗΓΩΝΤΑΣ ΜΕ ΜΕΙΩΜΕΝΗ ΠΡΟΣΦΥΣΗ",
  "18": "ΟΔΗΓΗΣΗ ΣΕ ΒΟΥΝΟ",
  "19": "Η ΚΟΥΡΑΣΗ ΚΑΙ Η ΕΤΟΙΜΟΤΗΤΑ",
  "20": "Η ΣΥΜΠΕΡΙΦΟΡΑ ΣΕ ΑΤΗΧΥΜΑ",
  "21": "ΣΥΝΤΗΡΗΣΗ ΚΑΙ ΕΠΙΣΚΕΥΗ",
  "22": "ΟΙ ΕΚΤΑΚΤΕΣ ΚΑΤΑΣΤΑΣΕΙΣ",
  "23": "ΠΡΟΣΤΑΣΙΑ ΠΕΡΙΒΑΛΛΟΝΤΟΣ - ΕΞΟΙΚΟΝΟΜΗΣΗ ΕΝΕΡΓΕΙΑΣ",
};

List questions = [
  Question(
      '1',
      true,
      'Το δικτυωτό σκαρίφημα στο μοχλό αλλαγής των ταχυτήτων είναι όμοιο σε όλα τα οχήματα:',
      [Answer('ΝΑΙ', false), Answer('ΟΧΙ', true)]),
  Question('1', true,
      'Μεταξύ των οργάνων της αναρτήσεως, οι αποσβεστήρες(αμορτισέρ):', [
    Answer('Εξασφαλίζουν μόνο την άνεση των επιβατών', false),
    Answer('Εγγυώνται κυρίως τη σωστή επαφή των τροχών με το οδόστρωμα', true)
  ])
];
