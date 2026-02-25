// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get abortQuizTitle => 'Abandonner le Quiz ?';

  @override
  String get abortQuizMessage =>
      'L\'ouverture d\'un nouveau fichier arrêtera le quiz en cours.';

  @override
  String get stopAndOpenButton => 'Arrêter & Ouvrir';

  @override
  String get titleAppBar => 'Quiz - Simulateur d\'Examens';

  @override
  String get create => 'Créer';

  @override
  String get preview => 'Aperçu';

  @override
  String get previewLabel => 'Aperçu :';

  @override
  String get emptyPlaceholder => '(vide)';

  @override
  String get latexSyntaxTitle => 'Syntaxe LaTeX :';

  @override
  String get latexSyntaxHelp =>
      'Maths en ligne : Utilisez \$...\$ pour les expressions LaTeX\nExemple : \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'Aperçu du rendu LaTeX';

  @override
  String get okButton => 'OK';

  @override
  String get load => 'Charger';

  @override
  String fileLoaded(String filePath) {
    return 'Fichier chargé : $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'Fichier sauvegardé : $filePath';
  }

  @override
  String get dropFileHere =>
      'Cliquez ici ou faites glisser un fichier .quiz vers l\'écran';

  @override
  String get errorOpeningFile => 'Erreur lors de l\'ouverture du fichier';

  @override
  String get replaceFileTitle => 'Charger un nouveau Quiz';

  @override
  String get replaceFileMessage =>
      'Un Quiz est déjà chargé. Voulez-vous le remplacer par le nouveau fichier ?';

  @override
  String get replaceButton => 'Charger';

  @override
  String get clickOrDragFile =>
      'Cliquez pour charger ou faites glisser un fichier .quiz vers l\'écran';

  @override
  String get errorInvalidFile =>
      'Erreur : Fichier invalide. Doit être un fichier .quiz.';

  @override
  String errorLoadingFile(String error) {
    return 'Erreur lors du chargement du fichier Quiz : $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Erreur lors de l\'exportation du fichier : $error';
  }

  @override
  String get cancelButton => 'Annuler';

  @override
  String get saveButton => 'Sauvegarder';

  @override
  String get confirmDeleteTitle => 'Confirmer la suppression';

  @override
  String confirmDeleteMessage(String processName) {
    return 'Êtes-vous sûr de vouloir supprimer le processus `$processName` ?';
  }

  @override
  String get deleteButton => 'Supprimer';

  @override
  String get confirmExitTitle => 'Confirmer la sortie';

  @override
  String get confirmExitMessage =>
      'Il y a des modifications non enregistrées. Voulez-vous quitter et ignorer les modifications ?';

  @override
  String get exitButton => 'Quitter sans enregistrer';

  @override
  String get saveDialogTitle => 'Veuillez sélectionner un fichier de sortie :';

  @override
  String get createQuizFileTitle => 'Créer un fichier Quiz';

  @override
  String get editQuizFileTitle => 'Modifier le fichier quiz';

  @override
  String get fileNameLabel => 'Nom du fichier';

  @override
  String get fileDescriptionLabel => 'Description du fichier';

  @override
  String get createButton => 'Créer';

  @override
  String get fileNameRequiredError => 'Le nom du fichier est requis.';

  @override
  String get fileDescriptionRequiredError =>
      'La description du fichier est requise.';

  @override
  String get versionLabel => 'Version';

  @override
  String get authorLabel => 'Auteur';

  @override
  String get authorRequiredError => 'L\'auteur est requis.';

  @override
  String get requiredFieldsError =>
      'Tous les champs requis doivent être complétés.';

  @override
  String get requestFileNameTitle => 'Entrez le nom du fichier Quiz';

  @override
  String get fileNameHint => 'Nom du fichier';

  @override
  String get emptyFileNameMessage => 'Le nom du fichier ne peut pas être vide.';

  @override
  String get acceptButton => 'Accepter';

  @override
  String get saveTooltip => 'Sauvegarder le fichier';

  @override
  String get saveDisabledTooltip => 'Aucun changement à sauvegarder';

  @override
  String get executeTooltip => 'Exécuter l\'examen';

  @override
  String get addTooltip => 'Ajouter une nouvelle question';

  @override
  String get backSemanticLabel => 'Bouton retour';

  @override
  String get createFileTooltip => 'Créer un nouveau fichier Quiz';

  @override
  String get loadFileTooltip => 'Charger un fichier Quiz existant';

  @override
  String questionNumber(int number) {
    return 'Question $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return 'Question $current sur $total';
  }

  @override
  String get previous => 'Précédent';

  @override
  String get skip => 'Passer';

  @override
  String get questionsOverview => 'Questions Map';

  @override
  String get next => 'Suivant';

  @override
  String get finish => 'Terminer';

  @override
  String get finishQuiz => 'Terminer le quiz';

  @override
  String get finishQuizConfirmation =>
      'Êtes-vous sûr de vouloir terminer le quiz ? Vous ne pourrez plus modifier vos réponses après.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount questions sans réponse',
      one: '1 question sans réponse',
    );
    return 'Vous avez $_temp0. Êtes-vous sûr de vouloir terminer le quiz ?';
  }

  @override
  String get resolveUnansweredQuestions => 'Résoudre les questions';

  @override
  String get abandonQuiz => 'Abandonner le quiz';

  @override
  String get abandonQuizConfirmation =>
      'Êtes-vous sûr de vouloir abandonner le quiz ? Tous les progrès seront perdus.';

  @override
  String get abandon => 'Abandonner';

  @override
  String get quizCompleted => 'Quiz Terminé !';

  @override
  String score(String score) {
    return 'Score : $score%';
  }

  @override
  String correctAnswers(String correct, int total) {
    return '$correct de $total réponses correctes';
  }

  @override
  String get retry => 'Répéter';

  @override
  String get goBack => 'Terminer';

  @override
  String get retryFailedQuestions => 'Reprendre échecs';

  @override
  String question(String question) {
    return 'Question : $question';
  }

  @override
  String get selectQuestionCountTitle => 'Sélectionner le nombre de questions';

  @override
  String get selectQuestionCountMessage =>
      'Combien de questions aimeriez-vous répondre dans ce quiz ?';

  @override
  String allQuestions(int count) {
    return 'Toutes les questions ($count)';
  }

  @override
  String get startQuiz => 'Commencer le quiz';

  @override
  String get maxIncorrectAnswersLabel => 'Limiter le nombre d\'erreurs';

  @override
  String get maxIncorrectAnswersDescription =>
      'Examen de réussite/échec. Il n\'y a pas de note numérique.';

  @override
  String get maxIncorrectAnswersOffDescription =>
      'L\'examen a une note numérique de 0 à 100.';

  @override
  String get maxIncorrectAnswersLimitLabel =>
      'Nombre d\'erreurs maximum autorisé';

  @override
  String get examFailedStatus => 'Examen NON ADMIS';

  @override
  String get examPassedStatus => 'Examen ADMIS';

  @override
  String get quizFailedLimitReached =>
      'Examen Terminé : Le nombre maximal d\'erreurs a été atteint';

  @override
  String get errorInvalidNumber => 'Veuillez entrer un nombre valide';

  @override
  String get errorNumberMustBePositive => 'Le nombre doit être supérieur à 0';

  @override
  String get customNumberLabel => 'Ou entrez un nombre personnalisé :';

  @override
  String get numberInputLabel => 'Nombre de questions';

  @override
  String get questionOrderConfigTitle =>
      'Configuration de l\'ordre des questions';

  @override
  String get questionOrderConfigDescription =>
      'Sélectionnez l\'ordre dans lequel vous voulez que les questions apparaissent pendant l\'examen :';

  @override
  String get questionOrderAscending => 'Ordre croissant';

  @override
  String get questionOrderAscendingDesc =>
      'Les questions apparaîtront dans l\'ordre de 1 à la fin';

  @override
  String get questionOrderDescending => 'Ordre décroissant';

  @override
  String get questionOrderDescendingDesc =>
      'Les questions apparaîtront de la fin à 1';

  @override
  String get questionOrderRandom => 'Ordre aléatoire des questions';

  @override
  String get questionOrderRandomDesc =>
      'Les questions apparaîtront dans un ordre aléatoire';

  @override
  String get questionOrderConfigTooltip =>
      'Configuration de l\'ordre des questions';

  @override
  String get reorderQuestionsTooltip => 'Réorganiser les questions';

  @override
  String get save => 'Sauvegarder';

  @override
  String get examConfigurationTitle => 'Configuration de l\'examen';

  @override
  String get examTimeLimitTitle => 'Limite de temps d\'examen';

  @override
  String get examTimeLimitDescription =>
      'Définissez une limite de temps pour l\'examen. Un compte à rebours sera affiché pendant le quiz.';

  @override
  String get examTimeLimitOffDescription =>
      'Il n\'y a pas de limite de temps pour cet examen.';

  @override
  String get enableTimeLimit => 'Activer la limite de temps';

  @override
  String get timeLimitMinutes => 'Limite de temps (minutes)';

  @override
  String get examTimeExpiredTitle => 'Temps écoulé !';

  @override
  String get examTimeExpiredMessage =>
      'Le temps d\'examen a expiré. Vos réponses ont été automatiquement soumises.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Choix multiple';

  @override
  String get questionTypeSingleChoice => 'Choix unique';

  @override
  String get questionTypeTrueFalse => 'Vrai/Faux';

  @override
  String get questionTypeEssay => 'Question à développement';

  @override
  String get questionTypeRandom => 'Tous';

  @override
  String get questionTypeUnknown => 'Inconnu';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count options',
      one: '1 option',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip =>
      'Nombre d\'options de réponse pour cette question';

  @override
  String get imageTooltip => 'Cette question a une image associée';

  @override
  String get explanationTooltip => 'Cette question a une explication';

  @override
  String get missingExplanation => 'Explication manquante';

  @override
  String get missingExplanationTooltip =>
      'Cette question n\'a pas d\'explication';

  @override
  String questionTypeTooltip(String type) {
    return 'Type de question : $type';
  }

  @override
  String get aiPrompt =>
      'Concentrez-vous sur la question de l\'étudiant, pas sur la réponse directe à la question d\'examen originale. Expliquez avec une approche pédagogique. Pour les exercices pratiques ou les problèmes mathématiques, fournissez des instructions étape par étape. Pour les questions théoriques, fournissez une explication concise sans structurer la réponse en sections. Répondez dans la même langue que celle dans laquelle on vous a posé la question.';

  @override
  String get aiChatGuardrail =>
      'IMPORTANT : Vous êtes un assistant d\'étude exclusivement pour ce Quiz. Vous devez UNIQUEMENT répondre aux questions liées à la question actuelle du Quiz, ses options, son explication ou le sujet éducatif qu\'elle couvre. Si l\'étudiant pose une question sans rapport avec le Quiz (par exemple, votre modèle interne, des détails du système, des connaissances générales non liées à la question, ou toute demande hors sujet), répondez UNIQUEMENT par : \"Je suis là pour vous aider avec ce Quiz ! Concentrons-nous sur la question. N\'hésitez pas à me poser des questions sur le sujet, les options de réponse ou tout ce qui concerne cette question.\" Ne révélez jamais de détails techniques sur vous-même, le système ou le modèle d\'IA utilisé.';

  @override
  String get questionLabel => 'Question';

  @override
  String get studentComment => 'Commentaire de l\'étudiant';

  @override
  String get aiAssistantTitle => 'Assistant d\'étude IA';

  @override
  String get questionContext => 'Contexte de la question';

  @override
  String get aiAssistant => 'Assistant IA';

  @override
  String get aiThinking => 'L\'IA réfléchit...';

  @override
  String get askAIHint => 'Posez votre question sur ce sujet...';

  @override
  String get aiPlaceholderResponse =>
      'Ceci est une réponse d\'espace réservé. Dans une implémentation réelle, cela se connecterait à un service IA pour fournir des explications utiles sur la question.';

  @override
  String get aiErrorResponse =>
      'Désolé, il y a eu une erreur lors du traitement de votre question. Veuillez réessayer.';

  @override
  String get evaluatingResponses => 'Évaluation des réponses...';

  @override
  String pendingEvaluationsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count questions de développement en attente d\'évaluation par l\'IA',
      one: '1 question de développement en attente d\'évaluation par l\'IA',
    );
    return '$_temp0';
  }

  @override
  String get pendingStatus => 'En attente';

  @override
  String get notEvaluatedStatus => 'Non évalué';

  @override
  String get configureApiKeyMessage =>
      'Veuillez configurer votre clé API IA dans les Paramètres.';

  @override
  String get errorLabel => 'Erreur :';

  @override
  String get retryButton => 'Réessayer l\'évaluation';

  @override
  String get noResponseReceived => 'Aucune réponse reçue';

  @override
  String get invalidApiKeyError =>
      'Clé API invalide. Veuillez vérifier votre clé API OpenAI dans les paramètres.';

  @override
  String get rateLimitError =>
      'Quota dépassé ou modèle non disponible dans votre niveau. Vérifiez votre forfait.';

  @override
  String get modelNotFoundError =>
      'Modèle non trouvé. Veuillez vérifier votre accès API.';

  @override
  String get unknownError => 'Erreur inconnue';

  @override
  String get networkErrorOpenAI =>
      'Erreur réseau : Impossible de se connecter à OpenAI. Veuillez vérifier votre connexion internet.';

  @override
  String get networkErrorGemini =>
      'Erreur réseau : Impossible de se connecter à Gemini. Veuillez vérifier votre connexion internet.';

  @override
  String get openaiApiKeyNotConfigured => 'Clé API OpenAI non configurée';

  @override
  String get geminiApiKeyNotConfigured => 'Clé API Gemini non configurée';

  @override
  String get geminiApiKeyLabel => 'Clé API Gemini';

  @override
  String get geminiApiKeyHint => 'Entrez votre clé API Gemini';

  @override
  String get geminiApiKeyDescription =>
      'Requis pour la fonctionnalité IA Gemini. Votre clé est stockée en sécurité.';

  @override
  String get getGeminiApiKeyTooltip =>
      'Obtenir la clé API depuis Google AI Studio';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'L\'Assistant d\'Étude IA nécessite au moins une clé API (Gemini ou OpenAI). Veuillez saisir une clé API ou désactiver l\'Assistant IA.';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get aiButtonTooltip => 'Assistant d\'Étude IA';

  @override
  String get aiButtonText => 'IA';

  @override
  String get aiAssistantSettingsTitle => 'Assistant d\'Étude IA (Aperçu)';

  @override
  String get aiAssistantSettingsDescription =>
      'Activer ou désactiver l\'assistant d\'étude IA pour les questions';

  @override
  String get aiDefaultModelTitle => 'Modèle IA par défaut';

  @override
  String get aiDefaultModelDescription =>
      'Sélectionnez le service et modèle IA par défaut pour la génération de questions';

  @override
  String get openaiApiKeyLabel => 'Clé API OpenAI';

  @override
  String get openaiApiKeyHint => 'Entrez votre clé API OpenAI (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Requis pour l\'intégration avec OpenAI. Votre clé OpenAI est stockée en sécurité.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'L\'Assistant d\'Étude IA nécessite une clé API OpenAI. Veuillez entrer votre clé API ou désactiver l\'Assistant IA.';

  @override
  String get getApiKeyTooltip => 'Obtenir la clé API depuis OpenAI';

  @override
  String get deleteAction => 'Supprimer';

  @override
  String get explanationLabel => 'Explication (optionnelle)';

  @override
  String get explanationHint =>
      'Entrez une explication pour la ou les réponses correctes';

  @override
  String get explanationTitle => 'Explication';

  @override
  String get imageLabel => 'Image';

  @override
  String get changeImage => 'Changer l\'image';

  @override
  String get removeImage => 'Supprimer l\'image';

  @override
  String get addImageTap => 'Appuyez pour ajouter une image';

  @override
  String get imageFormats => 'Formats : JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Erreur de chargement de l\'image';

  @override
  String imagePickError(String error) {
    return 'Erreur de chargement de l\'image : $error';
  }

  @override
  String get tapToZoom => 'Appuyez pour zoomer';

  @override
  String get trueLabel => 'Vrai';

  @override
  String get falseLabel => 'Faux';

  @override
  String get addQuestion => 'Ajouter une question';

  @override
  String get editQuestion => 'Modifier la question';

  @override
  String get questionText => 'Texte de la question';

  @override
  String get questionType => 'Type de question';

  @override
  String get addOption => 'Ajouter une option';

  @override
  String get optionsLabel => 'Options';

  @override
  String get optionLabel => 'Option';

  @override
  String get questionTextRequired => 'Le texte de la question est requis';

  @override
  String get atLeastOneOptionRequired =>
      'Au moins une option doit avoir du texte';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'Au moins une réponse correcte doit être sélectionnée';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'Une seule réponse correcte est autorisée pour ce type de question';

  @override
  String get removeOption => 'Supprimer l\'option';

  @override
  String get selectCorrectAnswer => 'Sélectionner la réponse correcte';

  @override
  String get selectCorrectAnswers => 'Sélectionner les réponses correctes';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'Les options $optionNumbers sont vides. Veuillez leur ajouter du texte ou les supprimer.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'L\'option $optionNumber est vide. Veuillez lui ajouter du texte ou la supprimer.';
  }

  @override
  String get optionEmptyError => 'Cette option ne peut pas être vide';

  @override
  String get hasImage => 'Image';

  @override
  String get hasExplanation => 'Explication';

  @override
  String errorLoadingSettings(String error) {
    return 'Erreur de chargement des paramètres : $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'Impossible d\'ouvrir $url';
  }

  @override
  String get loadingAiServices => 'Chargement des services IA...';

  @override
  String usingAiService(String serviceName) {
    return 'Utilisation : $serviceName';
  }

  @override
  String get aiServiceLabel => 'Service IA :';

  @override
  String get aiModelLabel => 'Modèle :';

  @override
  String get importQuestionsTitle => 'Importer des Questions';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return 'Trouvé $count questions dans \"$fileName\". Où souhaitez-vous les importer ?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'Où souhaitez-vous ajouter ces questions ?';

  @override
  String get importAtBeginning => 'Au Début';

  @override
  String get importAtEnd => 'À la Fin';

  @override
  String questionsImportedSuccess(int count) {
    return 'Importation réussie de $count questions';
  }

  @override
  String get importQuestionsTooltip =>
      'Importer des questions depuis un autre fichier quiz';

  @override
  String get dragDropHintText =>
      'Vous pouvez aussi faire glisser et déposer des fichiers .quiz ici pour importer des questions';

  @override
  String get randomizeQuestionsTitle => 'Randomiser les Questions';

  @override
  String get randomizeQuestionsDescription =>
      'Mélanger l\'ordre des questions pendant l\'exécution du quiz';

  @override
  String get randomizeQuestionsOffDescription =>
      'Les questions apparaîtront dans leur ordre d\'origine';

  @override
  String get randomizeAnswersTitle => 'Ordre aléatoire des réponses';

  @override
  String get randomizeAnswersDescription =>
      'Mélanger l\'ordre des options de réponse pendant l\'exécution du quiz';

  @override
  String get randomizeAnswersOffDescription =>
      'Les options de réponse apparaîtront dans leur ordre original';

  @override
  String get showCorrectAnswerCountTitle =>
      'Afficher le Nombre de Réponses Correctes';

  @override
  String get showCorrectAnswerCountDescription =>
      'Afficher le nombre de réponses correctes dans les questions à choix multiple';

  @override
  String get showCorrectAnswerCountOffDescription =>
      'Le nombre de réponses correctes ne sera pas affiché pour les questions à choix multiples';

  @override
  String correctAnswersCount(int count) {
    return 'Sélectionnez $count réponses correctes';
  }

  @override
  String get correctSelectedLabel => 'Correct';

  @override
  String get correctMissedLabel => 'Correct';

  @override
  String get incorrectSelectedLabel => 'Incorrect';

  @override
  String get aiGenerateDialogTitle => 'Générer des Questions avec l\'IA';

  @override
  String get aiQuestionCountLabel => 'Nombre de Questions (Optionnel)';

  @override
  String get aiQuestionCountHint => 'Laisser vide pour laisser l\'IA décider';

  @override
  String get aiQuestionCountValidation => 'Doit être un nombre entre 1 et 50';

  @override
  String get aiQuestionTypeLabel => 'Type de Question';

  @override
  String get aiQuestionTypeRandom => 'Aléatoire (Mixte)';

  @override
  String get aiLanguageLabel => 'Langue des Questions';

  @override
  String get aiContentLabel => 'Contenu pour générer des questions';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max mots';
  }

  @override
  String get aiContentHint =>
      'Entrez le texte, sujet, ou contenu à partir duquel vous voulez générer des questions...';

  @override
  String get aiContentHelperText =>
      'L\'IA créera des questions basées sur ce contenu';

  @override
  String aiWordLimitError(int max) {
    return 'Vous avez dépassé la limite de $max mots';
  }

  @override
  String get aiContentRequiredError =>
      'Vous devez fournir du contenu pour générer des questions';

  @override
  String aiContentLimitError(int max) {
    return 'Le contenu dépasse la limite de $max mots';
  }

  @override
  String get aiMinWordsError =>
      'Fournissez au moins 10 mots pour générer des questions de qualité';

  @override
  String get aiInfoTitle => 'Information';

  @override
  String get aiInfoDescription =>
      '• L\'IA analysera le contenu et générera des questions pertinentes\n• Si tu écris moins de 10 mots, tu entreras en mode Thème où des questions sur ces sujets spécifiques seront posées\n• Avec plus de 10 mots, tu entreras en mode Contenu qui posera des questions sur ce même texte (plus de mots = plus de précision)\n• Tu peux inclure du texte, des définitions, des explications, ou tout matériel éducatif\n• Les questions incluront des options de réponse et des explications\n• Le processus peut prendre quelques secondes';

  @override
  String get aiGenerateButton => 'Générer des Questions';

  @override
  String get aiEnterContentTitle => 'Saisir le contenu';

  @override
  String get aiEnterContentDescription =>
      'Entrez le sujet ou collez le contenu pour générer des questions';

  @override
  String get aiContentFieldHint =>
      'Entrez un sujet comme « Histoire de la Seconde Guerre mondiale » ou collez du texte ici...';

  @override
  String get aiAttachFileHint => 'Joindre un fichier (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Déposez le fichier ici';

  @override
  String get dropImageHere => 'Déposez l\'image ici';

  @override
  String get aiNumberQuestionsLabel => 'Nombre de questions';

  @override
  String get backButton => 'Retour';

  @override
  String get generateButton => 'Générer';

  @override
  String aiTopicModeCount(int count) {
    return 'Mode Sujet ($count mots)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Mode Texte ($count mots)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Mode de Contenu';

  @override
  String get aiGenerationCategoryTheory => 'Théorie';

  @override
  String get aiGenerationCategoryExercises => 'Exercices';

  @override
  String get aiGenerationCategoryBoth => 'Mixte';

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
  String get aiServicesLoading => 'Chargement des services IA...';

  @override
  String get aiServicesNotConfigured => 'Aucun service IA configuré';

  @override
  String get aiGeneratedQuestions => 'Généré par IA';

  @override
  String get aiApiKeyRequired =>
      'Veuillez configurer au moins une clé API IA dans les Paramètres pour utiliser la génération IA.';

  @override
  String get aiGenerationFailed =>
      'Impossible de générer des questions. Essayez avec un contenu différent.';

  @override
  String get aiGenerationErrorTitle => 'Erreur de génération de questions';

  @override
  String get noQuestionsInFile =>
      'Aucune question trouvée dans le fichier importé';

  @override
  String get couldNotAccessFile =>
      'Impossible d\'accéder au fichier sélectionné';

  @override
  String get defaultOutputFileName => 'fichier-sortie.quiz';

  @override
  String get generateQuestionsWithAI => 'Générer des questions avec l\'IA';

  @override
  String get addQuestionsWithAI => 'Ajouter des questions avec l\'IA';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Limite : $words mots ou $chars caractères';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Limite : $words mots';
  }

  @override
  String get aiAssistantDisabled => 'Assistant IA Désactivé';

  @override
  String get enableAiAssistant =>
      'L\'assistant IA est désactivé. Veuillez l\'activer dans les paramètres pour utiliser les fonctionnalités IA.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Minimum $minWords mots requis';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount mots ✓ Prêt à générer';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords mots ($moreNeeded de plus nécessaires)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Minimum $minWords mots requis ($moreNeeded de plus nécessaires)';
  }

  @override
  String get enableQuestion => 'Activer la question';

  @override
  String get disableQuestion => 'Désactiver la question';

  @override
  String get questionDisabled => 'Désactivée';

  @override
  String get noEnabledQuestionsError =>
      'Aucune question activée disponible pour lancer le quiz';

  @override
  String get evaluateWithAI => 'Évaluer avec l\'IA';

  @override
  String get aiEvaluation => 'Évaluation IA';

  @override
  String aiEvaluationError(String error) {
    return 'Erreur lors de l\'évaluation de la réponse : $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'Vous êtes un professeur expert évaluant la réponse d\'un étudiant à une question de dissertation. Votre tâche est de fournir une évaluation détaillée et constructive. Répondez dans la même langue que la réponse de l\'étudiant.';

  @override
  String get aiEvaluationPromptQuestion => 'QUESTION:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'RÉPONSE DE L\'ÉTUDIANT:';

  @override
  String get aiEvaluationPromptCriteria =>
      'CRITÈRES D\'ÉVALUATION (basés sur l\'explication du professeur):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'INSTRUCTIONS SPÉCIFIQUES:\n- Évaluez dans quelle mesure la réponse de l\'étudiant s\'aligne sur les critères établis\n- Analysez le degré de synthèse et la structure de la réponse\n- Identifiez si quelque chose d\'important a été omis selon les critères\n- Considérez la profondeur et la précision de l\'analyse';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'INSTRUCTIONS GÉNÉRALES:\n- Comme il n\'y a pas de critères spécifiques établis, évaluez la réponse selon les standards académiques généraux\n- Considérez la clarté, la cohérence et la structure de la réponse\n- Évaluez si la réponse démontre une compréhension du sujet\n- Analysez la profondeur de l\'analyse et la qualité des arguments';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'FORMAT DE RÉPONSE:\n1. NOTE: [X/10] - Justifiez brièvement la note\n2. POINTS FORTS: Mentionnez les aspects positifs de la réponse\n3. DOMAINES D\'AMÉLIORATION: Signalez les aspects qui pourraient être améliorés\n4. COMMENTAIRES SPÉCIFIQUES: Fournissez des commentaires détaillés et constructifs\n5. SUGGESTIONS: Offrez des recommandations spécifiques pour l\'amélioration\n\nSoyez constructif, spécifique et éducatif dans votre évaluation. L\'objectif est d\'aider l\'étudiant à apprendre et à s\'améliorer. Adressez-vous à lui à la deuxième personne et utilisez un ton professionnel et amical.';

  @override
  String get aiModeTopicTitle => 'Mode Sujet';

  @override
  String get aiModeTopicDescription => 'Exploration créative du sujet';

  @override
  String get aiModeContentTitle => 'Mode Contenu';

  @override
  String get aiModeContentDescription =>
      'Questions précises basées sur votre saisie';

  @override
  String aiWordCountIndicator(int count) {
    return '$count mots';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Précision: $level';
  }

  @override
  String get aiPrecisionLow => 'Faible';

  @override
  String get aiPrecisionMedium => 'Moyenne';

  @override
  String get aiPrecisionHigh => 'Élevée';

  @override
  String get aiMoreWordsMorePrecision => 'Plus de mots = plus de précision';

  @override
  String get aiKeepDraftTitle => 'Conserver le brouillon IA';

  @override
  String get aiKeepDraftDescription =>
      'Enregistrer automatiquement le texte saisi dans la boîte de dialogue de génération IA pour qu\'il ne soit pas perdu si la boîte de dialogue est fermée.';

  @override
  String get aiAttachFile => 'Joindre un fichier';

  @override
  String get aiRemoveFile => 'Supprimer le fichier';

  @override
  String get aiFileMode => 'Mode fichier';

  @override
  String get aiFileModeDescription =>
      'Les questions seront générées à partir du fichier joint';

  @override
  String get aiCommentsLabel => 'Commentaires (Optionnel)';

  @override
  String get aiCommentsHint =>
      'Ajouter des instructions ou des commentaires sur le fichier joint...';

  @override
  String get aiCommentsHelperText =>
      'Ajouter éventuellement des instructions sur la façon de générer des questions à partir du fichier';

  @override
  String get aiFilePickerError =>
      'Impossible de charger le fichier sélectionné';

  @override
  String get studyModeLabel => 'Mode Étude';

  @override
  String get studyModeDescription =>
      'Assistance par IA disponible. Retour instantané après chaque réponse, sans limite de temps ni pénalité.';

  @override
  String get examModeLabel => 'Mode Examen';

  @override
  String get examModeDescription =>
      'Pas d\'assistance par IA. Des limites de temps et des pénalités pour les réponses incorrectes peuvent s\'appliquer.';

  @override
  String get checkAnswer => 'Vérifier';

  @override
  String get quizModeTitle => 'Mode Quiz';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get askAiAssistant => 'Demander à l\'IA';

  @override
  String get askAiAboutQuestion => 'Demander à l\'IA sur cette question';

  @override
  String get aiHelpWithQuestion => 'Aide-moi à comprendre cette question';

  @override
  String get edit => 'Modifier';

  @override
  String get enable => 'Activer';

  @override
  String get disable => 'Désactiver';

  @override
  String get quizPreviewTitle => 'Aperçu du Quiz';

  @override
  String get select => 'Sélectionner';

  @override
  String get done => 'Terminé';

  @override
  String get importButton => 'Importer';

  @override
  String get reorderButton => 'Réorganiser';

  @override
  String get startQuizButton => 'Commencer le Quiz';

  @override
  String get deleteConfirmation =>
      'Êtes-vous sûr de vouloir supprimer ce quiz ?';

  @override
  String get saveSuccess => 'Fichier enregistré avec succès';

  @override
  String get errorSavingFile => 'Erreur lors de l\'enregistrement du fichier';

  @override
  String get deleteSingleQuestionConfirmation =>
      'Êtes-vous sûr de vouloir supprimer cette question ?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'Êtes-vous sûr de vouloir supprimer $count questions ?';
  }

  @override
  String get keepPracticing =>
      'Continuez à vous entraîner pour vous améliorer !';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get review => 'Réviser';

  @override
  String get home => 'Accueil';

  @override
  String get allLabel => 'Toutes';

  @override
  String get subtractPointsLabel =>
      'Retirer des points pour une mauvaise réponse';

  @override
  String get subtractPointsDescription =>
      'Soustrait des points pour chaque réponse incorrecte.';

  @override
  String get subtractPointsOffDescription =>
      'Les mauvaises réponses ne déduisent pas de points.';

  @override
  String get penaltyAmountLabel => 'Montant de la pénalité';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount pts / erreur';
  }

  @override
  String get allQuestionsLabel => 'Toutes les questions';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Commencer avec $count sélectionnées';
  }

  @override
  String get advancedSettingsTitle => 'Paramètres avancés (Debug)';

  @override
  String get appLanguageLabel => 'Langue de l\'application';

  @override
  String get appLanguageDescription =>
      'Remplacer la langue de l\'application pour les tests';

  @override
  String get pasteFromClipboard => 'Coller depuis le presse-papiers';

  @override
  String get pasteImage => 'Coller';

  @override
  String get clipboardNoImage => 'Aucune image trouvée dans le presse-papiers';

  @override
  String get close => 'Fermer';

  @override
  String get scoringAndLimitsTitle => 'Score et limites';

  @override
  String get congratulations => '🎉 Félicitations ! 🎉';

  @override
  String get validationMin1Error => 'Minimum 1 minute';

  @override
  String remainingTimeWithDays(
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${days}j $hours:$minutes:$seconds';
  }

  @override
  String remainingTimeWithWeeks(
    String weeks,
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${weeks}s ${days}j $hours:$minutes:$seconds';
  }

  @override
  String get validationMax30DaysError => 'Maximum 30 jours';

  @override
  String get validationMin0GenericError => 'Minimum 0';

  @override
  String get errorStatus => 'Erreur';

  @override
  String get featureComingSoon =>
      'Bientôt disponible ! Restez à l\'écoute des nouveautés.';

  @override
  String get showOnboarding => 'Afficher l\'accueil';

  @override
  String get showOnboardingDescription =>
      'Voir à nouveau le tutoriel de bienvenue';

  @override
  String get onboardingBack => 'Retour';

  @override
  String get onboardingGetStarted => 'Commencer';

  @override
  String get onboardingWelcomeTitle => 'Bienvenue sur QuizLab AI';

  @override
  String get onboardingWelcomeDescription =>
      'Votre compagnon de quiz interactif avec des fonctionnalités alimentées par l\'IA, des questions personnalisables et un score en temps réel.';

  @override
  String get onboardingWelcomeSubtitle => 'Votre compagnon de quiz interactif';

  @override
  String get onboardingStartQuizTitle => 'Démarrer un Quiz';

  @override
  String get onboardingStartQuizDescription =>
      'Chargez un fichier .quiz existant ou créez-en un nouveau. Glissez et déposez des fichiers directement ou utilisez le sélecteur de fichiers.';

  @override
  String get onboardingStartQuizSubtitle => 'Charger, créer et jouer';

  @override
  String get onboardingCreateQuestionsTitle => 'Créer des Questions';

  @override
  String get onboardingCreateQuestionsDescription =>
      'Construisez des quiz avec plusieurs types de questions. Personnalisez chaque question avec des options, des réponses correctes et des explications.';

  @override
  String get onboardingCreateQuestionsSubtitle => 'Concevez vos propres quiz';

  @override
  String get onboardingAiFeaturesTitle => 'Fonctionnalités IA';

  @override
  String get onboardingAiFeaturesDescription =>
      'Générez des questions automatiquement avec l\'IA, obtenez de l\'aide à l\'étude en temps réel et apprenez plus intelligemment avec le tutorat intelligent.';

  @override
  String get onboardingAiFeaturesSubtitle => 'Propulsé par l\'IA';

  @override
  String get onboardingFeatureAiTitle => 'Génération de questions par l\'IA';

  @override
  String get onboardingFeatureAiDescription =>
      'Générez des quiz à partir de n\'importe quel texte avec GPT ou Gemini';

  @override
  String get onboardingFeatureTypesTitle => 'Plusieurs types de questions';

  @override
  String get onboardingFeatureTypesDescription =>
      'Choix unique, choix multiple, vrai/faux et essai';

  @override
  String get onboardingFeatureLanguagesTitle => '13 langues supportées';

  @override
  String get onboardingFeatureLanguagesDescription =>
      'Créez et passez des quiz dans plusieurs langues';

  @override
  String get onboardingStepCreateTitle => 'Créer Quiz';

  @override
  String get onboardingStepCreateDescription =>
      'Partez de zéro avec vos propres questions';

  @override
  String get onboardingStepLoadTitle => 'Charger Fichier';

  @override
  String get onboardingStepLoadDescription =>
      'Importez un fichier .quiz depuis votre appareil';

  @override
  String get onboardingStepTakeTitle => 'Répondre au Quiz';

  @override
  String get onboardingStepTakeDescription =>
      'Répondez aux questions et obtenez votre score en temps réel';

  @override
  String get onboardingAiAutoGenerateTitle => 'Auto-génération de questions';

  @override
  String get onboardingAiAutoGenerateDescription =>
      'Depuis n\'importe quel texte avec GPT ou Gemini';

  @override
  String get onboardingAiStudyAssistantTitle => 'Assistant d\'étude IA';

  @override
  String get onboardingAiStudyAssistantDescription =>
      'Obtenez des explications pendant votre apprentissage';

  @override
  String get onboardingAiMultiLanguageTitle => 'Support multi-langue';

  @override
  String get onboardingAiMultiLanguageDescription =>
      'Générez dans 13 langues différentes';
}
