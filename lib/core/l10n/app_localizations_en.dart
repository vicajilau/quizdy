// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get abortQuizTitle => 'Abort Quiz?';

  @override
  String get abortQuizMessage =>
      'Opening a new file will stop the current quiz.';

  @override
  String get stopAndOpenButton => 'Stop & Open';

  @override
  String get titleAppBar => 'Quiz - Exam Simulator';

  @override
  String get create => 'Create';

  @override
  String get preview => 'Preview';

  @override
  String get previewLabel => 'Preview:';

  @override
  String get emptyPlaceholder => '(empty)';

  @override
  String get latexSyntaxTitle => 'LaTeX Syntax:';

  @override
  String get latexSyntaxHelp =>
      'Inline math: Use \$...\$ for LaTeX expressions\nExample: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'Preview LaTeX rendering';

  @override
  String get okButton => 'OK';

  @override
  String get load => 'Load';

  @override
  String fileLoaded(String filePath) {
    return 'File loaded: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'File saved: $filePath';
  }

  @override
  String get dropFileHere => 'Click logo or drag a .quiz file to the screen';

  @override
  String get errorOpeningFile => 'Error opening file';

  @override
  String get replaceFileTitle => 'Load new Quiz';

  @override
  String get replaceFileMessage =>
      'A Quiz is already loaded. Do you want to replace it with the new file?';

  @override
  String get replaceButton => 'Load';

  @override
  String get clickOrDragFile =>
      'Click to load or drag a .quiz file to the screen';

  @override
  String get errorInvalidFile => 'Error: Invalid file. Must be a .quiz file.';

  @override
  String errorLoadingFile(String error) {
    return 'Error loading the Quiz file: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Error exporting the file: $error';
  }

  @override
  String get cancelButton => 'Cancel';

  @override
  String get saveButton => 'Save';

  @override
  String get confirmDeleteTitle => 'Confirm Deletion';

  @override
  String confirmDeleteMessage(String processName) {
    return 'Are you sure you want to delete `$processName` process?';
  }

  @override
  String get deleteButton => 'Delete';

  @override
  String get confirmExitTitle => 'Confirm Exit';

  @override
  String get confirmExitMessage =>
      'There are unsaved changes. Do you want to leave and discard changes?';

  @override
  String get exitButton => 'Exit without saving';

  @override
  String get saveDialogTitle => 'Please select an output file:';

  @override
  String get createQuizFileTitle => 'Create Quiz File';

  @override
  String get editQuizFileTitle => 'Edit Quiz File';

  @override
  String get fileNameLabel => 'File Name';

  @override
  String get fileDescriptionLabel => 'File Description';

  @override
  String get createButton => 'Create';

  @override
  String get fileNameRequiredError => 'The file name is required.';

  @override
  String get fileDescriptionRequiredError =>
      'The file description is required.';

  @override
  String get versionLabel => 'Version';

  @override
  String get authorLabel => 'Author';

  @override
  String get authorRequiredError => 'The author is required.';

  @override
  String get requiredFieldsError => 'All required fields must be completed.';

  @override
  String get requestFileNameTitle => 'Enter the Quiz file name';

  @override
  String get fileNameHint => 'File name';

  @override
  String get emptyFileNameMessage => 'The file name cannot be empty.';

  @override
  String get acceptButton => 'Accept';

  @override
  String get saveTooltip => 'Save the file';

  @override
  String get saveDisabledTooltip => 'No changes to save';

  @override
  String get executeTooltip => 'Execute the exam';

  @override
  String get addTooltip => 'Add a new question';

  @override
  String get backSemanticLabel => 'Back button';

  @override
  String get createFileTooltip => 'Create a new Quiz file';

  @override
  String get loadFileTooltip => 'Load an existing Quiz file';

  @override
  String questionNumber(int number) {
    return 'Question $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get previous => 'Previous';

  @override
  String get skip => 'Skip';

  @override
  String get questionsOverview => 'Questions Map';

  @override
  String get next => 'Next';

  @override
  String get finish => 'Finish';

  @override
  String get finishQuiz => 'Finish Quiz';

  @override
  String get finishQuizConfirmation =>
      'Are you sure you want to finish the quiz? You won\'t be able to change your answers afterwards.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount unanswered questions',
      one: '1 unanswered question',
    );
    return 'You have $_temp0. Are you sure you want to finish?';
  }

  @override
  String get resolveUnansweredQuestions => 'Resolve questions';

  @override
  String get abandonQuiz => 'Abandon Quiz';

  @override
  String get abandonQuizConfirmation =>
      'Are you sure you want to abandon the quiz? All progress will be lost.';

  @override
  String get abandon => 'Abandon';

  @override
  String get quizCompleted => 'Quiz Completed!';

  @override
  String score(String score) {
    return 'Score: $score%';
  }

  @override
  String correctAnswers(int correct, int total) {
    return '$correct of $total correct answers';
  }

  @override
  String get retry => 'Repeat';

  @override
  String get goBack => 'Finish';

  @override
  String get retryFailedQuestions => 'Retry Failed';

  @override
  String question(String question) {
    return 'Question: $question';
  }

  @override
  String get selectQuestionCountTitle => 'Select Number of Questions';

  @override
  String get selectQuestionCountMessage =>
      'How many questions would you like to answer in this quiz?';

  @override
  String allQuestions(int count) {
    return 'All questions ($count)';
  }

  @override
  String get startQuiz => 'Start Quiz';

  @override
  String get maxIncorrectAnswersLabel => 'Limit incorrect answers';

  @override
  String get maxIncorrectAnswersDescription =>
      'The quiz will end immediately if you reach this limit.';

  @override
  String get maxIncorrectAnswersLimitLabel => 'Maximum allowed errors';

  @override
  String get quizFailedLimitReached => 'Quiz Stopped: Error Limit Reached';

  @override
  String get errorInvalidNumber => 'Please enter a valid number';

  @override
  String get errorNumberMustBePositive => 'Number must be greater than 0';

  @override
  String get customNumberLabel => 'Or enter a custom number:';

  @override
  String get numberInputLabel => 'Number of questions';

  @override
  String get questionOrderConfigTitle => 'Question Order Configuration';

  @override
  String get questionOrderConfigDescription =>
      'Select the order in which you want questions to appear during the exam:';

  @override
  String get questionOrderAscending => 'Ascending Order';

  @override
  String get questionOrderAscendingDesc =>
      'Questions will appear in order from 1 to the end';

  @override
  String get questionOrderDescending => 'Descending Order';

  @override
  String get questionOrderDescendingDesc =>
      'Questions will appear from the end to 1';

  @override
  String get questionOrderRandom => 'Random';

  @override
  String get questionOrderRandomDesc => 'Questions will appear in random order';

  @override
  String get questionOrderConfigTooltip => 'Question order configuration';

  @override
  String get reorderQuestionsTooltip => 'Reorder Questions';

  @override
  String get save => 'Save';

  @override
  String get examTimeLimitTitle => 'Exam Time Limit';

  @override
  String get examTimeLimitDescription =>
      'Set a time limit for the exam. When enabled, a countdown timer will be displayed during the quiz.';

  @override
  String get enableTimeLimit => 'Enable time limit';

  @override
  String get timeLimitMinutes => 'Time limit (minutes)';

  @override
  String get examTimeExpiredTitle => 'Time\'s Up!';

  @override
  String get examTimeExpiredMessage =>
      'The exam time has expired. Your answers have been automatically submitted.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Multiple Choice';

  @override
  String get questionTypeSingleChoice => 'Single Choice';

  @override
  String get questionTypeTrueFalse => 'True/False';

  @override
  String get questionTypeEssay => 'Essay';

  @override
  String get questionTypeRandom => 'All';

  @override
  String get questionTypeUnknown => 'Unknown';

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
  String get optionsTooltip => 'Number of answer options for this question';

  @override
  String get imageTooltip => 'This question has an associated image';

  @override
  String get explanationTooltip => 'This question has an explanation';

  @override
  String get missingExplanation => 'Missing explanation';

  @override
  String get missingExplanationTooltip =>
      'This question is missing an explanation';

  @override
  String questionTypeTooltip(String type) {
    return 'Question type: $type';
  }

  @override
  String get aiPrompt =>
      'Focus on the student\'s question, not on directly answering the original exam question. Explain with a pedagogical approach. For practical exercises or math problems, provide step-by-step instructions. For theoretical questions, provide a concise explanation without structuring the response in sections. Respond in the same language you are asked in.';

  @override
  String get questionLabel => 'Question';

  @override
  String get studentComment => 'Student comment';

  @override
  String get aiAssistantTitle => 'AI Study Assistant';

  @override
  String get questionContext => 'Question Context';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get aiThinking => 'AI is thinking...';

  @override
  String get askAIHint => 'Ask your question about this topic...';

  @override
  String get aiPlaceholderResponse =>
      'This is a placeholder response. In a real implementation, this would connect to an AI service to provide helpful explanations about the question.';

  @override
  String get aiErrorResponse =>
      'Sorry, there was an error processing your question. Please try again.';

  @override
  String get configureApiKeyMessage =>
      'Please configure your AI API Key in Settings.';

  @override
  String get errorLabel => 'Error:';

  @override
  String get noResponseReceived => 'No response received';

  @override
  String get invalidApiKeyError =>
      'Invalid API Key. Please check your OpenAI API Key in settings.';

  @override
  String get rateLimitError =>
      'Quota exceeded or model not available in your tier. Check your plan.';

  @override
  String get modelNotFoundError =>
      'Model not found. Please check your API access.';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get networkErrorOpenAI =>
      'Network error: Unable to connect to OpenAI. Please check your internet connection.';

  @override
  String get networkErrorGemini =>
      'Network error: Unable to connect to Google Gemini. Please check your internet connection.';

  @override
  String get openaiApiKeyNotConfigured => 'OpenAI API Key not configured';

  @override
  String get geminiApiKeyNotConfigured => 'Gemini API Key not configured';

  @override
  String get geminiApiKeyLabel => 'Gemini API Key';

  @override
  String get geminiApiKeyHint => 'Enter your Gemini API Key';

  @override
  String get geminiApiKeyDescription =>
      'Required for Gemini AI functionality. Your key is stored securely.';

  @override
  String get getGeminiApiKeyTooltip => 'Get API Key from Google AI Studio';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'AI Study Assistant requires at least one API Key (Gemini or OpenAI). Please enter an API key or disable the AI Assistant.';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get aiButtonTooltip => 'AI Study Assistant';

  @override
  String get aiButtonText => 'AI';

  @override
  String get aiAssistantSettingsTitle => 'AI Study Assistant (Preview)';

  @override
  String get aiAssistantSettingsDescription =>
      'Enable or disable the AI study assistant for questions';

  @override
  String get aiDefaultModelTitle => 'Default AI Model';

  @override
  String get aiDefaultModelDescription =>
      'Select the default AI service and model for question generation';

  @override
  String get openaiApiKeyLabel => 'OpenAI API Key';

  @override
  String get openaiApiKeyHint => 'Enter your OpenAI API Key (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Required for integration with OpenAI. Your OpenAI key is stored securely.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'AI Study Assistant requires an OpenAI API Key. Please enter your API key or disable the AI Assistant.';

  @override
  String get getApiKeyTooltip => 'Get API Key from OpenAI';

  @override
  String get deleteAction => 'Delete';

  @override
  String get explanationLabel => 'Explanation (optional)';

  @override
  String get explanationHint =>
      'Enter an explanation for the correct answer(s)';

  @override
  String get explanationTitle => 'Explanation';

  @override
  String get imageLabel => 'Image';

  @override
  String get changeImage => 'Change image';

  @override
  String get removeImage => 'Remove image';

  @override
  String get addImageTap => 'Tap to add image';

  @override
  String get imageFormats => 'Formats: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Error loading image';

  @override
  String imagePickError(String error) {
    return 'Error loading image: $error';
  }

  @override
  String get tapToZoom => 'Tap to zoom';

  @override
  String get trueLabel => 'True';

  @override
  String get falseLabel => 'False';

  @override
  String get addQuestion => 'Add Question';

  @override
  String get editQuestion => 'Edit Question';

  @override
  String get questionText => 'Question Text';

  @override
  String get questionType => 'Question Type';

  @override
  String get addOption => 'Add Option';

  @override
  String get optionsLabel => 'Options';

  @override
  String get optionLabel => 'Option';

  @override
  String get questionTextRequired => 'Question text is required';

  @override
  String get atLeastOneOptionRequired => 'At least one option must have text';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'At least one correct answer must be selected';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'Only one correct answer is allowed for this question type';

  @override
  String get removeOption => 'Remove option';

  @override
  String get selectCorrectAnswer => 'Select correct answer';

  @override
  String get selectCorrectAnswers => 'Select correct answers';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'Options $optionNumbers are empty. Please add text to them or remove them.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'Option $optionNumber is empty. Please add text to it or remove it.';
  }

  @override
  String get optionEmptyError => 'This option cannot be empty';

  @override
  String get hasImage => 'Image';

  @override
  String get hasExplanation => 'Explanation';

  @override
  String errorLoadingSettings(String error) {
    return 'Error loading settings: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'Could not open $url';
  }

  @override
  String get loadingAiServices => 'Loading AI services...';

  @override
  String usingAiService(String serviceName) {
    return 'Using: $serviceName';
  }

  @override
  String get aiServiceLabel => 'AI Service:';

  @override
  String get aiModelLabel => 'Model:';

  @override
  String get importQuestionsTitle => 'Import Questions';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return 'Found $count questions in \"$fileName\". Where would you like to import them?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'Where would you like to add these questions?';

  @override
  String get importAtBeginning => 'At Beginning';

  @override
  String get importAtEnd => 'At End';

  @override
  String questionsImportedSuccess(int count) {
    return 'Successfully imported $count questions';
  }

  @override
  String get importQuestionsTooltip =>
      'Import questions from another quiz file';

  @override
  String get dragDropHintText =>
      'You can also drag and drop .quiz files here to import questions';

  @override
  String get randomizeAnswersTitle => 'Randomize Answer Options';

  @override
  String get randomizeAnswersDescription =>
      'Shuffle the order of answer options during quiz execution';

  @override
  String get showCorrectAnswerCountTitle => 'Show Correct Answer Count';

  @override
  String get showCorrectAnswerCountDescription =>
      'Display the number of correct answers in multiple choice questions';

  @override
  String correctAnswersCount(int count) {
    return 'Select $count correct answers';
  }

  @override
  String get correctSelectedLabel => 'Correct';

  @override
  String get correctMissedLabel => 'Correct';

  @override
  String get incorrectSelectedLabel => 'Incorrect';

  @override
  String get aiGenerateDialogTitle => 'Generate Questions with AI';

  @override
  String get aiQuestionCountLabel => 'Number of Questions (Optional)';

  @override
  String get aiQuestionCountHint => 'Leave empty for AI to decide';

  @override
  String get aiQuestionCountValidation => 'Must be a number between 1 and 50';

  @override
  String get aiQuestionTypeLabel => 'Question Type';

  @override
  String get aiQuestionTypeRandom => 'Random (Mixed)';

  @override
  String get aiLanguageLabel => 'Question Language';

  @override
  String get aiContentLabel => 'Content to generate questions from';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max words';
  }

  @override
  String get aiContentHint =>
      'Enter the text, topic, or content from which you want to generate questions...';

  @override
  String get aiContentHelperText =>
      'AI will create questions based on this content';

  @override
  String aiWordLimitError(int max) {
    return 'You have exceeded the limit of $max words';
  }

  @override
  String get aiContentRequiredError =>
      'You must provide content to generate questions';

  @override
  String aiContentLimitError(int max) {
    return 'Content exceeds the limit of $max words';
  }

  @override
  String get aiMinWordsError =>
      'Provide at least 10 words to generate quality questions';

  @override
  String get aiInfoTitle => 'Information';

  @override
  String get aiInfoDescription =>
      '• AI will analyze the content and generate relevant questions\n• If you write fewer than 10 words, you\'ll enter Topic mode where questions will be asked about those specific topics\n• With more than 10 words, you\'ll enter Content mode which will ask questions about that same text (more words = more precision)\n• You can include text, definitions, explanations, or any educational material\\n• Questions will include answer options and explanations\\n• The process may take a few seconds';

  @override
  String get aiGenerateButton => 'Generate Questions';

  @override
  String get aiEnterContentTitle => 'Enter Content';

  @override
  String get aiEnterContentDescription =>
      'Enter the topic or paste content to generate questions from';

  @override
  String get aiContentFieldHint =>
      'Enter a topic like \"World War II history\" or paste text content here...';

  @override
  String get aiAttachFileHint => 'Attach a file (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Drop file here';

  @override
  String get dropImageHere => 'Drop image here';

  @override
  String get aiNumberQuestionsLabel => 'Number of Questions';

  @override
  String get backButton => 'Back';

  @override
  String get generateButton => 'Generate';

  @override
  String aiTopicModeCount(int count) {
    return 'Topic Mode ($count words)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Text Mode ($count words)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Content Mode';

  @override
  String get aiGenerationCategoryTheory => 'Theory';

  @override
  String get aiGenerationCategoryExercises => 'Exercises';

  @override
  String get aiGenerationCategoryBoth => 'Mixed';

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
  String get aiServicesLoading => 'Loading AI services...';

  @override
  String get aiServicesNotConfigured => 'No AI services configured';

  @override
  String get aiGeneratedQuestions => 'AI Generated';

  @override
  String get aiApiKeyRequired =>
      'Please configure at least one AI API key in Settings to use AI generation.';

  @override
  String get aiGenerationFailed =>
      'Could not generate questions. Try with different content.';

  @override
  String get aiGenerationErrorTitle => 'Error generating questions';

  @override
  String get noQuestionsInFile => 'No questions found in the imported file';

  @override
  String get couldNotAccessFile => 'Could not access the selected file';

  @override
  String get defaultOutputFileName => 'output-file.quiz';

  @override
  String get generateQuestionsWithAI => 'Generate questions with AI';

  @override
  String get addQuestionsWithAI => 'Add questions with AI';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Limit: $words words or $chars characters';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Limit: $words words';
  }

  @override
  String get aiAssistantDisabled => 'AI Assistant Disabled';

  @override
  String get enableAiAssistant =>
      'The AI assistant is disabled. Please enable it in settings to use AI features.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Minimum $minWords words required';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount words ✓ Ready to generate';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords words ($moreNeeded more needed)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Minimum $minWords words required ($moreNeeded more needed)';
  }

  @override
  String get enableQuestion => 'Enable question';

  @override
  String get disableQuestion => 'Disable question';

  @override
  String get questionDisabled => 'Disabled';

  @override
  String get noEnabledQuestionsError =>
      'No enabled questions available to run the quiz';

  @override
  String get evaluateWithAI => 'Evaluate with AI';

  @override
  String get aiEvaluation => 'AI Evaluation';

  @override
  String aiEvaluationError(String error) {
    return 'Error evaluating response: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'You are an expert teacher evaluating a student\'s response to an essay question. Your task is to provide detailed and constructive evaluation. Respond in the same language as the student\'s answer.';

  @override
  String get aiEvaluationPromptQuestion => 'QUESTION:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'STUDENT\'S ANSWER:';

  @override
  String get aiEvaluationPromptCriteria =>
      'EVALUATION CRITERIA (based on teacher\'s explanation):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'SPECIFIC INSTRUCTIONS:\n- Evaluate how well the student\'s response aligns with the established criteria\n- Analyze the degree of synthesis and structure in the response\n- Identify if anything important has been left out according to the criteria\n- Consider the depth and accuracy of the analysis';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'GENERAL INSTRUCTIONS:\n- Since there are no specific criteria established, evaluate the response based on general academic standards\n- Consider clarity, coherence, and structure of the response\n- Evaluate if the response demonstrates understanding of the topic\n- Analyze the depth of analysis and quality of arguments';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'RESPONSE FORMAT:\n1. GRADE: [X/10] - Briefly justify the grade\n2. STRENGTHS: Mention positive aspects of the response\n3. AREAS FOR IMPROVEMENT: Point out aspects that could be improved\n4. SPECIFIC COMMENTS: Provide detailed and constructive feedback\n5. SUGGESTIONS: Offer specific recommendations for improvement\n\nBe constructive, specific, and educational in your evaluation. The goal is to help the student learn and improve. Address them in second person and use a professional and friendly tone.';

  @override
  String get raffleTitle => 'Raffle';

  @override
  String get raffleTooltip => 'Start raffle';

  @override
  String get participantListTitle => 'Participant List';

  @override
  String get participantListHint => 'Enter one name per line:';

  @override
  String get participantListPlaceholder =>
      'John Doe\nJane Smith\nBob Johnson\n...';

  @override
  String get clearList => 'Clear List';

  @override
  String get participants => 'Participants';

  @override
  String get noParticipants => 'No participants';

  @override
  String get addParticipantsHint => 'Add names in the text area';

  @override
  String get activeParticipants => 'Active Participants';

  @override
  String get alreadySelected => 'Already Selected';

  @override
  String totalParticipants(int count) {
    return 'Total: $count';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return 'Active: $active | Winners: $winners';
  }

  @override
  String get startRaffle => 'Start Raffle';

  @override
  String get raffling => 'Raffling...';

  @override
  String get selectingWinner => 'Selecting winner...';

  @override
  String get allParticipantsSelected =>
      'All participants have already been selected';

  @override
  String get addParticipantsToStart => 'Add participants to start the raffle';

  @override
  String participantsReadyCount(int count) {
    return '$count participant(s) ready for raffle';
  }

  @override
  String get resetWinners => 'Reset Winners';

  @override
  String get resetWinnersConfirmTitle => 'Reset Winners';

  @override
  String get resetWinnersConfirmMessage =>
      'Are you sure you want to reset the winners list? All participants will be available for the raffle again.';

  @override
  String get resetRaffleTitle => 'Reset Raffle';

  @override
  String get resetRaffleConfirmMessage =>
      'Are you sure you want to reset the raffle? All participants and winners will be lost.';

  @override
  String get cancel => 'Cancel';

  @override
  String get reset => 'Reset';

  @override
  String get viewWinners => 'View winners';

  @override
  String get congratulations => '🎉 Congratulations! 🎉';

  @override
  String positionLabel(int position) {
    return 'Position: $position°';
  }

  @override
  String remainingParticipants(int count) {
    return 'Remaining participants: $count';
  }

  @override
  String get continueRaffle => 'Continue Raffle';

  @override
  String get finishRaffle => 'Finish Raffle';

  @override
  String get winnersTitle => 'Raffle Winners';

  @override
  String get shareResults => 'Share results';

  @override
  String get noWinnersYet => 'No winners yet';

  @override
  String get performRaffleToSeeWinners =>
      'Perform a raffle to see the winners here';

  @override
  String get goToRaffle => 'Go to Raffle';

  @override
  String get raffleCompleted => 'Raffle Completed';

  @override
  String winnersSelectedCount(int count) {
    return '$count winner(s) selected';
  }

  @override
  String get newRaffle => 'New Raffle';

  @override
  String get shareResultsTitle => 'Share Results';

  @override
  String get raffleResultsLabel => 'Raffle results:';

  @override
  String get close => 'Close';

  @override
  String get share => 'Copy';

  @override
  String get shareNotImplemented => 'Share functionality not implemented';

  @override
  String get firstPlace => '1st';

  @override
  String get secondPlace => '2nd';

  @override
  String get thirdPlace => '3rd';

  @override
  String nthPlace(int position) {
    return '$position°';
  }

  @override
  String placeLabel(String position) {
    return '$position place';
  }

  @override
  String get raffleResultsHeader => '🏆 RAFFLE RESULTS 🏆';

  @override
  String totalWinners(int count) {
    return 'Total winners: $count';
  }

  @override
  String get noWinnersToShare => 'No winners.';

  @override
  String get shareSuccess => 'Results copied successfully';

  @override
  String get selectLogo => 'Select Logo';

  @override
  String get logoUrl => 'Logo URL';

  @override
  String get logoUrlHint =>
      'Enter the URL of an image to use as a custom logo for the raffle';

  @override
  String get invalidLogoUrl =>
      'Invalid image URL. Must be a valid URL ending in .jpg, .png, .gif, etc.';

  @override
  String get logoPreview => 'Preview';

  @override
  String get removeLogo => 'Remove Logo';

  @override
  String get logoTooLargeWarning =>
      'Image is too large to be saved. It will only be used during this session.';

  @override
  String get aiModeTopicTitle => 'Topic Mode';

  @override
  String get aiModeTopicDescription => 'Creative exploration of the topic';

  @override
  String get aiModeContentTitle => 'Content Mode';

  @override
  String get aiModeContentDescription =>
      'Precise questions based on your input';

  @override
  String aiWordCountIndicator(int count) {
    return '$count words';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Precision: $level';
  }

  @override
  String get aiPrecisionLow => 'Low';

  @override
  String get aiPrecisionMedium => 'Medium';

  @override
  String get aiPrecisionHigh => 'High';

  @override
  String get aiMoreWordsMorePrecision => 'More words = more precision';

  @override
  String get aiKeepDraftTitle => 'Keep AI Draft';

  @override
  String get aiKeepDraftDescription =>
      'Automatically save the text entered in the AI generation dialog so it is not lost if the dialog is closed.';

  @override
  String get aiAttachFile => 'Attach File';

  @override
  String get aiRemoveFile => 'Remove file';

  @override
  String get aiFileMode => 'File Mode';

  @override
  String get aiFileModeDescription =>
      'Questions will be generated from the attached file';

  @override
  String get aiCommentsLabel => 'Comments (Optional)';

  @override
  String get aiCommentsHint =>
      'Add instructions or comments about the attached file...';

  @override
  String get aiCommentsHelperText =>
      'Optionally add instructions on how to generate questions from the file';

  @override
  String get aiFilePickerError => 'Could not load the selected file';

  @override
  String get studyModeLabel => 'Study Mode';

  @override
  String get studyModeDescription => 'Instant feedback and no timer';

  @override
  String get examModeLabel => 'Exam Mode';

  @override
  String get examModeDescription => 'Standard timer and results at the end';

  @override
  String get checkAnswer => 'Check Answer';

  @override
  String get quizModeTitle => 'Quiz Mode';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get askAiAssistant => 'Ask AI Assistant';

  @override
  String get sorteosLabel => 'Raffles';

  @override
  String get edit => 'Edit';

  @override
  String get enable => 'Enable';

  @override
  String get disable => 'Disable';

  @override
  String get quizPreviewTitle => 'Quiz Preview';

  @override
  String get select => 'Select';

  @override
  String get done => 'Done';

  @override
  String get importButton => 'Import';

  @override
  String get reorderButton => 'Reorder';

  @override
  String get startQuizButton => 'Start Quiz';

  @override
  String get deleteConfirmation => 'Are you sure you want to delete this quiz?';

  @override
  String get saveSuccess => 'File saved successfully';

  @override
  String get errorSavingFile => 'Error saving file';

  @override
  String get deleteSingleQuestionConfirmation =>
      'Are you sure you want to delete this question?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'Are you sure you want to delete $count questions?';
  }

  @override
  String get keepPracticing => 'Keep practicing to improve!';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get review => 'Review';

  @override
  String get home => 'Home';

  @override
  String get allLabel => 'All';

  @override
  String get subtractPointsLabel => 'Subtract points for wrong answer';

  @override
  String get penaltyAmountLabel => 'Penalty amount';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount pts / mistake';
  }

  @override
  String get allQuestionsLabel => 'All Questions';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Start with $count selected';
  }

  @override
  String get advancedSettingsTitle => 'Advanced Settings (Debug)';

  @override
  String get appLanguageLabel => 'App Language';

  @override
  String get appLanguageDescription =>
      'Override application language for testing';

  @override
  String get pasteFromClipboard => 'Paste from clipboard';

  @override
  String get pasteImage => 'Paste';

  @override
  String get clipboardNoImage => 'No image found in clipboard';
}
