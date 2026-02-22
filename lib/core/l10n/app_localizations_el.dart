// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get abortQuizTitle => 'Ακύρωση Quiz;';

  @override
  String get abortQuizMessage =>
      'Το άνοιγμα ενός νέου αρχείου θα διακόψει το τρέχον κουίζ.';

  @override
  String get stopAndOpenButton => 'Διακοπή & Άνοιγμα';

  @override
  String get titleAppBar => 'Κουίζ - Προσομοιωτής Εξετάσεων';

  @override
  String get create => 'Δημιουργία';

  @override
  String get preview => 'Προεπισκόπηση';

  @override
  String get previewLabel => 'Προεπισκόπηση:';

  @override
  String get emptyPlaceholder => '(κενό)';

  @override
  String get latexSyntaxTitle => 'Σύνταξη LaTeX:';

  @override
  String get latexSyntaxHelp =>
      'Ενσωματωμένα μαθηματικά: Χρησιμοποιήστε \$...\$ για εκφράσεις LaTeX\nΠαράδειγμα: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'Προεπισκόπηση απόδοσης LaTeX';

  @override
  String get okButton => 'ΟΚ';

  @override
  String get load => 'Φόρτωση';

  @override
  String fileLoaded(String filePath) {
    return 'Το αρχείο φορτώθηκε: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'Το αρχείο αποθηκεύτηκε: $filePath';
  }

  @override
  String get dropFileHere =>
      'Κάντε κλικ στο λογότυπο ή σύρετε ένα αρχείο .quiz στην οθόνη';

  @override
  String get errorOpeningFile => 'Σφάλμα κατά το άνοιγμα του αρχείου';

  @override
  String get replaceFileTitle => 'Φόρτωση νέου Quiz';

  @override
  String get replaceFileMessage =>
      'Ένα Quiz είναι ήδη φορτωμένο. Θέλετε να το αντικαταστήσετε με το νέο αρχείο;';

  @override
  String get replaceButton => 'Φόρτωση';

  @override
  String get clickOrDragFile =>
      'Κάντε κλικ για φόρτωση ή σύρετε ένα αρχείο .quiz στην οθόνη';

  @override
  String get errorInvalidFile =>
      'Σφάλμα: Μη έγκυρο αρχείο. Πρέπει να είναι αρχείο .quiz.';

  @override
  String errorLoadingFile(String error) {
    return 'Σφάλμα κατά τη φόρτωση του αρχείου Quiz: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Σφάλμα κατά την εξαγωγή του αρχείου: $error';
  }

  @override
  String get cancelButton => 'Ακύρωση';

  @override
  String get saveButton => 'Αποθήκευση';

  @override
  String get confirmDeleteTitle => 'Επιβεβαίωση Διαγραφής';

  @override
  String confirmDeleteMessage(String processName) {
    return 'Είστε σίγουροι ότι θέλετε να διαγράψετε τη διαδικασία `$processName`;';
  }

  @override
  String get deleteButton => 'Διαγραφή';

  @override
  String get confirmExitTitle => 'Επιβεβαίωση Εξόδου';

  @override
  String get confirmExitMessage =>
      'Υπάρχουν μη αποθηκευμένες αλλαγές. Θέλετε να φύγετε απορρίπτοντας τις αλλαγές;';

  @override
  String get exitButton => 'Έξοδος χωρίς αποθήκευση';

  @override
  String get saveDialogTitle => 'Παρακαλώ επιλέξτε αρχείο εξόδου:';

  @override
  String get createQuizFileTitle => 'Δημιουργία Αρχείου Quiz';

  @override
  String get editQuizFileTitle => 'Επεξεργασία Αρχείου Κουίζ';

  @override
  String get fileNameLabel => 'Όνομα Αρχείου';

  @override
  String get fileDescriptionLabel => 'Περιγραφή Αρχείου';

  @override
  String get createButton => 'Δημιουργία';

  @override
  String get fileNameRequiredError => 'Το όνομα αρχείου είναι υποχρεωτικό.';

  @override
  String get fileDescriptionRequiredError =>
      'Η περιγραφή αρχείου είναι υποχρεωτική.';

  @override
  String get versionLabel => 'Έκδοση';

  @override
  String get authorLabel => 'Συγγραφέας';

  @override
  String get authorRequiredError => 'Ο συγγραφέας είναι υποχρεωτικός.';

  @override
  String get requiredFieldsError =>
      'Όλα τα υποχρεωτικά πεδία πρέπει να συμπληρωθούν.';

  @override
  String get requestFileNameTitle => 'Εισάγετε το όνομα του αρχείου Quiz';

  @override
  String get fileNameHint => 'Όνομα αρχείου';

  @override
  String get emptyFileNameMessage =>
      'Το όνομα αρχείου δεν μπορεί να είναι κενό.';

  @override
  String get acceptButton => 'Αποδοχή';

  @override
  String get saveTooltip => 'Αποθήκευση αρχείου';

  @override
  String get saveDisabledTooltip => 'Δεν υπάρχουν αλλαγές για αποθήκευση';

  @override
  String get executeTooltip => 'Εκτέλεση εξέτασης';

  @override
  String get addTooltip => 'Προσθήκη νέας ερώτησης';

  @override
  String get backSemanticLabel => 'Κουμπί επιστροφής';

  @override
  String get createFileTooltip => 'Δημιουργία νέου αρχείου Quiz';

  @override
  String get loadFileTooltip => 'Φόρτωση υπάρχοντος αρχείου Quiz';

  @override
  String questionNumber(int number) {
    return 'Ερώτηση $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return 'Ερώτηση $current από $total';
  }

  @override
  String get previous => 'Προηγούμενο';

  @override
  String get skip => 'Παράλειψη';

  @override
  String get questionsOverview => 'Χάρτης Ερωτήσεων';

  @override
  String get next => 'Επόμενο';

  @override
  String get finish => 'Τέλος';

  @override
  String get finishQuiz => 'Ολοκλήρωση Κουίζ';

  @override
  String get finishQuizConfirmation =>
      'Είστε σίγουροι ότι θέλετε να ολοκληρώσετε το κουίζ; Δεν θα μπορείτε να αλλάξετε τις απαντήσεις σας μετά.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount αναπάντητες ερωτήσεις',
      one: '1 αναπάντητη ερώτηση',
    );
    return 'Έχετε $_temp0. Είστε σίγουροι ότι θέλετε να ολοκληρώσετε το κουίζ?';
  }

  @override
  String get resolveUnansweredQuestions => 'Επίλυση ερωτήσεων';

  @override
  String get abandonQuiz => 'Εγκατάλειψη Κουίζ';

  @override
  String get abandonQuizConfirmation =>
      'Είστε σίγουροι ότι θέλετε να εγκαταλείψετε το κουίζ; Όλη η πρόοδος θα χαθεί.';

  @override
  String get abandon => 'Εγκατάλειψη';

  @override
  String get quizCompleted => 'Το Κουίζ Ολοκληρώθηκε!';

  @override
  String score(String score) {
    return 'Βαθμολογία: $score%';
  }

  @override
  String correctAnswers(int correct, int total) {
    return '$correct από $total σωστές απαντήσεις';
  }

  @override
  String get retry => 'Επανάληψη';

  @override
  String get goBack => 'Τέλος';

  @override
  String get retryFailedQuestions => 'Επανάληψη Λάθος';

  @override
  String question(String question) {
    return 'Ερώτηση: $question';
  }

  @override
  String get selectQuestionCountTitle => 'Επιλογή Αριθμού Ερωτήσεων';

  @override
  String get selectQuestionCountMessage =>
      'Πόσες ερωτήσεις θα θέλατε να απαντήσετε σε αυτό το κουίζ;';

  @override
  String allQuestions(int count) {
    return 'Όλες οι ερωτήσεις ($count)';
  }

  @override
  String get startQuiz => 'Έναρξη Κουίζ';

  @override
  String get maxIncorrectAnswersLabel => 'Περιορισμός λανθασμένων απαντήσεων';

  @override
  String get maxIncorrectAnswersDescription =>
      'Εξέταση Επιτυχίας/Αποτυχίας. Δεν υπάρχει αριθμητική βαθμολογία.';

  @override
  String get maxIncorrectAnswersOffDescription =>
      'Η εξέταση έχει αριθμητική βαθμολογία από 0 έως 100.';

  @override
  String get maxIncorrectAnswersLimitLabel =>
      'Μέγιστος αριθμός επιτρεπόμενων σφαλμάτων';

  @override
  String get quizFailedLimitReached =>
      'Το κουίζ διακόπηκε: Συμπληρώθηκε το όριο σφαλμάτων';

  @override
  String get errorInvalidNumber => 'Παρακαλώ εισάγετε έγκυρο αριθμό';

  @override
  String get errorNumberMustBePositive =>
      'Ο αριθμός πρέπει να είναι μεγαλύτερος από 0';

  @override
  String get customNumberLabel => 'Ή εισάγετε προσαρμοσμένο αριθμό:';

  @override
  String get numberInputLabel => 'Αριθμός ερωτήσεων';

  @override
  String get questionOrderConfigTitle => 'Διαμόρφωση Σειράς Ερωτήσεων';

  @override
  String get questionOrderConfigDescription =>
      'Επιλέξτε τη σειρά εμφάνισης των ερωτήσεων κατά την εξέταση:';

  @override
  String get questionOrderAscending => 'Αύξουσα Σειρά';

  @override
  String get questionOrderAscendingDesc =>
      'Οι ερωτήσεις θα εμφανίζονται με σειρά από 1 έως το τέλος';

  @override
  String get questionOrderDescending => 'Φθίνουσα Σειρά';

  @override
  String get questionOrderDescendingDesc =>
      'Οι ερωτήσεις θα εμφανίζονται από το τέλος προς το 1';

  @override
  String get questionOrderRandom => 'Τυχαία σειρά ερωτήσεων';

  @override
  String get questionOrderRandomDesc =>
      'Οι ερωτήσεις θα εμφανίζονται με τυχαία σειρά';

  @override
  String get questionOrderConfigTooltip => 'Διαμόρφωση σειράς ερωτήσεων';

  @override
  String get reorderQuestionsTooltip => 'Αναδιάταξη ερωτήσεων';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get examConfigurationTitle => 'Διαμόρφωση Εξέτασης';

  @override
  String get examTimeLimitTitle => 'Χρονικό Όριο Εξέτασης';

  @override
  String get examTimeLimitDescription =>
      'Ορίστε χρονικό όριο για την εξέταση. Θα εμφανίζεται χρονόμετρο κατά τη διάρκεια του κουίζ.';

  @override
  String get examTimeLimitOffDescription =>
      'Δεν υπάρχει χρονικό όριο για αυτήν την εξέταση.';

  @override
  String get enableTimeLimit => 'Ενεργοποίηση χρονικού ορίου';

  @override
  String get timeLimitMinutes => 'Χρονικό όριο (λεπτά)';

  @override
  String get examTimeExpiredTitle => 'Τέλος Χρόνου!';

  @override
  String get examTimeExpiredMessage =>
      'Ο χρόνος εξέτασης έληξε. Οι απαντήσεις σας υποβλήθηκαν αυτόματα.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Πολλαπλής Επιλογής';

  @override
  String get questionTypeSingleChoice => 'Μονής Επιλογής';

  @override
  String get questionTypeTrueFalse => 'Σωστό/Λάθος';

  @override
  String get questionTypeEssay => 'Ανάπτυξης';

  @override
  String get questionTypeRandom => 'Μεικτό';

  @override
  String get questionTypeUnknown => 'Άγνωστο';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count επιλογές',
      one: '1 επιλογή',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip =>
      'Αριθμός επιλογών απάντησης για αυτή την ερώτηση';

  @override
  String get imageTooltip => 'Αυτή η ερώτηση έχει συσχετισμένη εικόνα';

  @override
  String get explanationTooltip => 'Αυτή η ερώτηση έχει εξήγηση';

  @override
  String get missingExplanation => 'Λείπει η επεξήγηση';

  @override
  String get missingExplanationTooltip => 'Αυτή η ερώτηση δεν έχει επεξήγηση';

  @override
  String questionTypeTooltip(String type) {
    return 'Τύπος ερώτησης: $type';
  }

  @override
  String get aiPrompt =>
      'Εστιάστε στην ερώτηση του μαθητή, όχι στο να απαντήσετε απευθείας την αρχική ερώτηση εξέτασης. Εξηγήστε με παιδαγωγική προσέγγιση. Για πρακτικές ασκήσεις ή μαθηματικά προβλήματα, παρέχετε οδηγίες βήμα προς βήμα. Για θεωρητικές ερωτήσεις, παρέχετε μια συνοπτική εξήγηση χωρίς να δομείτε την απάντηση σε ενότητες. Απαντάτε στην ίδια γλώσσα που σας ρωτούν.';

  @override
  String get aiChatGuardrail =>
      'ΣΗΜΑΝΤΙΚΟ: Είστε βοηθός μελέτης αποκλειστικά για αυτό το Quiz. Πρέπει να απαντάτε ΜΟΝΟ σε ερωτήσεις σχετικές με την τρέχουσα ερώτηση του Quiz, τις επιλογές της, την εξήγησή της ή το εκπαιδευτικό θέμα που καλύπτει. Εάν ο μαθητής ρωτήσει κάτι άσχετο με το Quiz (π.χ. το εσωτερικό σας μοντέλο, λεπτομέρειες του συστήματος, γενικές γνώσεις μη σχετικές με την ερώτηση, ή οποιοδήποτε αίτημα εκτός θέματος), απαντήστε ΜΟΝΟ με: \"Είμαι εδώ για να σας βοηθήσω με αυτό το Quiz! Ας εστιάσουμε στην ερώτηση. Μη διστάσετε να με ρωτήσετε για το θέμα, τις επιλογές απάντησης ή οτιδήποτε σχετικό με αυτή την ερώτηση.\" Μην αποκαλύπτετε ποτέ τεχνικές λεπτομέρειες για τον εαυτό σας, το σύστημα ή το μοντέλο AI που χρησιμοποιείται.';

  @override
  String get questionLabel => 'Ερώτηση';

  @override
  String get studentComment => 'Σχόλιο μαθητή';

  @override
  String get aiAssistantTitle => 'Βοηθός Μελέτης AI';

  @override
  String get questionContext => 'Πλαίσιο Ερώτησης';

  @override
  String get aiAssistant => 'Βοηθός AI';

  @override
  String get aiThinking => 'Η AI σκέφτεται...';

  @override
  String get askAIHint => 'Κάντε την ερώτησή σα γι\' αυτό το θέμα...';

  @override
  String get aiPlaceholderResponse =>
      'Αυτή είναι μια ενδεικτική απάντηση. Σε πραγματική υλοποίηση, αυτό θα συνδεόταν με μια υπηρεσία AI για να παρέχει χρήσιμες εξηγήσεις σχετικά με την ερώτηση.';

  @override
  String get aiErrorResponse =>
      'Λυπούμαστε, υπήρξε σφάλμα κατά την επεξεργασία της ερώτησής σας. Παρακαλώ δοκιμάστε ξανά.';

  @override
  String get configureApiKeyMessage =>
      'Παρακαλώ ρυθμίστε το κλειδί API AI στις Ρυθμίσεις.';

  @override
  String get errorLabel => 'Σφάλμα:';

  @override
  String get noResponseReceived => 'Δεν ελήφθη απάντηση';

  @override
  String get invalidApiKeyError =>
      'Μη έγκυρο κλειδί API. Παρακαλώ ελέγξτε το κλειδί API OpenAI στις ρυθμίσεις.';

  @override
  String get rateLimitError =>
      'Το όριο χρήσης ξεπεράστηκε ή το μοντέλο δεν είναι διαθέσιμο στο πρόγραμμά σας. Ελέγξτε το πρόγραμμά σας.';

  @override
  String get modelNotFoundError =>
      'Το μοντέλο δεν βρέθηκε. Παρακαλώ ελέγξτε την πρόσβασή σας στο API.';

  @override
  String get unknownError => 'Άγνωστο σφάλμα';

  @override
  String get networkErrorOpenAI =>
      'Σφάλμα δικτύου: Αδυναμία σύνδεσης με το OpenAI. Ελέγξτε τη σύνδεσή σας στο διαδίκτυο.';

  @override
  String get networkErrorGemini =>
      'Σφάλμα δικτύου: Αδυναμία σύνδεσης με το Gemini. Ελέγξτε τη σύνδεσή σας στο διαδίκτυο.';

  @override
  String get openaiApiKeyNotConfigured =>
      'Το κλειδί API OpenAI δεν έχει ρυθμιστεί';

  @override
  String get geminiApiKeyNotConfigured =>
      'Το κλειδί API Gemini δεν έχει ρυθμιστεί';

  @override
  String get geminiApiKeyLabel => 'Κλειδί API Gemini';

  @override
  String get geminiApiKeyHint => 'Εισάγετε το κλειδί API Gemini';

  @override
  String get geminiApiKeyDescription =>
      'Απαιτείται για τη λειτουργικότητα Gemini AI. Το κλειδί σας αποθηκεύεται με ασφάλεια.';

  @override
  String get getGeminiApiKeyTooltip => 'Λήψη κλειδιού API από Google AI Studio';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'Ο Βοηθός Μελέτης AI απαιτεί τουλάχιστον ένα κλειδί API (Gemini ή OpenAI). Παρακαλώ εισάγετε ένα κλειδί API ή απενεργοποιήστε τον Βοηθό AI.';

  @override
  String get minutesAbbreviation => 'λεπ';

  @override
  String get aiButtonTooltip => 'Βοηθός Μελέτης AI';

  @override
  String get aiButtonText => 'AI';

  @override
  String get aiAssistantSettingsTitle => 'Βοηθός Μελέτης AI (Προεπισκόπηση)';

  @override
  String get aiAssistantSettingsDescription =>
      'Ενεργοποίηση ή απενεργοποίηση του βοηθού μελέτης AI για ερωτήσεις';

  @override
  String get aiDefaultModelTitle => 'Προεπιλεγμένο Μοντέλο AI';

  @override
  String get aiDefaultModelDescription =>
      'Επιλέξτε την προεπιλεγμένη υπηρεσία και μοντέλο AI για δημιουργία ερωτήσεων';

  @override
  String get openaiApiKeyLabel => 'Κλειδί API OpenAI';

  @override
  String get openaiApiKeyHint => 'Εισάγετε το κλειδί API OpenAI (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Απαιτείται για ενσωμάτωση με OpenAI. Το κλειδί OpenAI αποθηκεύεται με ασφάλεια.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'Ο Βοηθός Μελέτης AI απαιτεί κλειδί API OpenAI. Παρακαλώ εισάγετε το κλειδί API σας ή απενεργοποιήστε τον Βοηθό AI.';

  @override
  String get getApiKeyTooltip => 'Λήψη κλειδιού API από OpenAI';

  @override
  String get deleteAction => 'Διαγραφή';

  @override
  String get explanationLabel => 'Εξήγηση (προαιρετικό)';

  @override
  String get explanationHint =>
      'Εισάγετε μια εξήγηση για τη/τις σωστή/ές απάντηση/εις';

  @override
  String get explanationTitle => 'Εξήγηση';

  @override
  String get imageLabel => 'Εικόνα';

  @override
  String get changeImage => 'Αλλαγή εικόνας';

  @override
  String get removeImage => 'Αφαίρεση εικόνας';

  @override
  String get addImageTap => 'Πατήστε για προσθήκη εικόνας';

  @override
  String get imageFormats => 'Μορφές: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Σφάλμα φόρτωσης εικόνας';

  @override
  String imagePickError(String error) {
    return 'Σφάλμα φόρτωσης εικόνας: $error';
  }

  @override
  String get tapToZoom => 'Πατήστε για εστίαση';

  @override
  String get trueLabel => 'Σωστό';

  @override
  String get falseLabel => 'Λάθος';

  @override
  String get addQuestion => 'Προσθήκη Ερώτησης';

  @override
  String get editQuestion => 'Επεξεργασία Ερώτησης';

  @override
  String get questionText => 'Κείμενο Ερώτησης';

  @override
  String get questionType => 'Τύπος Ερώτησης';

  @override
  String get addOption => 'Προσθήκη Επιλογής';

  @override
  String get optionsLabel => 'Επιλογές';

  @override
  String get optionLabel => 'Επιλογή';

  @override
  String get questionTextRequired => 'Το κείμενο ερώτησης είναι υποχρεωτικό';

  @override
  String get atLeastOneOptionRequired =>
      'Τουλάχιστον μία επιλογή πρέπει να έχει κείμενο';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'Πρέπει να επιλεγεί τουλάχιστον μία σωστή απάντηση';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'Επιτρέπεται μόνο μία σωστή απάντηση για αυτόν τον τύπο ερώτησης';

  @override
  String get removeOption => 'Αφαίρεση επιλογής';

  @override
  String get selectCorrectAnswer => 'Επιλογή σωστής απάντησης';

  @override
  String get selectCorrectAnswers => 'Επιλογή σωστών απαντήσεων';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'Οι επιλογές $optionNumbers είναι κενές. Παρακαλώ προσθέστε κείμενο ή αφαιρέστε τις.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'Η επιλογή $optionNumber είναι κενή. Παρακαλώ προσθέστε κείμενο ή αφαιρέστε την.';
  }

  @override
  String get optionEmptyError => 'Αυτή η επιλογή δεν μπορεί να είναι κενή';

  @override
  String get hasImage => 'Εικόνα';

  @override
  String get hasExplanation => 'Εξήγηση';

  @override
  String errorLoadingSettings(String error) {
    return 'Σφάλμα φόρτωσης ρυθμίσεων: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'Αδυναμία ανοίγματος $url';
  }

  @override
  String get loadingAiServices => 'Φόρτωση υπηρεσιών AI...';

  @override
  String usingAiService(String serviceName) {
    return 'Χρήση: $serviceName';
  }

  @override
  String get aiServiceLabel => 'Υπηρεσία AI:';

  @override
  String get aiModelLabel => 'Μοντέλο:';

  @override
  String get importQuestionsTitle => 'Εισαγωγή Ερωτήσεων';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return 'Βρέθηκαν $count ερωτήσεις στο \"$fileName\". Πού θέλετε να τις εισάγετε;';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'Πού θα θέλατε να προσθέσετε αυτές τις ερωτήσεις;';

  @override
  String get importAtBeginning => 'Στην Αρχή';

  @override
  String get importAtEnd => 'Στο Τέλος';

  @override
  String questionsImportedSuccess(int count) {
    return 'Εισήχθησαν επιτυχώς $count ερωτήσεις';
  }

  @override
  String get importQuestionsTooltip =>
      'Εισαγωγή ερωτήσεων από άλλο αρχείο quiz';

  @override
  String get dragDropHintText =>
      'Μπορείτε επίσης να σύρετε και να αποθέσετε αρχεία .quiz εδώ για εισαγωγή ερωτήσεων';

  @override
  String get randomizeQuestionsTitle => 'Τυχαία Σειρά Ερωτήσεων';

  @override
  String get randomizeQuestionsDescription =>
      'Ανακάτεμα της σειράς των ερωτήσεων κατά την εκτέλεση του κουίζ';

  @override
  String get randomizeQuestionsOffDescription =>
      'Οι ερωτήσεις θα εμφανίζονται στην αρχική τους σειρά';

  @override
  String get randomizeAnswersTitle => 'Τυχαία σειρά απαντήσεων';

  @override
  String get randomizeAnswersDescription =>
      'Ανακάτεμα της σειράς των επιλογών απάντησης κατά την εκτέλεση του κουίζ';

  @override
  String get randomizeAnswersOffDescription =>
      'Οι επιλογές απάντησης θα εμφανίζονται με την αρχική τους σειρά';

  @override
  String get showCorrectAnswerCountTitle =>
      'Εμφάνιση Αριθμού Σωστών Απαντήσεων';

  @override
  String get showCorrectAnswerCountDescription =>
      'Εμφάνιση του αριθμού των σωστών απαντήσεων σε ερωτήσεις πολλαπλής επιλογής';

  @override
  String get showCorrectAnswerCountOffDescription =>
      'Ο αριθμός των σωστών απαντήσεων δεν θα εμφανίζεται για ερωτήσεις πολλαπλής επιλογής';

  @override
  String correctAnswersCount(int count) {
    return 'Επιλέξτε $count σωστές απαντήσεις';
  }

  @override
  String get correctSelectedLabel => 'Σωστό';

  @override
  String get correctMissedLabel => 'Σωστό';

  @override
  String get incorrectSelectedLabel => 'Λάθος';

  @override
  String get aiGenerateDialogTitle => 'Δημιουργία Ερωτήσεων με AI';

  @override
  String get aiQuestionCountLabel => 'Αριθμός Ερωτήσεων (Προαιρετικό)';

  @override
  String get aiQuestionCountHint => 'Αφήστε κενό για να αποφασίσει το AI';

  @override
  String get aiQuestionCountValidation =>
      'Πρέπει να είναι αριθμός μεταξύ 1 και 50';

  @override
  String get aiQuestionTypeLabel => 'Τύπος Ερώτησης';

  @override
  String get aiQuestionTypeRandom => 'Τυχαίο (Μικτό)';

  @override
  String get aiLanguageLabel => 'Γλώσσα Ερώτησης';

  @override
  String get aiContentLabel => 'Περιεχόμενο για δημιουργία ερωτήσεων';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max λέξεις';
  }

  @override
  String get aiContentHint =>
      'Εισάγετε το κείμενο, θέμα ή περιεχόμενο από το οποίο θέλετε να δημιουργήσετε ερωτήσεις...';

  @override
  String get aiContentHelperText =>
      'Το AI θα δημιουργήσει ερωτήσεις με βάση αυτό το περιεχόμενο';

  @override
  String aiWordLimitError(int max) {
    return 'Έχετε υπερβεί το όριο των $max λέξεων';
  }

  @override
  String get aiContentRequiredError =>
      'Πρέπει να παρέχετε περιεχόμενο για τη δημιουργία ερωτήσεων';

  @override
  String aiContentLimitError(int max) {
    return 'Το περιεχόμενο υπερβαίνει το όριο των $max λέξεων';
  }

  @override
  String get aiMinWordsError =>
      'Παρέχετε τουλάχιστον 10 λέξεις για τη δημιουργία ποιοτικών ερωτήσεων';

  @override
  String get aiInfoTitle => 'Πληροφορίες';

  @override
  String get aiInfoDescription =>
      '• Το AI θα αναλύσει το περιεχόμενο και θα δημιουργήσει σχετικές ερωτήσεις\n• Εάν γράψεις λιγότερες από 10 λέξεις, θα μπεις στη λειτουργία Θέμα όπου θα γίνουν ερωτήσεις για αυτά τα συγκεκριμένα θέματα\n• Με περισσότερες από 10 λέξεις, θα μπεις στη λειτουργία Περιεχόμενο που θα κάνει ερωτήσεις για το ίδιο κείμενο (περισσότερες λέξεις = μεγαλύτερη ακρίβεια)\n• Μπορείτε να συμπεριλάβετε κείμενο, ορισμούς, εξηγήσεις ή οποιοδήποτε εκπαιδευτικό υλικό\n• Οι ερωτήσεις θα περιλαμβάνουν επιλογές απάντησης και εξηγήσεις\n• Η διαδικασία μπορεί να διαρκέσει μερικά δευτερόλεπτα';

  @override
  String get aiGenerateButton => 'Δημιουργία Ερωτήσεων';

  @override
  String get aiEnterContentTitle => 'Εισαγωγή περιεχομένου';

  @override
  String get aiEnterContentDescription =>
      'Εισάγετε το θέμα ή επικολλήστε περιεχόμενο για τη δημιουργία ερωτήσεων';

  @override
  String get aiContentFieldHint =>
      'Εισάγετε ένα θέμα όπως \"Ιστορία του Β\' Παγκόσμιου Πολέμου\" ή επικολλήστε κείμενο εδώ...';

  @override
  String get aiAttachFileHint => 'Επισύναψη αρχείου (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Αφήστε το αρχείο εδώ';

  @override
  String get dropImageHere => 'Αφήστε την εικόνα εδώ';

  @override
  String get aiNumberQuestionsLabel => 'Αριθμός ερωτήσεων';

  @override
  String get backButton => 'Πίσω';

  @override
  String get generateButton => 'Δημιουργία';

  @override
  String aiTopicModeCount(int count) {
    return 'Λειτουργία θέματος ($count λέξεις)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Λειτουργία κειμένου ($count λέξεις)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Λειτουργία Περιεχομένου';

  @override
  String get aiGenerationCategoryTheory => 'Θεωρία';

  @override
  String get aiGenerationCategoryExercises => 'Ασκήσεις';

  @override
  String get aiGenerationCategoryBoth => 'Μικτό';

  @override
  String get languageSpanish => 'Ισπανικά';

  @override
  String get languageEnglish => 'Αγγλικά';

  @override
  String get languageFrench => 'Γαλλικά';

  @override
  String get languageGerman => 'Γερμανικά';

  @override
  String get languageGreek => 'Ελληνικά';

  @override
  String get languageItalian => 'Ιταλικά';

  @override
  String get languagePortuguese => 'Πορτογαλικά';

  @override
  String get languageCatalan => 'Καταλανικά';

  @override
  String get languageBasque => 'Βασκικά';

  @override
  String get languageGalician => 'Γαλικιανά';

  @override
  String get languageHindi => 'Χίντι';

  @override
  String get languageChinese => 'Κινεζικά';

  @override
  String get languageArabic => 'Αραβικά';

  @override
  String get languageJapanese => 'Ιαπωνικά';

  @override
  String get aiServicesLoading => 'Φόρτωση υπηρεσιών AI...';

  @override
  String get aiServicesNotConfigured => 'Δεν έχουν ρυθμιστεί υπηρεσίες AI';

  @override
  String get aiGeneratedQuestions => 'Δημιουργήθηκε από AI';

  @override
  String get aiApiKeyRequired =>
      'Παρακαλώ ρυθμίστε τουλάχιστον ένα κλειδί API AI στις Ρυθμίσεις για να χρησιμοποιήσετε τη δημιουργία AI.';

  @override
  String get aiGenerationFailed =>
      'Αδυναμία δημιουργίας ερωτήσεων. Δοκιμάστε με διαφορετικό περιεχόμενο.';

  @override
  String get aiGenerationErrorTitle => 'Σφάλμα δημιουργίας ερωτήσεων';

  @override
  String get noQuestionsInFile =>
      'Δεν βρέθηκαν ερωτήσεις στο εισαγόμενο αρχείο';

  @override
  String get couldNotAccessFile => 'Αδυναμία πρόσβασης στο επιλεγμένο αρχείο';

  @override
  String get defaultOutputFileName => 'output-file.quiz';

  @override
  String get generateQuestionsWithAI => 'Δημιουργία ερωτήσεων με AI';

  @override
  String get addQuestionsWithAI => 'Προσθήκη ερωτήσεων με AI';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Όριο: $words λέξεις ή $chars χαρακτήρες';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Όριο: $words λέξεις';
  }

  @override
  String get aiAssistantDisabled => 'Βοηθός AI Απενεργοποιημένος';

  @override
  String get enableAiAssistant =>
      'Ο βοηθός AI είναι απενεργοποιημένος. Παρακαλώ ενεργοποιήστε τον στις ρυθμίσεις για να χρησιμοποιήσετε τις λειτουργίες AI.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Απαιτούνται τουλάχιστον $minWords λέξεις';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount λέξεις ✓ Έτοιμο για δημιουργία';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords λέξεις ($moreNeeded ακόμη χρειάζονται)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Απαιτούνται τουλάχιστον $minWords λέξεις ($moreNeeded ακόμη χρειάζονται)';
  }

  @override
  String get enableQuestion => 'Ενεργοποίηση ερώτησης';

  @override
  String get disableQuestion => 'Απενεργοποίηση ερώτησης';

  @override
  String get questionDisabled => 'Απενεργοποιημένο';

  @override
  String get noEnabledQuestionsError =>
      'Δεν υπάρχουν ενεργοποιημένες ερωτήσεις για την εκτέλεση του κουίζ';

  @override
  String get evaluateWithAI => 'Αξιολόγηση με AI';

  @override
  String get aiEvaluation => 'Αξιολόγηση AI';

  @override
  String aiEvaluationError(String error) {
    return 'Σφάλμα αξιολόγησης απάντησης: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'Είστε ένας ειδικός καθηγητής που αξιολογεί την απάντηση ενός μαθητή σε μια ερώτηση ανάπτυξης. Το έργο σας είναι να παρέχετε λεπτομερή και εποικοδομητική αξιολόγηση. Απαντήστε στην ίδια γλώσσα με την απάντηση του μαθητή.';

  @override
  String get aiEvaluationPromptQuestion => 'ΕΡΩΤΗΣΗ:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'ΑΠΑΝΤΗΣΗ ΜΑΘΗΤΗ:';

  @override
  String get aiEvaluationPromptCriteria =>
      'ΚΡΙΤΗΡΙΑ ΑΞΙΟΛΟΓΗΣΗΣ (με βάση την εξήγηση του καθηγητή):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'ΕΙΔΙΚΕΣ ΟΔΗΓΙΕΣ:\n- Αξιολογήστε πόσο καλά ευθυγραμμίζεται η απάντηση του μαθητή με τα καθιερωμένα κριτήρια\n- Αναλύστε τον βαθμό σύνθεσης και δομής στην απάντηση\n- Προσδιορίστε αν έχει παραλειφθεί κάτι σημαντικό σύμφωνα με τα κριτήρια\n- Εξετάστε το βάθος και την ακρίβεια της ανάλυσης';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'ΓΕΝΙΚΕΣ ΟΔΗΓΙΕΣ:\n- Δεδομένου ότι δεν υπάρχουν καθιερωμένα ειδικά κριτήρια, αξιολογήστε την απάντηση με βάση τα γενικά ακαδημαϊκά πρότυπα\n- Εξετάστε τη σαφήνεια, τη συνοχή και τη δομή της απάντησης\n- Αξιολογήστε αν η απάντηση δείχνει κατανόηση του θέματος\n- Αναλύστε το βάθος της ανάλυσης και την ποιότητα των επιχειρημάτων';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'ΜΟΡΦΗ ΑΠΑΝΤΗΣΗΣ:\n1. ΒΑΘΜΟΣ: [X/10] - Δικαιολογήστε σύντομα τον βαθμό\n2. ΔΥΝΑΤΑ ΣΗΜΕΙΑ: Αναφέρετε θετικές πτυχές της απάντησης\n3. ΠΕΡΙΟΧΕΣ ΓΙΑ ΒΕΛΤΙΩΣΗ: Επισημάνετε πτυχές που θα μπορούσαν να βελτιωθούν\n4. ΕΙΔΙΚΑ ΣΧΟΛΙΑ: Παρέχετε λεπτομερή και εποικοδομητικά σχόλια\n5. ΠΡΟΤΑΣΕΙΣ: Προσφέρετε συγκεκριμένες συστάσεις για βελτίωση\n\nΝα είστε εποικοδομητικοί, συγκεκριμένοι και εκπαιδευτικοί στην αξιολόγησή σας. Στόχος είναι να βοηθήσετε τον μαθητή να μάθει και να βελτιωθεί. Απευθυνθείτε σε αυτόν στον δεύτερο ενικό και χρησιμοποιήστε επαγγελματικό και φιλικό ύφος.';

  @override
  String get aiModeTopicTitle => 'Λειτουργία Θέματος';

  @override
  String get aiModeTopicDescription => 'Δημιουργική εξερεύνηση του θέματος';

  @override
  String get aiModeContentTitle => 'Λειτουργία Περιεχομένου';

  @override
  String get aiModeContentDescription =>
      'Ακριβείς ερωτήσεις βάσει της εισόδου σας';

  @override
  String aiWordCountIndicator(int count) {
    return '$count λέξεις';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Ακρίβεια: $level';
  }

  @override
  String get aiPrecisionLow => 'Χαμηλή';

  @override
  String get aiPrecisionMedium => 'Μεσαία';

  @override
  String get aiPrecisionHigh => 'Υψηλή';

  @override
  String get aiMoreWordsMorePrecision =>
      'Περισσότερες λέξεις = περισσότερη ακρίβεια';

  @override
  String get aiKeepDraftTitle => 'Διατήρηση πρόχειρου AI';

  @override
  String get aiKeepDraftDescription =>
      'Αυτόματη αποθήκευση του κειμένου που εισάγεται στο διάλογο δημιουργίας AI.';

  @override
  String get aiAttachFile => 'Επισύναψη αρχείου';

  @override
  String get aiRemoveFile => 'Αφαίρεση αρχείου';

  @override
  String get aiFileMode => 'Λειτουργία αρχείου';

  @override
  String get aiFileModeDescription =>
      'Οι ερωτήσεις θα δημιουργηθούν από το επισυναπτόμενο αρχείο';

  @override
  String get aiCommentsLabel => 'Σχόλια (Προαιρετικό)';

  @override
  String get aiCommentsHint =>
      'Προσθέστε οδηγίες ή σχόλια σχετικά με το επισυναπτόμενο αρχείο...';

  @override
  String get aiCommentsHelperText =>
      'Προαιρετικά προσθέστε οδηγίες σχετικά με τον τρόπο δημιουργίας ερωτήσεων από το αρχείο';

  @override
  String get aiFilePickerError =>
      'Δεν ήταν δυνατή η φόρτωση του επιλεγμένου αρχείου';

  @override
  String get studyModeLabel => 'Λειτουργία Μελέτης';

  @override
  String get studyModeDescription =>
      'Διαθέσιμη βοήθεια AI. Άμεση ανατροφοδότηση μετά από κάθε απάντηση, χωρίς χρονικά όρια ή ποινές.';

  @override
  String get examModeLabel => 'Λειτουργία Εξέτασης';

  @override
  String get examModeDescription =>
      'Χωρίς βοήθεια AI. Ενδέχεται να ισχύουν χρονικά όρια και ποινές για λανθασμένες απαντήσεις.';

  @override
  String get checkAnswer => 'Έλεγχος';

  @override
  String get quizModeTitle => 'Λειτουργία Κουίζ';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get askAiAssistant => 'Ρωτήστε τον Βοηθό AI';

  @override
  String get askAiAboutQuestion => 'Ρωτήστε την AI για αυτήν την ερώτηση';

  @override
  String get aiHelpWithQuestion => 'Βοήθησέ με να κατανοήσω αυτήν την ερώτηση';

  @override
  String get edit => 'Επεξεργασία';

  @override
  String get enable => 'Ενεργοποίηση';

  @override
  String get disable => 'Απενεργοποίηση';

  @override
  String get quizPreviewTitle => 'Προεπισκόπηση Κουίζ';

  @override
  String get select => 'Επιλογή';

  @override
  String get done => 'Τέλος';

  @override
  String get importButton => 'Εισαγωγή';

  @override
  String get reorderButton => 'Αναδιάταξη';

  @override
  String get startQuizButton => 'Έναρξη Κουίζ';

  @override
  String get deleteConfirmation =>
      'Είστε σίγουροι ότι θέλετε να διαγράψετε αυτό το κουίζ;';

  @override
  String get saveSuccess => 'Το αρχείο αποθηκεύτηκε επιτυχώς';

  @override
  String get errorSavingFile => 'Σφάλμα κατά την αποθήκευση του αρχείου';

  @override
  String get deleteSingleQuestionConfirmation =>
      'Είστε σίγουροι ότι θέλετε να διαγράψετε αυτή την ερώτηση;';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'Είστε σίγουροι ότι θέλετε να διαγράψετε $count ερωτήσεις;';
  }

  @override
  String get keepPracticing => 'Συνεχίστε την εξάσκηση για να βελτιωθείτε!';

  @override
  String get tryAgain => 'Δοκιμάστε ξανά';

  @override
  String get review => 'Ανασκόπηση';

  @override
  String get home => 'Αρχική';

  @override
  String get allLabel => 'Όλες';

  @override
  String get subtractPointsLabel => 'Αφαίρεση πόντων για λάθος απάντηση';

  @override
  String get subtractPointsDescription =>
      'Αφαίρεση πόντων για κάθε λάθος απάντηση.';

  @override
  String get subtractPointsOffDescription =>
      'Οι λάθος απαντήσεις δεν αφαιρούν πόντους.';

  @override
  String get penaltyAmountLabel => 'Ποσό ποινής';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount πόντοι / λάθος';
  }

  @override
  String get allQuestionsLabel => 'Όλες οι ερωτήσεις';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Έναρξη με $count επιλεγμένες';
  }

  @override
  String get advancedSettingsTitle => 'Σύνθετες Ρυθμίσεις (Debug)';

  @override
  String get appLanguageLabel => 'Γλώσσα εφαρμογής';

  @override
  String get appLanguageDescription =>
      'Παράκαμψη γλώσσας εφαρμογής για δοκιμές';

  @override
  String get pasteFromClipboard => 'Επικόλληση από πρόχειρο';

  @override
  String get pasteImage => 'Επικόλληση';

  @override
  String get clipboardNoImage => 'Δεν βρέθηκε εικόνα στο πρόχειρο';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get scoringAndLimitsTitle => 'Βαθμολογία και όρια';

  @override
  String get congratulations => '🎉 Συγχαρητήρια! 🎉';

  @override
  String get validationMin1Error => 'Ελάχιστο 1 λεπτό';

  @override
  String remainingTimeWithDays(
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '$daysημ $hours:$minutes:$seconds';
  }

  @override
  String remainingTimeWithWeeks(
    String weeks,
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '$weeksε $daysημ $hours:$minutes:$seconds';
  }

  @override
  String get validationMax30DaysError => 'Μέγιστο 30 ημέρες';

  @override
  String get validationMin0GenericError => 'Minimum 0';
}
