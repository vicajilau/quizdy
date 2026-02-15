// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get titleAppBar => 'क्विज़ - परीक्षा सिमुलेटर';

  @override
  String get create => 'बनाएं';

  @override
  String get preview => 'पूर्वावलोकन';

  @override
  String get previewLabel => 'पूर्वावलोकन:';

  @override
  String get emptyPlaceholder => '(खाली)';

  @override
  String get latexSyntaxTitle => 'LaTeX सिंटैक्स:';

  @override
  String get latexSyntaxHelp =>
      'इनलाइन गणित: LaTeX अभिव्यक्तियों के लिए \$...\$ का उपयोग करें\nउदाहरण: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'LaTeX रेंडरिंग का पूर्वावलोकन करें';

  @override
  String get okButton => 'ठीक है';

  @override
  String get load => 'लोड करें';

  @override
  String fileLoaded(String filePath) {
    return 'फ़ाइल लोड हुई: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'फ़ाइल सेव हुई: $filePath';
  }

  @override
  String get dropFileHere =>
      'यहाँ क्लिक करें या स्क्रीन पर .quiz फ़ाइल ड्रैग करें';

  @override
  String get clickOrDragFile =>
      'Load karne ke liye click karen ya screen par .quiz file drag karen';

  @override
  String get errorInvalidFile =>
      'त्रुटि: अमान्य फ़ाइल। .quiz फ़ाइल होनी चाहिए।';

  @override
  String errorLoadingFile(String error) {
    return 'क्विज़ फ़ाइल लोड करने में त्रुटि: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'फ़ाइल एक्सपोर्ट करने में त्रुटि: $error';
  }

  @override
  String get cancelButton => 'रद्द करें';

  @override
  String get saveButton => 'सेव करें';

  @override
  String get confirmDeleteTitle => 'हटाने की पुष्टि करें';

  @override
  String confirmDeleteMessage(String processName) {
    return 'क्या आप वाकई `$processName` प्रक्रिया को हटाना चाहते हैं?';
  }

  @override
  String get deleteButton => 'हटाएं';

  @override
  String get confirmExitTitle => 'बाहर निकलने की पुष्टि करें';

  @override
  String get confirmExitMessage =>
      'क्या आप वाकई बिना सेव किए बाहर निकलना चाहते हैं?';

  @override
  String get exitButton => 'बाहर निकलें';

  @override
  String get saveDialogTitle => 'कृपया आउटपुट फ़ाइल चुनें:';

  @override
  String get createQuizFileTitle => 'क्विज़ फ़ाइल बनाएं';

  @override
  String get editQuizFileTitle => 'क्विज़ फ़ाइल संपादित करें';

  @override
  String get fileNameLabel => 'फ़ाइल का नाम';

  @override
  String get fileDescriptionLabel => 'फ़ाइल का विवरण';

  @override
  String get createButton => 'बनाएं';

  @override
  String get fileNameRequiredError => 'फ़ाइल का नाम आवश्यक है।';

  @override
  String get fileDescriptionRequiredError => 'फ़ाइल का विवरण आवश्यक है।';

  @override
  String get versionLabel => 'संस्करण';

  @override
  String get authorLabel => 'लेखक';

  @override
  String get authorRequiredError => 'लेखक का नाम आवश्यक है।';

  @override
  String get requiredFieldsError => 'सभी आवश्यक फ़ील्ड भरे जाने चाहिए।';

  @override
  String get requestFileNameTitle => 'क्विज़ फ़ाइल का नाम दर्ज करें';

  @override
  String get fileNameHint => 'फ़ाइल का नाम';

  @override
  String get emptyFileNameMessage => 'फ़ाइल का नाम खाली नहीं हो सकता।';

  @override
  String get acceptButton => 'स्वीकार करें';

  @override
  String get saveTooltip => 'फ़ाइल सेव करें';

  @override
  String get saveDisabledTooltip => 'सेव करने के लिए कोई बदलाव नहीं';

  @override
  String get executeTooltip => 'परीक्षा शुरू करें';

  @override
  String get addTooltip => 'नया प्रश्न जोड़ें';

  @override
  String get backSemanticLabel => 'वापस जाएं बटन';

  @override
  String get createFileTooltip => 'नई क्विज़ फ़ाइल बनाएं';

  @override
  String get loadFileTooltip => 'मौजूदा क्विज़ फ़ाइल लोड करें';

  @override
  String questionNumber(int number) {
    return 'प्रश्न $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return 'प्रश्न $current / $total';
  }

  @override
  String get previous => 'पिछला';

  @override
  String get skip => 'छोड़ें';

  @override
  String get questionsOverview => 'Questions Map';

  @override
  String get next => 'अगला';

  @override
  String get finish => 'समाप्त करें';

  @override
  String get finishQuiz => 'क्विज़ समाप्त करें';

  @override
  String get finishQuizConfirmation =>
      'क्या आप वाकई क्विज़ समाप्त करना चाहते हैं? इसके बाद आप अपने उत्तर नहीं बदल सकेंगे।';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount निरुत्तरित प्रश्न हैं',
      one: '1 निरुत्तरित प्रश्न है',
    );
    return 'आपके पास $_temp0। क्या आप वाकई क्विज़ समाप्त करना चाहते हैं?';
  }

  @override
  String get resolveUnansweredQuestions => 'प्रश्न हल करें';

  @override
  String get abandonQuiz => 'क्विज़ छोड़ें';

  @override
  String get abandonQuizConfirmation =>
      'क्या आप वाकई क्विज़ छोड़ना चाहते हैं? सभी प्रगति खो जाएगी।';

  @override
  String get abandon => 'छोड़ें';

  @override
  String get quizCompleted => 'क्विज़ पूरी हुई!';

  @override
  String score(String score) {
    return 'स्कोर: $score%';
  }

  @override
  String correctAnswers(int correct, int total) {
    return '$total में से $correct सही उत्तर';
  }

  @override
  String get retry => 'दोहराएं';

  @override
  String get goBack => 'समाप्त करें';

  @override
  String get retryFailedQuestions => 'गलत प्रश्न दोहराएं';

  @override
  String question(String question) {
    return 'प्रश्न: $question';
  }

  @override
  String get selectQuestionCountTitle => 'प्रश्नों की संख्या चुनें';

  @override
  String get selectQuestionCountMessage =>
      'इस क्विज़ में आप कितने प्रश्नों का उत्तर देना चाहते हैं?';

  @override
  String allQuestions(int count) {
    return 'सभी प्रश्न ($count)';
  }

  @override
  String get startQuiz => 'क्विज़ शुरू करें';

  @override
  String get errorInvalidNumber => 'कृपया वैध संख्या दर्ज करें';

  @override
  String get errorNumberMustBePositive => 'संख्या 0 से अधिक होनी चाहिए';

  @override
  String get customNumberLabel => 'या कस्टम संख्या दर्ज करें:';

  @override
  String get numberInputLabel => 'प्रश्नों की संख्या';

  @override
  String get questionOrderConfigTitle => 'प्रश्न क्रम कॉन्फ़िगरेशन';

  @override
  String get questionOrderConfigDescription =>
      'परीक्षा के दौरान प्रश्न किस क्रम में दिखाए जाएं, यह चुनें:';

  @override
  String get questionOrderAscending => 'आरोही क्रम';

  @override
  String get questionOrderAscendingDesc =>
      'प्रश्न 1 से अंत तक क्रम में दिखेंगे';

  @override
  String get questionOrderDescending => 'अवरोही क्रम';

  @override
  String get questionOrderDescendingDesc => 'प्रश्न अंत से 1 तक दिखेंगे';

  @override
  String get questionOrderRandom => 'यादृच्छिक';

  @override
  String get questionOrderRandomDesc => 'प्रश्न यादृच्छिक क्रम में दिखेंगे';

  @override
  String get questionOrderConfigTooltip => 'प्रश्न क्रम कॉन्फ़िगरेशन';

  @override
  String get reorderQuestionsTooltip => 'प्रश्नों को पुनः व्यवस्थित करें';

  @override
  String get save => 'सेव करें';

  @override
  String get examTimeLimitTitle => 'परीक्षा समय सीमा';

  @override
  String get examTimeLimitDescription =>
      'परीक्षा के लिए समय सीमा निर्धारित करें। सक्षम होने पर, क्विज़ के दौरान काउंटडाउन टाइमर दिखेगा।';

  @override
  String get enableTimeLimit => 'समय सीमा सक्षम करें';

  @override
  String get timeLimitMinutes => 'समय सीमा (मिनट)';

  @override
  String get examTimeExpiredTitle => 'समय समाप्त!';

  @override
  String get examTimeExpiredMessage =>
      'परीक्षा का समय समाप्त हो गया है। आपके उत्तर स्वचालित रूप से जमा कर दिए गए हैं।';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'बहुविकल्पीय';

  @override
  String get questionTypeSingleChoice => 'एकल विकल्प';

  @override
  String get questionTypeTrueFalse => 'सही/गलत';

  @override
  String get questionTypeEssay => 'निबंध';

  @override
  String get questionTypeRandom => 'मिश्रित';

  @override
  String get questionTypeUnknown => 'अज्ञात';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count विकल्प',
      one: '1 विकल्प',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip => 'इस प्रश्न के लिए उत्तर विकल्पों की संख्या';

  @override
  String get imageTooltip => 'इस प्रश्न के साथ चित्र जुड़ा है';

  @override
  String get explanationTooltip => 'इस प्रश्न का स्पष्टीकरण है';

  @override
  String get missingExplanation => 'स्पष्टीकरण गायब है';

  @override
  String get missingExplanationTooltip => 'इस प्रश्न का कोई स्पष्टीकरण नहीं है';

  @override
  String questionTypeTooltip(String type) {
    return 'प्रश्न का प्रकार: $type';
  }

  @override
  String get aiPrompt =>
      'छात्र के प्रश्न पर ध्यान दें, मूल परीक्षा प्रश्न का सीधे उत्तर देने पर नहीं। एक शैक्षणिक दृष्टिकोण के साथ समझाएं। व्यावहारिक अभ्यासों या गणित की समस्याओं के लिए, चरण-दर-चरण निर्देश प्रदान करें। सैद्धांतिक प्रश्नों के लिए, उत्तर को अनुभागों में व्यवस्थित किए बिना एक संक्षिप्त स्पष्टीकरण प्रदान करें। उसी भाषा में उत्तर दें जिसमें आपसे पूछा गया है।';

  @override
  String get questionLabel => 'प्रश्न';

  @override
  String get studentComment => 'छात्र की टिप्पणी';

  @override
  String get aiAssistantTitle => 'AI अध्ययन सहायक';

  @override
  String get questionContext => 'प्रश्न संदर्भ';

  @override
  String get aiAssistant => 'AI सहायक';

  @override
  String get aiThinking => 'AI सोच रहा है...';

  @override
  String get askAIHint => 'इस विषय के बारे में अपना प्रश्न पूछें...';

  @override
  String get aiPlaceholderResponse =>
      'यह एक प्लेसहोल्डर प्रतिक्रिया है। वास्तविक कार्यान्वयन में, यह प्रश्न के बारे में सहायक स्पष्टीकरण प्रदान करने के लिए AI सेवा से जुड़ेगा।';

  @override
  String get aiErrorResponse =>
      'क्षमा करें, आपके प्रश्न को प्रोसेस करने में त्रुटि हुई। कृपया पुनः प्रयास करें।';

  @override
  String get configureApiKeyMessage =>
      'कृपया सेटिंग्स में अपनी AI API Key कॉन्फ़िगर करें।';

  @override
  String get errorLabel => 'त्रुटि:';

  @override
  String get noResponseReceived => 'कोई प्रतिक्रिया प्राप्त नहीं हुई';

  @override
  String get invalidApiKeyError =>
      'अमान्य API Key। कृपया सेटिंग्स में अपनी OpenAI API Key जांचें।';

  @override
  String get rateLimitError =>
      'कोटा पार हो गया है या मॉडल आपकी योजना में उपलब्ध नहीं है। अपनी योजना की जाँच करें।';

  @override
  String get modelNotFoundError =>
      'मॉडल नहीं मिला। कृपया अपनी API पहुंच जांचें।';

  @override
  String get unknownError => 'अज्ञात त्रुटि';

  @override
  String get networkErrorOpenAI =>
      'नेटवर्क त्रुटि: OpenAI से कनेक्ट नहीं हो सका। कृपया अपना इंटरनेट कनेक्शन जांचें।';

  @override
  String get networkErrorGemini =>
      'नेटवर्क त्रुटि: Gemini से कनेक्ट नहीं हो सका। कृपया अपना इंटरनेट कनेक्शन जांचें।';

  @override
  String get openaiApiKeyNotConfigured => 'OpenAI API Key कॉन्फ़िगर नहीं की गई';

  @override
  String get geminiApiKeyNotConfigured => 'Gemini API Key कॉन्फ़िगर नहीं की गई';

  @override
  String get geminiApiKeyLabel => 'Gemini API Key';

  @override
  String get geminiApiKeyHint => 'अपनी Gemini API Key दर्ज करें';

  @override
  String get geminiApiKeyDescription =>
      'Gemini AI कार्यक्षमता के लिए आवश्यक। आपकी key सुरक्षित रूप से संग्रहीत की जाती है।';

  @override
  String get getGeminiApiKeyTooltip =>
      'Google AI Studio से API Key प्राप्त करें';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'AI अध्ययन सहायक को कम से कम एक API कुंजी (Gemini या OpenAI) की आवश्यकता है। कृपया एक API कुंजी दर्ज करें या AI सहायक को अक्षम करें।';

  @override
  String get minutesAbbreviation => 'मिन';

  @override
  String get aiButtonTooltip => 'AI अध्ययन सहायक';

  @override
  String get aiButtonText => 'AI';

  @override
  String get aiAssistantSettingsTitle => 'AI अध्ययन सहायक (पूर्वावलोकन)';

  @override
  String get aiAssistantSettingsDescription =>
      'प्रश्नों के लिए AI अध्ययन सहायक को सक्षम या अक्षम करें';

  @override
  String get aiDefaultModelTitle => 'डिफ़ॉल्ट AI मॉडल';

  @override
  String get aiDefaultModelDescription =>
      'प्रश्न निर्माण के लिए डिफ़ॉल्ट AI सेवा और मॉडल चुनें';

  @override
  String get openaiApiKeyLabel => 'OpenAI API Key';

  @override
  String get openaiApiKeyHint => 'अपनी OpenAI API Key दर्ज करें (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'OpenAI एकीकरण के लिए आवश्यक। आपकी OpenAI key सुरक्षित रूप से संग्रहीत की जाती है।';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'AI अध्ययन सहायक के लिए OpenAI API Key की आवश्यकता है। कृपया अपनी API key दर्ज करें या AI सहायक को अक्षम करें।';

  @override
  String get getApiKeyTooltip => 'OpenAI से API Key प्राप्त करें';

  @override
  String get deleteAction => 'हटाएं';

  @override
  String get explanationLabel => 'स्पष्टीकरण (वैकल्पिक)';

  @override
  String get explanationHint => 'सही उत्तर(रों) के लिए स्पष्टीकरण दर्ज करें';

  @override
  String get explanationTitle => 'स्पष्टीकरण';

  @override
  String get imageLabel => 'चित्र';

  @override
  String get changeImage => 'चित्र बदलें';

  @override
  String get removeImage => 'चित्र हटाएं';

  @override
  String get addImageTap => 'चित्र जोड़ने के लिए टैप करें';

  @override
  String get imageFormats => 'प्रारूप: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'चित्र लोड करने में त्रुटि';

  @override
  String imagePickError(String error) {
    return 'चित्र लोड करने में त्रुटि: $error';
  }

  @override
  String get tapToZoom => 'ज़ूम करने के लिए टैप करें';

  @override
  String get trueLabel => 'सही';

  @override
  String get falseLabel => 'गलत';

  @override
  String get addQuestion => 'प्रश्न जोड़ें';

  @override
  String get editQuestion => 'प्रश्न संपादित करें';

  @override
  String get questionText => 'प्रश्न पाठ';

  @override
  String get questionType => 'प्रश्न प्रकार';

  @override
  String get addOption => 'विकल्प जोड़ें';

  @override
  String get optionsLabel => 'विकल्प';

  @override
  String get optionLabel => 'विकल्प';

  @override
  String get questionTextRequired => 'प्रश्न पाठ आवश्यक है';

  @override
  String get atLeastOneOptionRequired =>
      'कम से कम एक विकल्प में पाठ होना चाहिए';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'कम से कम एक सही उत्तर चुना जाना चाहिए';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'इस प्रश्न प्रकार के लिए केवल एक सही उत्तर की अनुमति है';

  @override
  String get removeOption => 'विकल्प हटाएं';

  @override
  String get selectCorrectAnswer => 'सही उत्तर चुनें';

  @override
  String get selectCorrectAnswers => 'सही उत्तर चुनें';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'विकल्प $optionNumbers खाली हैं। कृपया उनमें पाठ जोड़ें या उन्हें हटा दें।';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'विकल्प $optionNumber खाली है। कृपया इसमें पाठ जोड़ें या इसे हटा दें।';
  }

  @override
  String get optionEmptyError => 'यह विकल्प खाली नहीं हो सकता';

  @override
  String get hasImage => 'चित्र';

  @override
  String get hasExplanation => 'स्पष्टीकरण';

  @override
  String errorLoadingSettings(String error) {
    return 'सेटिंग्स लोड करने में त्रुटि: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return '$url खोला नहीं जा सका';
  }

  @override
  String get loadingAiServices => 'AI सेवाएं लोड हो रही हैं...';

  @override
  String usingAiService(String serviceName) {
    return 'उपयोग में: $serviceName';
  }

  @override
  String get aiServiceLabel => 'AI सेवा:';

  @override
  String get aiModelLabel => 'मॉडल:';

  @override
  String get importQuestionsTitle => 'प्रश्न आयात करें';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return '\"$fileName\" में $count प्रश्न मिले। आप इन्हें कहाँ आयात करना चाहते हैं?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'आप इन प्रश्नों को कहाँ जोड़ना चाहते हैं?';

  @override
  String get importAtBeginning => 'शुरुआत में';

  @override
  String get importAtEnd => 'अंत में';

  @override
  String questionsImportedSuccess(int count) {
    return 'सफलतापूर्वक $count प्रश्न आयात किए गए';
  }

  @override
  String get importQuestionsTooltip => 'दूसरी क्विज़ फ़ाइल से प्रश्न आयात करें';

  @override
  String get dragDropHintText =>
      'प्रश्न आयात करने के लिए आप .quiz फ़ाइलों को यहाँ ड्रैग और ड्रॉप भी कर सकते हैं';

  @override
  String get randomizeAnswersTitle => 'उत्तर विकल्पों को मिलाएं';

  @override
  String get randomizeAnswersDescription =>
      'क्विज़ निष्पादन के दौरान उत्तर विकल्पों का क्रम मिलाएं';

  @override
  String get showCorrectAnswerCountTitle => 'सही उत्तर संख्या दिखाएं';

  @override
  String get showCorrectAnswerCountDescription =>
      'बहुविकल्पीय प्रश्नों में सही उत्तरों की संख्या प्रदर्शित करें';

  @override
  String correctAnswersCount(int count) {
    return '$count सही उत्तर चुनें';
  }

  @override
  String get correctSelectedLabel => 'सही';

  @override
  String get correctMissedLabel => 'सही';

  @override
  String get incorrectSelectedLabel => 'गलत';

  @override
  String get aiGenerateDialogTitle => 'AI के साथ प्रश्न बनाएं';

  @override
  String get aiQuestionCountLabel => 'प्रश्नों की संख्या (वैकल्पिक)';

  @override
  String get aiQuestionCountHint => 'AI को निर्णय लेने के लिए खाली छोड़ें';

  @override
  String get aiQuestionCountValidation => '1 से 50 के बीच संख्या होनी चाहिए';

  @override
  String get aiQuestionTypeLabel => 'प्रश्न प्रकार';

  @override
  String get aiQuestionTypeRandom => 'यादृच्छिक (मिश्रित)';

  @override
  String get aiLanguageLabel => 'प्रश्न भाषा';

  @override
  String get aiContentLabel => 'प्रश्न बनाने के लिए सामग्री';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max शब्द';
  }

  @override
  String get aiContentHint =>
      'वह पाठ, विषय या सामग्री दर्ज करें जिससे आप प्रश्न बनाना चाहते हैं...';

  @override
  String get aiContentHelperText => 'AI इस सामग्री के आधार पर प्रश्न बनाएगा';

  @override
  String aiWordLimitError(int max) {
    return 'आपने $max शब्दों की सीमा पार कर दी है';
  }

  @override
  String get aiContentRequiredError =>
      'प्रश्न बनाने के लिए आपको सामग्री प्रदान करनी होगी';

  @override
  String aiContentLimitError(int max) {
    return 'सामग्री $max शब्दों की सीमा से अधिक है';
  }

  @override
  String get aiMinWordsError =>
      'गुणवत्तापूर्ण प्रश्न बनाने के लिए कम से कम 10 शब्द प्रदान करें';

  @override
  String get aiInfoTitle => 'जानकारी';

  @override
  String get aiInfoDescription =>
      '• AI सामग्री का विश्लेषण करके प्रासंगिक प्रश्न बनाएगा\n• यदि तुम 10 से कम शब्द लिखते हो, तो यह \'विषय\' (Topic) मोड में चला जाएगा जहाँ उन विशिष्ट विषयों के बारे में प्रश्न पूछे जाएंगे\n• 10 से अधिक शब्दों के साथ, यह \'सामग्री\' (Content) मोड में चला जाएगा जो उसी पाठ के बारे में प्रश्न पूछेगा (अधिक शब्द = अधिक सटीकता)\n• तुम पाठ, परिभाषाएं, स्पष्टीकरण या कोई भी शैक्षिक सामग्री शामिल कर सकते हो\n• प्रश्नों में उत्तर विकल्प और स्पष्टीकरण शामिल होंगे\n• इस प्रक्रिया में कुछ सेकंड लग सकते हैं';

  @override
  String get aiGenerateButton => 'प्रश्न बनाएं';

  @override
  String get aiEnterContentTitle => 'सामग्री दर्ज करें';

  @override
  String get aiEnterContentDescription =>
      'प्रश्न उत्पन्न करने के लिए विषय दर्ज करें या सामग्री पेस्ट करें';

  @override
  String get aiContentFieldHint =>
      '\"द्वितीय विश्व युद्ध का इतिहास\" जैसा कोई विषय दर्ज करें या यहां पाठ पेस्ट करें...';

  @override
  String get aiAttachFileHint => 'फ़ाइल संलग्न करें (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'फ़ाइल यहाँ छोड़ें';

  @override
  String get dropImageHere => 'छवि यहाँ छोड़ें';

  @override
  String get aiNumberQuestionsLabel => 'प्रश्नों की संख्या';

  @override
  String get backButton => 'वापस';

  @override
  String get generateButton => 'उत्पन्न करें';

  @override
  String aiTopicModeCount(int count) {
    return 'विषय मोड ($count शब्द)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'पाठ मोड ($count शब्द)';
  }

  @override
  String get aiGenerationCategoryLabel => 'सामग्री मोड';

  @override
  String get aiGenerationCategoryTheory => 'सिद्धांत';

  @override
  String get aiGenerationCategoryExercises => 'अभ्यास';

  @override
  String get aiGenerationCategoryBoth => 'मिश्रित';

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
  String get aiServicesLoading => 'AI सेवाएं लोड हो रही हैं...';

  @override
  String get aiServicesNotConfigured => 'कोई AI सेवा कॉन्फ़िगर नहीं की गई';

  @override
  String get aiGeneratedQuestions => 'AI द्वारा बनाए गए';

  @override
  String get aiApiKeyRequired =>
      'AI जेनरेशन का उपयोग करने के लिए कृपया सेटिंग्स में कम से कम एक AI API key कॉन्फ़िगर करें।';

  @override
  String get aiGenerationFailed =>
      'प्रश्न नहीं बना सके। अलग सामग्री के साथ प्रयास करें।';

  @override
  String get aiGenerationErrorTitle => 'प्रश्न बनाने में त्रुटि';

  @override
  String get noQuestionsInFile => 'आयातित फ़ाइल में कोई प्रश्न नहीं मिले';

  @override
  String get couldNotAccessFile => 'चयनित फ़ाइल तक पहुंच नहीं सकी';

  @override
  String get defaultOutputFileName => 'output-file.quiz';

  @override
  String get generateQuestionsWithAI => 'AI के साथ प्रश्न बनाएं';

  @override
  String get addQuestionsWithAI => 'AI के साथ प्रश्न जोड़ें';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'सीमा: $words शब्द या $chars अक्षर';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'सीमा: $words शब्द';
  }

  @override
  String get aiAssistantDisabled => 'AI सहायक अक्षम';

  @override
  String get enableAiAssistant =>
      'AI सहायक अक्षम है। AI सुविधाओं का उपयोग करने के लिए कृपया इसे सेटिंग्स में सक्षम करें।';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'न्यूनतम $minWords शब्द आवश्यक';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount शब्द ✓ उत्पन्न करने के लिए तैयार';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords शब्द ($moreNeeded और चाहिए)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'न्यूनतम $minWords शब्द आवश्यक ($moreNeeded और चाहिए)';
  }

  @override
  String get enableQuestion => 'प्रश्न सक्रिय करें';

  @override
  String get disableQuestion => 'प्रश्न निष्क्रिय करें';

  @override
  String get questionDisabled => 'निष्क्रिय';

  @override
  String get noEnabledQuestionsError =>
      'क्विज़ चलाने के लिए कोई सक्रिय प्रश्न उपलब्ध नहीं है';

  @override
  String get evaluateWithAI => 'AI के साथ मूल्यांकन करें';

  @override
  String get aiEvaluation => 'AI मूल्यांकन';

  @override
  String aiEvaluationError(String error) {
    return 'उत्तर का मूल्यांकन करने में त्रुटि: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'आप एक विशेषज्ञ शिक्षक हैं जो एक निबंध प्रश्न के लिए छात्र के उत्तर का मूल्यांकन कर रहे हैं। आपका कार्य विस्तृत और रचनात्मक मूल्यांकन प्रदान करना है। कृपया छात्र के उत्तर की भाषा में ही जवाब दें।';

  @override
  String get aiEvaluationPromptQuestion => 'प्रश्न:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'छात्र का उत्तर:';

  @override
  String get aiEvaluationPromptCriteria =>
      'मूल्यांकन मानदंड (शिक्षक की व्याख्या के आधार पर):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'विशिष्ट निर्देश:\n- मूल्यांकन करें कि छात्र का उत्तर स्थापित मानदंडों के साथ कितनी अच्छी तरह मेल खाता है\n- उत्तर में संश्लेषण और संरचना की डिग्री का विश्लेषण करें\n- पहचानें कि क्या मानदंडों के अनुसार कुछ महत्वपूर्ण छूट गया है\n- विश्लेषण की गहराई और सटीकता पर विचार करें';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'सामान्य निर्देश:\n- चूंकि कोई विशिष्ट मानदंड स्थापित नहीं हैं, सामान्य शैक्षणिक मानकों के आधार पर उत्तर का मूल्यांकन करें\n- उत्तर की स्पष्टता, सुसंगति और संरचना पर विचार करें\n- मूल्यांकन करें कि क्या उत्तर विषय की समझ प्रदर्शित करता है\n- विश्लेषण की गहराई और तर्कों की गुणवत्ता का विश्लेषण करें';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'उत्तर प्रारूप:\n1. ग्रेड: [X/10] - ग्रेड के लिए संक्षेप में औचित्य दें\n2. शक्तियां: उत्तर के सकारात्मक पहलुओं का उल्लेख करें\n3. सुधार के क्षेत्र: उन पहलुओं को इंगित करें जिन्हें सुधारा जा सकता है\n4. विशिष्ट टिप्पणियां: विस्तृत और रचनात्मक प्रतिक्रिया प्रदान करें\n5. सुझाव: सुधार के लिए विशिष्ट सिफारिशें प्रदान करें\n\nअपने मूल्यांकन में रचनात्मक, विशिष्ट और शैक्षिक बनें। लक्ष्य छात्र को सीखने और सुधारने में मदद करना है। उन्हें द्वितीय व्यक्ति में संबोधित करें और एक पेशेवर और मित्रवत स्वर का उपयोग करें।';

  @override
  String get raffleTitle => 'लॉटरी';

  @override
  String get raffleTooltip => 'लॉटरी स्क्रीन खोलें';

  @override
  String get participantListTitle => 'प्रतिभागियों की सूची';

  @override
  String get participantListHint => 'नई लाइन से अलग किए गए नाम दर्ज करें';

  @override
  String get participantListPlaceholder =>
      'प्रतिभागियों के नाम यहाँ दर्ज करें...\nएक लाइन में एक नाम';

  @override
  String get clearList => 'सूची साफ़ करें';

  @override
  String get participants => 'प्रतिभागी';

  @override
  String get noParticipants => 'कोई प्रतिभागी नहीं';

  @override
  String get addParticipantsHint => 'लॉटरी शुरू करने के लिए प्रतिभागी जोड़ें';

  @override
  String get activeParticipants => 'सक्रिय प्रतिभागी';

  @override
  String get alreadySelected => 'पहले से चुने गए';

  @override
  String totalParticipants(int count) {
    return 'कुल प्रतिभागी';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return '$active सक्रिय, $winners विजेता';
  }

  @override
  String get startRaffle => 'लॉटरी शुरू करें';

  @override
  String get raffling => 'लॉटरी हो रही है...';

  @override
  String get selectingWinner => 'विजेता चुना जा रहा है...';

  @override
  String get allParticipantsSelected => 'सभी प्रतिभागी चुने गए हैं';

  @override
  String get addParticipantsToStart =>
      'लॉटरी शुरू करने के लिए प्रतिभागी जोड़ें';

  @override
  String participantsReadyCount(int count) {
    return '$count प्रतिभागी लॉटरी के लिए तैयार';
  }

  @override
  String get resetWinners => 'विजेताओं को रीसेट करें';

  @override
  String get resetWinnersConfirmTitle => 'विजेताओं को रीसेट करें?';

  @override
  String get resetWinnersConfirmMessage =>
      'यह सभी विजेताओं को सक्रिय प्रतिभागी सूची में वापस कर देगा।';

  @override
  String get resetRaffleTitle => 'लॉटरी रीसेट करें?';

  @override
  String get resetRaffleConfirmMessage =>
      'यह सभी विजेताओं और सक्रिय प्रतिभागियों को रीसेट कर देगा।';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get reset => 'रीसेट करें';

  @override
  String get viewWinners => 'विजेता देखें';

  @override
  String get congratulations => '🎉 बधाई हो! 🎉';

  @override
  String positionLabel(int position) {
    return 'स्थिति $position';
  }

  @override
  String remainingParticipants(int count) {
    return 'शेष प्रतिभागी: $count';
  }

  @override
  String get continueRaffle => 'लॉटरी जारी रखें';

  @override
  String get finishRaffle => 'लॉटरी समाप्त करें';

  @override
  String get winnersTitle => 'विजेता';

  @override
  String get shareResults => 'परिणाम साझा करें';

  @override
  String get noWinnersYet => 'अभी तक कोई विजेता नहीं';

  @override
  String get performRaffleToSeeWinners => 'विजेता देखने के लिए लॉटरी करें';

  @override
  String get goToRaffle => 'लॉटरी पर जाएं';

  @override
  String get raffleCompleted => 'लॉटरी पूर्ण!';

  @override
  String winnersSelectedCount(int count) {
    return '$count विजेता चुने गए';
  }

  @override
  String get newRaffle => 'नई लॉटरी';

  @override
  String get shareResultsTitle => 'लॉटरी के परिणाम';

  @override
  String get raffleResultsLabel => 'लॉटरी के परिणाम:';

  @override
  String get close => 'बंद करें';

  @override
  String get share => 'कॉपी करें';

  @override
  String get shareNotImplemented => 'साझा करना अभी तक लागू नहीं है';

  @override
  String get firstPlace => 'पहला स्थान';

  @override
  String get secondPlace => 'दूसरा स्थान';

  @override
  String get thirdPlace => 'तीसरा स्थान';

  @override
  String nthPlace(int position) {
    return '$positionवां स्थान';
  }

  @override
  String placeLabel(String position) {
    return 'स्थान';
  }

  @override
  String get raffleResultsHeader => 'लॉटरी परिणाम - null विजेता';

  @override
  String totalWinners(int count) {
    return 'कुल विजेता: $count';
  }

  @override
  String get noWinnersToShare => 'साझा करने के लिए कोई विजेता नहीं';

  @override
  String get shareSuccess => 'परिणाम सफलतापूर्वक कॉपी किए गए';

  @override
  String get selectLogo => 'लोगो चुनें';

  @override
  String get logoUrl => 'लोगो URL';

  @override
  String get logoUrlHint =>
      'लॉटरी के लिए कस्टम लोगो के रूप में उपयोग करने के लिए एक छवि का URL दर्ज करें';

  @override
  String get invalidLogoUrl =>
      'अमान्य छवि URL। यह .jpg, .png, .gif, आदि में समाप्त होने वाला एक वैध URL होना चाहिए।';

  @override
  String get logoPreview => 'पूर्वावलोकन';

  @override
  String get removeLogo => 'लोगो हटाएं';

  @override
  String get logoTooLargeWarning =>
      'छवि बहुत बड़ी है और सहेजी नहीं जा सकती। इसका उपयोग केवल इस सत्र के दौरान किया जाएगा।';

  @override
  String get aiModeTopicTitle => 'विषय मोड';

  @override
  String get aiModeTopicDescription => 'विषय का रचनात्मक अन्वेषण';

  @override
  String get aiModeContentTitle => 'सामग्री मोड';

  @override
  String get aiModeContentDescription => 'आपके इनपुट पर आधारित सटीक प्रश्न';

  @override
  String aiWordCountIndicator(int count) {
    return '$count शब्द';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'सटीकता: $level';
  }

  @override
  String get aiPrecisionLow => 'कम';

  @override
  String get aiPrecisionMedium => 'मध्यम';

  @override
  String get aiPrecisionHigh => 'उच्च';

  @override
  String get aiMoreWordsMorePrecision => 'अधिक शब्द = अधिक सटीकता';

  @override
  String get aiKeepDraftTitle => 'AI ड्राफ्ट सुरक्षित रखें';

  @override
  String get aiKeepDraftDescription =>
      'AI जनरेशन डायलॉग में दर्ज टेक्स्ट को अपने आप सेव करें ताकि डायलॉग बंद होने पर वह खो न जाए।';

  @override
  String get aiAttachFile => 'फ़ाइल संलग्न करें';

  @override
  String get aiRemoveFile => 'फ़ाइल निकालें';

  @override
  String get aiFileMode => 'फ़ाइल मोड';

  @override
  String get aiFileModeDescription =>
      'संलग्न फ़ाइल से प्रश्न उत्पन्न किए जाएंगे';

  @override
  String get aiCommentsLabel => 'टिप्पणियाँ (वैकल्पिक)';

  @override
  String get aiCommentsHint =>
      'संलग्न फ़ाइल के बारे में निर्देश या टिप्पणियाँ जोड़ें...';

  @override
  String get aiCommentsHelperText =>
      'वैकल्पिक रूप से फ़ाइल से प्रश्न कैसे उत्पन्न करें, इस पर निर्देश जोड़ें';

  @override
  String get aiFilePickerError => 'चयनित फ़ाइल लोड नहीं की जा सकी';

  @override
  String get studyModeLabel => 'अध्ययन मोड';

  @override
  String get studyModeDescription => 'तत्काल प्रतिक्रिया और कोई टाइमर नहीं';

  @override
  String get examModeLabel => 'परीक्षा मोड';

  @override
  String get examModeDescription => 'मानक समय और अंत में परिणाम';

  @override
  String get checkAnswer => 'जांचें';

  @override
  String get quizModeTitle => 'क्विज़ मोड';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get askAiAssistant => 'AI सहायक से पूछें';

  @override
  String get sorteosLabel => 'Raffles';

  @override
  String get edit => 'संपादित करें';

  @override
  String get enable => 'सक्षम करें';

  @override
  String get disable => 'अक्षम करें';

  @override
  String get quizPreviewTitle => 'प्रश्नोत्तरी पूर्वावलोकन';

  @override
  String get select => 'चुनें';

  @override
  String get done => 'हो गया';

  @override
  String get importButton => 'आयात करें';

  @override
  String get reorderButton => 'पुनः क्रमित करें';

  @override
  String get startQuizButton => 'प्रश्नोत्तरी शुरू करें';

  @override
  String get deleteConfirmation =>
      'क्या आप वाकई इस प्रश्नोत्तरी को हटाना चाहते हैं?';

  @override
  String get saveSuccess => 'फ़ाइल सफलतापूर्वक सहेजी गई';

  @override
  String get errorSavingFile => 'फ़ाइल सहेजने में त्रुटि';

  @override
  String get deleteSingleQuestionConfirmation =>
      'क्या आप वाकई इस प्रश्न को हटाना चाहते हैं?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'क्या आप वाकई $count प्रश्नों को हटाना चाहते हैं?';
  }

  @override
  String get keepPracticing => 'सुधार के लिए अभ्यास जारी रखें!';

  @override
  String get tryAgain => 'फिर कोशिश करें';

  @override
  String get review => 'समीक्षा';

  @override
  String get home => 'होम';

  @override
  String get allLabel => 'सभी';

  @override
  String get subtractPointsLabel => 'गलत उत्तर के लिए अंक घटाएं';

  @override
  String get penaltyAmountLabel => 'दंड राशि';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount अंक / गलती';
  }

  @override
  String get allQuestionsLabel => 'सभी प्रश्न';

  @override
  String startWithSelectedQuestions(int count) {
    return '$count चयनित के साथ शुरू करें';
  }

  @override
  String get advancedSettingsTitle => 'उन्नत सेटिंग्स (डिबग)';

  @override
  String get appLanguageLabel => 'ऐप की भाषा';

  @override
  String get appLanguageDescription =>
      'परीक्षण के लिए एप्लिकेशन भाषा को ओवरराइड करें';
}
