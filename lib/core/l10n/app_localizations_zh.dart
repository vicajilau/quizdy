// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get abortQuizTitle => '中止Quiz？';

  @override
  String get abortQuizMessage => '打开新文件将停止当前测验。';

  @override
  String get stopAndOpenButton => '停止并打开';

  @override
  String get titleAppBar => '测验 - 考试模拟器';

  @override
  String get create => '创建';

  @override
  String get preview => '预览';

  @override
  String get previewLabel => '预览：';

  @override
  String get emptyPlaceholder => '(空)';

  @override
  String get latexSyntaxTitle => 'LaTeX 语法：';

  @override
  String get latexSyntaxHelp =>
      '行内数学公式：使用 \$...\$ 包裹 LaTeX 表达式\n示例：\$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => '预览 LaTeX 渲染';

  @override
  String get okButton => '确定';

  @override
  String get load => '加载';

  @override
  String fileLoaded(String filePath) {
    return '文件已加载：$filePath';
  }

  @override
  String fileSaved(String filePath) {
    return '文件已保存：$filePath';
  }

  @override
  String get dropFileHere => '点击徽标或将 .quiz 文件拖到屏幕上';

  @override
  String get errorOpeningFile => '打开文件时出错';

  @override
  String get replaceFileTitle => '加载新 Quiz';

  @override
  String get replaceFileMessage => '已加载一个 Quiz。您要用新文件替换它吗？';

  @override
  String get replaceButton => '加载';

  @override
  String get clickOrDragFile => '点击加载或将 .quiz 文件拖动到屏幕上';

  @override
  String get errorInvalidFile => '错误：无效文件。必须是.quiz文件。';

  @override
  String errorLoadingFile(String error) {
    return '加载测验文件时出错：$error';
  }

  @override
  String errorExportingFile(String error) {
    return '导出文件时出错：$error';
  }

  @override
  String get cancelButton => '取消';

  @override
  String get saveButton => '保存';

  @override
  String get confirmDeleteTitle => '确认删除';

  @override
  String confirmDeleteMessage(String processName) {
    return '您确定要删除\"$processName\"过程吗？';
  }

  @override
  String get deleteButton => '删除';

  @override
  String get confirmExitTitle => '确认退出';

  @override
  String get confirmExitMessage => '有未保存的更改。您要放弃更改并离开吗？';

  @override
  String get exitButton => '退出不保存';

  @override
  String get saveDialogTitle => '请选择输出文件：';

  @override
  String get createQuizFileTitle => '创建测验文件';

  @override
  String get editQuizFileTitle => '编辑测验文件';

  @override
  String get fileNameLabel => '文件名';

  @override
  String get fileDescriptionLabel => '文件描述';

  @override
  String get createButton => '创建';

  @override
  String get fileNameRequiredError => '文件名是必需的。';

  @override
  String get fileDescriptionRequiredError => '文件描述是必需的。';

  @override
  String get versionLabel => '版本';

  @override
  String get authorLabel => '作者';

  @override
  String get authorRequiredError => '作者是必需的。';

  @override
  String get requiredFieldsError => '所有必填字段都必须填写。';

  @override
  String get requestFileNameTitle => '输入测验文件名';

  @override
  String get fileNameHint => '文件名';

  @override
  String get emptyFileNameMessage => '文件名不能为空。';

  @override
  String get acceptButton => '接受';

  @override
  String get saveTooltip => '保存文件';

  @override
  String get saveDisabledTooltip => '没有需要保存的更改';

  @override
  String get executeTooltip => '执行考试';

  @override
  String get addTooltip => '添加新问题';

  @override
  String get backSemanticLabel => '返回按钮';

  @override
  String get createFileTooltip => '创建新的测验文件';

  @override
  String get loadFileTooltip => '加载现有的测验文件';

  @override
  String questionNumber(int number) {
    return '问题 $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return '第 $current 题，共 $total 题';
  }

  @override
  String get previous => '上一个';

  @override
  String get skip => '跳过';

  @override
  String get questionsOverview => '题目概览';

  @override
  String get next => '下一个';

  @override
  String get finish => '完成';

  @override
  String get finishQuiz => '完成测验';

  @override
  String get finishQuizConfirmation => '您确定要完成测验吗？之后您将无法更改答案。';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount 道未回答的问题',
      one: '1 道未回答的问题',
    );
    return '你还有 $_temp0。你确定要结束测验吗？';
  }

  @override
  String get resolveUnansweredQuestions => '解决未回答的问题';

  @override
  String get abandonQuiz => '放弃测验';

  @override
  String get abandonQuizConfirmation => '您确定要放弃测验吗？所有进度都将丢失。';

  @override
  String get abandon => '放弃';

  @override
  String get quizCompleted => '测验完成！';

  @override
  String score(String score) {
    return '得分：$score%';
  }

  @override
  String correctAnswers(String correct, int total) {
    return '$total个问题中答对$correct个';
  }

  @override
  String get retry => '重试';

  @override
  String get goBack => '完成';

  @override
  String get retryFailedQuestions => '重做错题';

  @override
  String question(String question) {
    return '问题：$question';
  }

  @override
  String get selectQuestionCountTitle => '选择问题数量';

  @override
  String get selectQuestionCountMessage => '您想在这个测验中回答多少个问题？';

  @override
  String allQuestions(int count) {
    return '所有问题（$count个）';
  }

  @override
  String get startQuiz => '开始测验';

  @override
  String get maxIncorrectAnswersLabel => '限制错误答案';

  @override
  String get maxIncorrectAnswersDescription => '及格/不及格考试。没有具体分数，只有及格或不及格。';

  @override
  String get maxIncorrectAnswersOffDescription => '考试将有 0 到 100 的数值评分。';

  @override
  String get maxIncorrectAnswersLimitLabel => '允许的最大错误数';

  @override
  String get examFailedStatus => '考试不及格';

  @override
  String get examPassedStatus => '考试及格';

  @override
  String get quizFailedLimitReached => '考试结束：已达到最大错误限制';

  @override
  String get errorInvalidNumber => '请输入有效数字';

  @override
  String get errorNumberMustBePositive => '数字必须大于0';

  @override
  String get customNumberLabel => '或输入自定义数量：';

  @override
  String get numberInputLabel => '问题数量';

  @override
  String get questionOrderConfigTitle => '问题顺序配置';

  @override
  String get questionOrderConfigDescription => '选择考试期间问题的显示顺序：';

  @override
  String get questionOrderAscending => '升序';

  @override
  String get questionOrderAscendingDesc => '问题将按从1到结尾的顺序显示';

  @override
  String get questionOrderDescending => '降序';

  @override
  String get questionOrderDescendingDesc => '问题将从结尾到1显示';

  @override
  String get questionOrderRandom => '随机化问题顺序';

  @override
  String get questionOrderRandomDesc => '问题将随机显示';

  @override
  String get questionOrderConfigTooltip => '问题顺序配置';

  @override
  String get reorderQuestionsTooltip => '重新排序问题';

  @override
  String get save => '保存';

  @override
  String get examConfigurationTitle => '考试配置';

  @override
  String get examTimeLimitTitle => '考试时间限制';

  @override
  String get examTimeLimitDescription => '为考试设置时间限制。测验期间将显示倒计时器。';

  @override
  String get examTimeLimitOffDescription => '本次考试没有时间限制。';

  @override
  String get enableTimeLimit => '启用时间限制';

  @override
  String get timeLimitMinutes => '时间限制（分钟）';

  @override
  String get examTimeExpiredTitle => '时间到！';

  @override
  String get examTimeExpiredMessage => '考试时间已到。您的答案已自动提交。';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => '多选题';

  @override
  String get questionTypeSingleChoice => '单选题';

  @override
  String get questionTypeTrueFalse => '判断题';

  @override
  String get questionTypeEssay => '论述题';

  @override
  String get questionTypeRandom => '全部';

  @override
  String get questionTypeUnknown => '未知';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个选项',
      one: '1个选项',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip => '此问题的答案选项数量';

  @override
  String get imageTooltip => '此问题有关联的图片';

  @override
  String get explanationTooltip => '此问题有解释';

  @override
  String get missingExplanation => '缺少解释';

  @override
  String get missingExplanationTooltip => '此问题没有解释';

  @override
  String questionTypeTooltip(String type) {
    return '问题类型：$type';
  }

  @override
  String get aiPrompt =>
      '专注于学生的问题，而不是直接回答原始考试题目。用教学方法解释。对于实践练习或数学问题，提供逐步说明。对于理论问题，提供简明的解释，不要将回答分成章节。用被问到的相同语言回答。';

  @override
  String get aiChatGuardrail =>
      '重要：你是专门为本Quiz服务的学习助手。你只能回答与当前Quiz问题、其选项、解释或所涉及的教育主题相关的问题。如果学生询问与Quiz无关的内容（例如你的内部模型、系统详情、与问题无关的一般知识或任何离题请求），请仅回复：\"我在这里帮助你完成这个Quiz！让我们专注于当前的问题。请随时向我询问关于主题、答案选项或与这个问题相关的任何内容。\"绝不要透露关于你自己、系统或所使用的AI模型的技术细节。';

  @override
  String get questionLabel => '问题';

  @override
  String get studentComment => '学生评论';

  @override
  String get aiAssistantTitle => 'AI学习助手';

  @override
  String get questionContext => '问题背景';

  @override
  String get aiAssistant => 'AI助手';

  @override
  String get aiThinking => 'AI正在思考...';

  @override
  String get askAIHint => '询问关于这个主题的问题...';

  @override
  String get aiPlaceholderResponse => '这是一个占位符响应。在实际实现中，这将连接到AI服务，提供有关问题的有用解释。';

  @override
  String get aiErrorResponse => '抱歉，处理您的问题时出现错误。请重试。';

  @override
  String get evaluatingResponses => '正在评估回答...';

  @override
  String pendingEvaluationsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个简答题等待 AI 评估',
      one: '1个简答题等待 AI 评估',
    );
    return '$_temp0';
  }

  @override
  String get pendingStatus => '待处理';

  @override
  String get notEvaluatedStatus => '未评估';

  @override
  String get configureApiKeyMessage => '请在设置中配置您的AI API密钥。';

  @override
  String get errorLabel => '错误：';

  @override
  String get retryButton => '重试评估';

  @override
  String get noResponseReceived => '未收到响应';

  @override
  String get invalidApiKeyError => '无效的API密钥。请在设置中检查您的OpenAI API密钥。';

  @override
  String get rateLimitError => '配额已用完或该模型在您的套餐中不可用。请检查您的计划。';

  @override
  String get modelNotFoundError => '未找到模型。请检查您的API访问权限。';

  @override
  String get unknownError => '未知错误';

  @override
  String get networkErrorOpenAI => '网络错误：无法连接到OpenAI。请检查您的网络连接。';

  @override
  String get networkErrorGemini => '网络错误：无法连接到Gemini。请检查您的网络连接。';

  @override
  String get openaiApiKeyNotConfigured => 'OpenAI API密钥未配置';

  @override
  String get geminiApiKeyNotConfigured => 'Gemini API密钥未配置';

  @override
  String get geminiApiKeyLabel => 'Gemini API密钥';

  @override
  String get geminiApiKeyHint => '输入您的Gemini API密钥';

  @override
  String get geminiApiKeyDescription => 'Gemini AI功能所需。您的密钥会安全存储。';

  @override
  String get getGeminiApiKeyTooltip => '从Google AI Studio获取API密钥';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'AI学习助手至少需要一个API密钥（Gemini或OpenAI）。请输入API密钥或禁用AI助手。';

  @override
  String get minutesAbbreviation => '分钟';

  @override
  String get aiButtonTooltip => 'AI学习助手';

  @override
  String get aiButtonText => 'AI';

  @override
  String get aiAssistantSettingsTitle => 'AI学习助手（预览）';

  @override
  String get aiAssistantSettingsDescription => '启用或禁用问题的AI学习助手';

  @override
  String get aiDefaultModelTitle => '默认AI模型';

  @override
  String get aiDefaultModelDescription => '选择用于生成问题的默认AI服务和模型';

  @override
  String get openaiApiKeyLabel => 'OpenAI API密钥';

  @override
  String get openaiApiKeyHint => '输入您的OpenAI API密钥（sk-...）';

  @override
  String get openaiApiKeyDescription => '用于与OpenAI集成。您的OpenAI密钥会安全存储。';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'AI学习助手需要OpenAI API密钥。请输入您的API密钥或禁用AI助手。';

  @override
  String get getApiKeyTooltip => '从OpenAI获取API密钥';

  @override
  String get deleteAction => '删除';

  @override
  String get explanationLabel => '解释（可选）';

  @override
  String get explanationHint => '输入正确答案的解释';

  @override
  String get explanationTitle => '解释';

  @override
  String get imageLabel => '图片';

  @override
  String get changeImage => '更换图片';

  @override
  String get removeImage => '移除图片';

  @override
  String get addImageTap => '点击添加图片';

  @override
  String get imageFormats => '格式：JPG、PNG、GIF';

  @override
  String get imageLoadError => '图片加载错误';

  @override
  String imagePickError(String error) {
    return '图片加载错误：$error';
  }

  @override
  String get tapToZoom => '点击放大';

  @override
  String get trueLabel => '正确';

  @override
  String get falseLabel => '错误';

  @override
  String get addQuestion => '添加问题';

  @override
  String get editQuestion => '编辑问题';

  @override
  String get questionText => '问题文本';

  @override
  String get questionType => '问题类型';

  @override
  String get addOption => '添加选项';

  @override
  String get optionsLabel => '选项';

  @override
  String get optionLabel => '选项';

  @override
  String get questionTextRequired => '问题文本是必需的';

  @override
  String get atLeastOneOptionRequired => '至少一个选项必须有文本';

  @override
  String get atLeastOneCorrectAnswerRequired => '至少必须选择一个正确答案';

  @override
  String get onlyOneCorrectAnswerAllowed => '此问题类型只允许一个正确答案';

  @override
  String get removeOption => '移除选项';

  @override
  String get selectCorrectAnswer => '选择正确答案';

  @override
  String get selectCorrectAnswers => '选择正确答案';

  @override
  String emptyOptionsError(String optionNumbers) {
    return '选项$optionNumbers为空。请为它们添加文本或删除它们。';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return '选项$optionNumber为空。请为其添加文本或删除它。';
  }

  @override
  String get optionEmptyError => '此选项不能为空';

  @override
  String get hasImage => '图片';

  @override
  String get hasExplanation => '解释';

  @override
  String errorLoadingSettings(String error) {
    return '加载设置时出错：$error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return '无法打开$url';
  }

  @override
  String get loadingAiServices => '正在加载AI服务...';

  @override
  String usingAiService(String serviceName) {
    return '使用：$serviceName';
  }

  @override
  String get aiServiceLabel => 'AI服务：';

  @override
  String get aiModelLabel => '模型：';

  @override
  String get importQuestionsTitle => '导入问题';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return '在\"$fileName\"中找到$count个问题。您想将它们导入到哪里？';
  }

  @override
  String get importQuestionsPositionQuestion => '您想将这些问题添加到哪里？';

  @override
  String get importAtBeginning => '开头';

  @override
  String get importAtEnd => '结尾';

  @override
  String questionsImportedSuccess(int count) {
    return '成功导入$count个问题';
  }

  @override
  String get importQuestionsTooltip => '从另一个测验文件导入问题';

  @override
  String get dragDropHintText => '您也可以将.quiz文件拖拽到这里导入问题';

  @override
  String get randomizeQuestionsTitle => '随机问题';

  @override
  String get randomizeQuestionsDescription => '在测验执行期间打乱问题顺序';

  @override
  String get randomizeQuestionsOffDescription => '问题将按其原始顺序出现';

  @override
  String get randomizeAnswersTitle => '随机化答案顺序';

  @override
  String get randomizeAnswersDescription => '在测验执行期间打乱答案选项的顺序';

  @override
  String get randomizeAnswersOffDescription => '答案选项将按原始顺序出现';

  @override
  String get showCorrectAnswerCountTitle => '显示正确答案数量';

  @override
  String get showCorrectAnswerCountDescription => '在多选题中显示正确答案的数量';

  @override
  String get showCorrectAnswerCountOffDescription => '多选题将不显示正确答案的数量';

  @override
  String correctAnswersCount(int count) {
    return '选择$count个正确答案';
  }

  @override
  String get correctSelectedLabel => '正确';

  @override
  String get correctMissedLabel => '正确';

  @override
  String get incorrectSelectedLabel => '错误';

  @override
  String get aiGenerateDialogTitle => '使用AI生成问题';

  @override
  String get aiQuestionCountLabel => '问题数量（可选）';

  @override
  String get aiQuestionCountHint => '留空让AI决定';

  @override
  String get aiQuestionCountValidation => '必须是1到50之间的数字';

  @override
  String get aiQuestionTypeLabel => '问题类型';

  @override
  String get aiQuestionTypeRandom => '随机（混合）';

  @override
  String get aiLanguageLabel => '问题语言';

  @override
  String get aiContentLabel => '生成问题的内容';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max 词';
  }

  @override
  String get aiContentHint => '输入您想生成问题的文本、主题或内容...';

  @override
  String get aiContentHelperText => 'AI将基于此内容创建问题';

  @override
  String aiWordLimitError(int max) {
    return '您已超过$max词的限制';
  }

  @override
  String get aiContentRequiredError => '您必须提供内容来生成问题';

  @override
  String aiContentLimitError(int max) {
    return '内容超过$max词限制';
  }

  @override
  String get aiMinWordsError => '至少提供10个词以生成高质量问题';

  @override
  String get aiInfoTitle => '信息';

  @override
  String get aiInfoDescription =>
      '• AI将分析内容并生成相关问题\n• 如果你输入的字数少于10个词，将进入“主题模式”，针对特定话题进行提问\n• 字数超过10个词，将进入“内容模式”，针对你提供的文本进行提问（字数越多 = 精确度越高）\n• 你可以包含文本、定义、解释或任何教育材料\n• 问题将包括答案选项和解释\n• 该过程可能需要几秒钟';

  @override
  String get aiGenerateButton => '生成问题';

  @override
  String get aiEnterContentTitle => '输入内容';

  @override
  String get aiEnterContentDescription => '输入主题或粘贴内容以生成问题';

  @override
  String get aiContentFieldHint => '输入主题如“二战史”或在此粘贴文本...';

  @override
  String get aiAttachFileHint => '附加文件 (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => '在此处放置文件';

  @override
  String get dropImageHere => '在此处放置图片';

  @override
  String get aiNumberQuestionsLabel => '问题数量';

  @override
  String get backButton => '返回';

  @override
  String get generateButton => '生成';

  @override
  String aiTopicModeCount(int count) {
    return '主题模式 ($count 字)';
  }

  @override
  String aiTextModeCount(int count) {
    return '文本模式 ($count 字)';
  }

  @override
  String get aiGenerationCategoryLabel => '内容模式';

  @override
  String get aiGenerationCategoryTheory => '理论';

  @override
  String get aiGenerationCategoryExercises => '练习';

  @override
  String get aiGenerationCategoryBoth => '混合';

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
  String get aiServicesLoading => '正在加载AI服务...';

  @override
  String get aiServicesNotConfigured => '未配置AI服务';

  @override
  String get aiGeneratedQuestions => 'AI生成';

  @override
  String get aiApiKeyRequired => '请在设置中配置至少一个AI API密钥以使用AI生成。';

  @override
  String get aiGenerationFailed => '无法生成问题。请尝试不同的内容。';

  @override
  String get aiGenerationErrorTitle => '生成问题时出错';

  @override
  String get noQuestionsInFile => '导入的文件中未找到问题';

  @override
  String get couldNotAccessFile => '无法访问所选文件';

  @override
  String get defaultOutputFileName => 'output-file.quiz';

  @override
  String get generateQuestionsWithAI => '使用AI生成问题';

  @override
  String get addQuestionsWithAI => '使用 AI 添加问题';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return '限制：$words词或$chars字符';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return '限制：$words词';
  }

  @override
  String get aiAssistantDisabled => 'AI助手已禁用';

  @override
  String get enableAiAssistant => 'AI助手已禁用。请在设置中启用它以使用AI功能。';

  @override
  String aiMinWordsRequired(int minWords) {
    return '需要至少$minWords个单词';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount个单词 ✓ 准备生成';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords个单词（还需要$moreNeeded个）';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return '需要至少$minWords个单词（还需要$moreNeeded个）';
  }

  @override
  String get enableQuestion => '启用问题';

  @override
  String get disableQuestion => '禁用问题';

  @override
  String get questionDisabled => '已禁用';

  @override
  String get noEnabledQuestionsError => '没有启用的问题可以运行测验';

  @override
  String get evaluateWithAI => '用 AI 评估';

  @override
  String get aiEvaluation => 'AI 评估';

  @override
  String aiEvaluationError(String error) {
    return '评估回答时出错：$error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      '您是一位专家教师，正在评估学生对论述题的回答。您的任务是提供详细和建设性的评估。请用与学生回答相同的语言回答。';

  @override
  String get aiEvaluationPromptQuestion => '题目：';

  @override
  String get aiEvaluationPromptStudentAnswer => '学生答案：';

  @override
  String get aiEvaluationPromptCriteria => '评估标准（基于教师解释）：';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      '具体指示：\n- 评估学生回答与既定标准的契合程度\n- 分析回答中的综合程度和结构\n- 识别根据标准是否遗漏了重要内容\n- 考虑分析的深度和准确性';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      '一般指示：\n- 由于没有建立具体标准，请基于一般学术标准评估回答\n- 考虑回答的清晰度、连贯性和结构\n- 评估回答是否展示了对主题的理解\n- 分析分析的深度和论证的质量';

  @override
  String get aiEvaluationPromptResponseFormat =>
      '回答格式：\n1. 评分：[X/10] - 简要说明评分理由\n2. 优点：提及回答的积极方面\n3. 改进领域：指出可以改进的方面\n4. 具体评论：提供详细和建设性的反馈\n5. 建议：提供具体的改进建议\n\n在评估中要有建设性、具体性和教育性。目标是帮助学生学习和改进。用第二人称称呼他们，使用专业友好的语调。';

  @override
  String get aiModeTopicTitle => '主题模式';

  @override
  String get aiModeTopicDescription => '主题的创意探索';

  @override
  String get aiModeContentTitle => '内容模式';

  @override
  String get aiModeContentDescription => '基于您输入的精确问题';

  @override
  String aiWordCountIndicator(int count) {
    return '$count 个词';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return '精确度: $level';
  }

  @override
  String get aiPrecisionLow => '低';

  @override
  String get aiPrecisionMedium => '中';

  @override
  String get aiPrecisionHigh => '高';

  @override
  String get aiMoreWordsMorePrecision => '更多词汇 = 更高精度';

  @override
  String get aiKeepDraftTitle => '保留 AI 草稿';

  @override
  String get aiKeepDraftDescription => '自动保存 AI 生成对话框中输入的文本，以防对话框关闭时丢失。';

  @override
  String get aiAttachFile => '附加文件';

  @override
  String get aiRemoveFile => '删除文件';

  @override
  String get aiFileMode => '文件模式';

  @override
  String get aiFileModeDescription => '将从附件文件中生成问题';

  @override
  String get aiCommentsLabel => '评论（可选）';

  @override
  String get aiCommentsHint => '添加关于附件文件的说明或评论...';

  @override
  String get aiCommentsHelperText => '可选地添加关于如何从文件生成问题的说明';

  @override
  String get aiFilePickerError => '无法加载所选文件';

  @override
  String get studyModeLabel => '学习模式';

  @override
  String get studyModeDescription => '提供 AI 辅助。每题回答后提供即时反馈，无时间限制或扣分。';

  @override
  String get examModeLabel => '考试模式';

  @override
  String get examModeDescription => '无 AI 辅助。可能适用时间限制和答错扣分。';

  @override
  String get checkAnswer => '检查';

  @override
  String get quizModeTitle => '测验模式';

  @override
  String get settingsTitle => '设置';

  @override
  String get askAiAssistant => '询问 AI 助手';

  @override
  String get askAiAboutQuestion => '向 AI 询问此问题';

  @override
  String get aiHelpWithQuestion => '帮我理解这道题';

  @override
  String get edit => '编辑';

  @override
  String get enable => '启用';

  @override
  String get disable => '禁用';

  @override
  String get quizPreviewTitle => '测验预览';

  @override
  String get select => '选择';

  @override
  String get done => '完成';

  @override
  String get importButton => '导入';

  @override
  String get reorderButton => '重新排序';

  @override
  String get startQuizButton => '开始测验';

  @override
  String get deleteConfirmation => '您确定要删除此测验吗？';

  @override
  String get saveSuccess => '文件保存成功';

  @override
  String get errorSavingFile => '保存文件时出错';

  @override
  String get deleteSingleQuestionConfirmation => '您确定要删除这个问题吗？';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return '您确定要删除 $count 个问题吗？';
  }

  @override
  String get keepPracticing => '继续练习以提高！';

  @override
  String get tryAgain => '再试一次';

  @override
  String get review => '复习';

  @override
  String get home => '首页';

  @override
  String get allLabel => '全部';

  @override
  String get subtractPointsLabel => '答错扣分';

  @override
  String get subtractPointsDescription => '每答错一题扣除分数。';

  @override
  String get subtractPointsOffDescription => '回答错误不会扣分。';

  @override
  String get penaltyAmountLabel => '扣分金额';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount 分 / 错误';
  }

  @override
  String get allQuestionsLabel => '所有题目';

  @override
  String startWithSelectedQuestions(int count) {
    return '开始 $count 道已选题目';
  }

  @override
  String get advancedSettingsTitle => '高级设置 (调试)';

  @override
  String get appLanguageLabel => '应用语言';

  @override
  String get appLanguageDescription => '覆盖用于测试的应用语言';

  @override
  String get pasteFromClipboard => '从剪贴板粘贴';

  @override
  String get pasteImage => '粘贴';

  @override
  String get clipboardNoImage => '剪贴板中未找到图片';

  @override
  String get close => '关闭';

  @override
  String get scoringAndLimitsTitle => '评分和限制';

  @override
  String get congratulations => '🎉 恭喜！ 🎉';

  @override
  String get validationMin1Error => '最少1分钟';

  @override
  String remainingTimeWithDays(
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '$days天 $hours:$minutes:$seconds';
  }

  @override
  String remainingTimeWithWeeks(
    String weeks,
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '$weeks周 $days天 $hours:$minutes:$seconds';
  }

  @override
  String get validationMax30DaysError => '最多30天';

  @override
  String get validationMin0GenericError => '至少 0';

  @override
  String get errorStatus => '错误';
}
