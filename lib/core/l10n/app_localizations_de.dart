// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get abortQuizTitle => 'Quiz abbrechen?';

  @override
  String get abortQuizMessage =>
      'Das Öffnen einer neuen Datei beendet das aktuelle Quiz.';

  @override
  String get stopAndOpenButton => 'Stoppen & Öffnen';

  @override
  String get titleAppBar => 'Quiz - Prüfungssimulator';

  @override
  String get create => 'Erstellen';

  @override
  String get preview => 'Vorschau';

  @override
  String get previewLabel => 'Vorschau:';

  @override
  String get emptyPlaceholder => '(leer)';

  @override
  String get latexSyntaxTitle => 'LaTeX-Syntax:';

  @override
  String get latexSyntaxHelp =>
      'Inline-Mathematik: Verwenden Sie \$...\$ für LaTeX-Ausdrücke\nBeispiel: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'LaTeX-Rendering-Vorschau';

  @override
  String get okButton => 'OK';

  @override
  String get load => 'Laden';

  @override
  String fileLoaded(String filePath) {
    return 'Datei geladen: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'Datei gespeichert: $filePath';
  }

  @override
  String get dropFileHere =>
      'Klicken Sie auf das Logo oder ziehen Sie eine .quiz-Datei auf den Bildschirm';

  @override
  String get errorOpeningFile => 'Fehler beim Öffnen der Datei';

  @override
  String get replaceFileTitle => 'Neues Quiz laden';

  @override
  String get replaceFileMessage =>
      'Ein Quiz ist bereits geladen. Möchten Sie es durch die neue Datei ersetzen?';

  @override
  String get replaceButton => 'Laden';

  @override
  String get clickOrDragFile =>
      'Klicken zum Laden oder .quiz-Datei auf den Bildschirm ziehen';

  @override
  String get errorInvalidFile =>
      'Fehler: Ungültige Datei. Muss eine .quiz-Datei sein.';

  @override
  String errorLoadingFile(String error) {
    return 'Fehler beim Laden der Quiz-Datei: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Fehler beim Exportieren der Datei: $error';
  }

  @override
  String get cancelButton => 'Abbrechen';

  @override
  String get saveButton => 'Speichern';

  @override
  String get confirmDeleteTitle => 'Löschung bestätigen';

  @override
  String confirmDeleteMessage(String processName) {
    return 'Sind Sie sicher, dass Sie den Prozess `$processName` löschen möchten?';
  }

  @override
  String get deleteButton => 'Löschen';

  @override
  String get confirmExitTitle => 'Beenden bestätigen';

  @override
  String get confirmExitMessage =>
      'Es gibt ungespeicherte Änderungen. Möchten Sie verlassen und die Änderungen verwerfen?';

  @override
  String get exitButton => 'Beenden ohne zu speichern';

  @override
  String get saveDialogTitle => 'Bitte wählen Sie eine Ausgabedatei:';

  @override
  String get createQuizFileTitle => 'Quiz-Datei erstellen';

  @override
  String get editQuizFileTitle => 'Quizdatei bearbeiten';

  @override
  String get fileNameLabel => 'Dateiname';

  @override
  String get fileDescriptionLabel => 'Dateibeschreibung';

  @override
  String get createButton => 'Erstellen';

  @override
  String get fileNameRequiredError => 'Der Dateiname ist erforderlich.';

  @override
  String get fileDescriptionRequiredError =>
      'Die Dateibeschreibung ist erforderlich.';

  @override
  String get versionLabel => 'Version';

  @override
  String get authorLabel => 'Autor';

  @override
  String get authorRequiredError => 'Der Autor ist erforderlich.';

  @override
  String get requiredFieldsError =>
      'Alle erforderlichen Felder müssen ausgefüllt werden.';

  @override
  String get requestFileNameTitle => 'Geben Sie den Quiz-Dateinamen ein';

  @override
  String get fileNameHint => 'Dateiname';

  @override
  String get emptyFileNameMessage => 'Der Dateiname darf nicht leer sein.';

  @override
  String get acceptButton => 'Akzeptieren';

  @override
  String get saveTooltip => 'Datei speichern';

  @override
  String get saveDisabledTooltip => 'Keine Änderungen zu speichern';

  @override
  String get executeTooltip => 'Prüfung ausführen';

  @override
  String get addTooltip => 'Neue Frage hinzufügen';

  @override
  String get backSemanticLabel => 'Zurück-Schaltfläche';

  @override
  String get createFileTooltip => 'Neue Quiz-Datei erstellen';

  @override
  String get loadFileTooltip => 'Vorhandene Quiz-Datei laden';

  @override
  String questionNumber(int number) {
    return 'Frage $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return 'Frage $current von $total';
  }

  @override
  String get previous => 'Zurück';

  @override
  String get skip => 'Überspringen';

  @override
  String get questionsOverview => 'Questions Map';

  @override
  String get next => 'Weiter';

  @override
  String get finish => 'Beenden';

  @override
  String get finishQuiz => 'Quiz beenden';

  @override
  String get finishQuizConfirmation =>
      'Sind Sie sicher, dass Sie das Quiz beenden möchten? Sie können Ihre Antworten danach nicht mehr ändern.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount unbeantwortete Fragen',
      one: '1 unbeantwortete Frage',
    );
    return 'Du hast $_temp0. Bist du sicher, dass du das Quiz beenden möchtest?';
  }

  @override
  String get resolveUnansweredQuestions => 'Fragen lösen';

  @override
  String get abandonQuiz => 'Quiz aufgeben';

  @override
  String get abandonQuizConfirmation =>
      'Sind Sie sicher, dass Sie das Quiz aufgeben möchten? Der gesamte Fortschritt geht verloren.';

  @override
  String get abandon => 'Aufgeben';

  @override
  String get quizCompleted => 'Quiz abgeschlossen!';

  @override
  String score(String score) {
    return 'Punktzahl: $score%';
  }

  @override
  String correctAnswers(String correct, int total) {
    return '$correct von $total richtige Antworten';
  }

  @override
  String get retry => 'Wiederholen';

  @override
  String get goBack => 'Beenden';

  @override
  String get retryFailedQuestions => 'Fehlgeschlagene wiederholen';

  @override
  String question(String question) {
    return 'Frage: $question';
  }

  @override
  String get selectQuestionCountTitle => 'Anzahl der Fragen auswählen';

  @override
  String get selectQuestionCountMessage =>
      'Wie viele Fragen möchten Sie in diesem Quiz beantworten?';

  @override
  String allQuestions(int count) {
    return 'Alle Fragen ($count)';
  }

  @override
  String get startQuiz => 'Quiz starten';

  @override
  String get maxIncorrectAnswersLabel => 'Falsche Antworten begrenzen';

  @override
  String get maxIncorrectAnswersDescription =>
      'Bestanden/Nicht bestanden Prüfung. Es gibt keine numerische Note.';

  @override
  String get maxIncorrectAnswersOffDescription =>
      'Die Prüfung hat eine numerische Note von 0 bis 100.';

  @override
  String get maxIncorrectAnswersLimitLabel => 'Maximal zulässige Fehler';

  @override
  String get examFailedStatus => 'Prüfung NICHT BESTANDEN';

  @override
  String get examPassedStatus => 'Prüfung BESTANDEN';

  @override
  String get quizFailedLimitReached =>
      'Prüfung Beendet: Das maximale Fehlerlimit wurde überschritten';

  @override
  String get errorInvalidNumber => 'Bitte geben Sie eine gültige Zahl ein';

  @override
  String get errorNumberMustBePositive => 'Die Zahl muss größer als 0 sein';

  @override
  String get customNumberLabel =>
      'Oder geben Sie eine benutzerdefinierte Zahl ein:';

  @override
  String get numberInputLabel => 'Anzahl der Fragen';

  @override
  String get questionOrderConfigTitle => 'Fragenreihenfolge-Konfiguration';

  @override
  String get questionOrderConfigDescription =>
      'Wählen Sie die Reihenfolge, in der die Fragen während der Prüfung erscheinen sollen:';

  @override
  String get questionOrderAscending => 'Aufsteigende Reihenfolge';

  @override
  String get questionOrderAscendingDesc =>
      'Fragen erscheinen in der Reihenfolge von 1 bis zum Ende';

  @override
  String get questionOrderDescending => 'Absteigende Reihenfolge';

  @override
  String get questionOrderDescendingDesc => 'Fragen erscheinen vom Ende bis 1';

  @override
  String get questionOrderRandom => 'Fragenreihenfolge zufällig anordnen';

  @override
  String get questionOrderRandomDesc =>
      'Fragen erscheinen in zufälliger Reihenfolge';

  @override
  String get questionOrderConfigTooltip => 'Fragenreihenfolge-Konfiguration';

  @override
  String get reorderQuestionsTooltip => 'Fragen neu ordnen';

  @override
  String get save => 'Speichern';

  @override
  String get examConfigurationTitle => 'Prüfungskonfiguration';

  @override
  String get examTimeLimitTitle => 'Prüfungszeit-Limit';

  @override
  String get examTimeLimitDescription =>
      'Legen Sie ein Zeitlimit für die Prüfung fest. Während des Quiz wird ein Countdown-Timer angezeigt.';

  @override
  String get examTimeLimitOffDescription =>
      'Für diese Prüfung gibt es kein Zeitlimit.';

  @override
  String get enableTimeLimit => 'Zeitlimit aktivieren';

  @override
  String get timeLimitMinutes => 'Zeitlimit (Minuten)';

  @override
  String get examTimeExpiredTitle => 'Zeit abgelaufen!';

  @override
  String get examTimeExpiredMessage =>
      'Die Prüfungszeit ist abgelaufen. Ihre Antworten wurden automatisch übermittelt.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Mehrfachauswahl';

  @override
  String get questionTypeSingleChoice => 'Einfachauswahl';

  @override
  String get questionTypeTrueFalse => 'Wahr/Falsch';

  @override
  String get questionTypeEssay => 'Aufsatz';

  @override
  String get questionTypeRandom => 'Alle';

  @override
  String get questionTypeUnknown => 'Unbekannt';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Optionen',
      one: '1 Option',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip => 'Anzahl der Antwortoptionen für diese Frage';

  @override
  String get imageTooltip => 'Diese Frage hat ein zugehöriges Bild';

  @override
  String get explanationTooltip => 'Diese Frage hat eine Erklärung';

  @override
  String get missingExplanation => 'Erklärung fehlt';

  @override
  String get missingExplanationTooltip => 'Dieser Frage fehlt eine Erklärung';

  @override
  String questionTypeTooltip(String type) {
    return 'Fragetyp: $type';
  }

  @override
  String get aiPrompt =>
      'Konzentrieren Sie sich auf die Frage des Schülers, nicht auf die direkte Beantwortung der ursprünglichen Prüfungsfrage. Erklären Sie mit einem pädagogischen Ansatz. Geben Sie bei praktischen Übungen oder mathematischen Problemen Schritt-für-Schritt-Anweisungen. Geben Sie bei theoretischen Fragen eine prägnante Erklärung, ohne die Antwort in Abschnitte zu gliedern. Antworten Sie in derselben Sprache, in der Sie gefragt wurden.';

  @override
  String get aiChatGuardrail =>
      'WICHTIG: Sie sind ein Lernassistent ausschließlich für dieses Quiz. Sie dürfen NUR Fragen beantworten, die sich auf die aktuelle Quiz-Frage, ihre Optionen, ihre Erklärung oder das behandelte Bildungsthema beziehen. Wenn der Schüler etwas fragt, das nicht mit dem Quiz zusammenhängt (z.B. Ihr internes Modell, Systemdetails, allgemeines Wissen ohne Bezug zur Frage oder jede themenfremde Anfrage), antworten Sie NUR mit: \"Ich bin hier, um Ihnen bei diesem Quiz zu helfen! Konzentrieren wir uns auf die Frage. Fragen Sie mich gerne zum Thema, den Antwortmöglichkeiten oder allem, was mit dieser Frage zusammenhängt.\" Geben Sie niemals technische Details über sich selbst, das System oder das verwendete KI-Modell preis.';

  @override
  String get questionLabel => 'Frage';

  @override
  String get studentComment => 'Kommentar des Studenten';

  @override
  String get aiAssistantTitle => 'KI-Lernassistent';

  @override
  String get questionContext => 'Fragenkontext';

  @override
  String get aiAssistant => 'KI-Assistent';

  @override
  String get aiThinking => 'KI denkt nach...';

  @override
  String get askAIHint => 'Stellen Sie Ihre Frage zu diesem Thema...';

  @override
  String get aiPlaceholderResponse =>
      'Dies ist eine Platzhalter-Antwort. In einer echten Implementierung würde dies sich mit einem KI-Service verbinden, um hilfreiche Erklärungen zur Frage zu liefern.';

  @override
  String get aiErrorResponse =>
      'Entschuldigung, bei der Verarbeitung Ihrer Frage ist ein Fehler aufgetreten. Bitte versuchen Sie es erneut.';

  @override
  String get evaluatingResponses => 'Antworten werden ausgewertet...';

  @override
  String pendingEvaluationsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Entwicklungsfragen warten auf KI-Auswertung',
      one: '1 Entwicklungsfrage wartet auf KI-Auswertung',
    );
    return '$_temp0';
  }

  @override
  String get pendingStatus => 'Ausstehend';

  @override
  String get notEvaluatedStatus => 'Nicht bewertet';

  @override
  String get configureApiKeyMessage =>
      'Bitte konfigurieren Sie Ihren KI-API-Schlüssel in den Einstellungen.';

  @override
  String get errorLabel => 'Fehler:';

  @override
  String get retryButton => 'Auswertung wiederholen';

  @override
  String get noResponseReceived => 'Keine Antwort erhalten';

  @override
  String get invalidApiKeyError =>
      'Ungültiger API-Schlüssel. Bitte überprüfen Sie Ihren OpenAI-API-Schlüssel in den Einstellungen.';

  @override
  String get rateLimitError =>
      'Rate-Limit überschritten. Bitte versuchen Sie es später erneut.';

  @override
  String get modelNotFoundError =>
      'Modell nicht gefunden. Bitte überprüfen Sie Ihren API-Zugang.';

  @override
  String get unknownError => 'Unbekannter Fehler';

  @override
  String get networkErrorOpenAI =>
      'Netzwerkfehler: Verbindung zu OpenAI konnte nicht hergestellt werden. Bitte überprüfen Sie Ihre Internetverbindung.';

  @override
  String get networkErrorGemini =>
      'Netzwerkfehler: Verbindung zu Gemini konnte nicht hergestellt werden. Bitte überprüfen Sie Ihre Internetverbindung.';

  @override
  String get openaiApiKeyNotConfigured =>
      'OpenAI-API-Schlüssel nicht konfiguriert';

  @override
  String get geminiApiKeyNotConfigured =>
      'Gemini-API-Schlüssel nicht konfiguriert';

  @override
  String get geminiApiKeyLabel => 'Gemini API-Schlüssel';

  @override
  String get geminiApiKeyHint => 'Geben Sie Ihren Gemini-API-Schlüssel ein';

  @override
  String get geminiApiKeyDescription =>
      'Erforderlich für Gemini-KI-Funktionalität. Ihr Schlüssel wird sicher gespeichert.';

  @override
  String get getGeminiApiKeyTooltip =>
      'API-Schlüssel von Google AI Studio erhalten';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'Der KI-Lernassistent benötigt mindestens einen API-Schlüssel (Gemini oder OpenAI). Bitte geben Sie einen API-Schlüssel ein oder deaktivieren Sie den KI-Assistenten.';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get aiButtonTooltip => 'KI-Lernassistent';

  @override
  String get aiButtonText => 'KI';

  @override
  String get aiAssistantSettingsTitle => 'KI-Lernassistent (Vorschau)';

  @override
  String get aiAssistantSettingsDescription =>
      'KI-Lernassistenten für Fragen aktivieren oder deaktivieren';

  @override
  String get aiDefaultModelTitle => 'Standard-KI-Modell';

  @override
  String get aiDefaultModelDescription =>
      'Wählen Sie den Standard-KI-Service und das Modell für die Fragengenerierung';

  @override
  String get openaiApiKeyLabel => 'OpenAI-API-Schlüssel';

  @override
  String get openaiApiKeyHint =>
      'Geben Sie Ihren OpenAI-API-Schlüssel ein (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Erforderlich für die Integration mit OpenAI. Ihr OpenAI-Schlüssel wird sicher gespeichert.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'KI-Lernassistent benötigt einen OpenAI-API-Schlüssel. Bitte geben Sie Ihren API-Schlüssel ein oder deaktivieren Sie den KI-Assistenten.';

  @override
  String get getApiKeyTooltip => 'API-Schlüssel von OpenAI erhalten';

  @override
  String get deleteAction => 'Löschen';

  @override
  String get explanationLabel => 'Erklärung (optional)';

  @override
  String get explanationHint =>
      'Geben Sie eine Erklärung für die richtige(n) Antwort(en) ein';

  @override
  String get explanationTitle => 'Erklärung';

  @override
  String get imageLabel => 'Bild';

  @override
  String get changeImage => 'Bild ändern';

  @override
  String get removeImage => 'Bild entfernen';

  @override
  String get addImageTap => 'Tippen Sie, um ein Bild hinzuzufügen';

  @override
  String get imageFormats => 'Formate: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Fehler beim Laden des Bildes';

  @override
  String imagePickError(String error) {
    return 'Fehler beim Laden des Bildes: $error';
  }

  @override
  String get tapToZoom => 'Tippen zum Zoomen';

  @override
  String get trueLabel => 'Wahr';

  @override
  String get falseLabel => 'Falsch';

  @override
  String get addQuestion => 'Frage hinzufügen';

  @override
  String get editQuestion => 'Frage bearbeiten';

  @override
  String get questionText => 'Fragentext';

  @override
  String get questionType => 'Fragentyp';

  @override
  String get addOption => 'Option hinzufügen';

  @override
  String get optionsLabel => 'Optionen';

  @override
  String get optionLabel => 'Option';

  @override
  String get questionTextRequired => 'Fragentext ist erforderlich';

  @override
  String get atLeastOneOptionRequired =>
      'Mindestens eine Option muss Text haben';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'Mindestens eine richtige Antwort muss ausgewählt werden';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'Nur eine richtige Antwort ist für diesen Fragentyp erlaubt';

  @override
  String get removeOption => 'Option entfernen';

  @override
  String get selectCorrectAnswer => 'Richtige Antwort auswählen';

  @override
  String get selectCorrectAnswers => 'Richtige Antworten auswählen';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'Optionen $optionNumbers sind leer. Bitte fügen Sie Text hinzu oder entfernen Sie sie.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'Option $optionNumber ist leer. Bitte fügen Sie Text hinzu oder entfernen Sie sie.';
  }

  @override
  String get optionEmptyError => 'Diese Option darf nicht leer sein';

  @override
  String get hasImage => 'Bild';

  @override
  String get hasExplanation => 'Erklärung';

  @override
  String errorLoadingSettings(String error) {
    return 'Fehler beim Laden der Einstellungen: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'Konnte $url nicht öffnen';
  }

  @override
  String get loadingAiServices => 'KI-Services werden geladen...';

  @override
  String usingAiService(String serviceName) {
    return 'Verwende: $serviceName';
  }

  @override
  String get aiServiceLabel => 'KI-Service:';

  @override
  String get aiModelLabel => 'Modell:';

  @override
  String get importQuestionsTitle => 'Fragen importieren';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return '$count Fragen in \"$fileName\" gefunden. Wo möchten Sie sie importieren?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'Wo möchten Sie diese Fragen hinzufügen?';

  @override
  String get importAtBeginning => 'Am Anfang';

  @override
  String get importAtEnd => 'Am Ende';

  @override
  String questionsImportedSuccess(int count) {
    return 'Erfolgreich $count Fragen importiert';
  }

  @override
  String get importQuestionsTooltip =>
      'Fragen aus einer anderen Quiz-Datei importieren';

  @override
  String get dragDropHintText =>
      'Sie können auch .quiz-Dateien hierher ziehen und ablegen, um Fragen zu importieren';

  @override
  String get randomizeQuestionsTitle => 'Fragen randomisieren';

  @override
  String get randomizeQuestionsDescription =>
      'Reihenfolge der Fragen während der Quiz-Ausführung mischen';

  @override
  String get randomizeQuestionsOffDescription =>
      'Die Fragen erscheinen in ihrer ursprünglichen Reihenfolge';

  @override
  String get randomizeAnswersTitle => 'Antwortreihenfolge zufällig anordnen';

  @override
  String get randomizeAnswersDescription =>
      'Reihenfolge der Antwortoptionen während der Quiz-Ausführung mischen';

  @override
  String get randomizeAnswersOffDescription =>
      'Die Antwortoptionen erscheinen in ihrer ursprünglichen Reihenfolge';

  @override
  String get showCorrectAnswerCountTitle =>
      'Anzahl richtiger Antworten anzeigen';

  @override
  String get showCorrectAnswerCountDescription =>
      'Anzahl der richtigen Antworten in Mehrfachauswahl-Fragen anzeigen';

  @override
  String get showCorrectAnswerCountOffDescription =>
      'Die Anzahl der richtigen Antworten wird bei Multiple-Choice-Fragen nicht angezeigt';

  @override
  String correctAnswersCount(int count) {
    return 'Wählen Sie $count richtige Antworten';
  }

  @override
  String get correctSelectedLabel => 'Richtig';

  @override
  String get correctMissedLabel => 'Richtig';

  @override
  String get incorrectSelectedLabel => 'Falsch';

  @override
  String get aiGenerateDialogTitle => 'Fragen mit KI generieren';

  @override
  String get aiQuestionCountLabel => 'Anzahl der Fragen (Optional)';

  @override
  String get aiQuestionCountHint => 'Leer lassen, damit KI entscheidet';

  @override
  String get aiQuestionCountValidation =>
      'Muss eine Zahl zwischen 1 und 50 sein';

  @override
  String get aiQuestionTypeLabel => 'Fragentyp';

  @override
  String get aiQuestionTypeRandom => 'Zufällig (Gemischt)';

  @override
  String get aiLanguageLabel => 'Fragensprache';

  @override
  String get aiContentLabel => 'Inhalt für die Fragengenerierung';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max Wörter';
  }

  @override
  String get aiContentHint =>
      'Geben Sie den Text, das Thema oder den Inhalt ein, aus dem Sie Fragen generieren möchten...';

  @override
  String get aiContentHelperText =>
      'KI wird basierend auf diesem Inhalt Fragen erstellen';

  @override
  String aiWordLimitError(int max) {
    return 'Sie haben das Limit von $max Wörtern überschritten';
  }

  @override
  String get aiContentRequiredError =>
      'Sie müssen Inhalt bereitstellen, um Fragen zu generieren';

  @override
  String aiContentLimitError(int max) {
    return 'Inhalt überschreitet das Limit von $max Wörtern';
  }

  @override
  String get aiMinWordsError =>
      'Geben Sie mindestens 10 Wörter an, um qualitativ hochwertige Fragen zu generieren';

  @override
  String get aiInfoTitle => 'Information';

  @override
  String get aiInfoDescription =>
      '• KI wird den Inhalt analysieren und relevante Fragen generieren\n• Wenn du weniger als 10 Wörter schreibst, gelangst du in den Themenmodus, in dem Fragen zu diesen spezifischen Themen gestellt werden\n• Mit mehr als 10 Wörtern gelangst du in den Inhaltsmodus, in dem Fragen zu demselben Text gestellt werden (mehr Wörter = mehr Präzision)\n• Du kannst Text, Definitionen, Erklärungen oder beliebiges Lernmaterial einschließen\n• Fragen werden Antwortoptionen und Erklärungen beinhalten\n• Der Vorgang kann einige Sekunden dauern';

  @override
  String get aiGenerateButton => 'Fragen generieren';

  @override
  String get aiEnterContentTitle => 'Inhalt eingeben';

  @override
  String get aiEnterContentDescription =>
      'Geben Sie das Thema ein oder fügen Sie Inhalte ein, um Fragen zu generieren';

  @override
  String get aiContentFieldHint =>
      'Geben Sie ein Thema wie \"Geschichte des Zweiten Weltkriegs\" ein oder fügen Sie hier Textinhalt ein...';

  @override
  String get aiAttachFileHint => 'Datei anhängen (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Datei hier ablegen';

  @override
  String get dropImageHere => 'Bild hier ablegen';

  @override
  String get aiNumberQuestionsLabel => 'Anzahl der Fragen';

  @override
  String get backButton => 'Zurück';

  @override
  String get generateButton => 'Generieren';

  @override
  String aiTopicModeCount(int count) {
    return 'Themenmodus ($count Wörter)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Textmodus ($count Wörter)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Inhaltsmodus';

  @override
  String get aiGenerationCategoryTheory => 'Theorie';

  @override
  String get aiGenerationCategoryExercises => 'Übungen';

  @override
  String get aiGenerationCategoryBoth => 'Gemischt';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageGreek => 'Ελληνικά';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get languageCatalan => 'Català';

  @override
  String get languageBasque => 'Euskera';

  @override
  String get languageGalician => 'Galego';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageChinese => '中文';

  @override
  String get languageArabic => 'العربية';

  @override
  String get languageJapanese => '日本語';

  @override
  String get aiServicesLoading => 'KI-Services werden geladen...';

  @override
  String get aiServicesNotConfigured => 'Keine KI-Services konfiguriert';

  @override
  String get aiGeneratedQuestions => 'KI-generiert';

  @override
  String get aiApiKeyRequired =>
      'Bitte konfigurieren Sie mindestens einen KI-API-Schlüssel in den Einstellungen, um KI-Generierung zu verwenden.';

  @override
  String get aiGenerationFailed =>
      'Fragen konnten nicht generiert werden. Versuchen Sie es mit anderem Inhalt.';

  @override
  String get aiGenerationErrorTitle => 'Fehler beim Generieren von Fragen';

  @override
  String get noQuestionsInFile =>
      'Keine Fragen in der importierten Datei gefunden';

  @override
  String get couldNotAccessFile =>
      'Zugriff auf die ausgewählte Datei nicht möglich';

  @override
  String get defaultOutputFileName => 'ausgabe-datei.quiz';

  @override
  String get generateQuestionsWithAI => 'Fragen mit KI generieren';

  @override
  String get addQuestionsWithAI => 'Fragen mit KI hinzufügen';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Limit: $words Wörter oder $chars Zeichen';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Limit: $words Wörter';
  }

  @override
  String get aiAssistantDisabled => 'KI-Assistent Deaktiviert';

  @override
  String get enableAiAssistant =>
      'KI-Assistent ist deaktiviert. Bitte aktivieren Sie ihn in den Einstellungen, um KI-Funktionen zu nutzen.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Mindestens $minWords Wörter erforderlich';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount Wörter ✓ Bereit zu generieren';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords Wörter ($moreNeeded weitere benötigt)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Mindestens $minWords Wörter erforderlich ($moreNeeded weitere benötigt)';
  }

  @override
  String get enableQuestion => 'Frage aktivieren';

  @override
  String get disableQuestion => 'Frage deaktivieren';

  @override
  String get questionDisabled => 'Deaktiviert';

  @override
  String get noEnabledQuestionsError =>
      'Keine aktivierten Fragen verfügbar, um das Quiz zu starten';

  @override
  String get evaluateWithAI => 'Mit KI bewerten';

  @override
  String get aiEvaluation => 'KI-Bewertung';

  @override
  String aiEvaluationError(String error) {
    return 'Fehler beim Bewerten der Antwort: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'Sie sind ein Experte-Lehrer, der die Antwort eines Studenten auf eine Essay-Frage bewertet. Ihre Aufgabe ist es, eine detaillierte und konstruktive Bewertung zu geben. Antworten Sie in derselben Sprache wie die Antwort des Studenten.';

  @override
  String get aiEvaluationPromptQuestion => 'FRAGE:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'ANTWORT DES STUDENTEN:';

  @override
  String get aiEvaluationPromptCriteria =>
      'BEWERTUNGSKRITERIEN (basierend auf der Erklärung des Lehrers):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'SPEZIFISCHE ANWEISUNGEN:\n- Bewerten Sie, wie gut die Antwort des Studenten mit den etablierten Kriterien übereinstimmt\n- Analysieren Sie den Grad der Synthese und Struktur in der Antwort\n- Identifizieren Sie, ob etwas Wichtiges gemäß den Kriterien ausgelassen wurde\n- Berücksichtigen Sie die Tiefe und Genauigkeit der Analyse';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'ALLGEMEINE ANWEISUNGEN:\n- Da keine spezifischen Kriterien festgelegt sind, bewerten Sie die Antwort basierend auf allgemeinen akademischen Standards\n- Berücksichtigen Sie Klarheit, Kohärenz und Struktur der Antwort\n- Bewerten Sie, ob die Antwort Verständnis des Themas zeigt\n- Analysieren Sie die Tiefe der Analyse und Qualität der Argumente';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'ANTWORTFORMAT:\n1. BEWERTUNG: [X/10] - Begründen Sie kurz die Note\n2. STÄRKEN: Erwähnen Sie positive Aspekte der Antwort\n3. VERBESSERUNGSBEREICHE: Weisen Sie auf Aspekte hin, die verbessert werden könnten\n4. SPEZIFISCHE KOMMENTARE: Geben Sie detailliertes und konstruktives Feedback\n5. VORSCHLÄGE: Bieten Sie spezifische Empfehlungen zur Verbesserung\n\nSeien Sie konstruktiv, spezifisch und lehrreich in Ihrer Bewertung. Das Ziel ist es, dem Studenten beim Lernen und Verbessern zu helfen. Sprechen Sie ihn in der zweiten Person an und verwenden Sie einen professionellen und freundlichen Ton.';

  @override
  String get aiModeTopicTitle => 'Themenmodus';

  @override
  String get aiModeTopicDescription => 'Kreative Erkundung des Themas';

  @override
  String get aiModeContentTitle => 'Inhaltsmodus';

  @override
  String get aiModeContentDescription =>
      'Präzise Fragen basierend auf Ihrer Eingabe';

  @override
  String aiWordCountIndicator(int count) {
    return '$count Wörter';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Präzision: $level';
  }

  @override
  String get aiPrecisionLow => 'Niedrig';

  @override
  String get aiPrecisionMedium => 'Mittel';

  @override
  String get aiPrecisionHigh => 'Hoch';

  @override
  String get aiMoreWordsMorePrecision => 'Mehr Wörter = mehr Präzision';

  @override
  String get aiKeepDraftTitle => 'KI-Entwurf behalten';

  @override
  String get aiKeepDraftDescription =>
      'Speichern Sie den im KI-Generierungsdialog eingegebenen Text automatisch, damit er nicht verloren geht, wenn der Dialog geschlossen wird.';

  @override
  String get aiAttachFile => 'Datei anhängen';

  @override
  String get aiRemoveFile => 'Datei entfernen';

  @override
  String get aiFileMode => 'Dateimodus';

  @override
  String get aiFileModeDescription =>
      'Fragen werden aus der angehängten Datei generiert';

  @override
  String get aiCommentsLabel => 'Kommentare (Optional)';

  @override
  String get aiCommentsHint =>
      'Anweisungen oder Kommentare zur angehängten Datei hinzufügen...';

  @override
  String get aiCommentsHelperText =>
      'Optional Anweisungen hinzufügen, wie Fragen aus der Datei generiert werden sollen';

  @override
  String get aiFilePickerError =>
      'Die ausgewählte Datei konnte nicht geladen werden';

  @override
  String get studyModeLabel => 'Lernmodus';

  @override
  String get studyModeDescription =>
      'KI-Unterstützung verfügbar. Sofortiges Feedback nach jeder Antwort, ohne Zeitlimits oder Punktabzüge.';

  @override
  String get examModeLabel => 'Prüfungsmodus';

  @override
  String get examModeDescription =>
      'Keine KI-Unterstützung. Zeitlimits und Punktabzüge für falsche Antworten können anfallen.';

  @override
  String get checkAnswer => 'Überprüfen';

  @override
  String get quizModeTitle => 'Quizmodus';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get askAiAssistant => 'KI-Assistenten fragen';

  @override
  String get askAiAboutQuestion => 'KI zu dieser Frage befragen';

  @override
  String get aiHelpWithQuestion => 'Hilf mir, diese Frage zu verstehen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get enable => 'Aktivieren';

  @override
  String get disable => 'Deaktivieren';

  @override
  String get quizPreviewTitle => 'Quiz-Vorschau';

  @override
  String get select => 'Auswählen';

  @override
  String get done => 'Fertig';

  @override
  String get importButton => 'Importieren';

  @override
  String get reorderButton => 'Neu ordnen';

  @override
  String get startQuizButton => 'Quiz starten';

  @override
  String get deleteConfirmation =>
      'Sind Sie sicher, dass Sie dieses Quiz löschen möchten?';

  @override
  String get saveSuccess => 'Datei erfolgreich gespeichert';

  @override
  String get errorSavingFile => 'Fehler beim Speichern der Datei';

  @override
  String get deleteSingleQuestionConfirmation =>
      'Sind Sie sicher, dass Sie diese Frage löschen möchten?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'Sind Sie sicher, dass Sie $count Fragen löschen möchten?';
  }

  @override
  String get keepPracticing => 'Übe weiter, um dich zu verbessern!';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get review => 'Überprüfen';

  @override
  String get home => 'Startseite';

  @override
  String get allLabel => 'Alle';

  @override
  String get subtractPointsLabel => 'Punkte für falsche Antwort abziehen';

  @override
  String get subtractPointsDescription =>
      'Punkte für jede falsche Antwort abziehen.';

  @override
  String get subtractPointsOffDescription =>
      'Falsche Antworten führen nicht zu Punktabzug.';

  @override
  String get penaltyAmountLabel => 'Strafbetrag';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount Pkt. / Fehler';
  }

  @override
  String get allQuestionsLabel => 'Alle Fragen';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Mit $count ausgewählten starten';
  }

  @override
  String get advancedSettingsTitle => 'Erweiterte Einstellungen (Debug)';

  @override
  String get appLanguageLabel => 'App-Sprache';

  @override
  String get appLanguageDescription =>
      'Anwendungssprache für Tests überschreiben';

  @override
  String get pasteFromClipboard => 'Aus Zwischenablage einfügen';

  @override
  String get pasteImage => 'Einfügen';

  @override
  String get clipboardNoImage => 'Kein Bild in der Zwischenablage gefunden';

  @override
  String get close => 'Schließen';

  @override
  String get scoringAndLimitsTitle => 'Bewertung und Limits';

  @override
  String get congratulations => '🎉 Herzlichen Glückwunsch! 🎉';

  @override
  String get validationMin1Error => 'Mindestens 1 Minute';

  @override
  String remainingTimeWithDays(
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${days}T $hours:$minutes:$seconds';
  }

  @override
  String remainingTimeWithWeeks(
    String weeks,
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${weeks}W ${days}T $hours:$minutes:$seconds';
  }

  @override
  String get validationMax30DaysError => 'Maximal 30 Tage';

  @override
  String get validationMin0GenericError => 'Mindestens 0';

  @override
  String get errorStatus => 'Fehler';

  @override
  String get featureComingSoon =>
      'Demnächst verfügbar! Bleiben Sie auf dem Laufenden.';
}
