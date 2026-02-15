// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get titleAppBar => 'Quiz - Simulador d\'Exàmens';

  @override
  String get create => 'Crear';

  @override
  String get preview => 'Previsualització';

  @override
  String get previewLabel => 'Previsualització:';

  @override
  String get emptyPlaceholder => '(buit)';

  @override
  String get latexSyntaxTitle => 'Sintaxi LaTeX:';

  @override
  String get latexSyntaxHelp =>
      'Matemàtiques en línia: Utilitzeu \$...\$ per a expressions LaTeX\nExemple: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'Previsualització del renderitzat LaTeX';

  @override
  String get okButton => 'D\'acord';

  @override
  String get load => 'Carregar';

  @override
  String fileLoaded(String filePath) {
    return 'Fitxer carregat: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'Fitxer desat: $filePath';
  }

  @override
  String get dropFileHere =>
      'Feu clic aquí o arrossegueu un fitxer .quiz a la pantalla';

  @override
  String get clickOrDragFile =>
      'Feu clic per carregar o arrossegueu un fitxer .quiz a la pantalla';

  @override
  String get errorInvalidFile =>
      'Error: Fitxer no vàlid. Ha de ser un fitxer .quiz.';

  @override
  String errorLoadingFile(String error) {
    return 'Error en carregar el fitxer Quiz: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Error en exportar el fitxer: $error';
  }

  @override
  String get cancelButton => 'Cancel·lar';

  @override
  String get saveButton => 'Desar';

  @override
  String get confirmDeleteTitle => 'Confirmar eliminació';

  @override
  String confirmDeleteMessage(String processName) {
    return 'Esteu segur que voleu eliminar el procés `$processName`?';
  }

  @override
  String get deleteButton => 'Eliminar';

  @override
  String get confirmExitTitle => 'Confirmar sortida';

  @override
  String get confirmExitMessage => 'Esteu segur que voleu sortir sense desar?';

  @override
  String get exitButton => 'Sortir';

  @override
  String get saveDialogTitle => 'Seleccioneu un fitxer de sortida:';

  @override
  String get createQuizFileTitle => 'Crear fitxer Quiz';

  @override
  String get editQuizFileTitle => 'Editar fitxer Quiz';

  @override
  String get fileNameLabel => 'Nom del fitxer';

  @override
  String get fileDescriptionLabel => 'Descripció del fitxer';

  @override
  String get createButton => 'Crear';

  @override
  String get fileNameRequiredError => 'El nom del fitxer és obligatori.';

  @override
  String get fileDescriptionRequiredError =>
      'La descripció del fitxer és obligatòria.';

  @override
  String get versionLabel => 'Versió';

  @override
  String get authorLabel => 'Autor';

  @override
  String get authorRequiredError => 'L\'autor és obligatori.';

  @override
  String get requiredFieldsError =>
      'Tots els camps obligatoris han de ser completats.';

  @override
  String get requestFileNameTitle => 'Introduïu el nom del fitxer Quiz';

  @override
  String get fileNameHint => 'Nom del fitxer';

  @override
  String get emptyFileNameMessage => 'El nom del fitxer no pot estar buit.';

  @override
  String get acceptButton => 'Acceptar';

  @override
  String get saveTooltip => 'Desar el fitxer';

  @override
  String get saveDisabledTooltip => 'Cap canvi per desar';

  @override
  String get executeTooltip => 'Executar l\'examen';

  @override
  String get addTooltip => 'Afegir una nova pregunta';

  @override
  String get backSemanticLabel => 'Botó tornar';

  @override
  String get createFileTooltip => 'Crear un nou fitxer Quiz';

  @override
  String get loadFileTooltip => 'Carregar un fitxer Quiz existent';

  @override
  String questionNumber(int number) {
    return 'Pregunta $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return 'Pregunta $current de $total';
  }

  @override
  String get previous => 'Anterior';

  @override
  String get skip => 'Saltar';

  @override
  String get questionsOverview => 'Mapa de preguntes';

  @override
  String get next => 'Següent';

  @override
  String get finish => 'Acabar';

  @override
  String get finishQuiz => 'Acabar quiz';

  @override
  String get finishQuizConfirmation =>
      'Esteu segur que voleu acabar el quiz? No podreu canviar les vostres respostes després.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount preguntes sense respondre',
      one: '1 pregunta sense respondre',
    );
    return 'Tens $_temp0. Segur que vols acabar el qüestionari?';
  }

  @override
  String get resolveUnansweredQuestions => 'Resoldre preguntes';

  @override
  String get abandonQuiz => 'Abandonar quiz';

  @override
  String get abandonQuizConfirmation =>
      'Esteu segur que voleu abandonar el quiz? Tot el progrés es perdrà.';

  @override
  String get abandon => 'Abandonar';

  @override
  String get quizCompleted => 'Quiz Completat!';

  @override
  String score(String score) {
    return 'Puntuació: $score%';
  }

  @override
  String correctAnswers(int correct, int total) {
    return '$correct de $total respostes correctes';
  }

  @override
  String get retry => 'Repetir';

  @override
  String get goBack => 'Acabar';

  @override
  String get retryFailedQuestions => 'Repetir fallades';

  @override
  String question(String question) {
    return 'Pregunta: $question';
  }

  @override
  String get selectQuestionCountTitle => 'Seleccionar nombre de preguntes';

  @override
  String get selectQuestionCountMessage =>
      'A quantes preguntes us agradaria respondre en aquest quiz?';

  @override
  String allQuestions(int count) {
    return 'Totes les preguntes ($count)';
  }

  @override
  String get startQuiz => 'Començar quiz';

  @override
  String get errorInvalidNumber => 'Si us plau, introduïu un número vàlid';

  @override
  String get errorNumberMustBePositive => 'El número ha de ser més gran que 0';

  @override
  String get customNumberLabel => 'O introduïu un número personalitzat:';

  @override
  String get numberInputLabel => 'Nombre de preguntes';

  @override
  String get questionOrderConfigTitle =>
      'Configuració de l\'ordre de les preguntes';

  @override
  String get questionOrderConfigDescription =>
      'Seleccioneu l\'ordre en què voleu que apareguin les preguntes durant l\'examen:';

  @override
  String get questionOrderAscending => 'Ordre ascendent';

  @override
  String get questionOrderAscendingDesc =>
      'Les preguntes apareixeran en ordre de 1 al final';

  @override
  String get questionOrderDescending => 'Ordre descendent';

  @override
  String get questionOrderDescendingDesc =>
      'Les preguntes apareixeran del final a 1';

  @override
  String get questionOrderRandom => 'Aleatori';

  @override
  String get questionOrderRandomDesc =>
      'Les preguntes apareixeran en ordre aleatori';

  @override
  String get questionOrderConfigTooltip =>
      'Configuració de l\'ordre de les preguntes';

  @override
  String get reorderQuestionsTooltip => 'Reordenar preguntes';

  @override
  String get save => 'Desar';

  @override
  String get examTimeLimitTitle => 'Límit de temps de l\'examen';

  @override
  String get examTimeLimitDescription =>
      'Establiu un límit de temps per l\'examen. Quan s\'activi, es mostrarà un temporitzador de compte enrere durant el quiz.';

  @override
  String get enableTimeLimit => 'Activar límit de temps';

  @override
  String get timeLimitMinutes => 'Límit de temps (minuts)';

  @override
  String get examTimeExpiredTitle => 'Temps esgotat!';

  @override
  String get examTimeExpiredMessage =>
      'El temps de l\'examen ha expirat. Les vostres respostes s\'han enviat automàticament.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Elecció múltiple';

  @override
  String get questionTypeSingleChoice => 'Elecció única';

  @override
  String get questionTypeTrueFalse => 'Cert/Fals';

  @override
  String get questionTypeEssay => 'Desenvolupament';

  @override
  String get questionTypeRandom => 'Tots';

  @override
  String get questionTypeUnknown => 'Desconegut';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opcions',
      one: '1 opció',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip =>
      'Nombre d\'opcions de resposta per aquesta pregunta';

  @override
  String get imageTooltip => 'Aquesta pregunta té una imatge associada';

  @override
  String get explanationTooltip => 'Aquesta pregunta té una explicació';

  @override
  String get missingExplanation => 'Manca explicació';

  @override
  String get missingExplanationTooltip => 'Aquesta pregunta no té explicació';

  @override
  String questionTypeTooltip(String type) {
    return 'Tipus de pregunta: $type';
  }

  @override
  String get aiPrompt =>
      'Centreu-vos en la pregunta de l\'estudiant, no en respondre directament la pregunta original de l\'examen. Expliqueu amb un enfocament pedagògic. Per a exercicis pràctics o problemes matemàtics, proporcioneu instruccions pas a pas. Per a preguntes teòriques, proporcioneu una explicació concisa sense estructurar la resposta en seccions. Responeu en la mateixa llengua en què se us pregunta.';

  @override
  String get questionLabel => 'Pregunta';

  @override
  String get studentComment => 'Comentari de l\'estudiant';

  @override
  String get aiAssistantTitle => 'Assistent d\'estudi IA';

  @override
  String get questionContext => 'Context de la pregunta';

  @override
  String get aiAssistant => 'Assistent IA';

  @override
  String get aiThinking => 'La IA està pensant...';

  @override
  String get askAIHint => 'Feu la vostra pregunta sobre aquest tema...';

  @override
  String get aiPlaceholderResponse =>
      'Aquesta és una resposta de marcador de posició. En una implementació real, això es connectaria a un servei IA per proporcionar explicacions útils sobre la pregunta.';

  @override
  String get aiErrorResponse =>
      'Ho sento, hi ha hagut un error en processar la vostra pregunta. Torneu-ho a provar.';

  @override
  String get configureApiKeyMessage =>
      'Si us plau, configureu la vostra Clau API IA a la Configuració.';

  @override
  String get errorLabel => 'Error:';

  @override
  String get noResponseReceived => 'Cap resposta rebuda';

  @override
  String get invalidApiKeyError =>
      'Clau API no vàlida. Comproveu la vostra Clau API OpenAI a la configuració.';

  @override
  String get rateLimitError =>
      'Quota excedida o model no disponible en el teu pla.';

  @override
  String get modelNotFoundError =>
      'Model no trobat. Comproveu el vostre accés a l\'API.';

  @override
  String get unknownError => 'Error desconegut';

  @override
  String get networkErrorOpenAI =>
      'Error de xarxa: No s\'ha pogut connectar amb OpenAI. Comproveu la vostra connexió a Internet.';

  @override
  String get networkErrorGemini =>
      'Error de xarxa: No s\'ha pogut connectar amb Gemini. Comproveu la vostra connexió a Internet.';

  @override
  String get openaiApiKeyNotConfigured => 'Clau API OpenAI no configurada';

  @override
  String get geminiApiKeyNotConfigured => 'Clau API Gemini no configurada';

  @override
  String get geminiApiKeyLabel => 'Clau API Gemini';

  @override
  String get geminiApiKeyHint => 'Introduïu la vostra Clau API Gemini';

  @override
  String get geminiApiKeyDescription =>
      'Requerit per la funcionalitat IA Gemini. La vostra clau s\'emmagatzema de forma segura.';

  @override
  String get getGeminiApiKeyTooltip => 'Obtenir Clau API de Google AI Studio';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'L\'Assistent d\'Estudi IA requereix almenys una clau API (Gemini o OpenAI). Si us plau, introduïu una clau API o desactiveu l\'Assistent d\'IA.';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get aiButtonTooltip => 'Assistent d\'Estudi IA';

  @override
  String get aiButtonText => 'IA';

  @override
  String get aiAssistantSettingsTitle =>
      'Assistent d\'Estudi IA (Vista prèvia)';

  @override
  String get aiAssistantSettingsDescription =>
      'Activar o desactivar l\'assistent d\'estudi IA per les preguntes';

  @override
  String get aiDefaultModelTitle => 'Model IA per defecte';

  @override
  String get aiDefaultModelDescription =>
      'Selecciona el servei i model IA per defecte per la generació de preguntes';

  @override
  String get openaiApiKeyLabel => 'Clau API OpenAI';

  @override
  String get openaiApiKeyHint => 'Introduïu la vostra Clau API OpenAI (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Requerit per a la integració amb OpenAI. La vostra clau OpenAI s\'emmagatzema de forma segura.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'L\'Assistent d\'Estudi IA requereix una Clau API OpenAI. Introduïu la vostra clau API o desactiveu l\'Assistent IA.';

  @override
  String get getApiKeyTooltip => 'Obtenir Clau API d\'OpenAI';

  @override
  String get deleteAction => 'Eliminar';

  @override
  String get explanationLabel => 'Explicació (opcional)';

  @override
  String get explanationHint =>
      'Introduïu una explicació per la/les resposta/es correcta/es';

  @override
  String get explanationTitle => 'Explicació';

  @override
  String get imageLabel => 'Imatge';

  @override
  String get changeImage => 'Canviar imatge';

  @override
  String get removeImage => 'Eliminar imatge';

  @override
  String get addImageTap => 'Toqueu per afegir imatge';

  @override
  String get imageFormats => 'Formats: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Error en carregar la imatge';

  @override
  String imagePickError(String error) {
    return 'Error en carregar la imatge: $error';
  }

  @override
  String get tapToZoom => 'Toqueu per ampliar';

  @override
  String get trueLabel => 'Cert';

  @override
  String get falseLabel => 'Fals';

  @override
  String get addQuestion => 'Afegir pregunta';

  @override
  String get editQuestion => 'Editar pregunta';

  @override
  String get questionText => 'Text de la pregunta';

  @override
  String get questionType => 'Tipus de pregunta';

  @override
  String get addOption => 'Afegir opció';

  @override
  String get optionsLabel => 'Opcions';

  @override
  String get optionLabel => 'Opció';

  @override
  String get questionTextRequired => 'El text de la pregunta és obligatori';

  @override
  String get atLeastOneOptionRequired => 'Almenys una opció ha de tenir text';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'Almenys una resposta correcta ha de ser seleccionada';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'Només es permet una resposta correcta per aquest tipus de pregunta';

  @override
  String get removeOption => 'Eliminar opció';

  @override
  String get selectCorrectAnswer => 'Seleccionar resposta correcta';

  @override
  String get selectCorrectAnswers => 'Seleccionar respostes correctes';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'Les opcions $optionNumbers estan buides. Afegiu-hi text o elimineu-les.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'L\'opció $optionNumber està buida. Afegiu-hi text o elimineu-la.';
  }

  @override
  String get optionEmptyError => 'Aquesta opció no pot estar buida';

  @override
  String get hasImage => 'Imatge';

  @override
  String get hasExplanation => 'Explicació';

  @override
  String errorLoadingSettings(String error) {
    return 'Error en carregar la configuració: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'No s\'ha pogut obrir $url';
  }

  @override
  String get loadingAiServices => 'Carregant serveis IA...';

  @override
  String usingAiService(String serviceName) {
    return 'Usant: $serviceName';
  }

  @override
  String get aiServiceLabel => 'Servei IA:';

  @override
  String get aiModelLabel => 'Model:';

  @override
  String get importQuestionsTitle => 'Importar preguntes';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return 'Trobades $count preguntes a \"$fileName\". On voleu importar-les?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'On voleu afegir aquestes preguntes?';

  @override
  String get importAtBeginning => 'Al principi';

  @override
  String get importAtEnd => 'Al final';

  @override
  String questionsImportedSuccess(int count) {
    return 'Importades amb èxit $count preguntes';
  }

  @override
  String get importQuestionsTooltip =>
      'Importar preguntes d\'un altre fitxer quiz';

  @override
  String get dragDropHintText =>
      'També podeu arrossegar i deixar anar fitxers .quiz aquí per importar preguntes';

  @override
  String get randomizeAnswersTitle => 'Aleatoritzar opcions de resposta';

  @override
  String get randomizeAnswersDescription =>
      'Barrejar l\'ordre de les opcions de resposta durant l\'execució del quiz';

  @override
  String get showCorrectAnswerCountTitle =>
      'Mostrar nombre de respostes correctes';

  @override
  String get showCorrectAnswerCountDescription =>
      'Mostrar el nombre de respostes correctes en preguntes d\'elecció múltiple';

  @override
  String correctAnswersCount(int count) {
    return 'Seleccioneu $count respostes correctes';
  }

  @override
  String get correctSelectedLabel => 'Correcte';

  @override
  String get correctMissedLabel => 'Correcte';

  @override
  String get incorrectSelectedLabel => 'Incorrecte';

  @override
  String get aiGenerateDialogTitle => 'Generar preguntes amb IA';

  @override
  String get aiQuestionCountLabel => 'Nombre de preguntes (Opcional)';

  @override
  String get aiQuestionCountHint => 'Deixeu buit perquè la IA decideixi';

  @override
  String get aiQuestionCountValidation => 'Ha de ser un número entre 1 i 50';

  @override
  String get aiQuestionTypeLabel => 'Tipus de pregunta';

  @override
  String get aiQuestionTypeRandom => 'Aleatori (Mixt)';

  @override
  String get aiLanguageLabel => 'Idioma de les preguntes';

  @override
  String get aiContentLabel => 'Contingut per generar preguntes';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max paraules';
  }

  @override
  String get aiContentHint =>
      'Introduïu el text, tema, o contingut a partir del qual voleu generar preguntes...';

  @override
  String get aiContentHelperText =>
      'La IA crearà preguntes basades en aquest contingut';

  @override
  String aiWordLimitError(int max) {
    return 'Heu excedit el límit de $max paraules';
  }

  @override
  String get aiContentRequiredError =>
      'Heu de proporcionar contingut per generar preguntes';

  @override
  String aiContentLimitError(int max) {
    return 'El contingut supera el límit de $max paraules';
  }

  @override
  String get aiMinWordsError =>
      'Proporcioneu almenys 10 paraules per generar preguntes de qualitat';

  @override
  String get aiInfoTitle => 'Informació';

  @override
  String get aiInfoDescription =>
      '• La IA analitzarà el contingut i generarà preguntes rellevants\n• Si escrius menys de 10 paraules entraràs en modo Tema on es realitzaran preguntes sobre aquests temes específics\n• Amb més de 10 paraules entraràs en modo Contingut que farà preguntes sobre el mateix text (més paraules = més precisió)\n• Podeu incloure text, definicions, explicacions, o qualseval material educatiu\n• Les preguntes inclouran opcions de resposta i explicacions\n• El procés pot trigar uns segons';

  @override
  String get aiGenerateButton => 'Generar Preguntes';

  @override
  String get aiEnterContentTitle => 'Introduir contingut';

  @override
  String get aiEnterContentDescription =>
      'Introduïu el tema o enganxeu el contingut per generar preguntes';

  @override
  String get aiContentFieldHint =>
      'Introduïu un tema com \"Història de la Segona Guerra Mundial\" o enganxeu contingut de text aquí...';

  @override
  String get aiAttachFileHint => 'Adjunteu un fitxer (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Deixeu anar el fitxer aquí';

  @override
  String get dropImageHere => 'Deixeu anar la imatge aquí';

  @override
  String get aiNumberQuestionsLabel => 'Nombre de preguntes';

  @override
  String get backButton => 'Enrere';

  @override
  String get generateButton => 'Generar';

  @override
  String aiTopicModeCount(int count) {
    return 'Mode Tema ($count paraules)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Mode Text ($count paraules)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Modo de Contingut';

  @override
  String get aiGenerationCategoryTheory => 'Teoria';

  @override
  String get aiGenerationCategoryExercises => 'Exercicis';

  @override
  String get aiGenerationCategoryBoth => 'Mixt';

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
  String get aiServicesLoading => 'Carregant serveis IA...';

  @override
  String get aiServicesNotConfigured => 'Cap servei IA configurat';

  @override
  String get aiGeneratedQuestions => 'Generat per IA';

  @override
  String get aiApiKeyRequired =>
      'Configureu almenys una clau API IA a la Configuració per usar generació IA.';

  @override
  String get aiGenerationFailed =>
      'No s\'han pogut generar preguntes. Proveu amb contingut diferent.';

  @override
  String get aiGenerationErrorTitle => 'Error en generar preguntes';

  @override
  String get noQuestionsInFile => 'Cap pregunta trobada al fitxer importat';

  @override
  String get couldNotAccessFile =>
      'No s\'ha pogut accedir al fitxer seleccionat';

  @override
  String get defaultOutputFileName => 'fitxer-sortida.quiz';

  @override
  String get generateQuestionsWithAI => 'Generar preguntes amb IA';

  @override
  String get addQuestionsWithAI => 'Afegir preguntes amb IA';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Límit: $words paraules o $chars caràcters';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Límit: $words paraules';
  }

  @override
  String get aiAssistantDisabled => 'Assistent d\'IA Deshabilitat';

  @override
  String get enableAiAssistant =>
      'L\'assistent d\'IA està desactivat. Si us plau, activa\'l a la configuració per utilitzar les funcions d\'IA.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Mínim $minWords paraules necessàries';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount paraules ✓ Llest per generar';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords paraules ($moreNeeded més necessàries)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Mínim $minWords paraules necessàries ($moreNeeded més necessàries)';
  }

  @override
  String get enableQuestion => 'Activar pregunta';

  @override
  String get disableQuestion => 'Desactivar pregunta';

  @override
  String get questionDisabled => 'Desactivada';

  @override
  String get noEnabledQuestionsError =>
      'No hi ha preguntes activades disponibles per executar el qüestionari';

  @override
  String get evaluateWithAI => 'Avaluar amb IA';

  @override
  String get aiEvaluation => 'Avaluació IA';

  @override
  String aiEvaluationError(String error) {
    return 'Error en avaluar la resposta: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'Ets un professor especialitzat en avaluar respostes d\'estudiants a preguntes d\'assaig. La teva tasca és proporcionar avaluacions detallades i constructives. Respon en el mateix idioma que la resposta de l\'estudiant.';

  @override
  String get aiEvaluationPromptQuestion => 'Pregunta:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'Resposta de l\'estudiant:';

  @override
  String get aiEvaluationPromptCriteria =>
      'Criteris d\'avaluació (basats en l\'explicació del professor):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'Instruccions específiques:\n- Avalua fins a quin punt la resposta de l\'estudiant s\'ajusta als criteris establerts\n- Analitza el grau d\'integració i estructura en la resposta\n- Identifica si no s\'ha tingut en compte alguna cosa important segons els criteris\n- Considera la profunditat i precisió de l\'anàlisi';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'Instruccions generals:\n- Com que no s\'han establert criteris específics, avalua la resposta basant-te en estàndards acadèmics generals\n- Considera la claredat, coherència i estructura de la resposta\n- Avalua si la resposta demostra comprensió del tema\n- Analitza la profunditat de l\'anàlisi i la qualitat de l\'argumentació';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'Format de resposta:\n1. Puntuació: [X/10] - Justifica breument la puntuació\n2. Punts forts: Indica els aspectes positius de la resposta\n3. Àrees de millora: Assenyala els aspectes que es poden millorar\n4. Comentaris específics: Proporciona retroalimentació detallada i constructiva\n5. Suggeriments: Ofereix recomanacions específiques per millorar\n\nSigues constructiu, específic i educatiu en la teva avaluació. L\'objectiu és ajudar l\'estudiant a aprendre i millorar. Dirigeix-te a ell en segona persona i utilitza un to professional però accessible.';

  @override
  String get raffleTitle => 'Sorteig';

  @override
  String get raffleTooltip => 'Començar sorteig';

  @override
  String get participantListTitle => 'Llista de Participants';

  @override
  String get participantListHint =>
      'Introdueix noms separats per salt de línia';

  @override
  String get participantListPlaceholder =>
      'Introdueix els noms dels participants aquí...\nUn nom per línia';

  @override
  String get clearList => 'Netejar Llista';

  @override
  String get participants => 'Participants';

  @override
  String get noParticipants => 'No hi ha participants';

  @override
  String get addParticipantsHint =>
      'Afegeix participants per començar el sorteig';

  @override
  String get activeParticipants => 'Participants Actius';

  @override
  String get alreadySelected => 'Ja Seleccionats';

  @override
  String totalParticipants(int count) {
    return 'Total de Participants';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return '$active actius, $winners guanyadors';
  }

  @override
  String get startRaffle => 'Començar Sorteig';

  @override
  String get raffling => 'Sortejant...';

  @override
  String get selectingWinner => 'Seleccionant guanyador...';

  @override
  String get allParticipantsSelected =>
      'Tots els participants han estat seleccionats';

  @override
  String get addParticipantsToStart =>
      'Afegeix participants per començar el sorteig';

  @override
  String participantsReadyCount(int count) {
    return '$count participants preparats per al sorteig';
  }

  @override
  String get resetWinners => 'Reiniciar Guanyadors';

  @override
  String get resetWinnersConfirmTitle => 'Reiniciar guanyadors?';

  @override
  String get resetWinnersConfirmMessage =>
      'Això retornarà tots els guanyadors a la llista de participants actius.';

  @override
  String get resetRaffleTitle => 'Reiniciar sorteig?';

  @override
  String get resetRaffleConfirmMessage =>
      'Això reiniciarà tots els guanyadors i participants actius.';

  @override
  String get cancel => 'Cancel·lar';

  @override
  String get reset => 'Reiniciar';

  @override
  String get viewWinners => 'Veure Guanyadors';

  @override
  String get congratulations => '🎉 Felicitats! 🎉';

  @override
  String positionLabel(int position) {
    return 'Posició $position';
  }

  @override
  String remainingParticipants(int count) {
    return 'Participants restants: $count';
  }

  @override
  String get continueRaffle => 'Continuar Sorteig';

  @override
  String get finishRaffle => 'Finalitzar Sorteig';

  @override
  String get winnersTitle => 'Guanyadors';

  @override
  String get shareResults => 'Compartir Resultats';

  @override
  String get noWinnersYet => 'Encara no hi ha guanyadors';

  @override
  String get performRaffleToSeeWinners =>
      'Realitza un sorteig per veure els guanyadors';

  @override
  String get goToRaffle => 'Anar al Sorteig';

  @override
  String get raffleCompleted => 'Sorteig completat!';

  @override
  String winnersSelectedCount(int count) {
    return '$count guanyadors seleccionats';
  }

  @override
  String get newRaffle => 'Nou Sorteig';

  @override
  String get shareResultsTitle => 'Resultats del Sorteig';

  @override
  String get raffleResultsLabel => 'Resultats del sorteig:';

  @override
  String get close => 'Tancar';

  @override
  String get share => 'Copiar';

  @override
  String get shareNotImplemented => 'Compartir encara no està implementat';

  @override
  String get firstPlace => 'Primer Lloc';

  @override
  String get secondPlace => 'Segon Lloc';

  @override
  String get thirdPlace => 'Tercer Lloc';

  @override
  String nthPlace(int position) {
    return 'Lloc $position';
  }

  @override
  String placeLabel(String position) {
    return 'Lloc';
  }

  @override
  String get raffleResultsHeader => 'Resultats del Sorteig - null guanyadors';

  @override
  String totalWinners(int count) {
    return 'Total de guanyadors: $count';
  }

  @override
  String get noWinnersToShare => 'No hi ha guanyadors per compartir';

  @override
  String get shareSuccess => 'Resultats copiats amb èxit';

  @override
  String get selectLogo => 'Seleccionar Logo';

  @override
  String get logoUrl => 'URL del Logo';

  @override
  String get logoUrlHint =>
      'Introdueix la URL d\'una imatge per utilitzar com a logo personalitzat per al sorteig';

  @override
  String get invalidLogoUrl =>
      'URL d\'imatge no vàlida. Ha de ser una URL vàlida que acabi en .jpg, .png, .gif, etc.';

  @override
  String get logoPreview => 'Vista Prèvia';

  @override
  String get removeLogo => 'Eliminar Logo';

  @override
  String get logoTooLargeWarning =>
      'La imatge és massa gran per guardar-se. Només s\'utilitzarà durant aquesta sessió.';

  @override
  String get aiModeTopicTitle => 'Mode Tema';

  @override
  String get aiModeTopicDescription => 'Exploració creativa del tema';

  @override
  String get aiModeContentTitle => 'Mode Contingut';

  @override
  String get aiModeContentDescription =>
      'Preguntes precises basades en la teva entrada';

  @override
  String aiWordCountIndicator(int count) {
    return '$count paraules';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Precisió: $level';
  }

  @override
  String get aiPrecisionLow => 'Baixa';

  @override
  String get aiPrecisionMedium => 'Mitjana';

  @override
  String get aiPrecisionHigh => 'Alta';

  @override
  String get aiMoreWordsMorePrecision => 'Més paraules = més precisió';

  @override
  String get aiKeepDraftTitle => 'Mantenir esborrany d\'IA';

  @override
  String get aiKeepDraftDescription =>
      'Desar automàticament el text introduït al diàleg de generació d\'IA perquè no es perdi si es tanca el diàleg.';

  @override
  String get aiAttachFile => 'Adjuntar fitxer';

  @override
  String get aiRemoveFile => 'Eliminar fitxer';

  @override
  String get aiFileMode => 'Mode fitxer';

  @override
  String get aiFileModeDescription =>
      'Les preguntes es generaran a partir del fitxer adjunt';

  @override
  String get aiCommentsLabel => 'Comentaris (Opcional)';

  @override
  String get aiCommentsHint =>
      'Afegiu instruccions o comentaris sobre el fitxer adjunt...';

  @override
  String get aiCommentsHelperText =>
      'Opcionalment, afegiu instruccions sobre com generar preguntes a partir del fitxer';

  @override
  String get aiFilePickerError =>
      'No s\'ha pogut carregar el fitxer seleccionat';

  @override
  String get studyModeLabel => 'Mode estudi';

  @override
  String get studyModeDescription =>
      'Feedback instantani i sense temporitzador';

  @override
  String get examModeLabel => 'Mode examen';

  @override
  String get examModeDescription =>
      'Temporitzador estàndard i resultats al final';

  @override
  String get checkAnswer => 'Comprovar';

  @override
  String get quizModeTitle => 'Mode qüestionari';

  @override
  String get settingsTitle => 'Configuració';

  @override
  String get askAiAssistant => 'Pregunta a l\'assistent d\'IA';

  @override
  String get sorteosLabel => 'Raffles';

  @override
  String get edit => 'Editar';

  @override
  String get enable => 'Activar';

  @override
  String get disable => 'Desactivar';

  @override
  String get quizPreviewTitle => 'Vista prèvia del qüestionari';

  @override
  String get select => 'Seleccionar';

  @override
  String get done => 'Fet';

  @override
  String get importButton => 'Importar';

  @override
  String get reorderButton => 'Reordenar';

  @override
  String get startQuizButton => 'Començar qüestionari';

  @override
  String get deleteConfirmation =>
      'Esteu segur que voleu eliminar aquest qüestionari?';

  @override
  String get saveSuccess => 'Fitxer desat correctament';

  @override
  String get errorSavingFile => 'Error en desar el fitxer';

  @override
  String get deleteSingleQuestionConfirmation =>
      'Estàs segur que vols eliminar aquesta pregunta?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'Estàs segur que vols eliminar $count preguntes?';
  }

  @override
  String get keepPracticing => 'Segueix practicant per millorar!';

  @override
  String get tryAgain => 'Tornar a intentar';

  @override
  String get review => 'Repassar';

  @override
  String get home => 'Inici';

  @override
  String get allLabel => 'Totes';

  @override
  String get subtractPointsLabel => 'Restar punts per resposta incorrecta';

  @override
  String get penaltyAmountLabel => 'Quantitat de penalització';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount pts / error';
  }

  @override
  String get allQuestionsLabel => 'Totes les preguntes';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Iniciar amb $count seleccionades';
  }

  @override
  String get advancedSettingsTitle => 'Ajustes Avançats (Debug)';

  @override
  String get appLanguageLabel => 'Idioma de l\'aplicació';

  @override
  String get appLanguageDescription =>
      'Sobreescriure l\'idioma de l\'aplicació per a proves';
}
