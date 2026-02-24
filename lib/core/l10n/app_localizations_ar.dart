// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get abortQuizTitle => 'إلغاء Quiz؟';

  @override
  String get abortQuizMessage =>
      'سيؤدي فتح ملف جديد إلى إيقاف الاختبار الحالي.';

  @override
  String get stopAndOpenButton => 'إيقاف وفتح';

  @override
  String get titleAppBar => 'اختبار - محاكي الامتحان';

  @override
  String get create => 'إنشاء';

  @override
  String get preview => 'معاينة';

  @override
  String get previewLabel => 'معاينة:';

  @override
  String get emptyPlaceholder => '(فارغ)';

  @override
  String get latexSyntaxTitle => 'بناء جملة LaTeX:';

  @override
  String get latexSyntaxHelp =>
      'الرياضيات المضمنة: استخدم \$...\$ لتعبيرات LaTeX\nمثال: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'معاينة عرض LaTeX';

  @override
  String get okButton => 'موافق';

  @override
  String get load => 'تحميل';

  @override
  String fileLoaded(String filePath) {
    return 'تم تحميل الملف: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'تم حفظ الملف: $filePath';
  }

  @override
  String get dropFileHere => 'انقر فوق الشعار أو اسحب ملف .quiz إلى الشاشة';

  @override
  String get errorOpeningFile => 'خطأ في فتح الملف';

  @override
  String get replaceFileTitle => 'تحميل اختبار Quiz جديد';

  @override
  String get replaceFileMessage =>
      'هناك اختبار Quiz محمل بالفعل. هل تريد استبداله بالملف الجديد؟';

  @override
  String get replaceButton => 'تحميل';

  @override
  String get clickOrDragFile => 'انقر للتحميل أو اسحب ملف .quiz إلى الشاشة';

  @override
  String get errorInvalidFile => 'خطأ: ملف غير صالح. يجب أن يكون ملف .quiz.';

  @override
  String errorLoadingFile(String error) {
    return 'خطأ في تحميل ملف الاختبار: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'خطأ في تصدير الملف: $error';
  }

  @override
  String get cancelButton => 'إلغاء';

  @override
  String get saveButton => 'حفظ';

  @override
  String get confirmDeleteTitle => 'تأكيد الحذف';

  @override
  String confirmDeleteMessage(String processName) {
    return 'هل أنت متأكد من أنك تريد حذف العملية `$processName`؟';
  }

  @override
  String get deleteButton => 'حذف';

  @override
  String get confirmExitTitle => 'تأكيد الخروج';

  @override
  String get confirmExitMessage =>
      'هناك تغييرات غير محفوظة. هل تريد الخروج وتجاهل التغييرات؟';

  @override
  String get exitButton => 'خروج بدون حفظ';

  @override
  String get saveDialogTitle => 'يرجى اختيار ملف الإخراج:';

  @override
  String get createQuizFileTitle => 'إنشاء ملف اختبار';

  @override
  String get editQuizFileTitle => 'تعديل ملف الاختبار';

  @override
  String get fileNameLabel => 'اسم الملف';

  @override
  String get fileDescriptionLabel => 'وصف الملف';

  @override
  String get createButton => 'إنشاء';

  @override
  String get fileNameRequiredError => 'اسم الملف مطلوب.';

  @override
  String get fileDescriptionRequiredError => 'وصف الملف مطلوب.';

  @override
  String get versionLabel => 'الإصدار';

  @override
  String get authorLabel => 'المؤلف';

  @override
  String get authorRequiredError => 'المؤلف مطلوب.';

  @override
  String get requiredFieldsError => 'يجب ملء جميع الحقول المطلوبة.';

  @override
  String get requestFileNameTitle => 'أدخل اسم ملف الاختبار';

  @override
  String get fileNameHint => 'اسم الملف';

  @override
  String get emptyFileNameMessage => 'اسم الملف لا يمكن أن يكون فارغاً.';

  @override
  String get acceptButton => 'قبول';

  @override
  String get saveTooltip => 'حفظ الملف';

  @override
  String get saveDisabledTooltip => 'لا توجد تغييرات للحفظ';

  @override
  String get executeTooltip => 'تنفيذ الامتحان';

  @override
  String get addTooltip => 'إضافة سؤال جديد';

  @override
  String get backSemanticLabel => 'زر الرجوع';

  @override
  String get createFileTooltip => 'إنشاء ملف اختبار جديد';

  @override
  String get loadFileTooltip => 'تحميل ملف اختبار موجود';

  @override
  String questionNumber(int number) {
    return 'السؤال $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return 'السؤال $current من $total';
  }

  @override
  String get previous => 'السابق';

  @override
  String get skip => 'تخطي';

  @override
  String get questionsOverview => 'خريطة الأسئلة';

  @override
  String get next => 'التالي';

  @override
  String get finish => 'إنهاء';

  @override
  String get finishQuiz => 'إنهاء الاختبار';

  @override
  String get finishQuizConfirmation =>
      'هل أنت متأكد من أنك تريد إنهاء الاختبار؟ لن تتمكن من تغيير إجاباتك بعد ذلك.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount أسئلة غير مجابة',
      one: 'سؤال واحد غير مجاب',
    );
    return 'لديك $_temp0. هل أنت متأكد أنك تريد إنهاء الاختبار؟';
  }

  @override
  String get resolveUnansweredQuestions => 'حل الأسئلة';

  @override
  String get abandonQuiz => 'التخلي عن الاختبار';

  @override
  String get abandonQuizConfirmation =>
      'هل أنت متأكد من أنك تريد التخلي عن الاختبار؟ سيتم فقدان جميع التقدم.';

  @override
  String get abandon => 'التخلي';

  @override
  String get quizCompleted => 'تم إكمال الاختبار!';

  @override
  String score(String score) {
    return 'النتيجة: $score%';
  }

  @override
  String correctAnswers(String correct, int total) {
    return '$correct من $total إجابات صحيحة';
  }

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get goBack => 'إنهاء';

  @override
  String get retryFailedQuestions => 'إعادة الأسئلة الخاطئة';

  @override
  String question(String question) {
    return 'السؤال: $question';
  }

  @override
  String get selectQuestionCountTitle => 'اختر عدد الأسئلة';

  @override
  String get selectQuestionCountMessage =>
      'كم عدد الأسئلة التي تريد الإجابة عليها في هذا الاختبار؟';

  @override
  String allQuestions(int count) {
    return 'جميع الأسئلة ($count)';
  }

  @override
  String get startQuiz => 'بدء الاختبار';

  @override
  String get maxIncorrectAnswersLabel => 'تقييد الإجابات الخاطئة';

  @override
  String get maxIncorrectAnswersDescription =>
      'امتحان نجاح/رسوب. لا توجد درجة رقمية، إما أن تنجح أو ترسب.';

  @override
  String get maxIncorrectAnswersOffDescription =>
      'للامتحان درجة رقمية من 0 إلى 100.';

  @override
  String get maxIncorrectAnswersLimitLabel => 'الحد الأقصى للأخطاء المسموح بها';

  @override
  String get examFailedStatus => 'اختبار لم يجتز';

  @override
  String get examPassedStatus => 'اختبار اجتيز';

  @override
  String get quizFailedLimitReached =>
      'انتهى الاختبار: تم تجاوز الحد الأقصى للأخطاء المسموح بها';

  @override
  String get errorInvalidNumber => 'يرجى إدخال رقم صالح';

  @override
  String get errorNumberMustBePositive => 'يجب أن يكون الرقم أكبر من 0';

  @override
  String get customNumberLabel => 'أو أدخل رقماً مخصصاً:';

  @override
  String get numberInputLabel => 'عدد الأسئلة';

  @override
  String get questionOrderConfigTitle => 'إعداد ترتيب الأسئلة';

  @override
  String get questionOrderConfigDescription =>
      'اختر الترتيب الذي تريد أن تظهر به الأسئلة أثناء الامتحان:';

  @override
  String get questionOrderAscending => 'الترتيب التصاعدي';

  @override
  String get questionOrderAscendingDesc =>
      'ستظهر الأسئلة بترتيب من 1 إلى النهاية';

  @override
  String get questionOrderDescending => 'الترتيب التنازلي';

  @override
  String get questionOrderDescendingDesc => 'ستظهر الأسئلة من النهاية إلى 1';

  @override
  String get questionOrderRandom => 'ترتيب عشوائي للأسئلة';

  @override
  String get questionOrderRandomDesc => 'ستظهر الأسئلة بترتيب عشوائي';

  @override
  String get questionOrderConfigTooltip => 'إعداد ترتيب الأسئلة';

  @override
  String get reorderQuestionsTooltip => 'إعادة ترتيب الأسئلة';

  @override
  String get save => 'حفظ';

  @override
  String get examConfigurationTitle => 'إعدادات الامتحان';

  @override
  String get examTimeLimitTitle => 'حد وقت الامتحان';

  @override
  String get examTimeLimitDescription =>
      'قم بتعيين حد زمني للاختبار. سيتم عرض مؤقت تنازلي أثناء الاختبار.';

  @override
  String get examTimeLimitOffDescription => 'لا يوجد حد زمني لهذا الاختبار.';

  @override
  String get enableTimeLimit => 'تفعيل الحد الزمني';

  @override
  String get timeLimitMinutes => 'الحد الزمني (دقائق)';

  @override
  String get examTimeExpiredTitle => 'انتهى الوقت!';

  @override
  String get examTimeExpiredMessage =>
      'انتهى وقت الامتحان. تم تقديم إجاباتك تلقائياً.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'اختيار متعدد';

  @override
  String get questionTypeSingleChoice => 'اختيار واحد';

  @override
  String get questionTypeTrueFalse => 'صح/خطأ';

  @override
  String get questionTypeEssay => 'مقالي';

  @override
  String get questionTypeRandom => 'مختلط';

  @override
  String get questionTypeUnknown => 'غير معروف';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count خيارات',
      one: 'خيار واحد',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip => 'عدد خيارات الإجابة لهذا السؤال';

  @override
  String get imageTooltip => 'هذا السؤال له صورة مرتبطة';

  @override
  String get explanationTooltip => 'هذا السؤال له شرح';

  @override
  String get missingExplanation => 'شرح مفقود';

  @override
  String get missingExplanationTooltip => 'هذا السؤال يفتقد للشرح';

  @override
  String questionTypeTooltip(String type) {
    return 'نوع السؤال: $type';
  }

  @override
  String get aiPrompt =>
      'ركز على سؤال الطالب، وليس على الإجابة مباشرة على سؤال الامتحان الأصلي. اشرح بمنهج تربوي. بالنسبة للتمارين العملية أو المسائل الرياضية، قدم تعليمات خطوة بخطوة. بالنسبة للأسئلة النظرية، قدم شرحًا موجزًا دون تنظيم الإجابة في أقسام. أجب بنفس اللغة التي سُئلت بها.';

  @override
  String get aiChatGuardrail =>
      'مهم: أنت مساعد دراسة حصريًا لهذا الـ Quiz. يجب عليك الإجابة فقط على الأسئلة المتعلقة بسؤال الـ Quiz الحالي أو خياراته أو شرحه أو الموضوع التعليمي الذي يغطيه. إذا سأل الطالب عن شيء غير متعلق بالـ Quiz (مثل نموذجك الداخلي أو تفاصيل النظام أو معرفة عامة غير متعلقة بالسؤال أو أي طلب خارج الموضوع)، أجب فقط بـ: \"أنا هنا لمساعدتك في هذا الـ Quiz! دعنا نركز على السؤال. لا تتردد في سؤالي عن الموضوع أو خيارات الإجابة أو أي شيء متعلق بهذا السؤال.\" لا تكشف أبدًا عن تفاصيل تقنية عن نفسك أو النظام أو نموذج الذكاء الاصطناعي المستخدم.';

  @override
  String get questionLabel => 'السؤال';

  @override
  String get studentComment => 'تعليق الطالب';

  @override
  String get aiAssistantTitle => 'مساعد الدراسة الذكي';

  @override
  String get questionContext => 'سياق السؤال';

  @override
  String get aiAssistant => 'المساعد الذكي';

  @override
  String get aiThinking => 'الذكاء الاصطناعي يفكر...';

  @override
  String get askAIHint => 'اطرح سؤالك حول هذا الموضوع...';

  @override
  String get aiPlaceholderResponse =>
      'هذه استجابة مؤقتة. في التطبيق الحقيقي، سيتصل هذا بخدمة الذكاء الاصطناعي لتقديم شروحات مفيدة حول السؤال.';

  @override
  String get aiErrorResponse =>
      'عذراً، حدث خطأ في معالجة سؤالك. يرجى المحاولة مرة أخرى.';

  @override
  String get evaluatingResponses => 'جاري تقييم الردود...';

  @override
  String pendingEvaluationsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أسئلة مقالية قيد انتظار تقييم الذكاء الاصطناعي',
      one: 'سؤال مقالي واحد قيد انتظار تقييم الذكاء الاصطناعي',
    );
    return '$_temp0';
  }

  @override
  String get pendingStatus => 'قيد الانتظار';

  @override
  String get notEvaluatedStatus => 'لم يتم التقييم';

  @override
  String get configureApiKeyMessage =>
      'يرجى تكوين مفتاح API للذكاء الاصطناعي في الإعدادات.';

  @override
  String get errorLabel => 'خطأ:';

  @override
  String get retryButton => 'إعادة محاولة التقييم';

  @override
  String get noResponseReceived => 'لم يتم استلام رد';

  @override
  String get invalidApiKeyError =>
      'مفتاح API غير صالح. يرجى التحقق من مفتاح OpenAI API في الإعدادات.';

  @override
  String get rateLimitError =>
      'تم تجاوز الحصة أو أن النموذج غير متوفر في خطتك. تحقق من خطتك.';

  @override
  String get modelNotFoundError =>
      'النموذج غير موجود. يرجى التحقق من إمكانية الوصول إلى API.';

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get networkErrorOpenAI =>
      'خطأ في الشبكة: تعذر الاتصال بـ OpenAI. يرجى التحقق من اتصالك بالإنترنت.';

  @override
  String get networkErrorGemini =>
      'خطأ في الشبكة: تعذر الاتصال بـ Gemini. يرجى التحقق من اتصالك بالإنترنت.';

  @override
  String get openaiApiKeyNotConfigured => 'مفتاح OpenAI API غير مُكوَّن';

  @override
  String get geminiApiKeyNotConfigured => 'مفتاح Gemini API غير مُكوَّن';

  @override
  String get geminiApiKeyLabel => 'مفتاح Gemini API';

  @override
  String get geminiApiKeyHint => 'أدخل مفتاح Gemini API الخاص بك';

  @override
  String get geminiApiKeyDescription =>
      'مطلوب لوظائف Gemini AI. يتم تخزين مفتاحك بأمان.';

  @override
  String get getGeminiApiKeyTooltip => 'احصل على مفتاح API من Google AI Studio';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'يتطلب مساعد الدراسة الذكي مفتاح API واحدًا على الأقل (Gemini أو OpenAI). يرجى إدخال مفتاح API أو تعطيل المساعد الذكي.';

  @override
  String get minutesAbbreviation => 'د';

  @override
  String get aiButtonTooltip => 'مساعد الدراسة الذكي';

  @override
  String get aiButtonText => 'AI';

  @override
  String get aiAssistantSettingsTitle => 'مساعد الدراسة الذكي (معاينة)';

  @override
  String get aiAssistantSettingsDescription =>
      'تفعيل أو تعطيل مساعد الدراسة الذكي للأسئلة';

  @override
  String get aiDefaultModelTitle => 'نموذج الذكاء الاصطناعي الافتراضي';

  @override
  String get aiDefaultModelDescription =>
      'حدد خدمة ونموذج الذكاء الاصطناعي الافتراضي لتوليد الأسئلة';

  @override
  String get openaiApiKeyLabel => 'مفتاح OpenAI API';

  @override
  String get openaiApiKeyHint => 'أدخل مفتاح OpenAI API الخاص بك (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'مطلوب للتكامل مع OpenAI. يتم تخزين مفتاح OpenAI الخاص بك بأمان.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'مساعد الدراسة الذكي يتطلب مفتاح OpenAI API. يرجى إدخال مفتاح API أو تعطيل المساعد الذكي.';

  @override
  String get getApiKeyTooltip => 'احصل على مفتاح API من OpenAI';

  @override
  String get deleteAction => 'حذف';

  @override
  String get explanationLabel => 'الشرح (اختياري)';

  @override
  String get explanationHint => 'أدخل شرحاً للإجابة/الإجابات الصحيحة';

  @override
  String get explanationTitle => 'الشرح';

  @override
  String get imageLabel => 'الصورة';

  @override
  String get changeImage => 'تغيير الصورة';

  @override
  String get removeImage => 'إزالة الصورة';

  @override
  String get addImageTap => 'انقر لإضافة صورة';

  @override
  String get imageFormats => 'التنسيقات: JPG، PNG، GIF';

  @override
  String get imageLoadError => 'خطأ في تحميل الصورة';

  @override
  String imagePickError(String error) {
    return 'خطأ في تحميل الصورة: $error';
  }

  @override
  String get tapToZoom => 'انقر للتكبير';

  @override
  String get trueLabel => 'صحيح';

  @override
  String get falseLabel => 'خطأ';

  @override
  String get addQuestion => 'إضافة سؤال';

  @override
  String get editQuestion => 'تحرير السؤال';

  @override
  String get questionText => 'نص السؤال';

  @override
  String get questionType => 'نوع السؤال';

  @override
  String get addOption => 'إضافة خيار';

  @override
  String get optionsLabel => 'الخيارات';

  @override
  String get optionLabel => 'الخيار';

  @override
  String get questionTextRequired => 'نص السؤال مطلوب';

  @override
  String get atLeastOneOptionRequired =>
      'يجب أن يحتوي خيار واحد على الأقل على نص';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'يجب اختيار إجابة صحيحة واحدة على الأقل';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'إجابة صحيحة واحدة فقط مسموحة لهذا النوع من الأسئلة';

  @override
  String get removeOption => 'إزالة الخيار';

  @override
  String get selectCorrectAnswer => 'اختر الإجابة الصحيحة';

  @override
  String get selectCorrectAnswers => 'اختر الإجابات الصحيحة';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'الخيارات $optionNumbers فارغة. يرجى إضافة نص إليها أو إزالتها.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'الخيار $optionNumber فارغ. يرجى إضافة نص إليه أو إزالته.';
  }

  @override
  String get optionEmptyError => 'هذا الخيار لا يمكن أن يكون فارغاً';

  @override
  String get hasImage => 'صورة';

  @override
  String get hasExplanation => 'شرح';

  @override
  String errorLoadingSettings(String error) {
    return 'خطأ في تحميل الإعدادات: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'لا يمكن فتح $url';
  }

  @override
  String get loadingAiServices => 'جاري تحميل خدمات الذكاء الاصطناعي...';

  @override
  String usingAiService(String serviceName) {
    return 'الاستخدام: $serviceName';
  }

  @override
  String get aiServiceLabel => 'خدمة الذكاء الاصطناعي:';

  @override
  String get aiModelLabel => 'النموذج:';

  @override
  String get importQuestionsTitle => 'استيراد الأسئلة';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return 'وجدت $count أسئلة في \"$fileName\". أين تريد استيرادها؟';
  }

  @override
  String get importQuestionsPositionQuestion => 'أين تريد إضافة هذه الأسئلة؟';

  @override
  String get importAtBeginning => 'في البداية';

  @override
  String get importAtEnd => 'في النهاية';

  @override
  String questionsImportedSuccess(int count) {
    return 'تم استيراد $count أسئلة بنجاح';
  }

  @override
  String get importQuestionsTooltip => 'استيراد أسئلة من ملف اختبار آخر';

  @override
  String get dragDropHintText =>
      'يمكنك أيضاً سحب وإفلات ملفات .quiz هنا لاستيراد الأسئلة';

  @override
  String get randomizeQuestionsTitle => 'عشوائية الأسئلة';

  @override
  String get randomizeQuestionsDescription =>
      'خلط ترتيب الأسئلة أثناء تنفيذ الاختبار';

  @override
  String get randomizeQuestionsOffDescription =>
      'ستظهر الأسئلة بترتيبها الأصلي';

  @override
  String get randomizeAnswersTitle => 'ترتيب عشوائي للإجابات';

  @override
  String get randomizeAnswersDescription =>
      'خلط ترتيب خيارات الإجابة أثناء تنفيذ الاختبار';

  @override
  String get randomizeAnswersOffDescription =>
      'ستظهر خيارات الإجابة بترتيبها الأصلي';

  @override
  String get showCorrectAnswerCountTitle => 'إظهار عدد الإجابات الصحيحة';

  @override
  String get showCorrectAnswerCountDescription =>
      'عرض عدد الإجابات الصحيحة في أسئلة الاختيار المتعدد';

  @override
  String get showCorrectAnswerCountOffDescription =>
      'لن يتم عرض عدد الإجابات الصحيحة لأسئلة الاختيار من متعدد';

  @override
  String correctAnswersCount(int count) {
    return 'اختر $count إجابات صحيحة';
  }

  @override
  String get correctSelectedLabel => 'صحيح';

  @override
  String get correctMissedLabel => 'صحيح';

  @override
  String get incorrectSelectedLabel => 'خطأ';

  @override
  String get aiGenerateDialogTitle => 'إنتاج أسئلة بالذكاء الاصطناعي';

  @override
  String get aiQuestionCountLabel => 'عدد الأسئلة (اختياري)';

  @override
  String get aiQuestionCountHint => 'اتركه فارغاً ليقرر الذكاء الاصطناعي';

  @override
  String get aiQuestionCountValidation => 'يجب أن يكون رقماً بين 1 و 50';

  @override
  String get aiQuestionTypeLabel => 'نوع السؤال';

  @override
  String get aiQuestionTypeRandom => 'عشوائي (مختلط)';

  @override
  String get aiLanguageLabel => 'لغة الأسئلة';

  @override
  String get aiContentLabel => 'المحتوى لإنتاج الأسئلة منه';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max كلمة';
  }

  @override
  String get aiContentHint =>
      'أدخل النص أو الموضوع أو المحتوى الذي تريد إنتاج أسئلة منه...';

  @override
  String get aiContentHelperText =>
      'سينشئ الذكاء الاصطناعي أسئلة بناءً على هذا المحتوى';

  @override
  String aiWordLimitError(int max) {
    return 'لقد تجاوزت حد $max كلمة';
  }

  @override
  String get aiContentRequiredError => 'يجب أن تقدم محتوى لإنتاج الأسئلة';

  @override
  String aiContentLimitError(int max) {
    return 'المحتوى يتجاوز حد $max كلمة';
  }

  @override
  String get aiMinWordsError =>
      'قدم 10 كلمات على الأقل لإنتاج أسئلة عالية الجودة';

  @override
  String get aiInfoTitle => 'معلومات';

  @override
  String get aiInfoDescription =>
      '• سيحلل الذكاء الاصطناعي المحتوى وينتج أسئلة ذات صلة\n• إذا كتبت أقل من 10 كلمات، فستدخل في وضع الموضوع حيث سيطرح أسئلة حول تلك المواضيع المحددة\n• مع أكثر من 10 كلمات ستدخل في وضع المحتوى الذي سيطرح أسئلة حول النص نفسه (مزيد من الكلمات = مزيد من الدقة)\n• يمكنك تضمين نصوص وتعريفات وشروحات أو أي مادة تعليمية\n• ستتضمن الأسئلة خيارات إجابة وشروحات\n• قد تستغرق العملية بضع ثوانٍ';

  @override
  String get aiGenerateButton => 'إنتاج الأسئلة';

  @override
  String get aiEnterContentTitle => 'إدخال المحتوى';

  @override
  String get aiEnterContentDescription =>
      'أدخل الموضوع أو الصق المحتوى لتوليد الأسئلة منه';

  @override
  String get aiContentFieldHint =>
      'أدخل موضوعاً مثل \"تاريخ الحرب العالمية الثانية\" أو الصق محتوى نصي هنا...';

  @override
  String get aiAttachFileHint => 'إرفاق ملف (PDF، TXT، MP3، MP4،...)';

  @override
  String get dropAttachmentHere => 'أفلت الملف هنا';

  @override
  String get dropImageHere => 'أفلت الصورة هنا';

  @override
  String get aiNumberQuestionsLabel => 'عدد الأسئلة';

  @override
  String get backButton => 'رجوع';

  @override
  String get generateButton => 'توليد';

  @override
  String aiTopicModeCount(int count) {
    return 'وضع الموضوع ($count كلمات)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'وضع النص ($count كلمات)';
  }

  @override
  String get aiGenerationCategoryLabel => 'وضع المحتوى';

  @override
  String get aiGenerationCategoryTheory => 'نظرية';

  @override
  String get aiGenerationCategoryExercises => 'تمارين';

  @override
  String get aiGenerationCategoryBoth => 'مختلط';

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
  String get aiServicesLoading => 'جاري تحميل خدمات الذكاء الاصطناعي...';

  @override
  String get aiServicesNotConfigured => 'لم يتم تكوين خدمات الذكاء الاصطناعي';

  @override
  String get aiGeneratedQuestions => 'منتج بالذكاء الاصطناعي';

  @override
  String get aiApiKeyRequired =>
      'يرجى تكوين مفتاح API واحد على الأقل للذكاء الاصطناعي في الإعدادات لاستخدام الإنتاج بالذكاء الاصطناعي.';

  @override
  String get aiGenerationFailed =>
      'لم أتمكن من إنتاج الأسئلة. جرب بمحتوى مختلف.';

  @override
  String get aiGenerationErrorTitle => 'خطأ في إنتاج الأسئلة';

  @override
  String get noQuestionsInFile => 'لم توجد أسئلة في الملف المستورد';

  @override
  String get couldNotAccessFile => 'لا يمكن الوصول إلى الملف المحدد';

  @override
  String get defaultOutputFileName => 'output-file.quiz';

  @override
  String get generateQuestionsWithAI => 'إنتاج أسئلة بالذكاء الاصطناعي';

  @override
  String get addQuestionsWithAI => 'إضافة أسئلة باستخدام الذكاء الاصطناعي';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'الحد: $words كلمة أو $chars حرف';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'الحد: $words كلمة';
  }

  @override
  String get aiAssistantDisabled => 'مساعد الذكاء الاصطناعي معطل';

  @override
  String get enableAiAssistant =>
      'مساعد الذكاء الاصطناعي معطل. يرجى تفعيله في الإعدادات لاستخدام ميزات الذكاء الاصطناعي.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'مطلوب الحد الأدنى $minWords كلمة';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount كلمة ✓ جاهز للتوليد';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords كلمة (نحتاج $moreNeeded أكثر)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'مطلوب الحد الأدنى $minWords كلمة (نحتاج $moreNeeded أكثر)';
  }

  @override
  String get enableQuestion => 'تفعيل السؤال';

  @override
  String get disableQuestion => 'تعطيل السؤال';

  @override
  String get questionDisabled => 'معطل';

  @override
  String get noEnabledQuestionsError => 'لا توجد أسئلة مفعلة لتشغيل الاختبار';

  @override
  String get evaluateWithAI => 'تقييم بالذكاء الاصطناعي';

  @override
  String get aiEvaluation => 'تقييم الذكاء الاصطناعي';

  @override
  String aiEvaluationError(String error) {
    return 'خطأ في تقييم الإجابة: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'أنت مدرس خبير تقيم إجابة طالب على سؤال مقال. مهمتك هي تقديم تقييم مفصل وبناء. أجب بنفس لغة إجابة الطالب.';

  @override
  String get aiEvaluationPromptQuestion => 'السؤال:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'إجابة الطالب:';

  @override
  String get aiEvaluationPromptCriteria =>
      'معايير التقييم (بناءً على شرح المعلم):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'تعليمات محددة:\n- قيم مدى توافق إجابة الطالب مع المعايير المحددة\n- حلل درجة التركيب والهيكل في الإجابة\n- حدد إذا كان هناك شيء مهم مفقود وفقاً للمعايير\n- اعتبر عمق ودقة التحليل';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'تعليمات عامة:\n- بما أنه لا توجد معايير محددة، قيم الإجابة بناءً على المعايير الأكاديمية العامة\n- اعتبر الوضوح والتماسك وهيكل الإجابة\n- قيم إذا كانت الإجابة تظهر فهماً للموضوع\n- حلل عمق التحليل وجودة الحجج';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'تنسيق الإجابة:\n1. الدرجة: [X/10] - اذكر مبرراً مختصراً للدرجة\n2. نقاط القوة: اذكر الجوانب الإيجابية في الإجابة\n3. مجالات التحسين: أشر إلى الجوانب التي يمكن تحسينها\n4. تعليقات محددة: قدم ملاحظات مفصلة وبناءة\n5. اقتراحات: قدم توصيات محددة للتحسين\n\nكن بناءً ومحدداً وتعليمياً في تقييمك. الهدف هو مساعدة الطالب على التعلم والتحسن. اخاطبه بصيغة المخاطب واستخدم نبرة مهنية وودية.';

  @override
  String get aiModeTopicTitle => 'وضع الموضوع';

  @override
  String get aiModeTopicDescription => 'استكشاف إبداعي للموضوع';

  @override
  String get aiModeContentTitle => 'وضع المحتوى';

  @override
  String get aiModeContentDescription => 'أسئلة دقيقة بناءً على مدخلاتك';

  @override
  String aiWordCountIndicator(int count) {
    return '$count كلمة';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'الدقة: $level';
  }

  @override
  String get aiPrecisionLow => 'منخفضة';

  @override
  String get aiPrecisionMedium => 'متوسطة';

  @override
  String get aiPrecisionHigh => 'عالية';

  @override
  String get aiMoreWordsMorePrecision => 'كلمات أكثر = دقة أعلى';

  @override
  String get aiKeepDraftTitle => 'حفظ مسودة الذكاء الاصطناعي';

  @override
  String get aiKeepDraftDescription =>
      'حفظ النص المدخل في مربع حوار توليد الذكاء الاصطناعي تلقائيًا حتى لا يضيع إذا تم إغلاق مربع الحوار.';

  @override
  String get aiAttachFile => 'إرفاق ملف';

  @override
  String get aiRemoveFile => 'إزالة ملف';

  @override
  String get aiFileMode => 'وضع الملف';

  @override
  String get aiFileModeDescription => 'سيتم توليد الأسئلة من الملف المرفق';

  @override
  String get aiCommentsLabel => 'تعليقات (اختياري)';

  @override
  String get aiCommentsHint => 'أضف تعليمات أو تعليقات بخصوص الملف المرفق...';

  @override
  String get aiCommentsHelperText =>
      'يمكنك إضافة تعليمات اختيارية حول كيفية توليد الأسئلة من الملف';

  @override
  String get aiFilePickerError => 'تعذر تحميل الملف المحدد';

  @override
  String get studyModeLabel => 'وضع الدراسة';

  @override
  String get studyModeDescription =>
      'مساعدة الذكاء الاصطناعي متاحة. تعليقات فورية بعد كل إجابة بدون حدود زمنية أو عقوبات.';

  @override
  String get examModeLabel => 'وضع الاختبار';

  @override
  String get examModeDescription =>
      'بدون مساعدة الذكاء الاصطناعي. قد يتم تطبيق حدود زمنية وعقوبات على الإجابات غير الصحيحة.';

  @override
  String get checkAnswer => 'تحقق';

  @override
  String get quizModeTitle => 'وضع الاختبار';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get askAiAssistant => 'اسأل مساعد الذكاء الاصطناعي';

  @override
  String get askAiAboutQuestion => 'اسأل الذكاء الاصطناعي عن هذا السؤال';

  @override
  String get aiHelpWithQuestion => 'ساعدني في فهم هذا السؤال';

  @override
  String get edit => 'تعديل';

  @override
  String get enable => 'تفعيل';

  @override
  String get disable => 'تعطيل';

  @override
  String get quizPreviewTitle => 'معاينة الاختبار';

  @override
  String get select => 'تحديد';

  @override
  String get done => 'تم';

  @override
  String get importButton => 'استيراد';

  @override
  String get reorderButton => 'إعادة ترتيب';

  @override
  String get startQuizButton => 'بدء الاختبار';

  @override
  String get deleteConfirmation => 'هل أنت متأكد أنك تريد حذف هذا الاختبار؟';

  @override
  String get saveSuccess => 'تم حفظ الملف بنجاح';

  @override
  String get errorSavingFile => 'خطأ في حفظ الملف';

  @override
  String get deleteSingleQuestionConfirmation =>
      'هل أنت متأكد أنك تريد حذف هذا السؤال؟';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'هل أنت متأكد أنك تريد حذف $count أسئلة؟';
  }

  @override
  String get keepPracticing => 'استمر في التدريب للتحسن!';

  @override
  String get tryAgain => 'إعادة المحاولة';

  @override
  String get review => 'مراجعة';

  @override
  String get home => 'الرئيسية';

  @override
  String get allLabel => 'الكل';

  @override
  String get subtractPointsLabel => 'خصم نقاط للإجابة الخاطئة';

  @override
  String get subtractPointsDescription => 'خصم نقاط عن كل إجابة خاطئة.';

  @override
  String get subtractPointsOffDescription => 'الإجابات الخاطئة لا تخصم نقاطا.';

  @override
  String get penaltyAmountLabel => 'مبلغ الغرامة';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount نقاط / خطأ';
  }

  @override
  String get allQuestionsLabel => 'جميع الأسئلة';

  @override
  String startWithSelectedQuestions(int count) {
    return 'ابدأ بـ $count محددة';
  }

  @override
  String get advancedSettingsTitle => 'إعدادات متقدمة (تصحيح الأخطاء)';

  @override
  String get appLanguageLabel => 'لغة التطبيق';

  @override
  String get appLanguageDescription => 'تجاوز لغة التطبيق للاختبار';

  @override
  String get pasteFromClipboard => 'لصق من الحافظة';

  @override
  String get pasteImage => 'لصق';

  @override
  String get clipboardNoImage => 'لم يتم العثور على صورة في الحافظة';

  @override
  String get close => 'إغلاق';

  @override
  String get scoringAndLimitsTitle => 'الدرجات والحدود';

  @override
  String get congratulations => '🎉 تهانينا! 🎉';

  @override
  String get validationMin1Error => 'دقيقة واحدة كحد أدنى';

  @override
  String remainingTimeWithDays(
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '$daysي $hours:$minutes:$seconds';
  }

  @override
  String remainingTimeWithWeeks(
    String weeks,
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '$weeksأ $daysي $hours:$minutes:$seconds';
  }

  @override
  String get validationMax30DaysError => 'كحد أقصى 30 يومًا';

  @override
  String get validationMin0GenericError => 'بحد أدنى 0';

  @override
  String get errorStatus => 'خطأ';

  @override
  String get featureComingSoon =>
      'الميزة قادمة قريبا! ابقَ على اطلاع على التحديثات.';

  @override
  String get showOnboarding => 'عرض العرض الترحيبي';

  @override
  String get showOnboardingDescription =>
      'عرض البرنامج التعليمي الترحيبي مرة أخرى';

  @override
  String get onboardingBack => 'عودة';

  @override
  String get onboardingGetStarted => 'ابدأ الآن';

  @override
  String get onboardingWelcomeTitle => 'مرحباً بك في QuizLab AI';

  @override
  String get onboardingWelcomeDescription =>
      'رفيقك التفاعلي للاختبارات مع ميزات مدعومة بالذكاء الاصطناعي، وأسئلة قابلة للتخصيص، وتسجيل في الوقت الفعلي.';

  @override
  String get onboardingWelcomeSubtitle => 'رفيقك التفاعلي للاختبارات';

  @override
  String get onboardingStartQuizTitle => 'ابدأ اختباراً';

  @override
  String get onboardingStartQuizDescription =>
      'قم بتحميل ملف .quiz موجود أو أنشئ ملفاً جديداً من الصفر. اسحب الملفات وأفلتها مباشرة أو استخدم منتقي الملفات.';

  @override
  String get onboardingStartQuizSubtitle => 'تحميل، إنشاء، ولعب';

  @override
  String get onboardingCreateQuestionsTitle => 'إنشاء أسئلة';

  @override
  String get onboardingCreateQuestionsDescription =>
      'قم ببناء اختبارات بأنواع أسئلة متعددة. خصص كل سؤال بالخيارات، والإجابات الصحيحة، والشروحات.';

  @override
  String get onboardingCreateQuestionsSubtitle => 'صمم اختباراتك الخاصة';

  @override
  String get onboardingAiFeaturesTitle => 'ميزات مدعومة بالذكاء الاصطناعي';

  @override
  String get onboardingAiFeaturesDescription =>
      'قم بتوليد الأسئلة تلقائياً باستخدام الذكاء الاصطناعي، واحصل على مساعدة دراسية في الوقت الفعلي، وتعلّم بذكاء أكبر مع التدريس الذكي.';

  @override
  String get onboardingAiFeaturesSubtitle => 'مدعوم بالذكاء الاصطناعي';

  @override
  String get onboardingFeatureAiTitle => 'توليد الأسئلة بالذكاء الاصطناعي';

  @override
  String get onboardingFeatureAiDescription =>
      'توليد اختبارات من أي نص باستخدام GPT أو Gemini';

  @override
  String get onboardingFeatureTypesTitle => 'أنواع أسئلة متعددة';

  @override
  String get onboardingFeatureTypesDescription =>
      'اختيار واحد، اختيار متعدد، صح/خطأ، ومقالي';

  @override
  String get onboardingFeatureLanguagesTitle => 'دعم 13 لغة';

  @override
  String get onboardingFeatureLanguagesDescription =>
      'إنشاء وإجراء الاختبارات بلغات متعددة';

  @override
  String get onboardingStepCreateTitle => 'إنشاء اختبار';

  @override
  String get onboardingStepCreateDescription => 'ابدأ من الصفر بأسئلتك الخاصة';

  @override
  String get onboardingStepLoadTitle => 'تحميل ملف';

  @override
  String get onboardingStepLoadDescription => 'استيراد ملف .quiz من جهازك';

  @override
  String get onboardingStepTakeTitle => 'إجراء الاختبار';

  @override
  String get onboardingStepTakeDescription =>
      'أجب عن الأسئلة واحصل على النتائج في الوقت الفعلي';

  @override
  String get onboardingAiAutoGenerateTitle => 'توليد تلقائي للأسئلة';

  @override
  String get onboardingAiAutoGenerateDescription =>
      'من أي نص باستخدام GPT أو Gemini';

  @override
  String get onboardingAiStudyAssistantTitle =>
      'مساعد الدراسة بالذكاء الاصطناعي';

  @override
  String get onboardingAiStudyAssistantDescription =>
      'احصل على شروحات أثناء التعلم';

  @override
  String get onboardingAiMultiLanguageTitle => 'دعم لغات متعددة';

  @override
  String get onboardingAiMultiLanguageDescription => 'توليد بـ 13 لغة مختلفة';
}
