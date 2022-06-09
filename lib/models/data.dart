import 'dart:math' show Random;

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
  static Map<String, int> _nextImageId = {};
  bool hasImage = false;
  int id = -1;
  int imageId = -1;
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

  String get Q_imagePath {
    return 'assets/quizImgs/${category}.${imageId}.jpg';
  }

  int get Q_id {
    return id;
  }

  List<Answer> get Q_answers {
    return answers;
  }

  //constructors
  Question(String category, bool hasImage, String text, List<Answer> answers) {
    this.id = ++_nextId; // Αυτόματη αύξηση id για προστασία από λογικά λάθη
    this.category = category;

    //Αυξηση counter φωτογραφιας ανα κατηγορια (1.1/1.2...2.1/2.2 etc)
    if (_nextImageId[this.category] == null) {
      _nextImageId[this.category] = 0;
    }
    if (hasImage) {
      _nextImageId[this.category] = _nextImageId[this.category]! + 1;
      this.imageId = _nextImageId[this.category]!;
    }
    this.hasImage = hasImage;
    this.text = text;
    this.answers = answers;
  }
  bool checkIfTrue(String answer_id) {
    for (Answer answer in answers) {
      if (answer.A_id.toString() == answer_id) {
        return answer.A_isTrue; //answer.A_isTrue ?? false
      }
    }
    return false;
  }

  String getRightAnswer() {
    for (Answer answer in answers) {
      if (answer.A_isTrue == true) return answer.A_text;
    }
    return '';
  }
}

final Map<String, String> _categories = {
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

final Map<String, String> categoriesImages = {
  "1": "assets/carIcons/026-car pedals.png",
  "2": "assets/carIcons/040-steering wheel.png",
  "3": "assets/carIcons/023-forbidden.png",
  "4": "assets/carIcons/005-traffic light.png",
  "5": "assets/carIcons/006-speedometer.png",
  "6": "assets/carIcons/017-road.png",
};
// Question('2', true, '', [Answer('', false), Answer('', false), Answer('', false)]),

List<Question> c1 = [
  Question(
      '1',
      false,
      'Οδηγείτε με την 4η ταχύτητα, ο κινητήρας δυσκολεύεται (σκορτσάρει) και κινδυνεύει να σταματήσει εντελώς τότε:',
      [
        Answer('Περνάτε στην 3η ταχύτητα.', true),
        Answer('Περνάτε στην 5η ταχύτητα.', false)
      ]),
  Question(
      '1',
      false,
      'Εάν συγκρίνετε το τιμόνι με την αριθμημένη οθόνη ενός ωρολογίου με δείκτες, η σωστή θέση των χεριών, σε ευθεία πορεία, τοποθετείται στις',
      [
        Answer('Εννέα και τέταρτο ως δέκα και δέκα.', true),
        Answer('Εννέα.', false),
        Answer('Εντεκα και πέντε.', false)
      ]),
  Question(
      '1', false, 'Οταν περιμένετε να ανάψει το πράσινο φως του σηματοδότη:', [
    Answer(
        'Εχετε «βάλει» την 1η ταχύτητα και πιέζετε τον ποδομοχλό του συμπλέκτη.',
        false),
    Answer(
        'Εχετε το μοχλό ταχυτήτων στη «νεκρά» και πιέζετε τον ποδομοχλό της πέδης (φρένο).',
        true),
    Answer(
        'Εχετε το μοχλό ταχυτήτων στη «νεκρά» και πιέζετε τον ποδομοχλό του συμπλέκτη.',
        false)
  ]),
  Question(
      '1',
      false,
      'Σε ποιες περιπτώσεις έχετε υποχρέωση να χρησιμοποιήσετε τους δείκτες αλλαγής κατευθύνσεως (φλας) του οχήματός σας:',
      [
        Answer(
            'Μόνο όταν έχετε πρόθεση να αλλάξετε κατεύθυνση προς τα αριστερά.',
            false),
        Answer(
            'Μόνο όταν έχετε πρόθεση να αλλάξετε λωρίδα κυκλοφορίας ή κατεύθυνση.',
            false),
        Answer('Πριν από κάθε αλλαγή κατευθύνσεως ή ελιγμό.', true)
      ]),
  Question(
      '1',
      false,
      'Σε κανονική πορεία που δεν απαιτείται συχνή αλλαγή ταχυτήτων, το αριστερό πόδι:',
      [
        Answer(
            'Παραμένει πάνω στον ποδομοχλό του συμπλέχτη χωρίς να τον πιέζει.',
            false),
        Answer('Μένει ακίνητο απέναντι από τον ποδομοχλό.', false),
        Answer('Μένει ακίνητο στα αριστερά του ποδομοχλού.', true)
      ]),
  Question(
      '1',
      false,
      'Πώς µπορείτε να μεταφέρετε κατά το δυνατόν ασφαλέστερα µε το επιβατηγό σας αυτοκίνητο ένα μικρό παιδί:',
      [
        Answer('Στη θέση του συνοδηγού.', false),
        Answer(
            'Στην αγκαλιά ενός προσώπου που κάθεταιστο εμπρός κάθισμα.', false),
        Answer(
            ' Στο πίσω κάθισμα, σε ένα εγκεκριµµένου τύπου, για το σκοπό αυτό, παιδικό κάθισμα. ',
            true)
      ]),
  Question(
      '1',
      false,
      'Τι µπορεί να συμβεί, εάν επιβάτες που κάθονται στο πίσω κάθισμα, δεν χρησιμοποιούν τις υπάρχουσες ζώνες ασφαλείας:',
      [
        Answer(
            'Σε µία σύγκρουση δημιουργούν για τον οδηγό και τον συνοδηγό ένα πρόσθετο κίνδυνο τραυματισμού.',
            true),
        Answer(
            'Τίποτα διότι τα μαξιλάρια κεφαλής των μπροστινών καθισμάτων προσφέρουν επαρκή προστασία από τραυματισμούς.',
            false),
      ]),
  Question(
      '1',
      false,
      'Σε πόση απόσταση τουλάχιστον πρέπει να φωτίζουν επαρκώς την οδό, µε συνθήκες αιθρίας, κατά τη νύχτα τα φώτα πορείας (μεγάλα) του αυτοκινήτου:',
      [Answer('100m', true), Answer('40m', false), Answer('300m', false)]),
  Question(
      '1',
      false,
      'Τι πρέπει να προσέχει ο οδηγός κατά τη χρησιµοποίηση των καθρεπτών ενός επιβατηγού:',
      [
        Answer(
            'Ο εσωτερικός καθρέπτης καθιστά πάντα δυνατή την πλήρη ορατότητα προς τα δεξιά.',
            false),
        Answer(
            'Σε µία ορισμένη περιοχή (νεκρή γωνία) είναι δυνατόν να µην είναι ορατά αυτοκίνητα που προσπερνούν',
            true)
      ]),
  Question(
      '1',
      false,
      'Ο ήχος που εκπέµπεται από το ηχητικό όργανο του οχήµατος (κόρνα) πρέπει να είναι:',
      [
        Answer('Συνεχής µε ίδιο τόνο.', true),
        Answer('Διαπεραστικός.', false),
        Answer('Ἐναλλασσόμενος', false)
      ]),
  Question(
      '1',
      false,
      'Η χρήση ζώνης ασφαλείας είναι απαραίτητη και από τους επιβάτες των πίσω καθισμάτων:',
      [
        Answer('Ναι, γιατί δεν προστατεύονται σε περίπτωση ατυχήματος.', true),
        Answer('Όχι, γιατί δεν προβλέπεται στον Κ.Ο.Κ.', false),
        Answer('΄Οχι, γιατί προστατεύονται από τα μπροστινά καθίσµατα.', false)
      ]),
  Question('1', false, 'Ποια είναι τα φώτα διασταυρώσεως του αυτοκινήτου:', [
    Answer(' Τα φώτα που έχουν εμβέλεια τουλάχιστον 100m', false),
    Answer('Τα φώτα που έχουν εμβέλεια τουλάχιστον 40m', true),
    Answer('Τα μικρά φώτα στο εμπρόσθιο µέρος.', false)
  ]),
  Question(
      '1',
      false,
      'Όταν δεν λειτουργούν τα φώτα τροχοπεδήσεως του οχήµατός σας, µε ποιον τρόπο οφείλετε να ειδοποιησετε αυτόν που ακολουθεί, ότι έχετε πρόθεση να σταθµεύσετε:',
      [
        Answer('Χρησιμοποιώντας τα φώτα οπισθοπορείας.', false),
        Answer('Κάµπτοντας το βραχίονα προς τα κάτω.', true),
        Answer('Κάµπτοντας το βραχίονα προς τα πάνω. ', false)
      ]),
  Question(
      '1',
      false,
      'Τι πρέπει να προσέχει ο οδηγός κατά τη χρησιµοποίηση του καθρέπτη ενός επιβατηγού:',
      [
        Answer(
            'Οι καθρέπτες πρέπει να είναι προσαρµοσµέγοι στον εκάστοτε οδηγό.',
            true),
        Answer(
            'Ο εσωτερικός καθρέπτης καθιστά πάντα δυνατή τη πλήρη ορατότητα προς τα δεξιά.',
            false)
      ]),
];
List<Question> c2 = [
  Question('2', true, 'Η νεκρή γωνία είναι µια περιοχή:', [
    Answer('Μη ορατή από τη θέση του οδηγού µέσω των καθρεπτών.', true),
    Answer('Ορατή µέσω των καθρεπτών.', false),
    Answer('Μη ορατή µε λοξή µατιά πάνω από τους ώμους.', false)
  ]),
  Question('2', true, 'Για να εγκατασταθείτε σωστά στη θέση του οδηγού:', [
    Answer(
        'Πρέπει να µπορείτε να ακουµπάτε τους καρπούς των χεριών σας στο επάνω µέρος του τιμονιού και να µπορείτε να πατάτε ὠς το τέρμα το συμπλέκτη.',
        true),
    Answer('Πρέπει να µπορείτε να ακουµπάτε τα χέρια σας στον πίνακα ελέγχου.',
        false)
  ]),
  Question(
      '2',
      false,
      'Ένα ογκώδες αντικείµενο δεν επιτρέπεται να εξέχει προς τα πίσω περισσότερο του 30% του μήκους του οχήματος χωρίς ειδική άδεια:',
      [Answer('ΝΑΙ ', true), Answer('ΟΧΙ', false)]),
  Question('2', false, 'Για να επιβιβασθείτε στο όχηµά σας:', [
    Answer('Γυρνάτε την πλάτη σας στην κυκλοφορία της κατευθύνσεώς σας', false),
    Answer(
        'Βρίσκεστε µε πρόσωπο προς την κυκλοφορία της κατευθύνσεώς σας.', true)
  ]),
  Question(
      '2', false, 'Εάν αλλάζετε λωρίδα, για να ελέγξετε καλά προς τα πίσω: ', [
    Answer('Σας αρκούν οι καθρέπτες.', false),
    Answer('Κοιτάτε µόνο τον εξωτερικό καθρέπτη.', false),
    Answer(
        'Ελέγχετε µε τους καθρέπτες και γυρνάτε το κεφάλι στην πλευρά που θα μπείτε.',
        true)
  ]),
  Question('2', false, 'Τα λαστιχάκια των υαλοκαθαριστήρων αντικαθίστανται:', [
    Answer(
        ' Κάθε φορά που έχουν φθαρεί και τουλάχιστον µια φορά το χρόνο, κατά προτίμηση πριν το χειμώνα.',
        true),
    Answer('Κατά προτίμηση το καλοκαίρι.', false)
  ]),
  Question(
      '2',
      false,
      'Για την ασφάλεια του παιδιού σας, µπορείτε να χρησιμοποιήσετε ανάλογα µε το ύψος, το βάρος και την ηλικία του:',
      [
        Answer(
            'Τα εγκεκριµένου τύπου παιδικά καθίσματα για το αυτοκίνητο.', true),
        Answer('Το δίχτυ ανάµεσα στα μπροστινά καθίσματα.', false)
      ]),
  Question(
      '2',
      false,
      'Οδηγείτε µε το επιβατηγό σας λίγο γρηγορότερα από την ταχύτητα βαδίσµατος. Οι ζώνες ασφαλείας πρέπει να δεθούν:',
      [
        Answer('Όχι, σε διαδρομές µέσα σε κατοικημένες περιοχές.', false),
        Answer('Ναι, σε κάθε διαδρομή. ', true),
        Answer(
            'Μόνο σε διαδρομές στους αυτοκινητόδροµους και δρόμους ταχείας κυκλοφορίας.',
            false)
      ]),
  Question(
      '2',
      false,
      ' Ένα επιβατηγό είναι εφοδιασμένο µε ζώνες ασφαλείας για όλες του τις θέσεις. Ποια πρόσωπα πρέπει να  τις φορέσουν:',
      [
        Answer('Ο οδηγός και οι επιβάτες των εμπροσθίων καθισμάτων.', false),
        Answer('Μόνο ο οδηγός.', false),
        Answer('Ο οδηγός και όλοι οι επιβάτες.', true)
      ]),
];
// Σήμανση (Μέχρι ερώτηση 87 του βιβλίου)
List<Question> c3 = [
  Question('3', true,
      'Τι πρέπει να κάνετε βλέποντας αυτό το σήµα σε άλλη θέση πλην κόμβου:', [
    Answer(
        'Να σταματήσετε στο ύψος της πιναχίδας και να ξεκιγήσετε όταν µπορείτε να το πράξετε χωρίς κίνδυνο.',
        true),
    Answer('Να περάσετε µε προσοχή χωρίς να σταματήσετε.', false)
  ]),
  Question(
      '3',
      true,
      'Όταν συναντότε αυτόν τον συνὸνασμµό πινακίδων. οδηγείτε σε ὀρόμο µε προτεραιότητα:',
      [Answer('ΝΑΙ', false), Answer('ΟΧΙ', true)]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Άνω (υπέργεια) διάβαση πεζών.', false),
    Answer('Κάτω (υπόγεια) διάβαση πεζών.', true),
    Answer('Ανισόπεδη διάβαση πεζών χωρίς σκαλοπάτια.', false)
  ]),
  Question('3', true, 'Σε αυτήν τη φωτογραφία, λωρίδες κυκλοφορίας είναι οι:',
      [Answer('1', true), Answer('2', false), Answer('1 και 2', false)]),
  Question(
      '3',
      true,
      'Όταν σε περιοχές έργων στον αυτοκινητόδρομο, η οριξόντια σήμανση συμπεριλαμβάνει άσπρες και κίτρινες γραμμές ταυτόχρονα, σέβεστε:',
      [
        Answer('Μόνο τις άσπρες γραμμές.', false),
        Answer('Τις άσπρες και τις κίτρινες γραμμές.', false),
        Answer('Μόνο τις πίτρινες γραμμές.', true)
      ]),
  Question(
      '3',
      true,
      'Το όχηµά σας έχει µήκος 4,5m. Αυτή η πινακίδα σας απαγορεύει την είσοδο:',
      [Answer('ΝΑΙ', false), Answer('ΟΧΙ', true)]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer(
        'Αναγγελία προσεγγίσεως σε ανισόπεδο κόμβο αυτοκινητόδροµμου.', true),
    Answer('Αναγγελία προσεγγίσεως σε διασταύρωση οδού ταχείας κυκλοφορίας.',
        false),
    Answer('Αναγγελία προσεγγίσεως σε διασταύρωση εθνικής οδού.', false)
  ]),
  Question('3', true, 'Αυτό το σήµα καθορίζει:', [
    Answer('Μια περιοχή σταθµεύσεως αριστερά.', false),
    Answer('Μια προειδοποίηση για αδιέξοδο ὀρόμο στα αριστερά.', true),
    Answer('Διακλάδωση αριστερά µε αγροτική οδό που οδηγεί σε οικισμό.', false)
  ]),
  Question(
      '3',
      true,
      'Οι ειδικές λωρίδες για τα λεωφορεία μπορούν να χρησιμοποιηθούν προσωρινά:',
      [
        Answer('Από τα οχήματα έκτακτης ανάγκης.', true),
        Answer('Από την κανονική κυνλοφορία.', false)
      ]),
  Question('3', true,
      'Οδηγείτε µε 90km/h σε αυτόν το δρόμο όπου η ορατότητα είναι καλή:', [
    Answer(
        'Να είσθε έτοιµοι να µειώσετε την ταχύτητά σας: µπορεί να υπάρχει κάποιος κίνδυνος που δεν έχετε ακόµα παρατηρήσει.',
        true),
    Answer('Η ελάχιστη επιτρεπόµενη ταχύτητα είναι  90km/h.', false)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία της πινακίδας αυτής:', [
    Answer(
        'Προειδοποιητική κατευθύνσεων που τοποθετείται προ ανισόπεδου κόμβου σε αυτοκινητόδρομο.',
        true),
    Answer(
        'Προειδοποιητική κατευθύνσεων που τοποθετείται προ κόμβου σε οδό ταχείας κυκλοφορίας.',
        false),
    Answer(
        'Προειδοποιητική κατευθύνσεων που τοποθετείται προ κόμβου σε εθνική οδό.',
        false)
  ]),
  Question('3', true, 'Τι επιτρέπεται να κάνετε όταν υπάρχει το σήµα αυτό:', [
    Answer(
        'Να σταθμεύσετε εφόσον διαθέτετε το προβλεπόμενο αντίτιμο σταθµεύσεως.',
        true),
    Answer('Να σταθμεύσετε επί πέντε λεπτά.', false),
    Answer(
        'Να σταθµεύσετε εφόσον δεν παρακωλύετε την είσοδο ή την έξοδο.', false)
  ]),
  Question('3', true, 'Αυτή η πινακίδα σηµαίνει:', [
    Answer('Επικίνδυνο ανώμαλο οδόστρωμα, σε κακή κατάσταση,με λάκκους κλπ.',
        true),
    Answer('Βαθιά λακκούβα.', false)
  ]),
  Question('3', true, 'Συναντώ αυτήν την πινακίδα µε αρίθµηση:',
      [Answer('Σε οδό πόλεως.', false), Answer('Σε εθνική οδό.', true)]),
  Question(
      '3',
      true,
      'Η ζώνη που προορίξεται για τη στάση λεωφορείων επισημαίνεται συνήθως µε µια τεθλασμένη κίτρινη γοαµµή (ξιγκ-ξαγν). Μπορείτε:',
      [
        Answer('Να πατήσετε αυτήν τη γραµµή ενώ οδηγείτε. ', true),
        Answer('Να σταματήσετε για κάποια στιγµή σε εκείνο το σηµείο. ', false),
        Answer('Να σταθμεύσετε σε εκείνο το σηµείο.', false)
      ]),
  Question('3', true, 'Αυτή η πινακίδα απαγορεύει την είσοδο:', [
    Answer('Στα µοτοποδήλατα και τις μοτοσυκλέτες.', false),
    Answer('Μόνο στα µοτοποδήλατα.', true)
  ]),
  Question('3', true, 'Αυτή η πινακίδα σηµαίνει:', [
    Answer('Κίνδυνος λόγω συχνής εισόδου ή διαβάσεως ποδηλατιστών.', true),
    Answer('Απαγορεύεται η είσοδος στους ποδηλατιστές.', false),
  ]),
  Question('3', true, 'Κάθε φορά που συναντότε αυτήν την πινακίδα:', [
    Answer('Οδηγείτε σε δρόμο µε προτεραιότητα.', false),
    Answer(
        'Πρόκειται για διασταύρωση όπου εφαρµόζεται η προτεραιότητα από τα δεξιά.',
        false),
    Answer('΄Έχετε προτεραιότητα µόνο στην επόµενη διασταύρωση.', true)
  ]),
  Question(
      '3',
      true,
      'Αυτή η πινακίδα συμβολίζει την απαγόρευση να στρίψετε αριστερά:',
      [Answer('ΝΑΙ', false), Answer('ΟΧΙ', true)]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Έξοδος από περιοχή επιτρεπόµενης σταθµεύσεως.', true),
    Answer('Έξοδος από περιοχή όπου απαγορεύεται η στάθμευση.', false),
    Answer('Έξοδος από περιοχή περιορισμένης σταθµεύσεως.', false)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Χώρος σταθµεύσεως οχημάτων ατόμων µε μειωμένη κινητικότητα.', true),
    Answer('Χώρος σταθμµεύσεως αναπηρικών αμαξιδίων.', false),
    Answer('Οδός αποκλειστικής διελεύσεως αναπηρικών αμαξιδίων.', false)
  ]),
  Question('3', true, 'Αυτή η πινακίδα σηµαίνει κίνδυνο λόγω:', [
    Answer('Ισόπεδης σιδηροδρομικής διαβάσεως µε κινητά φράγματα.', true),
    Answer('Αφύλακτης σιδηροδρομικής διαβάσεως.', false)
  ]),
  Question('3', true, 'Κάθε φορά που συναντότε αυτήν την πινακίδα:', [
    Answer('Σέβεστε µόνο την προτεραιότητα από τα δεξιά.', false),
    Answer('Παραχωρείτε την προτεραιότητα, δεξιά και αριστερά.', true),
    Answer('Διακόπτετε υποχρεωτικά την πορείας σας.', false)
  ]),
  Question('3', true,
      'Κάθε φορά που συναντάτε αυτήν την πινακίδα, απαγορεύεται η είσοδος:', [
    Answer('Σε κάθε όχημα.', false),
    Answer('Σε μηχανοκίνητα οχήματα.', true),
    Answer('Σε όλα τα ποδήλατα και τα αγροτικά μηχανήματα.', false)
  ]),
  Question('3', true, 'Αυτή η πινακίδα σηµαίνει:', [
    Answer('Ολισθηρό οδόστρωμα.', true),
    Answer('Επικίνδυνες στροφές.', false)
  ]),
  Question('3', true, 'Αυτή η πινακίδα σηµαίνει:', [
    Answer('Κίνδυνος λόγω διαβάσεως πεζών.', true),
    Answer('Απαγόρευση εισόδου στους πεζούς.', false),
    Answer('Οδός υποχρεωτικής διελεύσεως πεζών.', false)
  ]),
  Question(
      '3',
      true,
      'Βρίσκεσθε κατά λάθος σε µια λωρίδα επιβραδύνσεως και το συνειδητοποιείτε καθυστερημένα:',
      [
        Answer('Αλλάζετε λωρίδα.', false),
        Answer('Μένετε στην ίδια λωρίδα, ακόµα και αν κάνατε λάθος.', true)
      ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Απαγορεύεται η ανάπτυξη ταχύτητας μεγαλύτερης των 30km/h.', false),
    Answer('Τέλος υποχρεωτικής ελάχιστης ταχύτητας 30km/h.', true),
    Answer(
        'Έξοδος από περιοχή όπου ισχύει ανώτατο όριο ταχύτητας 30km/h.', false)
  ]),
  Question(
      '3',
      true,
      'Όταν συναντάτε αυτήν την πινακίδα, οδηγείτε σε δρόμο µε προτεραιότητα:',
      [Answer('ΝΑΙ', true), Answer('ΟΧΙ', false)]),
  Question('3', true, 'Αυτή η πινακίδα σηµαίνει κίνδυνο λόγω:', [
    Answer('Συχνού ισχυρού ανεμού (όπως δείχνει η κατεύθυνση του ανεμουρίου).',
        true),
    Answer('Ισχυρού µετωπικού ανέμου λόγω προσεγγίσεως σε αεροδρόμιο.', false)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Διακλάδωση µε κάθετη οδό όπου ισχύει η προτεραιότητα από δεξιά.',
        false),
    Answer(
        'Διακλάδωση µε κάθετη οδό δεξιά, οι επί της οποίας κινούμενοι οφείλουν να παραχωρήσουν προτεραιότητα.',
        true),
    Answer('Ὑποχρεωτική στροφή δεξιά.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer(
        'Κλειστή οδός για όλα τα οχήµατα και απότις δύο κατευθύνσεις.', true),
    Answer('Προσέγγιση σε κυκλικό κόµβο.', false),
    Answer('Αδιέξοδο.', false)
  ]),
  Question(
      '3',
      true,
      'Σε αυτήν την περίπτωση, έχετε το δικαίωµα να προσπεράσετε:',
      [Answer('ΝΑΙ', true), Answer('ΟΧΙ', false)]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Τέλος αρχαιολογικού χώρου.', false),
    Answer('Τέλος περιοχής κατοικίας.', true),
    Answer('Τέλος τουριστικής περιοχής.', false)
  ]),
  Question('3', true, 'Ποια από αυτές τις πινακίδες σηµαίνει: «Μονόδρομος»:',
      [Answer('A.', true), Answer('B.', false)]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Περιοχή επιτρεπόµενης σταθµεύσεως.', true),
    Answer('Περιοχή όπου απαγορεύεται η στάθμευση.', false),
    Answer('Περιοχή περιορισμένης σταθµεύσεως.', false)
  ]),
  Question(
      '3',
      true,
      'Έχουμε 14 Μαΐου. Μπορείτε να σταθµεύσετε στην πλευρά της οδού όπου έχει τοποθετηθεί αυτή η πινακίδα:',
      [Answer('ΝΑΙ', false), Answer('ΟΧΙ', true)]),
  Question('3', true, 'Τι πρέπει να κάνετε βλέποντας αυτό το σήμα:', [
    Answer(
        'Να τοποθετήσετε αντιολισθητικές αλυσίδες χιονιού, σε δύο τουλάχιστον από τους κινητήριους τροχούς του αυτοκινήτου.',
        true),
    Answer(
        'Να τοποθετήσετε αντιολισθητικές αλυσίδες χιονιού,στους πίσω τροχούς του αυτοκινήτου.',
        false),
    Answer(
        'Να τοποθετήσετε αντιολισθητικές αλυσίδες χιονιού,στους εµπρόσθιους τροχούς του αυτοκινήτου.',
        false)
  ]),
  Question('3', true, 'Αυτή η πινακίδα σηµαίνει:', [
    Answer('Κίνδυνος λόγω συχνής διελεύσεως πεζών.', false),
    Answer(
        'Οδός υποχρεωτικής διελεύσεως πεζών και απαγόρευση διελεύσεως οχημάτων πλην αυτών άµεσης ανάγκης και για την είσοδο-έξοδο σε παρόδιες ιδιοκτησίες.',
        true),
    Answer('Επιτρέπεται η διέλευση µόνον όσων πεζών συνοδεύουν παιδιά.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Αρχή περιοχής κατοικίας.', true),
    Answer('Τουριστική περιοχή.', false),
    Answer('Αρχαιολογικός χώρος.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer(
        'Προσοχή άλλοι κίνδυνοι (που δεν μπορούν να περιγραφούν µε άλλες πινακίδες).',
        true),
    Answer('Ὑποχρεωτική πορεία κατ’ ευθείαν εμπρός.', false),
    Answer('Ὑποχρεωτική προτεραιότητα στην επόμενη διασταύρωση.', false)
  ]),
  Question('3', true, 'Αυτή η πινακίδα σας τονίζει:', [
    Answer('Κίνδυνο για τα επόμενα 1.000m του δρόμου.', true),
    Answer('Έναν κίνδυνο που βρίσκεται 1.000m µετά την πινακίδα.', false)
  ]),
  Question(
      '3',
      true,
      'Σε αυτήν την εικονογράφηση. όπου κινείσθε κατά τη φορά του βέλους η οριογραμµή του οδοστρώµατος αντιστοιχεί στο σηµείο:',
      [Answer('1', true), Answer('2', false)]),
  Question(
      '3',
      true,
      'Σε αυτήν την περίπτωση µπορείτε να επιχειρήσετε προσπέρασµα:',
      [Answer('ΝΑΙ', false), Answer('ΟΧΙ', true)]),
  Question('3', true, 'Ποια είναι η σηµασία της πινακίδας αυτής:', [
    Answer('Ὑποχρεωτική κατεύθυνση πορείας µε στροφή αριστερά.', false),
    Answer('Επικίνδυνη αριστερή στροφή.', true),
    Answer('Απαγορεύεται η αριστερή στροφή.', false)
  ]),
  Question('3', true, 'Τι δείχνει η πινακίδα αυτή:', [
    Answer('Τον τρόπο σταθμεύσεως του οχήματος.', false),
    Answer('Επικίνδυνο έρεισµα αριστερά.', true),
    Answer('Αριστερά από το οδόστρωμα υπάρχει αυλάκι µε νερό.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer(
        'Απαγορεύεται η είσοδος σε μηχανοκίνητα οχήματα εκτός των διτρόχων μοτοσυκλετών.',
        false),
    Answer('Απαγορεύεται η είσοδος στις μοτοσυκλέτες.', true),
    Answer('Οδός αποκλειστικής κυκλοφορίας διτρόχων οχημάτων.', false)
  ]),
  Question(
      '3',
      true,
      'Ποια οχήματα απαγορεύεται να εισέλθουν σε µία οδό µε αυτήν τη σήµανση:',
      [
        Answer(
            'Τα οχήματα που έχουν απόβαρο που δεν υπερβαίνει τους πέντε τόνους.',
            false),
        Answer(
            'Τα οχήματα βάρους ανά άξονα που δεν υπερβαίνει τους δύο τόνους.',
            false),
        Answer(
            'Τα οχήματα συνολικού βάρους που υπερβαίνει τους πέντε 5 τόνους.',
            true)
      ]),
  Question('3', true, 'Ποια είναι η σηµασία της πινακίδας αυτής:', [
    Answer('Απαγορεύεται η αναστροφή (στροφή 180”)', true),
    Answer('Απαγορεύεται η αριστερή στροφή.', false),
    Answer('Απαγορεύεται η δεξιά στροφή.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Οδός αποκλειστικής κυκλοφορίας µοτοποδηλάτων και πεζών.', false),
    Answer(
        ' Η κάθε κατηγορία χρηστών πρέπει να χρησιμοποιεί την πλευρά του αντίστοιχου διαδρόμου που είναι ειδικά επιλεγµένη γι’ αυτήν την κατηγορία.',
        true),
    Answer('Απαγορεύεται η είσοδος σε πεζούς και µοτοποδήλατα.', false)
  ]),
  Question('3', true, 'Η πινακίδα σας προειδοποιεί για:', [
    Answer(
        'Μία έξοδο από την οδό ταχείας κυκλοφορίας, σε απόσταση 200m.', false),
    Answer(
        'Δύο εξόδους από την οδό ταχείας κυκλοφορίας σε απόσταση 200m.', true),
    Answer('Τρεις εξόδους από την οδό ταχείας κυκλοφορίας σε απόσταση 200m.',
        false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Κατεύθυνση προς χώρο επιτρεπόµενης σταθµεύσεως.', true),
    Answer('Μονόδρομος.', false),
    Answer('Έξοδος από χώρο επιτρεπόµενης σταθµεύσεως.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Άνω (υπέργεια) διάβαση πεζών.', true),
    Answer('Κάτω (υπόγεια) διάβαση πεζών.', false),
    Answer('Ανισόπεδη διάβαση πεζών χωρίς σκαλοπάτια.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Ὑποχρεωτική κατεύθυνση πορείας µε στροφή δεξιά.', false),
    Answer('Επικίνδυνη δεξιά στροφή.', true),
    Answer('Απαγορεύεται η δεξιά στροφή.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Η οδός οδηγεί σε αποβάθρα.', false),
    Answer('Προσοχή! Γέφυρα χωρίς κάγκελα.', false),
    Answer('Κινητή γέφυρα.', true)
  ]),
  Question('3', true, 'Τι δείχνει το σήµα αυτό:', [
    Answer('Ὑποχρεωτική πορεία σε µία σειρά.', false),
    Answer('Συχνή κυκλοφοριακή συμφόρηση.', true),
    Answer('Απαγορεύεται η είσοδος σε περισσότερα από τρία οχήματα.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Απαγορεύεται η είσοδος σε όλα τα μηχανοκίνητα οχήματα.', false),
    Answer('Απαγορεύεται η είσοδος στα ποδήλατα.', true),
    Answer('Οδός αποκλειστικής κυκλοφορίας ποδηλάτων.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Οδόστρωµα πλάτους 2m.', false),
    Answer(
        'Απαγορεύεται η είσοδος σε οχήματα συνολικού πλάτους που υπερβαίνει τα 2m.',
        true),
    Answer(
        'Απαγορεύεται η προσέγγιση προπορευόµενου οχήματος σε απόσταση μικρότερη των 2m.',
        false)
  ]),
  Question('3', true, 'Η πινακίδα σας προειδοποιεί για:', [
    Answer(
        'Μία έξοδο από την οδό ταχείας κυκλοφορίας, σε απόσταση 400m από την πινακίδα.',
        true),
    Answer(
        'Δύο εξόδους από την οδό ταχείας κυκλοφορίας, σε απόσταση 400m από την πινακίδα.',
        false),
    Answer('Καμία έξοδο από την οδό ταχείας κυκλοφορίας.', false)
  ]),
  Question('3', true, 'Ποια είναι η σημασία του σήµατος αυτού:', [
    Answer('Αγροτικό Ιατρείο.', false),
    Answer('Σταθµός Πρώτων Βοηθειών.', true),
    Answer('Νοσοκομείο.', false)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer(
        'Επικίνδυνες δύο αντίρροπες ή διαδοχικές (συνεχείς) στροφές από τις οποίες η πρώτη είναι δεξιά.',
        true),
    Answer(
        'Επικίνδυνες δύο αντίρροπες ή διαδοχικές στροφές από τις οποίες η πρώτη είναι αριστερά.',
        false),
    Answer('Απαγορεύεται η δεξιά στροφή.', false)
  ]),
  Question('3', true, 'Πώς συμπεριφέρεσθε βλέποντας αυτό το σήµα:', [
    Answer('Προσπερνάτε τα προπορευόµενα οχήματα.', false),
    Answer('Δεν προσπερνάτε σε καμμία περίπτωση.', true),
    Answer('Παραχωρείτε προτεραιότητα στην αντίθετη κυκλοφορία.', false)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Προσέγγιση σε κυκλική υποχρεωτική πορεία.', true),
    Answer('Ὑποχρεωτική κίνηση των οχημάτων σε µια σειρά.', false),
    Answer('Δρόμος κλειστός για όλα τα οχήματα.', false)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Απαγορεύεται η είσοδος σε φορτηγά οχήματα.', false),
    Answer(
        'Απαγορεύεται η είσοδος σε μηχανοκίνητο όχηµα το οποίο σύρει ρυμουλκούμενο πλην ημιρυμουλκούμενου ή ϱυμουλκούμενου ενός άξονα.',
        true),
    Answer('Απαγορεύεται η είσοδος σε ρυμουλκούμενα οχήματα.', false)
  ]),
  Question('3', true, 'Τι υποδεικνύει ο συνδυασμός των πινακίδων αυτών:', [
    Answer('Η στάθµευση επιτρέπεται µόνο για τα ταξί.', true),
    Answer('Η στάθµευση στα ταξί απαγορεύεται.', false),
    Answer('Κατεύθυνση προς χώρο σταθµεύσεως ταξί.', false)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer(
        'Είσοδος σε περιοχή όπου απαγορεύεται η ανάπτυξη ταχύτητας μεγαλύτερης των 50 km/h.',
        false),
    Answer('Υποχρεωτική σταθερή ταχύτητα 50 km/h', false),
    Answer(
        ' Έξοδος από περιοχή όπου ισχύει ανώτατο όριο ταχύτητας 50 km/h.', true)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Κινείσθε σε οδό προτεραιότητας. ', true),
    Answer('Παραχώρηση προτεραιότητας.', false),
    Answer('Οδός ταχείας κυκλοφορίας.', false)
  ]),
  Question(
      '3',
      true,
      'Τι πρέπει να κάνετε βλέποντας αυτό το σήµα για να κατευθυνθείτε προς την Αθήνα:',
      [
        Answer('Na στρίψετε δεξιά.', true),
        Answer('Να συνεχίσετε ευθεία.', false),
        Answer('Να στρίψετε αριστερά.', false)
      ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Αγροτικό Ιατρείο.', false),
    Answer('Τηλέφωνο.', false),
    Answer('Συνεργείο επισκευής βλαβών.', true)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Άνω (υπέργεια) διάβαση πεζών.', false),
    Answer('Κάτω (υπόγεια) διάβαση πεζών.', false),
    Answer('Ανισόπεδη διάβαση πεζών χωρίς σκαλοπάτια.', true)
  ]),
  Question('3', true, 'Πώς συμπεριφέρεσθε βλέποντας αυτό το σήµα:', [
    Answer('Φρενάρετε.', false),
    Answer('Φρενάρετε και κατεβάζετε ταχύτητα.', true),
    Answer('Συνεχίζετε µε την ίδια ταχύτητα.', false)
  ]),
  Question('3', true, 'Ποια είναι η σηµασία του σήµατος αυτού:', [
    Answer('Η κυκλοφορία των ποδηλατιστών έχει προτεραιότητα.', false),
    Answer('Προσέγγιση σε ποδηλατοδρόµιο.', false),
    Answer('Κίνδυνος λόγω συχνής εισόδου ή διαβάσεως ποδηλατιστών. ', true)
  ]),
  Question(
      '3',
      true,
      'Ποια πινακίδα επισημαίνει κίνδυνο λόγω ισόπεδης σιδηροδροµικής γραμμής χωρίς κινητά φράγματα:',
      [
        Answer('Η πινακίδα Α.', false),
        Answer('Η πινακίδα Β.', false),
        Answer('Η πινακίδα Γ.', true)
      ]),
  /**Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
  Question(
      '3', true, '', [Answer('', false), Answer('', false), Answer('', false)]),
**/
];
// Διασταυρώσεις (Μέχρι ερώτηση 22 του βιβλίου)
List<Question> c4 = [
  Question(
      '4',
      true,
      'Αυτή η κίτρινη διαγράµµιση (πλέγμα) υποχρεώνει τα οχήματα σε αναµονή µέχρι να στρίψουν:',
      [Answer('ΝΑΙ', false), Answer('ΟΧΙ', true)]),
  Question(
      '4',
      true,
      'Οδηγείτε το κόκκινο ανοιχτό αυτοκίνητο (καμπριολέ). Το μπλε αυτοκίνητο έρχεται µε µεγάλη ταχύτητα:',
      [
        Answer(
            'Κατευθύνεστε προςτη διασταύρωση, αφού προειδοποιήσετε µε την κόρνα, επειδή έχετε προτεραιότητα.',
            false),
        Answer(
            'Είστε έτοιμος να σταματήσετε γιατί πάντα είναι πιθανή η παραβίαση της προτεραιότητάς σας.',
            true)
      ]),
  Question('4', true, 'Σε αυτήν την περίπτωση:', [
    Answer('Επιβραδύνετε.', false),
    Answer('Σταµατάτε.', true),
    Answer('Περνάτε.', false)
  ]),
  Question(
      '4',
      true,
      'Όταν στρίβετε σε µια διασταύρωση, εγκαταλείπετε την επικίνδυνη περιοχή:',
      [
        Answer('Μόλις τελειώσετε τη στροφή σας.', false),
        Answer(
            'Αφού ανακτήσετε την ταχύτητα κυκλοφορίας των οχηµάτων του δρόμου στον οποίο εισέρχεσθε.',
            true)
      ]),
  Question('4', true, 'Συναντάτε αυτήν την πινακίδα:', [
    Answer('Παραχωρείτε την προτεραιότητα στην επόμενη διασταύρωση.', false),
    Answer('Στην επόµενη διασταύρωση, θα έχετε την προτεραιότητα.', true)
  ]),
  Question('4', true, 'Αυτή η πινακίδα σας πληροφορεί για:', [
    Answer(
        'Έναν κίνδυνο και µια διασταύρωση όπου ισχύει η από δεξιά προτεραιότητα.',
        true),
    Answer(
        'Έναν κίνδυνο και µια διασταύρωση όπου έχετε την προτεραιότητα.', false)
  ]),
  Question('4', true, 'Όταν συναντάτε αυτήν την πινακίδα:', [
    Answer(
        'Οφείλετε να παραχωρήσετε την προτεραιότητα στα οχήµατα που έρχονται από αριστερά και δεξιά.',
        true),
    Answer('Πρέπει να σταματήσετε στη διαχωριστική γραμμή.', false)
  ]),
  Question('4', true, 'Σε µια κυκλική διασταύρωση:', [
    Answer(
        'Συγκλίνετε προς το κέντρο εάν η έξοδός σας από τον κόµβο βρίσκεται στα αριστερά της προεκτάσεως του άξονα του δρόμου από τον οποίο εισήλθατε στον κόμβο.',
        true),
    Answer(
        'Όποια και αν είναι η έξοδος που θα ακολουθήσετε, διέρχεστε πρώτα από την εσωτερική λωρίδα κυκλοφορίας του κόμβου.',
        false)
  ]),
  Question('4', true, 'Σε µια κυκλική διασταύρωση:', [
    Answer(
        'Όποια και αν είναι η έξοδος που θα ακολουθήσετε, διέρχεστε πρώτα από την εσωτερική λωρίδα κυκλοφορίας του κόμβου.',
        false),
    Answer(
        'Μπορείτε να παραμείνετε δεξιά µέχρι την έξοδο, εάν δεν γνωρίζετε την έξοδό σας.',
        true)
  ]),
  Question('4', true, 'Το χρώμα των φαναριών που δηλώνουν τη στάση είναι:',
      [Answer('Κόκκινο ή κίτρινο.', true), Answer('Πράσινο.', false)]),
  Question(
      '4',
      true,
      'Το κόκκινο φανάρι έχει ανάψει και ένα κίτρινο βέλος στον ίδιο σηµατοδότη αναβοσβήνει. Εσείς:',
      [
        Answer('Πρέπει οπωσδήποτε να σταματήσετε.', false),
        Answer(
            'Μπορείτε να στρίψετε χωρίς να ενδιαφερθείτε για τους πεζούς στην οδό που θα εισέλθετε.',
            false),
        Answer(
            'Μπορείτε να στρίψετε προς την κατεύθυνση που υποδειπνύεται από το βέλος τηρώντας την προτεραιότητα.',
            true)
      ]),
  Question('4', true, 'Οδηγείτε το μαύρο (σκούρο) όχημα:', [
    Answer('Σταµατάτε και περνάτε µετά το φορτηγάκι.', true),
    Answer('Περνάτε πριν το κόκκινο αυτοκίνητο.', false)
  ]),
  Question('4', true,
      'Το γαλάξιο αυτοκίνητο πρέπει να παραχωρήσει την προτεραιότητα:', [
    Answer('Στο κόκκινο αυτοκίνητο.', false),
    Answer('Στο φορτηγάκι.', true)
  ]),
  Question('4', true, 'Οδηγείτε το κόκκινο όχημα:', [
    Answer('Το µπλε φορτηγάκι περνάει πριν από εσάς.', false),
    Answer('Αφήνετε να περάσουν και τα δύο φορτηγάκια.', false),
    Answer('Το κίτρινο φορτηγάκι περνάει πριν από σας.', true)
  ]),
  Question('4', true, 'Σε αυτήν την περίπτωση:', [
    Answer('Περνάει πρώτο το πράσινο όχημα.', false),
    Answer(
        'Το ανοικτό (μαύρο) όχηµα επιτρέπει να περάσουν τα άλλα δύο οχήματα πριν στρίψει αριστερά.',
        false),
    Answer('Το ανοικτό (μαύρο) όχηµα περνάει πριν το πράσινο όχηµα.', true)
  ]),
  Question('4', true, 'Όταν το κίτρινο φως αναβοσβήνει σε µία διασταύρωση:', [
    Answer(
        'Οφείλετε να επιβραδύνετε ιδιαίτερα, και να παραχωρείτε την προτεραιότητα στους κινούµενους στο δρόμο που διασταυρώνεται µε το δικό σας.',
        true),
    Answer(
        'Ισχύουν οι πινακίδες που ρυθμίζουν την προτεραιότητα στη διασταύρωση.',
        false)
  ]),
  Question('4', true, 'Όταν συναντάτε αυτήν την πινακίδα:', [
    Answer(
        'Οφείλετε να παραχωρήσετε την προτεραιότητα στα οχήµατα που έρχονται µόνο από τα δεξιά.',
        false),
    Answer(
        'Πρέπει να σταματήσετε στη διαχωριστική γραμμή και να παραχωρήσετε την προτεραιότητα αριστερά και δεξιά.',
        true)
  ]),
  Question(
      '4',
      true,
      'Όταν στρίβετε αριστερά σε ένα σταυροδρόμι όπου αντίθετα εισερχόµενα αυτοκίνητα επίσης στρίβουν αριστερά, ο σωστός και ασφαλής τρόπος διελεύσεως είναι αυτός που φαίνεται στο σκίτσο Α ή Β:',
      [Answer('Το σκίτσο Α.', true), Answer('Το σκίτσο Β.', false)]),
  Question('4', true, 'Όταν συναντάτε αυτήν την πινακίδα, σηµαίνει:', [
    Answer(
        'Ότι θα πρέπει ενδεχομένως να παραχωρήσετε την προτεραιότητα στην επόμενη διασταύρωση.',
        true),
    Answer(
        'Ότι µετά από την επόμενη διασταύρωση θα έχετε πάλι την προτεραιότητα.',
        false)
  ]),
  Question('4', true, 'Όταν λειτουργούν τα φανάρια υπερισχύουν των πινακίδων:',
      [Answer('ΝΑΙ', true), Answer('ΟΧΙ', false)]),
];
List<Question> c5 = [
  Question(
      '5', true, 'Φθάνοντας πίσω από αυτό το σχολικό λεωφορείο σε στάση:', [
    Answer('Σταµατάτε σε κάθε περίπτωση.', false),
    Answer(
        'Επιβραδύνετε και αν ο δρόμος έχει µέχρι δύο λωρίδες σταματάτε.', true),
    Answer('Πατάτε την κόρνα.', false)
  ]),
  Question(
      '5',
      true,
      'Μόλις πάρετε την άδεια οδηγήσεώς σας, είστε υποχρεωμένος να έχετε τοποθετημένο το ειδικό σήµα του νέου οδηγού (Ν) στο πίσω τζάµι του αυτοκινήτου σας για ένα έτος:',
      [
        Answer('Σε όλο το οδικό δίκτυο.', true),
        Answer(
            'Μόνο στις οδούς ταχείας κυκλοφορίας και τους αυτοκινητόδροµους.',
            false),
        Answer('Μόνο µέσα στις πόλεις.', false)
      ]),
  Question(
      '5',
      true,
      'Τα όρια ταχύτητας που τίθενται µε πινακίδες σαν αυτή του σχήματος έχουν σκοπό:',
      [
        Answer('Να τα φτάνετε.', false),
        Answer('Να µην τα υπερβαίνετε.', true),
        Answer('ως συμβουλή.', false)
      ]),
  Question(
      '5',
      true,
      'Προσαρµόζετε την ταχύτητά σας για να καταφέρετε να σταματήσετε στο ορατό και ελεύθερο διάστηµα του δρόμου εμπρός από το όχηµά σας:',
      [Answer('ΝΑΙ', true), Answer('ΟΧΙ', false)]),
  Question('5', true,
      'Τα όρια ταχύτητας στην Ελλάδα για τα επιβατηγά αυτοκίνητα είναι:', [
    Answer(
        '120km/h σε αυτοκινητόδρομο και 50km/h σε κατοικηµένη περιοχή.', true),
    Answer('90km/h σε όλο το εθνικό οδικό δίκτυο.', false)
  ]),
  Question('5', true,
      'Τα όρια ταχύτητας στην Ελλάδα για τα επιβατηγά αυτοκίνητα είναι:', [
    Answer('110km/h σε οδούς ταχείας κυκλοφορίας.', true),
    Answer(
        '130km/h σε οδούς µε διάζωµα που χωρίζει τις δύο κατευθύνσεις.', false),
    Answer('60km/h σε κατοικημένη περιοχή.', false)
  ]),
  Question(
      '5',
      true,
      'Η πινακίδα εισόδου σε κατοικημένη περιοχή σηµαίνει ταυτόχρονα πως το όριο ταχύτητας περιορίξεται σε:',
      [Answer('50 km/h', true), Answer('60 km/h', false)]),
  Question('5', true, 'Σε αυτήν την περίπτωση:', [
    Answer('Κορνάρετε.', false),
    Answer('Επιβραδύνετε και δεν προσπερνάτε.', true),
    Answer('Ενεργοποιείτε τα φώτα κινδύνου.', false)
  ]),
  Question(
      '5',
      true,
      'Κινείσθε στην αριστερή λωρίδα κυκλοφορίας της οδού και στη δεξιά λωρίδα υπάρχει σταθµευµένο φορτηγό. Τι πρέπει να προσέξετε ιδιαίτερα στην κατάσταση αυτή και γιατί:',
      [
        Answer(
            'Να µην υπερρβείτε το ανώτερο επιτρεπόμενο όριο ταχύτητας στην περιοχή αυτή.',
            false),
        Answer(
            'Πρέπει να ανακόψετε ταχύτητα και να παρατηρείτε µήπως εμπρός απότο σταθµευµένο φορτηγό αυτοκίνητο, πεταχτεί ξαφνικά κάποιος πεζός.',
            true)
      ]),
  Question(
      '5',
      false,
      'Σε ποια από τις ακόλουθες περιπτώσεις πρέπει να µετριάζετε την ταχύτητα του οχήµατός σας:',
      [
        Answer('Στις στροφές.', true),
        Answer('Όταν προσπερνώντας άλλο όχηµα βρίσκεσθε παράπλευρα σε αυτό.',
            false),
        Answer('Όταν περνάτε εμπρός από χώρους σταθµεύσεως γενικά.', false)
      ]),
  Question(
      '5',
      false,
      'Αν το όριο δεν καθορίζεται µε ειδικές πινακίδες ποιο είναι το ανώτατο επιτρεπόμενο όριο ταχύτητας των επιβατηγών αυτοκινήτων εχτός κατοικημένων περιοχών και εφόσον δεν είναι αυτοκινητόδρομος ή οδός ταχείας κυκλοφορίας:',
      [
        Answer('100 km/h.', false),
        Answer('80 km/h.', false),
        Answer('90 km/h.', true)
      ]),
  Question(
      '5',
      false,
      'Σε µία οδό ταχείας κυκλοφορίας, η ανώτατη επιτρεπόµενη ταχύτητα σε κανονικές καιρικές συνθήκες είναι:',
      [
        Answer('110 km/h γενικά για όλα οχήματα.', false),
        Answer(
            '80 km/h για τα φορτηγά άνω των 3,5 τόνων και 90 km/h για τα λεωφορεία και λοιπά φορτηγά.',
            true)
      ]),
  Question(
      '5',
      false,
      'Σε ποια από τις ακόλουθες περιπτώσεις πρέπει να µετριάσετε την ταχύτητα του οχήµατός σας:',
      [
        Answer('Όταν προσπερνάτε λεωφορείο σταματηµένο σε στάση.', true),
        Answer('Στις απότομες ανηφόρες.', false),
        Answer('Όταν περνάτε εμπρός από τροχονόµο.', false)
      ]),
  Question(
      '5',
      false,
      'Ποιο είναι το ανώτατο επιτρεπόμενο όριο ταχύτητας των επιβατηγών αυτοκινήτων σε αυτοκινητόδρομους αν τούτο δεν καθορίζεται µε ειδικές πινακίδες:',
      [
        Answer('100 km/h.', false),
        Answer('130 km/h.', true),
        Answer('150 km/h.', false)
      ]),
  Question(
      '5',
      false,
      'Σε περίπτωση απότοµης επιβραδύνσεως της κυκλοφορίας πώς προειδοποιείτε τα ακολουθούντα οχήματα:',
      [
        Answer(
            'Με διαδοχικές πιέσεις στο ποδόφρενο για να αναβοσβήσουν τα φώτα πεδήσεως',
            true),
        Answer('Ανάβετε τα πίσω φώτα ομίχλης.', false)
      ]),
  Question(
      '5',
      false,
      'Σε µία οδό ταχείας κυκλοφορίας. η ανώτατη επιτρεπόµενη ταχύτητα για τα επιβατηγά αυτοκίνητα και τις μοτοσυκλέτες άνω των 125 cc είναι:',
      [Answer('120 km/h.', false), Answer('110 km/h.', true)]),
  Question('5', false, 'Όταν οδηγείτε επί πολύ ώρα µε υψηλή ταχύτητα:', [
    Answer('Η ετοιμότητα αντιδράσεως αυξάνεται.', false),
    Answer('Οδηγείτε πολύ πλησίον στο προπορευόµενο όχημα.', false),
    Answer('Μειώνεται η αίσθηση της ταχύτητας.', true)
  ]),
  Question(
      '5',
      false,
      'Ποιο είναι το ανώτατο επιτρεπόμενο όριο ταχύτητας των επιβατηγών αυτοκινήτων σε οδούς ταχείας κυκλοφορίας αν τούτο δεν καθορίζεται µε ειδικές πινακίδες:',
      [
        Answer('100 km/h.', false),
        Answer('110 km/h.', true),
        Answer('90 km/h.', false)
      ]),
  Question(
      '5',
      false,
      'Σε δρόμους που αναπτύσσονται υψηλές ταχύτητες, σε περίπτωση απότοµης επιβραδύνσεως της κυκλοφορίας πώς προειδοποιείτε τα ακολουθούντα οχήματα:',
      [
        Answer('Ενεργοποιείτε τα φώτα έκτακτης ανάγκης (αλάρμ).', true),
        Answer('Κορνάρετε.', false)
      ]),
  Question(
      '5',
      false,
      'Τι εννοούµε όταν λέμε ότι ο οδηγός πρέπει να είναι κύριος της ταχύτητας του οχήµατός του:',
      [
        Answer(
            ' Να µπορεί να αυξάνει και να μειώνει την ταχύτητα του οχήµατός του κατά βούληση.',
            false),
        Answer('Να κινεί το όχημά του µε µικρή ταχύτητα.', false),
        Answer(
            'Να ρυθµίζει την ταχύτητα του οχήµατός του ανάλογα µε τις υπάρχουσες συνθήκες.',
            true)
      ]),
];
List<Question> c6 = [
  Question(
    '6',
    true,
    'Ποια από τις σημειούμενες πορείες πρέπει να ακολουθήσει ο µοτοσυκλετιστής για να στρίψει αριστερά από δρόμο διπλής κατευθύνσεως:',
    [
      Answer('Την πορεία 1.', true),
      Answer('Την πορεία 2.', false),
      Answer('Οποιαδήποτε από τις δύο πορείες.', false)
    ],
  ),
  Question(
    '6',
    true,
    'Σε κανονική κυκλοφορία, όταν οι λωρίδες οριοθετούνται από διακεκοµµένες γραμμές:',
    [
      Answer('Κινείσθε εντελώς στο δεξιό άκρο της λωρίδας.', false),
      Answer(
          'Οδηγείτε µέσα στα όρια της λωρίδας χαι κατά το δυνατόν στο µέσο της. ',
          true),
      Answer('Κινείσθε στο αριστερό άκρο της λωρίδας.', false)
    ],
  ),
  Question(
    '6',
    true,
    'Για να στρίψετε αριστερά σε διασταύρωση από οδό διπλής κατευθύνσεως:',
    [
      Answer('Κινείσθε προς τον άξονα της οδού που θα εγκαταλείψετε.', true),
      Answer('Παραμένετε πλήρως προς τα δεξιά της οδού.', false),
      Answer('Κινείσθε στο αριστερό άκρο της οδού.', false)
    ],
  ),
  Question(
    '6',
    true,
    'Σε κανονική πορεία, σε αυτοκινητόδρομο µε τρεις λωρίδες κυκλοφορίας ανά κατεύθυνση, ανεξάρτητα από την ταχύτητά σας, οδηγείτε σωστά αν κινείσθε:',
    [
      Answer('Στη µεσαία λωρίδα.', false),
      Answer('Στη δεξιά λωρίδα.', true),
      Answer('Στην αριστερή λωρίδα.', false)
    ],
  ),
  Question(
    '6',
    true,
    'Το αυτοκίνητο έχει σταματήσει στη σωστή θέση του οδοστρώμµατος και γιατί:',
    [
      Answer(
          'Όχι, διότι θα έπρεπε να πλησιάσει πιο κοντά, στο ύψος του φωτεινού σηµατοδότη.',
          false),
      Answer(
          'Ναι, διότι έχει σταματήσει πριν από την ειδική γραμμή διακοπής πορείας της διαβάσεως των πεζών.',
          true)
    ],
  ),
  Question(
    '6',
    true,
    'Σε έναν αυτοχκινητόδρομο ή ένα δρόμο ταχείας κυκλοφορίας µε τρεις λωρίδες ανά κατεύθυνση ρυμουλκείτε ένα τροχόσπιτο:',
    [
      Answer(
          'Μπορείτε να χρησιμοποιήσετε την αριστερή λωρίδα για να προσπεράσετε.',
          false),
      Answer(
          'Δεν µπορείτε να χρησιμοποιήσετε την αριστερή λωρίδα για να προσπεράσετε.',
          true)
    ],
  ),
  Question(
    '6',
    true,
    'Σε αυτήν την περίπτωση µπορείτε ακόµη να στρίψετε αριστερά:',
    [Answer('ΝΑΙ', false), Answer('ΟΧΙ', true)],
  ),
  Question(
    '6',
    true,
    'Σε αυτήν την περίπτωση, τα δύο οχήµατα που αναμένουν, θα στρίψουν αριστερά έχοντας το καθένα το άλλο όχημα στα δεξιά του:',
    [Answer('ΝΑΙ', true), Answer('ΟΧΙ', false)],
  ),
  Question(
    '6',
    true,
    'Στη φωτογραφία, οδηγείτε σε έναν αυτοκινητόδρομο µε τρεις λωρίδες ανα κατεύθυνση και κινείσθε µε το ανώτατο επιτρεπόμενο όριο ταχύτητας:',
    [
      Answer('Παραχωρείτε τη δεξιά λωρίδα στα βαρέα οχήματα.', false),
      Answer('Προσπερνάτε το φορτηγό και επανέρχεσθε στη δεξιά λωρίδα.', true),
      Answer(
          'Κινείσθε στην αριστερή λωρίδα για να παρεμποδίσετε κάποιους να κινηθούν µε ταχύτητα πάνω από το όριο.',
          false)
    ],
  ),
  Question(
    '6',
    true,
    'Το αυτοκίνητο έχει σταματήσει σε σωστή θέση και γιατί:',
    [
      Answer(
          'Όχι διότι δεν σταμάτησε πριν από την ειδική γραμμή διακοπής πορείας στη διάβαση των πεζών.',
          true),
      Answer(
          'Ναι, διότι σταμάτησε σε σηµείο επάνω στη διάβαση ώστε ο οδηγός να ελέγχει αν έρχονται οχήματα από δεξιά.',
          false)
    ],
  ),
  Question(
    '6',
    false,
    'Τι πρέπει να κάνετε προκειµένου να αλλάξετε λωρίδα κυκλοφορίας:',
    [
      Answer(
          'Να ελέγξτε µετους καθρέπτες και να κάνετε εγκαίρως γνωστή την πρόθεσή σας στους ακολουθούντες, χρησιμοποιώντας τους δείκτες κατευθύνσεως.',
          true),
      Answer(
          'Να χρησιμοποιήσετε τους δείκτες κατευθύνσεως µόνο όταν το όχηµα που ακολουθεί βρίσκεται κοντά σας.',
          false),
      Answer(
          'Τίποτε, εφόσον το όχηµα που ακολουθεί βρίσκεται σε αρκετή απόσταση από το δικό σας.',
          false)
    ],
  ),
  Question(
    '6',
    false,
    'Όταν σε ὀρόμο διπλής κατευθύνσεως θελήσετε να στρίψετε αριστερά, ποια θέση θα πάρετε επάνω στο οδόστρωμα:',
    [
      Answer(
          'Κοντά στον άξονα του οδοστρώματος, δηλαδή κοντά στη γραμμή που χωρίζει τις δύο κατευθύνσεις κυκλοφορίας.',
          true),
      Answer('Επάνω στη γραµµή που χωρίζει τις δύο κατευθύνσεις κυκλοφορίας.',
          false),
      Answer('Στην αριστερή πλευρά του οδοστρώµματος.', false)
    ],
  ),
  Question(
    '6',
    false,
    'Όταν δρόμος διπλής κατευθύνσεως, που διαθέτει δύο λωρίδες κυκλοφορίας για κάθε κατεύθυνση, είναι τελείως ελεύθερος σε ποια λωρίδα επάνω σε αυτόν επιτρέπεται να κινείσθε:',
    [
      Answer('Στη δεξιά λωρίδα κυκλοφορίας', true),
      Answer(
          'Σε οποιαδήποτε από τις δύο λωρίδες της δεξιάς κατευθύνσεως.', false),
      Answer('Στην αριστερή λωρίδα κυκλοφορίας.', false)
    ],
  ),
  Question(
    '6',
    false,
    'Αν σε ένα οδόστρωμα διπλής κατευθύνσεως, χωρίζουν τις κατευθύνσεις κυκλοφορίας δύο λευκές συνεχείς γραµµές, επιτρέπεται η υπέρβασή τους:',
    [
      Answer('Όχι, σε καμιά περίπτωση.', true),
      Answer('Ναι, εάν έχετε ορατότητα και ελέγχετε την απέναντι κατεύθυνση.',
          false),
      Answer('Ναι, εάν το προπορευόµενο όχηµα κινείται µε πολύ µικρή ταχύτητα.',
          false)
    ],
  ),
  Question(
    '6',
    false,
    'Σε ποια περίπτωση επιτρέπεται να περάσετε αντίθετα προς την κατεύθυνση της κυκλοφορίας σε µονόδρομο:',
    [
      Answer('Όταν ο μονόδρομος είναι τελείως ελεύθερος.', false),
      Answer(
          'Όταν µε το όχηµά σας μεταφέρετε άτομο που έχει ανάγκη άµεσης βοήθειας.',
          false),
      Answer('Σε καμιά περίπτωση.', true)
    ],
  ),
  Question(
    '6',
    false,
    'Σε ένα δρόμο µε πυκνή κυκλοφορία έχετε πάρει θέση για να στρίψετε αριστερά. Επάνω στη διασταύρωση διαπιστώνετε ότι έπρεπε να είχατε στρίψει δεξιά.Πώς συμπεριφέρεσθε:',
    [
      Answer(
          'Σταµατάτε και προσπαθείτε µε οπισθοπορεία να τοποθετηθείτε σωστά (στο οδόστρωμα).',
          false),
      Answer('Στρίβετε αριστερά.', true),
      Answer(
          'Προειδοποιείτε τους άλλους συμμετέχοντες στην κυκλοφορία µε τα ηχητικά όργανα, ανάβετε το δεξί φλας και µετά στρίβετε δεξιά.',
          false)
    ],
  ),
  Question(
    '6',
    false,
    'Αν σε ένα οδόστρωμα διπλής κατευθύνσεως, χωρίζει τις κατευθύνσεις κυκλοφορίας λευκή συνεχής γραµµή, επιτρέπεται η υπέρβασή της:',
    [
      Answer(
          'Ναι, εάν δεν βλέπετε να έρχονται από την αντίθετη κατεύθυνση οχήματα.',
          false),
      Answer('Όχι, σε καμιά περίπτωση.', true),
      Answer(
          'Ναι, αν είναι να προσπεράσετε άλλο όχηµα που κινείται µε µικρή ταχύτητα.',
          false)
    ],
  ),
  Question(
    '6',
    false,
    'Όταν σταµατάτε σε κόκκινο φανάρι, ποια είναι η σωστή θέση του οχήµατός σας:',
    [
      Answer('Στο ύψος του σηµατοδότη. ', false),
      Answer(
          'Πριν το σηµατοδότη και το μπροστινό µέρος του οχήματος να µην καλύπτει καθόλου τη γραμμή διακοπής πορείας πριν τη διάβαση των πεζών.',
          true),
      Answer('Σε οποιαδήποτε θέση πριν τη διασταύρωση.', false)
    ],
  ),
  Question(
    '6',
    false,
    'Σε ποία περίπτωση μπορούν τα οχήματα να κινούνται επάνω στις γραμμές που χωρίζουν τις λωρίδες κυκλοφορίας των οδοστρωμάτων:',
    [
      Answer('Όταν επιτρέπεται η κυκλοφορία σε παράλληλους στοίχους (σειρές)',
          false),
      Answer('Όταν οι γραμμές είναι διακεκομμένες', false),
      Answer('Σε καμία περίπτωση.', true)
    ],
  ),
  Question(
    '6',
    false,
    'Σε ποιους δρόμους κατοικημένων περιοχών επιτρέπεται η κυκλοφορία των οχημάτων σε παράλληλους στοίχους:',
    [
      Answer('Μόνο σε µονόδροµους.', false),
      Answer('Σε δρόμους µε µεγάλη πυκνότητα κυκλοφορίας.', false),
      Answer(
          'Σε δρόμους διπλής κατευθύνσεως, µε δύο τουλάχιστον λωρίδες κυκλοφορίας για κάθε κατεύθυνση και σε µονόδρομους µε δύο τουλάχιστον λωρίδες κυκλοφορίας.',
          true)
    ],
  ),
  Question(
    '6',
    false,
    'Προσεγγίξετε σε µία διασταύρωση που το οδόστρωμα είναι διαγραμμισμµένο µε βέλη και γραμμές που επιτρέπουν την πορεία µόνο ευθεία, ενώ εσείς θέλετε να στρίψετε δεξιά. Πώς πρέπει να συμπεριφερθείτε:',
    [Answer('Οδηγείτε ευθεία εμπρός.', true), Answer('Στρίβετε δεξιά.', false)],
  ),
  Question(
    '6',
    false,
    'Όταν βρίσκεσθε σε μονόδρομο µε τρεις λωρίδες κυκλοφορίας και έχετε πρόθεση να στρίψετε αριστερά,ποια λωρίδα θα ακολουθήσετε:',
    [
      Answer('Τη μεσαία.', false),
      Answer('Την αριστερή.', true),
      Answer('Τη δεξιά.', false)
    ],
  ),
];

List<List<Question>> listData = [c1, c2, c3, c4, c5, c6];

// Generates a quiz but getting 5 random questions from each category
List<Question> generateQuiz(templistData) {
  var random = new Random();
  var questions = <Question>[];
  List<List<Question>> cloneList = List.generate(
      templistData.length, (index) => List.from(templistData[index]));
  //var cloneList = [...templistData];
  //var cloneList = new List.from(templistData);

  for (List<Question> list in cloneList) {
    for (var i = 0; i <= 4; i++) {
      var randInt = random.nextInt(list.length);
      questions.add(list[randInt]);
      list.remove(list[randInt]);
    }
  }
  return questions;
}
