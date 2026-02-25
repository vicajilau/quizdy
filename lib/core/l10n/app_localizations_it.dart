// Copyright (C) 2026 Víctor Carreras
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get abortQuizTitle => 'Interrompere il Quiz?';

  @override
  String get abortQuizMessage =>
      'L\'apertura di un nuovo file interromperà il quiz corrente.';

  @override
  String get stopAndOpenButton => 'Ferma e Apri';

  @override
  String get titleAppBar => 'Quiz - Simulatore d\'Esame';

  @override
  String get create => 'Crea';

  @override
  String get preview => 'Anteprima';

  @override
  String get previewLabel => 'Anteprima:';

  @override
  String get emptyPlaceholder => '(vuoto)';

  @override
  String get latexSyntaxTitle => 'Sintassi LaTeX:';

  @override
  String get latexSyntaxHelp =>
      'Matematica in linea: Usa \$...\$ per le espressioni LaTeX\nEsempio: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'Anteprima rendering LaTeX';

  @override
  String get okButton => 'OK';

  @override
  String get load => 'Carica';

  @override
  String fileLoaded(String filePath) {
    return 'File caricato: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'File salvato: $filePath';
  }

  @override
  String get dropFileHere =>
      'Fai clic sul logo o trascina un file .quiz sulla schermata';

  @override
  String get errorOpeningFile => 'Errore durante l\'apertura del file';

  @override
  String get replaceFileTitle => 'Carica nuovo Quiz';

  @override
  String get replaceFileMessage =>
      'Un Quiz è già caricato. Vuoi sostituirlo con il nuovo file?';

  @override
  String get replaceButton => 'Carica';

  @override
  String get clickOrDragFile =>
      'Clicca per caricare o trascina un file .quiz sullo schermo';

  @override
  String get errorInvalidFile =>
      'Errore: File non valido. Deve essere un file .quiz.';

  @override
  String errorLoadingFile(String error) {
    return 'Errore nel caricamento del file Quiz: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Errore nell\'esportazione del file: $error';
  }

  @override
  String get cancelButton => 'Annulla';

  @override
  String get saveButton => 'Salva';

  @override
  String get confirmDeleteTitle => 'Conferma eliminazione';

  @override
  String confirmDeleteMessage(String processName) {
    return 'Sei sicuro di voler eliminare il processo `$processName`?';
  }

  @override
  String get deleteButton => 'Elimina';

  @override
  String get confirmExitTitle => 'Conferma uscita';

  @override
  String get confirmExitMessage =>
      'Ci sono modifiche non salvate. Vuoi uscire scartando le modifiche?';

  @override
  String get exitButton => 'Esci senza salvare';

  @override
  String get saveDialogTitle => 'Seleziona un file di output:';

  @override
  String get createQuizFileTitle => 'Crea file Quiz';

  @override
  String get editQuizFileTitle => 'Modifica file Quiz';

  @override
  String get fileNameLabel => 'Nome file';

  @override
  String get fileDescriptionLabel => 'Descrizione file';

  @override
  String get createButton => 'Crea';

  @override
  String get fileNameRequiredError => 'Il nome del file è obbligatorio.';

  @override
  String get fileDescriptionRequiredError =>
      'La descrizione del file è obbligatoria.';

  @override
  String get versionLabel => 'Versione';

  @override
  String get authorLabel => 'Autore';

  @override
  String get authorRequiredError => 'L\'autore è obbligatorio.';

  @override
  String get requiredFieldsError =>
      'Tutti i campi obbligatori devono essere completati.';

  @override
  String get requestFileNameTitle => 'Inserisci il nome del file Quiz';

  @override
  String get fileNameHint => 'Nome file';

  @override
  String get emptyFileNameMessage => 'Il nome del file non può essere vuoto.';

  @override
  String get acceptButton => 'Accetta';

  @override
  String get saveTooltip => 'Salva il file';

  @override
  String get saveDisabledTooltip => 'Nessuna modifica da salvare';

  @override
  String get executeTooltip => 'Esegui l\'esame';

  @override
  String get addTooltip => 'Aggiungi una nuova domanda';

  @override
  String get backSemanticLabel => 'Pulsante indietro';

  @override
  String get createFileTooltip => 'Crea un nuovo file Quiz';

  @override
  String get loadFileTooltip => 'Carica un file Quiz esistente';

  @override
  String questionNumber(int number) {
    return 'Domanda $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return 'Domanda $current di $total';
  }

  @override
  String get previous => 'Precedente';

  @override
  String get skip => 'Salta';

  @override
  String get questionsOverview => 'Mappa delle domande';

  @override
  String get next => 'Successivo';

  @override
  String get finish => 'Termina';

  @override
  String get finishQuiz => 'Termina quiz';

  @override
  String get finishQuizConfirmation =>
      'Sei sicuro di voler terminare il quiz? Non potrai più modificare le tue risposte dopo.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount domande senza risposta',
      one: '1 domanda senza risposta',
    );
    return 'Hai $_temp0. Sei sicuro di voler terminare il quiz?';
  }

  @override
  String get resolveUnansweredQuestions => 'Risolvi domande';

  @override
  String get abandonQuiz => 'Abbandona quiz';

  @override
  String get abandonQuizConfirmation =>
      'Sei sicuro di voler abbandonare il quiz? Tutti i progressi andranno persi.';

  @override
  String get abandon => 'Abbandona';

  @override
  String get quizCompleted => 'Quiz Completato!';

  @override
  String score(String score) {
    return 'Punteggio: $score%';
  }

  @override
  String correctAnswers(String correct, int total) {
    return '$correct di $total risposte corrette';
  }

  @override
  String get retry => 'Ripeti';

  @override
  String get goBack => 'Termina';

  @override
  String get retryFailedQuestions => 'Riprova sbagliate';

  @override
  String question(String question) {
    return 'Domanda: $question';
  }

  @override
  String get selectQuestionCountTitle => 'Seleziona numero di domande';

  @override
  String get selectQuestionCountMessage =>
      'A quante domande vorresti rispondere in questo quiz?';

  @override
  String allQuestions(int count) {
    return 'Tutte le domande ($count)';
  }

  @override
  String get startQuiz => 'Inizia quiz';

  @override
  String get maxIncorrectAnswersLabel => 'Limita risposte errate';

  @override
  String get maxIncorrectAnswersDescription =>
      'Esame Idoneo/Non Idoneo. Non c\'è voto numerico, sei promosso o bocciato.';

  @override
  String get maxIncorrectAnswersOffDescription =>
      'L\'esame ha un voto numerico da 0 a 100.';

  @override
  String get maxIncorrectAnswersLimitLabel => 'Massimo errori consentiti';

  @override
  String get examFailedStatus => 'Esame NON SUPERATO';

  @override
  String get examPassedStatus => 'Esame SUPERATO';

  @override
  String get quizFailedLimitReached =>
      'Esame Terminato: Il limite massimo di errori è stato raggiunto';

  @override
  String get errorInvalidNumber => 'Inserisci un numero valido';

  @override
  String get errorNumberMustBePositive => 'Il numero deve essere maggiore di 0';

  @override
  String get customNumberLabel => 'O inserisci un numbero personalizzato:';

  @override
  String get numberInputLabel => 'Numero di domande';

  @override
  String get questionOrderConfigTitle => 'Configurazione ordine domande';

  @override
  String get questionOrderConfigDescription =>
      'Seleziona l\'ordine in cui vuoi che le domande appaiano durante l\'esame:';

  @override
  String get questionOrderAscending => 'Ordine crescente';

  @override
  String get questionOrderAscendingDesc =>
      'Le domande appariranno in ordine da 1 alla fine';

  @override
  String get questionOrderDescending => 'Ordine decrescente';

  @override
  String get questionOrderDescendingDesc =>
      'Le domande appariranno dalla fine a 1';

  @override
  String get questionOrderRandom => 'Ordine casuale delle domande';

  @override
  String get questionOrderRandomDesc =>
      'Le domande appariranno in ordine casuale';

  @override
  String get questionOrderConfigTooltip => 'Configurazione ordine domande';

  @override
  String get reorderQuestionsTooltip => 'Riordina domande';

  @override
  String get save => 'Salva';

  @override
  String get examConfigurationTitle => 'Configurazione dell\'esame';

  @override
  String get examTimeLimitTitle => 'Limite di tempo esame';

  @override
  String get examTimeLimitDescription =>
      'Imposta un limite di tempo per l\'esame. Verrà visualizzato un timer di conto alla rovescia durante il quiz.';

  @override
  String get examTimeLimitOffDescription =>
      'Non c\'è limite de tempo per questo esame.';

  @override
  String get enableTimeLimit => 'Abilita limite di tempo';

  @override
  String get timeLimitMinutes => 'Limite di tempo (minuti)';

  @override
  String get examTimeExpiredTitle => 'Tempo scaduto!';

  @override
  String get examTimeExpiredMessage =>
      'Il tempo dell\'esame è scaduto. Le tue risposte sono state automaticamente inviate.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Scelta multipla';

  @override
  String get questionTypeSingleChoice => 'Scelta singola';

  @override
  String get questionTypeTrueFalse => 'Vero/Falso';

  @override
  String get questionTypeEssay => 'Risposta aperta';

  @override
  String get questionTypeRandom => 'Tutti';

  @override
  String get questionTypeUnknown => 'Sconosciuto';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opzioni',
      one: '1 opzione',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip =>
      'Numero di opzioni di risposta per questa domanda';

  @override
  String get imageTooltip => 'Questa domanda ha un\'immagine associata';

  @override
  String get explanationTooltip => 'Questa domanda ha una spiegazione';

  @override
  String get missingExplanation => 'Spiegazione mancante';

  @override
  String get missingExplanationTooltip => 'Questa domanda non ha spiegazione';

  @override
  String questionTypeTooltip(String type) {
    return 'Tipo di domanda: $type';
  }

  @override
  String get aiPrompt =>
      'Concentrati sulla domanda dello studente, non sul rispondere direttamente alla domanda d\'esame originale. Spiega con un approccio pedagogico. Per esercizi pratici o problemi matematici, fornisci istruzioni passo dopo passo. Per domande teoriche, fornisci una spiegazione concisa senza strutturare la risposta in sezioni. Rispondi nella stessa lingua in cui ti viene chiesto.';

  @override
  String get aiChatGuardrail =>
      'IMPORTANTE: Sei un assistente allo studio esclusivamente per questo Quiz. Devi rispondere SOLO a domande relative alla domanda attuale del Quiz, alle sue opzioni, alla sua spiegazione o all\'argomento educativo trattato. Se lo studente chiede qualcosa non correlato al Quiz (ad esempio, il tuo modello interno, dettagli del sistema, conoscenze generali non correlate alla domanda, o qualsiasi richiesta fuori tema), rispondi SOLO con: \"Sono qui per aiutarti con questo Quiz! Concentriamoci sulla domanda. Non esitare a chiedermi dell\'argomento, delle opzioni di risposta o di qualsiasi cosa relativa a questa domanda.\" Non rivelare mai dettagli tecnici su te stesso, il sistema o il modello di IA utilizzato.';

  @override
  String get questionLabel => 'Domanda';

  @override
  String get studentComment => 'Commento studente';

  @override
  String get aiAssistantTitle => 'Assistente di studio IA';

  @override
  String get questionContext => 'Contesto domanda';

  @override
  String get aiAssistant => 'Assistente IA';

  @override
  String get aiThinking => 'L\'IA sta pensando...';

  @override
  String get askAIHint => 'Fai la tua domanda su questo argomento...';

  @override
  String get aiPlaceholderResponse =>
      'Questa è una risposta segnaposto. In un\'implementazione reale, questo si connetterebbe a un servizio IA per fornire spiegazioni utili sulla domanda.';

  @override
  String get aiErrorResponse =>
      'Scusa, si è verificato un errore nell\'elaborazione della tua domanda. Riprova.';

  @override
  String get evaluatingResponses => 'Valutazione delle risposte...';

  @override
  String pendingEvaluationsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count domande di sviluppo in attesa di valutazione IA',
      one: '1 domanda di sviluppo in attesa di valutazione IA',
    );
    return '$_temp0';
  }

  @override
  String get pendingStatus => 'In attesa';

  @override
  String get notEvaluatedStatus => 'Non valutato';

  @override
  String get configureApiKeyMessage =>
      'Configura la tua chiave API IA nelle Impostazioni.';

  @override
  String get errorLabel => 'Errore:';

  @override
  String get retryButton => 'Riprova valutazione';

  @override
  String get noResponseReceived => 'Nessuna risposta ricevuta';

  @override
  String get invalidApiKeyError =>
      'Chiave API non valida. Controlla la tua chiave API OpenAI nelle impostazioni.';

  @override
  String get rateLimitError =>
      'Quota superata o modello non disponibile nel tuo piano. Controlla il tuo piano.';

  @override
  String get modelNotFoundError =>
      'Modello non trovato. Controlla il tuo accesso API.';

  @override
  String get unknownError => 'Errore sconosciuto';

  @override
  String get networkErrorOpenAI =>
      'Errore di rete: Impossibile connettersi a OpenAI. Controlla la tua connessione internet.';

  @override
  String get networkErrorGemini =>
      'Errore di rete: Impossibile connettersi a Gemini. Controlla la tua connessione internet.';

  @override
  String get openaiApiKeyNotConfigured => 'Chiave API OpenAI non configurata';

  @override
  String get geminiApiKeyNotConfigured => 'Chiave API Gemini non configurata';

  @override
  String get geminiApiKeyLabel => 'Chiave API Gemini';

  @override
  String get geminiApiKeyHint => 'Inserisci la tua chiave API Gemini';

  @override
  String get geminiApiKeyDescription =>
      'Richiesta per la funzionalità IA Gemini. La tua chiave è memorizzata in sicurezza.';

  @override
  String get getGeminiApiKeyTooltip =>
      'Ottieni la chiave API da Google AI Studio';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'L\'Assistente di Studio AI richiede almeno una chiave API (Gemini o OpenAI). Inserisci una chiave API o disabilita l\'Assistente IA.';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get aiButtonTooltip => 'Assistente di Studio IA';

  @override
  String get aiButtonText => 'IA';

  @override
  String get aiAssistantSettingsTitle => 'Assistente di Studio IA (Anteprima)';

  @override
  String get aiAssistantSettingsDescription =>
      'Abilita o disabilita l\'assistente di studio IA per le domande';

  @override
  String get aiDefaultModelTitle => 'Modello IA predefinito';

  @override
  String get aiDefaultModelDescription =>
      'Seleziona il servizio e modello IA predefinito per la generazione di domande';

  @override
  String get openaiApiKeyLabel => 'Chiave API OpenAI';

  @override
  String get openaiApiKeyHint => 'Inserisci la tua chiave API OpenAI (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Richiesta per l\'integrazione con OpenAI. La tua chiave OpenAI è memorizzata in sicurezza.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'L\'Assistente di Studio IA richiede una chiave API OpenAI. Inserisci la tua chiave API o disabilita l\'Assistente IA.';

  @override
  String get getApiKeyTooltip => 'Ottieni la chiave API da OpenAI';

  @override
  String get deleteAction => 'Elimina';

  @override
  String get explanationLabel => 'Spiegazione (opzionale)';

  @override
  String get explanationHint =>
      'Inserisci una spiegazione per la/e risposta/e corretta/e';

  @override
  String get explanationTitle => 'Spiegazione';

  @override
  String get imageLabel => 'Immagine';

  @override
  String get changeImage => 'Cambia immagine';

  @override
  String get removeImage => 'Rimuovi immagine';

  @override
  String get addImageTap => 'Tocca per aggiungere immagine';

  @override
  String get imageFormats => 'Formati: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Errore nel caricamento dell\'immagine';

  @override
  String imagePickError(String error) {
    return 'Errore nel caricamento dell\'immagine: $error';
  }

  @override
  String get tapToZoom => 'Tocca per ingrandire';

  @override
  String get trueLabel => 'Vero';

  @override
  String get falseLabel => 'Falso';

  @override
  String get addQuestion => 'Aggiungi domanda';

  @override
  String get editQuestion => 'Modifica domanda';

  @override
  String get questionText => 'Testo domanda';

  @override
  String get questionType => 'Tipo domanda';

  @override
  String get addOption => 'Aggiungi opzione';

  @override
  String get optionsLabel => 'Opzioni';

  @override
  String get optionLabel => 'Opzione';

  @override
  String get questionTextRequired => 'Il testo della domanda è obbligatorio';

  @override
  String get atLeastOneOptionRequired =>
      'Almeno un\'opzione deve avere del testo';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'Almeno una risposta corretta deve essere selezionata';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'È consentita solo una risposta corretta per questo tipo di domanda';

  @override
  String get removeOption => 'Rimuovi opzione';

  @override
  String get selectCorrectAnswer => 'Seleziona risposta corretta';

  @override
  String get selectCorrectAnswers => 'Seleziona risposte corrette';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'Le opzioni $optionNumbers sono vuote. Aggiungi del testo o rimuovile.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'L\'opzione $optionNumber è vuota. Aggiungi del testo o rimuovila.';
  }

  @override
  String get optionEmptyError => 'Questa opzione non può essere vuota';

  @override
  String get hasImage => 'Immagine';

  @override
  String get hasExplanation => 'Spiegazione';

  @override
  String errorLoadingSettings(String error) {
    return 'Errore nel caricamento delle impostazioni: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'Impossibile aprire $url';
  }

  @override
  String get loadingAiServices => 'Caricamento servizi IA...';

  @override
  String usingAiService(String serviceName) {
    return 'Usando: $serviceName';
  }

  @override
  String get aiServiceLabel => 'Servizio IA:';

  @override
  String get aiModelLabel => 'Modello:';

  @override
  String get importQuestionsTitle => 'Importa domande';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return 'Trovate $count domande in \"$fileName\". Dove vuoi importarle?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'Dove vuoi aggiungere queste domande?';

  @override
  String get importAtBeginning => 'All\'inizio';

  @override
  String get importAtEnd => 'Alla fine';

  @override
  String questionsImportedSuccess(int count) {
    return 'Importate con successo $count domande';
  }

  @override
  String get importQuestionsTooltip => 'Importa domande da un altro file quiz';

  @override
  String get dragDropHintText =>
      'Puoi anche trascinare e rilasciare file .quiz qui per importare domande';

  @override
  String get randomizeQuestionsTitle => 'Randomizza domande';

  @override
  String get randomizeQuestionsDescription =>
      'Mescola l\'ordine delle domande durante l\'esecuzione del quiz';

  @override
  String get randomizeQuestionsOffDescription =>
      'Le domande appariranno nel loro ordine originale';

  @override
  String get randomizeAnswersTitle => 'Ordine casuale delle risposte';

  @override
  String get randomizeAnswersDescription =>
      'Mescola l\'ordine delle opzioni di risposta durante l\'esecuzione del quiz';

  @override
  String get randomizeAnswersOffDescription =>
      'Le opzioni di risposta appariranno nel loro ordine originale';

  @override
  String get showCorrectAnswerCountTitle => 'Mostra numero risposte corrette';

  @override
  String get showCorrectAnswerCountDescription =>
      'Visualizza il numero di risposte corrette nelle domande a scelta multipla';

  @override
  String get showCorrectAnswerCountOffDescription =>
      'Il numero di risposte corrette non verrà mostrato per le domande a scelta multipla';

  @override
  String correctAnswersCount(int count) {
    return 'Seleziona $count risposte corrette';
  }

  @override
  String get correctSelectedLabel => 'Corretto';

  @override
  String get correctMissedLabel => 'Corretto';

  @override
  String get incorrectSelectedLabel => 'Errato';

  @override
  String get aiGenerateDialogTitle => 'Genera domande con IA';

  @override
  String get aiQuestionCountLabel => 'Numero di domande (Opzionale)';

  @override
  String get aiQuestionCountHint => 'Lascia vuoto per far decidere all\'IA';

  @override
  String get aiQuestionCountValidation => 'Deve essere un numero tra 1 e 50';

  @override
  String get aiQuestionTypeLabel => 'Tipo di domanda';

  @override
  String get aiQuestionTypeRandom => 'Casuale (Misto)';

  @override
  String get aiLanguageLabel => 'Lingua domande';

  @override
  String get aiContentLabel => 'Contenuto per generare domande';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max parole';
  }

  @override
  String get aiContentHint =>
      'Inserisci il testo, argomento, o contenuto da cui vuoi generare domande...';

  @override
  String get aiContentHelperText =>
      'L\'IA creerà domande basate su questo contenuto';

  @override
  String aiWordLimitError(int max) {
    return 'Hai superato il limite di $max parole';
  }

  @override
  String get aiContentRequiredError =>
      'Devi fornire contenuto per generare domande';

  @override
  String aiContentLimitError(int max) {
    return 'Il contenuto supera il limite di $max parole';
  }

  @override
  String get aiMinWordsError =>
      'Fornisci almeno 10 parole per generare domande di qualità';

  @override
  String get aiInfoTitle => 'Informazioni';

  @override
  String get aiInfoDescription =>
      '• L\'IA analizzerà il contenuto e genererà domande pertinenti\n• Se scrivi meno di 10 parole entrerai in modalità Argomento dove verranno fatte domande su quei temi specifici\n• Con più di 10 parole entrerai in modalità Contenuto che farà domande sullo stesso testo (più parole = più precisione)\n• Puoi includere testo, definizioni, spiegazioni, o qualsiasi materiale educativo\n• Le domande includeranno opzioni di risposta e spiegazioni\n• Il processo può richiedere alcuni secondi';

  @override
  String get aiGenerateButton => 'Genera Domande';

  @override
  String get aiEnterContentTitle => 'Inserisci contenuto';

  @override
  String get aiEnterContentDescription =>
      'Inserisci l\'argomento o incolla il contenuto da cui generare le domande';

  @override
  String get aiContentFieldHint =>
      'Inserisci un argomento come \"Storia della Seconda Guerra Mondiale\" o incolla il testo qui...';

  @override
  String get aiAttachFileHint => 'Allega file (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Rilascia il file qui';

  @override
  String get dropImageHere => 'Rilascia l\'immagine qui';

  @override
  String get aiNumberQuestionsLabel => 'Numero di domande';

  @override
  String get backButton => 'Indietro';

  @override
  String get generateButton => 'Genera';

  @override
  String aiTopicModeCount(int count) {
    return 'Modalità Argomento ($count parole)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Modalità Testo ($count parole)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Modalità Contenuto';

  @override
  String get aiGenerationCategoryTheory => 'Teoria';

  @override
  String get aiGenerationCategoryExercises => 'Esercizi';

  @override
  String get aiGenerationCategoryBoth => 'Misto';

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
  String get aiServicesLoading => 'Caricamento servizi IA...';

  @override
  String get aiServicesNotConfigured => 'Nessun servizio IA configurato';

  @override
  String get aiGeneratedQuestions => 'Generato da IA';

  @override
  String get aiApiKeyRequired =>
      'Configura almeno una chiave API IA nelle Impostazioni per usare la generazione IA.';

  @override
  String get aiGenerationFailed =>
      'Impossibile generare domande. Prova con contenuto diverso.';

  @override
  String get aiGenerationErrorTitle => 'Errore nella generazione domande';

  @override
  String get noQuestionsInFile => 'Nessuna domanda trovata nel file importato';

  @override
  String get couldNotAccessFile => 'Impossibile accedere al file selezionato';

  @override
  String get defaultOutputFileName => 'file-output.quiz';

  @override
  String get generateQuestionsWithAI => 'Genera domande con IA';

  @override
  String get addQuestionsWithAI => 'Aggiungi domande con l\'IA';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Limite: $words parole o $chars caratteri';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Limite: $words parole';
  }

  @override
  String get aiAssistantDisabled => 'Assistente IA Disabilitato';

  @override
  String get enableAiAssistant =>
      'L\'assistente IA è disabilitato. Si prega di abilitarlo nelle impostazioni per utilizzare le funzionalità IA.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Minimo $minWords parole richieste';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount parole ✓ Pronto a generare';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords parole ($moreNeeded altre necessarie)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Minimo $minWords parole richieste ($moreNeeded altre necessarie)';
  }

  @override
  String get enableQuestion => 'Abilita domanda';

  @override
  String get disableQuestion => 'Disabilita domanda';

  @override
  String get questionDisabled => 'Disabilitata';

  @override
  String get noEnabledQuestionsError =>
      'Nessuna domanda abilitata disponibile per avviare il quiz';

  @override
  String get evaluateWithAI => 'Valuta con AI';

  @override
  String get aiEvaluation => 'Valutazione AI';

  @override
  String aiEvaluationError(String error) {
    return 'Errore nella valutazione della risposta: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'Sei un insegnante esperto che valuta la risposta di uno studente a una domanda di saggio. Il tuo compito è fornire una valutazione dettagliata e costruttiva. Rispondi nella stessa lingua della risposta dello studente.';

  @override
  String get aiEvaluationPromptQuestion => 'DOMANDA:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'RISPOSTA DELLO STUDENTE:';

  @override
  String get aiEvaluationPromptCriteria =>
      'CRITERI DI VALUTAZIONE (basati sulla spiegazione dell\'insegnante):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'ISTRUZIONI SPECIFICHE:\n- Valuta quanto bene la risposta dello studente si allinea con i criteri stabiliti\n- Analizza il grado di sintesi e struttura nella risposta\n- Identifica se qualcosa di importante è stato tralasciato secondo i criteri\n- Considera la profondità e l\'accuratezza dell\'analisi';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'ISTRUZIONI GENERALI:\n- Poiché non ci sono criteri specifici stabiliti, valuta la risposta basandoti su standard accademici generali\n- Considera chiarezza, coerenza e struttura della risposta\n- Valuta se la risposta dimostra comprensione dell\'argomento\n- Analizza la profondità dell\'analisi e la qualità degli argomenti';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'FORMATO DELLA RISPOSTA:\n1. VOTO: [X/10] - Giustifica brevemente il voto\n2. PUNTI DI FORZA: Menziona gli aspetti positivi della risposta\n3. AREE DI MIGLIORAMENTO: Indica gli aspetti che potrebbero essere migliorati\n4. COMMENTI SPECIFICI: Fornisci feedback dettagliato e costruttivo\n5. SUGGERIMENTI: Offri raccomandazioni specifiche per il miglioramento\n\nSii costruttivo, specifico ed educativo nella tua valutazione. L\'obiettivo è aiutare lo studente a imparare e migliorare. Rivolgiti a lui in seconda persona e usa un tono professionale e amichevole.';

  @override
  String get aiModeTopicTitle => 'Modalità argomento';

  @override
  String get aiModeTopicDescription => 'Esplorazione creativa dell\'argomento';

  @override
  String get aiModeContentTitle => 'Modalità contenuto';

  @override
  String get aiModeContentDescription => 'Domande precise basate sul tuo input';

  @override
  String aiWordCountIndicator(int count) {
    return '$count parole';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Precisione: $level';
  }

  @override
  String get aiPrecisionLow => 'Bassa';

  @override
  String get aiPrecisionMedium => 'Media';

  @override
  String get aiPrecisionHigh => 'Alta';

  @override
  String get aiMoreWordsMorePrecision => 'Più parole = più precisione';

  @override
  String get aiKeepDraftTitle => 'Mantieni bozza IA';

  @override
  String get aiKeepDraftDescription =>
      'Salva automaticamente il testo inserito nella finestra di dialogo di generazione IA in modo che non vada perso se la finestra viene chiusa.';

  @override
  String get aiAttachFile => 'Allega file';

  @override
  String get aiRemoveFile => 'Rimuovi file';

  @override
  String get aiFileMode => 'Modalità file';

  @override
  String get aiFileModeDescription =>
      'Le domande verranno generate dal file allegato';

  @override
  String get aiCommentsLabel => 'Commenti (Opzionale)';

  @override
  String get aiCommentsHint =>
      'Aggiungi istruzioni o commenti sul file allegato...';

  @override
  String get aiCommentsHelperText =>
      'Facoltativamente aggiungi istruzioni su come generare domande dal file';

  @override
  String get aiFilePickerError => 'Impossibile caricare il file selezionato';

  @override
  String get studyModeLabel => 'Modalità studio';

  @override
  String get studyModeDescription =>
      'Assistenza AI disponibile. Feedback istantaneo dopo ogni risposta, senza limiti di tempo o penalità.';

  @override
  String get examModeLabel => 'Modalità esame';

  @override
  String get examModeDescription =>
      'Nessuna assistenza AI. Potrebbero essere applicati limiti di tempo e penalità per le risposte errate.';

  @override
  String get checkAnswer => 'Controlla';

  @override
  String get quizModeTitle => 'Modalità quiz';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get askAiAssistant => 'Chiedi all\'assistente AI';

  @override
  String get askAiAboutQuestion => 'Chiedi all\'AI su questa domanda';

  @override
  String get aiHelpWithQuestion => 'Aiutami a capire questa domanda';

  @override
  String get edit => 'Modifica';

  @override
  String get enable => 'Abilita';

  @override
  String get disable => 'Disabilita';

  @override
  String get quizPreviewTitle => 'Anteprima Quiz';

  @override
  String get select => 'Seleziona';

  @override
  String get done => 'Fatto';

  @override
  String get importButton => 'Importa';

  @override
  String get reorderButton => 'Riordina';

  @override
  String get startQuizButton => 'Inizia Quiz';

  @override
  String get deleteConfirmation => 'Sei sicuro di voler eliminare questo quiz?';

  @override
  String get saveSuccess => 'File salvato con successo';

  @override
  String get errorSavingFile => 'Errore durante il salvataggio del file';

  @override
  String get deleteSingleQuestionConfirmation =>
      'Sei sicuro di voler eliminare questa domanda?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'Sei sicuro di voler eliminare $count domande?';
  }

  @override
  String get keepPracticing => 'Continua a fare pratica per migliorare!';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get review => 'Ripassa';

  @override
  String get home => 'Home';

  @override
  String get allLabel => 'Tutte';

  @override
  String get subtractPointsLabel => 'Sottrai punti per risposta errata';

  @override
  String get subtractPointsDescription =>
      'Sottrae punti per ogni risposta errata.';

  @override
  String get subtractPointsOffDescription =>
      'Le risposte errate non sottraggono punti.';

  @override
  String get penaltyAmountLabel => 'Importo penalità';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount pt / errore';
  }

  @override
  String get allQuestionsLabel => 'Tutte le domande';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Inizia con $count selezionate';
  }

  @override
  String get advancedSettingsTitle => 'Impostazioni avanzate (Debug)';

  @override
  String get appLanguageLabel => 'Lingua dell\'app';

  @override
  String get appLanguageDescription =>
      'Sovrascrivi la lingua dell\'applicazione per i test';

  @override
  String get pasteFromClipboard => 'Incolla dagli appunti';

  @override
  String get pasteImage => 'Incolla';

  @override
  String get clipboardNoImage => 'Nessuna immagine trovata negli appunti';

  @override
  String get close => 'Chiudi';

  @override
  String get scoringAndLimitsTitle => 'Punteggio e limiti';

  @override
  String get congratulations => '🎉 Congratulazioni! 🎉';

  @override
  String get validationMin1Error => 'Minimo 1 minuto';

  @override
  String remainingTimeWithDays(
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${days}g $hours:$minutes:$seconds';
  }

  @override
  String remainingTimeWithWeeks(
    String weeks,
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${weeks}s ${days}g $hours:$minutes:$seconds';
  }

  @override
  String get validationMax30DaysError => 'Massimo 30 giorni';

  @override
  String get validationMin0GenericError => 'Minimo 0';

  @override
  String get errorStatus => 'Errore';

  @override
  String get featureComingSoon =>
      'Prossimamente disponibile! Resta sintonizzato per gli aggiornamenti.';

  @override
  String get showOnboarding => 'Mostra benvenuto';

  @override
  String get showOnboardingDescription =>
      'Visualizza di nuovo il tutorial di benvenuto';

  @override
  String get onboardingBack => 'Indietro';

  @override
  String get onboardingGetStarted => 'Inizia';

  @override
  String get onboardingWelcomeTitle => 'Benvenuto in QuizLab AI';

  @override
  String get onboardingWelcomeDescription =>
      'Il tuo compagno di quiz interattivo con funzioni basate sull\'IA, domande personalizzabili e punteggio in tempo reale.';

  @override
  String get onboardingWelcomeSubtitle => 'Il tuo compagno di quiz interattivo';

  @override
  String get onboardingStartQuizTitle => 'Inizia un Quiz';

  @override
  String get onboardingStartQuizDescription =>
      'Carica un file .quiz esistente o creane uno nuovo da zero. Trascina e rilascia i file direttamente o usa il selettore di file.';

  @override
  String get onboardingStartQuizSubtitle => 'Carica, crea e gioca';

  @override
  String get onboardingCreateQuestionsTitle => 'Crea Domande';

  @override
  String get onboardingCreateQuestionsDescription =>
      'Costruisci quiz con diversi tipi di domande. Personalizza ogni domanda con opzioni, risposte corrette e spiegazioni.';

  @override
  String get onboardingCreateQuestionsSubtitle => 'Progetta i tuoi quiz';

  @override
  String get onboardingAiFeaturesTitle => 'Funzioni basate sull\'IA';

  @override
  String get onboardingAiFeaturesDescription =>
      'Genera domande automaticamente con l\'IA, ricevi assistenza allo studio in tempo reale e impara in modo più intelligente con il tutoraggio intelligente.';

  @override
  String get onboardingAiFeaturesSubtitle => 'Potenziato dall\'IA';

  @override
  String get onboardingFeatureAiTitle => 'Generazione domande con IA';

  @override
  String get onboardingFeatureAiDescription =>
      'Genera quiz da qualsiasi testo con GPT o Gemini';

  @override
  String get onboardingFeatureTypesTitle => 'Diversi tipi di domande';

  @override
  String get onboardingFeatureTypesDescription =>
      'Scelta singola, scelta multipla, vero/falso e saggio';

  @override
  String get onboardingFeatureLanguagesTitle => '13 lingue supportate';

  @override
  String get onboardingFeatureLanguagesDescription =>
      'Crea e affronta quiz in più lingue';

  @override
  String get onboardingStepCreateTitle => 'Crea Quiz';

  @override
  String get onboardingStepCreateDescription =>
      'Inizia da zero con le tue domande';

  @override
  String get onboardingStepLoadTitle => 'Carica File';

  @override
  String get onboardingStepLoadDescription =>
      'Importa un file .quiz dal tuo dispositivo';

  @override
  String get onboardingStepTakeTitle => 'Affronta il Quiz';

  @override
  String get onboardingStepTakeDescription =>
      'Rispondi alle domande e ottieni il punteggio in tempo reale';

  @override
  String get onboardingAiAutoGenerateTitle => 'Auto-generazione domande';

  @override
  String get onboardingAiAutoGenerateDescription =>
      'Da qualsiasi testo con GPT o Gemini';

  @override
  String get onboardingAiStudyAssistantTitle => 'Assistente allo studio IA';

  @override
  String get onboardingAiStudyAssistantDescription =>
      'Ricevi spiegazioni mentre impari';

  @override
  String get onboardingAiMultiLanguageTitle => 'Supporto multi-lingua';

  @override
  String get onboardingAiMultiLanguageDescription =>
      'Genera in 13 lingue diverse';
}
