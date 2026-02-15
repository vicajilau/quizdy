// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get titleAppBar => 'クイズ - 試験シミュレーター';

  @override
  String get create => '作成';

  @override
  String get preview => 'プレビュー';

  @override
  String get previewLabel => 'プレビュー:';

  @override
  String get emptyPlaceholder => '(空)';

  @override
  String get latexSyntaxTitle => 'LaTeX 構文:';

  @override
  String get latexSyntaxHelp =>
      'インライン数式: LaTeX 式には \$...\$ を使用します\n例: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'LaTeX レンダリングのプレビュー';

  @override
  String get okButton => 'OK';

  @override
  String get load => '読み込み';

  @override
  String fileLoaded(String filePath) {
    return 'ファイルを読み込みました：$filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'ファイルを保存しました：$filePath';
  }

  @override
  String get dropFileHere => 'ここをクリックするか、.quizファイルを画面にドラッグしてください';

  @override
  String get clickOrDragFile => 'クリックしてロードするか、.quizファイルを画面にドラッグしてください';

  @override
  String get errorInvalidFile => 'エラー：無効なファイルです。.quizファイルである必要があります。';

  @override
  String errorLoadingFile(String error) {
    return 'クイズファイルの読み込みエラー：$error';
  }

  @override
  String errorExportingFile(String error) {
    return 'ファイルのエクスポートエラー：$error';
  }

  @override
  String get cancelButton => 'キャンセル';

  @override
  String get saveButton => '保存';

  @override
  String get confirmDeleteTitle => '削除の確認';

  @override
  String confirmDeleteMessage(String processName) {
    return '本当に`$processName`プロセスを削除しますか？';
  }

  @override
  String get deleteButton => '削除';

  @override
  String get confirmExitTitle => '終了の確認';

  @override
  String get confirmExitMessage => '本当に保存せずに終了しますか？';

  @override
  String get exitButton => '終了';

  @override
  String get saveDialogTitle => '出力ファイルを選択してください：';

  @override
  String get createQuizFileTitle => 'クイズファイルを作成';

  @override
  String get editQuizFileTitle => 'クイズファイルを編集';

  @override
  String get fileNameLabel => 'ファイル名';

  @override
  String get fileDescriptionLabel => 'ファイルの説明';

  @override
  String get createButton => '作成';

  @override
  String get fileNameRequiredError => 'ファイル名は必須です。';

  @override
  String get fileDescriptionRequiredError => 'ファイルの説明は必須です。';

  @override
  String get versionLabel => 'バージョン';

  @override
  String get authorLabel => '作成者';

  @override
  String get authorRequiredError => '作成者は必須です。';

  @override
  String get requiredFieldsError => 'すべての必須フィールドを入力してください。';

  @override
  String get requestFileNameTitle => 'クイズファイル名を入力';

  @override
  String get fileNameHint => 'ファイル名';

  @override
  String get emptyFileNameMessage => 'ファイル名を空にすることはできません。';

  @override
  String get acceptButton => '承認';

  @override
  String get saveTooltip => 'ファイルを保存';

  @override
  String get saveDisabledTooltip => '保存する変更がありません';

  @override
  String get executeTooltip => '試験を実行';

  @override
  String get addTooltip => '新しい問題を追加';

  @override
  String get backSemanticLabel => '戻るボタン';

  @override
  String get createFileTooltip => '新しいクイズファイルを作成';

  @override
  String get loadFileTooltip => '既存のクイズファイルを読み込み';

  @override
  String questionNumber(int number) {
    return '問題 $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return '$total 問中 $current 問目';
  }

  @override
  String get previous => '前へ';

  @override
  String get skip => 'スキップ';

  @override
  String get questionsOverview => 'Questions Map';

  @override
  String get next => '次へ';

  @override
  String get finish => '完了';

  @override
  String get finishQuiz => 'クイズを完了';

  @override
  String get finishQuizConfirmation => '本当にクイズを完了しますか？その後、回答を変更することはできません。';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount 問の未回答があります',
      one: '1 問の未回答があります',
    );
    return '$_temp0。クイズを終了してもよろしいですか？';
  }

  @override
  String get resolveUnansweredQuestions => '未回答の問題を解く';

  @override
  String get abandonQuiz => 'クイズを放棄';

  @override
  String get abandonQuizConfirmation => '本当にクイズを放棄しますか？すべての進捗が失われます。';

  @override
  String get abandon => '放棄';

  @override
  String get quizCompleted => 'クイズ完了！';

  @override
  String score(String score) {
    return 'スコア：$score%';
  }

  @override
  String correctAnswers(int correct, int total) {
    return '$total問中$correct問正解';
  }

  @override
  String get retry => '再試行';

  @override
  String get goBack => '完了';

  @override
  String get retryFailedQuestions => '不正解を再試行';

  @override
  String question(String question) {
    return '問題：$question';
  }

  @override
  String get selectQuestionCountTitle => '問題数を選択';

  @override
  String get selectQuestionCountMessage => 'このクイズで何問に回答しますか？';

  @override
  String allQuestions(int count) {
    return 'すべての問題（$count問）';
  }

  @override
  String get startQuiz => 'クイズ開始';

  @override
  String get errorInvalidNumber => '有効な数字を入力してください';

  @override
  String get errorNumberMustBePositive => '数字は0より大きい必要があります';

  @override
  String get customNumberLabel => 'またはカスタム数を入力：';

  @override
  String get numberInputLabel => '問題数';

  @override
  String get questionOrderConfigTitle => '問題順序の設定';

  @override
  String get questionOrderConfigDescription => '試験中に問題を表示する順序を選択してください：';

  @override
  String get questionOrderAscending => '昇順';

  @override
  String get questionOrderAscendingDesc => '問題は1から最後まで順番に表示されます';

  @override
  String get questionOrderDescending => '降順';

  @override
  String get questionOrderDescendingDesc => '問題は最後から1まで表示されます';

  @override
  String get questionOrderRandom => 'ランダム';

  @override
  String get questionOrderRandomDesc => '問題はランダム順で表示されます';

  @override
  String get questionOrderConfigTooltip => '問題順序の設定';

  @override
  String get reorderQuestionsTooltip => '質問を並べ替える';

  @override
  String get save => '保存';

  @override
  String get examTimeLimitTitle => '試験時間制限';

  @override
  String get examTimeLimitDescription =>
      '試験の時間制限を設定します。有効にすると、クイズ中にカウントダウンタイマーが表示されます。';

  @override
  String get enableTimeLimit => '時間制限を有効にする';

  @override
  String get timeLimitMinutes => '時間制限（分）';

  @override
  String get examTimeExpiredTitle => '時間切れ！';

  @override
  String get examTimeExpiredMessage => '試験時間が終了しました。回答が自動的に提出されました。';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => '複数選択';

  @override
  String get questionTypeSingleChoice => '単一選択';

  @override
  String get questionTypeTrueFalse => '真偽';

  @override
  String get questionTypeEssay => '記述式';

  @override
  String get questionTypeRandom => 'すべて';

  @override
  String get questionTypeUnknown => '不明';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countつの選択肢',
      one: '1つの選択肢',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip => 'この問題の回答選択肢の数';

  @override
  String get imageTooltip => 'この問題には関連する画像があります';

  @override
  String get explanationTooltip => 'この問題には解説があります';

  @override
  String get missingExplanation => '説明がありません';

  @override
  String get missingExplanationTooltip => 'この質問には説明がありません';

  @override
  String questionTypeTooltip(String type) {
    return '質問の種類: $type';
  }

  @override
  String get aiPrompt =>
      '元の試験問題に直接答えるのではなく、学生の質問に焦点を当ててください。教育的なアプローチで説明してください。実践的な演習や数学の問題については、ステップバイステップの指示を提供してください。理論的な質問については、回答をセクションに分けずに簡潔な説明を提供してください。質問されたのと同じ言語で回答してください。';

  @override
  String get questionLabel => '問題';

  @override
  String get studentComment => '学生のコメント';

  @override
  String get aiAssistantTitle => 'AI学習アシスタント';

  @override
  String get questionContext => '問題の背景';

  @override
  String get aiAssistant => 'AIアシスタント';

  @override
  String get aiThinking => 'AIが考えています...';

  @override
  String get askAIHint => 'このトピックについて質問してください...';

  @override
  String get aiPlaceholderResponse =>
      'これはプレースホルダー応答です。実際の実装では、問題について有用な説明を提供するAIサービスに接続されます。';

  @override
  String get aiErrorResponse => '申し訳ございませんが、質問の処理中にエラーが発生しました。もう一度お試しください。';

  @override
  String get configureApiKeyMessage => '設定でAI APIキーを設定してください。';

  @override
  String get errorLabel => 'エラー：';

  @override
  String get noResponseReceived => '応答を受信しませんでした';

  @override
  String get invalidApiKeyError => '無効なAPIキーです。設定でOpenAI APIキーを確認してください。';

  @override
  String get rateLimitError => 'クォータを超過したか、プランでモデルが利用できません。プランを確認してください。';

  @override
  String get modelNotFoundError => 'モデルが見つかりません。APIアクセスを確認してください。';

  @override
  String get unknownError => '不明なエラー';

  @override
  String get networkErrorOpenAI =>
      'ネットワークエラー：OpenAIに接続できません。インターネット接続を確認してください。';

  @override
  String get networkErrorGemini =>
      'ネットワークエラー：Geminiに接続できません。インターネット接続を確認してください。';

  @override
  String get openaiApiKeyNotConfigured => 'OpenAI APIキーが設定されていません';

  @override
  String get geminiApiKeyNotConfigured => 'Gemini APIキーが設定されていません';

  @override
  String get geminiApiKeyLabel => 'Gemini APIキー';

  @override
  String get geminiApiKeyHint => 'Gemini APIキーを入力してください';

  @override
  String get geminiApiKeyDescription => 'Gemini AI機能に必要です。キーは安全に保存されます。';

  @override
  String get getGeminiApiKeyTooltip => 'Google AI StudioからAPIキーを取得';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'AI学習アシスタントには、少なくとも1つのAPIキー（GeminiまたはOpenAI）が必要です。APIキーを入力するか、AIアシスタントを無効にしてください。';

  @override
  String get minutesAbbreviation => '分';

  @override
  String get aiButtonTooltip => 'AI学習アシスタント';

  @override
  String get aiButtonText => 'AI';

  @override
  String get aiAssistantSettingsTitle => 'AI学習アシスタント（プレビュー）';

  @override
  String get aiAssistantSettingsDescription => '問題のAI学習アシスタントを有効または無効にする';

  @override
  String get aiDefaultModelTitle => 'デフォルトAIモデル';

  @override
  String get aiDefaultModelDescription => '質問生成のデフォルトAIサービスとモデルを選択';

  @override
  String get openaiApiKeyLabel => 'OpenAI APIキー';

  @override
  String get openaiApiKeyHint => 'OpenAI APIキーを入力してください（sk-...）';

  @override
  String get openaiApiKeyDescription => 'OpenAI連携に必要です。OpenAIキーは安全に保存されます。';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'AI学習アシスタントにはOpenAI APIキーが必要です。APIキーを入力するか、AIアシスタントを無効にしてください。';

  @override
  String get getApiKeyTooltip => 'OpenAIからAPIキーを取得';

  @override
  String get deleteAction => '削除';

  @override
  String get explanationLabel => '解説（任意）';

  @override
  String get explanationHint => '正解の解説を入力してください';

  @override
  String get explanationTitle => '解説';

  @override
  String get imageLabel => '画像';

  @override
  String get changeImage => '画像を変更';

  @override
  String get removeImage => '画像を削除';

  @override
  String get addImageTap => 'タップして画像を追加';

  @override
  String get imageFormats => '形式：JPG、PNG、GIF';

  @override
  String get imageLoadError => '画像読み込みエラー';

  @override
  String imagePickError(String error) {
    return '画像読み込みエラー：$error';
  }

  @override
  String get tapToZoom => 'タップして拡大';

  @override
  String get trueLabel => '真';

  @override
  String get falseLabel => '偽';

  @override
  String get addQuestion => '問題を追加';

  @override
  String get editQuestion => '問題を編集';

  @override
  String get questionText => '問題文';

  @override
  String get questionType => '問題の種類';

  @override
  String get addOption => '選択肢を追加';

  @override
  String get optionsLabel => '選択肢';

  @override
  String get optionLabel => '選択肢';

  @override
  String get questionTextRequired => '問題文は必須です';

  @override
  String get atLeastOneOptionRequired => '少なくとも1つの選択肢にテキストが必要です';

  @override
  String get atLeastOneCorrectAnswerRequired => '少なくとも1つの正解を選択する必要があります';

  @override
  String get onlyOneCorrectAnswerAllowed => 'この問題の種類では正解は1つのみ許可されています';

  @override
  String get removeOption => '選択肢を削除';

  @override
  String get selectCorrectAnswer => '正解を選択';

  @override
  String get selectCorrectAnswers => '正解を選択';

  @override
  String emptyOptionsError(String optionNumbers) {
    return '選択肢$optionNumbersが空です。テキストを追加するか削除してください。';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return '選択肢$optionNumberが空です。テキストを追加するか削除してください。';
  }

  @override
  String get optionEmptyError => 'この選択肢を空にすることはできません';

  @override
  String get hasImage => '画像';

  @override
  String get hasExplanation => '解説';

  @override
  String errorLoadingSettings(String error) {
    return '設定の読み込みエラー：$error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return '$urlを開けませんでした';
  }

  @override
  String get loadingAiServices => 'AIサービスを読み込み中...';

  @override
  String usingAiService(String serviceName) {
    return '使用中：$serviceName';
  }

  @override
  String get aiServiceLabel => 'AIサービス：';

  @override
  String get aiModelLabel => 'モデル：';

  @override
  String get importQuestionsTitle => '問題をインポート';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return '\"$fileName\"に$count個の問題が見つかりました。どこにインポートしますか？';
  }

  @override
  String get importQuestionsPositionQuestion => 'これらの問題をどこに追加しますか？';

  @override
  String get importAtBeginning => '最初';

  @override
  String get importAtEnd => '最後';

  @override
  String questionsImportedSuccess(int count) {
    return '$count個の問題を正常にインポートしました';
  }

  @override
  String get importQuestionsTooltip => '別のクイズファイルから問題をインポート';

  @override
  String get dragDropHintText => '問題をインポートするために.quizファイルをここにドラッグ&ドロップすることもできます';

  @override
  String get randomizeAnswersTitle => '回答選択肢をランダム化';

  @override
  String get randomizeAnswersDescription => 'クイズ実行中に回答選択肢の順序をシャッフル';

  @override
  String get showCorrectAnswerCountTitle => '正解数を表示';

  @override
  String get showCorrectAnswerCountDescription => '複数選択問題で正解の数を表示';

  @override
  String correctAnswersCount(int count) {
    return '$countつの正解を選択';
  }

  @override
  String get correctSelectedLabel => '正解';

  @override
  String get correctMissedLabel => '正解';

  @override
  String get incorrectSelectedLabel => '不正解';

  @override
  String get aiGenerateDialogTitle => 'AIで問題を生成';

  @override
  String get aiQuestionCountLabel => '問題数（任意）';

  @override
  String get aiQuestionCountHint => 'AIに決めさせる場合は空白のままにしてください';

  @override
  String get aiQuestionCountValidation => '1から50までの数字である必要があります';

  @override
  String get aiQuestionTypeLabel => '問題の種類';

  @override
  String get aiQuestionTypeRandom => 'ランダム（混合）';

  @override
  String get aiLanguageLabel => '問題の言語';

  @override
  String get aiContentLabel => '問題生成元のコンテンツ';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max 語';
  }

  @override
  String get aiContentHint => '問題を生成したいテキスト、トピック、またはコンテンツを入力してください...';

  @override
  String get aiContentHelperText => 'AIはこのコンテンツに基づいて問題を作成します';

  @override
  String aiWordLimitError(int max) {
    return '$max語の制限を超えています';
  }

  @override
  String get aiContentRequiredError => '問題を生成するためにコンテンツを提供する必要があります';

  @override
  String aiContentLimitError(int max) {
    return 'コンテンツが$max語の制限を超えています';
  }

  @override
  String get aiMinWordsError => '質の高い問題を生成するために少なくとも10語を提供してください';

  @override
  String get aiInfoTitle => '情報';

  @override
  String get aiInfoDescription =>
      '• AIがコンテンツを分析して関連する問題を生成します\n• 10語未満であれば「トピックモード」になり、特定のテーマについて質問します\n• 10語以上であれば「コンテンツモード」になり、入力されたテキストに基づいて質問します（単語数が多いほど、精度が高まります）\n• テキスト、定義、説明、または任意の教育材料を含めることができます\n• 問題には回答選択肢と解説が含まれます\n• 処理には数秒かかる場合があります';

  @override
  String get aiGenerateButton => '問題を生成';

  @override
  String get aiEnterContentTitle => 'コンテンツを入力';

  @override
  String get aiEnterContentDescription => '質問を作成するトピックを入力するか、コンテンツを貼り付けてください';

  @override
  String get aiContentFieldHint =>
      '「第二次世界大戦の歴史」のようなトピックを入力するか、ここにテキストを貼り付けてください...';

  @override
  String get aiAttachFileHint => 'ファイルを添付 (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'ファイルをここにドロップ';

  @override
  String get dropImageHere => '画像をここにドロップ';

  @override
  String get aiNumberQuestionsLabel => '質問数';

  @override
  String get backButton => '戻る';

  @override
  String get generateButton => '生成';

  @override
  String aiTopicModeCount(int count) {
    return 'トピックモード ($count 語)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'テキストモード ($count 語)';
  }

  @override
  String get aiGenerationCategoryLabel => 'コンテンツモード';

  @override
  String get aiGenerationCategoryTheory => '理論';

  @override
  String get aiGenerationCategoryExercises => '演習';

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
  String get aiServicesLoading => 'AIサービスを読み込み中...';

  @override
  String get aiServicesNotConfigured => 'AIサービスが設定されていません';

  @override
  String get aiGeneratedQuestions => 'AI生成';

  @override
  String get aiApiKeyRequired => 'AI生成を使用するには、設定で少なくとも1つのAI APIキーを設定してください。';

  @override
  String get aiGenerationFailed => '問題を生成できませんでした。異なるコンテンツで試してください。';

  @override
  String get aiGenerationErrorTitle => '問題生成エラー';

  @override
  String get noQuestionsInFile => 'インポートされたファイルに問題が見つかりませんでした';

  @override
  String get couldNotAccessFile => '選択されたファイルにアクセスできませんでした';

  @override
  String get defaultOutputFileName => 'output-file.quiz';

  @override
  String get generateQuestionsWithAI => 'AIで問題を生成';

  @override
  String get addQuestionsWithAI => 'AIで質問を追加';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return '制限：$words語または$chars文字';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return '制限：$words語';
  }

  @override
  String get aiAssistantDisabled => 'AI学習アシスタントが無効';

  @override
  String get enableAiAssistant =>
      'AIアシスタントが無効になっています。AI機能を使用するために設定で有効にしてください。';

  @override
  String aiMinWordsRequired(int minWords) {
    return '最低$minWords語が必要です';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount語 ✓ 生成準備完了';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords語 (あと$moreNeeded語必要)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return '最低$minWords語が必要です（あと$moreNeeded語必要）';
  }

  @override
  String get enableQuestion => '質問を有効にする';

  @override
  String get disableQuestion => '質問を無効にする';

  @override
  String get questionDisabled => '無効';

  @override
  String get noEnabledQuestionsError => 'クイズを実行するための有効な質問がありません';

  @override
  String get evaluateWithAI => 'AIで評価';

  @override
  String get aiEvaluation => 'AI評価';

  @override
  String aiEvaluationError(String error) {
    return '回答の評価中にエラーが発生しました：$error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'あなたはエッセイ問題に対する学生の回答を評価する専門の教師です。あなたの任務は、詳細で建設的な評価を提供することです。学生の回答と同じ言語で回答してください。';

  @override
  String get aiEvaluationPromptQuestion => '問題：';

  @override
  String get aiEvaluationPromptStudentAnswer => '学生の回答：';

  @override
  String get aiEvaluationPromptCriteria => '評価基準（教師の説明に基づく）：';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      '具体的な指示：\n- 学生の回答が確立された基準とどの程度一致しているかを評価する\n- 回答における統合と構造の程度を分析する\n- 基準に従って重要なことが見落とされていないかを特定する\n- 分析の深さと正確性を考慮する';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      '一般的な指示：\n- 特定の基準が確立されていないため、一般的な学術基準に基づいて回答を評価する\n- 回答の明確さ、一貫性、構造を考慮する\n- 回答がトピックの理解を示しているかを評価する\n- 分析の深さと議論の質を分析する';

  @override
  String get aiEvaluationPromptResponseFormat =>
      '回答形式：\n1. 評点：[X/10] - 評点を簡潔に正当化する\n2. 長所：回答の肯定的な側面を述べる\n3. 改善領域：改善できる側面を指摘する\n4. 具体的なコメント：詳細で建設的なフィードバックを提供する\n5. 提案：改善のための具体的な推奨事項を提供する\n\n評価において建設的、具体的、教育的であること。目標は学生の学習と改善を助けることです。二人称で話しかけ、専門的で親しみやすい口調を使用してください。';

  @override
  String get raffleTitle => '抽選';

  @override
  String get raffleTooltip => '抽選画面を開く';

  @override
  String get participantListTitle => '参加者リスト';

  @override
  String get participantListHint => '改行で区切られた名前を入力してください';

  @override
  String get participantListPlaceholder => '参加者の名前をここに入力してください...\n一行に一つの名前';

  @override
  String get clearList => 'リストをクリア';

  @override
  String get participants => '参加者';

  @override
  String get noParticipants => '参加者はいません';

  @override
  String get addParticipantsHint => '抽選を開始するには参加者を追加してください';

  @override
  String get activeParticipants => 'アクティブな参加者';

  @override
  String get alreadySelected => '既に選択済み';

  @override
  String totalParticipants(int count) {
    return '総参加者数';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return '$active人アクティブ、$winners人当選';
  }

  @override
  String get startRaffle => '抽選開始';

  @override
  String get raffling => '抽選中...';

  @override
  String get selectingWinner => '当選者を選択中...';

  @override
  String get allParticipantsSelected => 'すべての参加者が選択されました';

  @override
  String get addParticipantsToStart => '抽選を開始するには参加者を追加してください';

  @override
  String participantsReadyCount(int count) {
    return '$count人が抽選の準備ができています';
  }

  @override
  String get resetWinners => '当選者をリセット';

  @override
  String get resetWinnersConfirmTitle => '当選者をリセットしますか？';

  @override
  String get resetWinnersConfirmMessage => 'これによりすべての当選者がアクティブ参加者リストに戻されます。';

  @override
  String get resetRaffleTitle => '抽選をリセットしますか？';

  @override
  String get resetRaffleConfirmMessage => 'これによりすべての当選者とアクティブ参加者がリセットされます。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get reset => 'リセット';

  @override
  String get viewWinners => '当選者を見る';

  @override
  String get congratulations => '🎉 おめでとうございます！ 🎉';

  @override
  String positionLabel(int position) {
    return '第$position位';
  }

  @override
  String remainingParticipants(int count) {
    return '残りの参加者：$count人';
  }

  @override
  String get continueRaffle => '抽選を続ける';

  @override
  String get finishRaffle => '抽選を終了';

  @override
  String get winnersTitle => '当選者';

  @override
  String get shareResults => '結果を共有';

  @override
  String get noWinnersYet => 'まだ当選者はいません';

  @override
  String get performRaffleToSeeWinners => '当選者を見るには抽選を行ってください';

  @override
  String get goToRaffle => '抽選へ移動';

  @override
  String get raffleCompleted => '抽選完了！';

  @override
  String winnersSelectedCount(int count) {
    return '$count人の当選者が選ばれました';
  }

  @override
  String get newRaffle => '新しい抽選';

  @override
  String get shareResultsTitle => '抽選結果';

  @override
  String get raffleResultsLabel => '抽選結果：';

  @override
  String get close => '閉じる';

  @override
  String get share => 'コピー';

  @override
  String get shareNotImplemented => '共有機能はまだ実装されていません';

  @override
  String get firstPlace => '第1位';

  @override
  String get secondPlace => '第2位';

  @override
  String get thirdPlace => '第3位';

  @override
  String nthPlace(int position) {
    return '第$position位';
  }

  @override
  String placeLabel(String position) {
    return '順位';
  }

  @override
  String get raffleResultsHeader => '抽選結果 - null人の当選者';

  @override
  String totalWinners(int count) {
    return '総当選者数：$count人';
  }

  @override
  String get noWinnersToShare => '共有する当選者はいません';

  @override
  String get shareSuccess => '結果が正常にコピーされました';

  @override
  String get selectLogo => 'ロゴを選択';

  @override
  String get logoUrl => 'ロゴURL';

  @override
  String get logoUrlHint => '抽選用のカスタムロゴとして使用する画像のURLを入力してください';

  @override
  String get invalidLogoUrl =>
      '無効な画像URLです。.jpg、.png、.gifなどで終わる有効なURLである必要があります。';

  @override
  String get logoPreview => 'プレビュー';

  @override
  String get removeLogo => 'ロゴを削除';

  @override
  String get logoTooLargeWarning => '画像が大きすぎて保存できません。このセッション中のみ使用されます。';

  @override
  String get aiModeTopicTitle => 'トピックモード';

  @override
  String get aiModeTopicDescription => 'トピックの創造的な探求';

  @override
  String get aiModeContentTitle => 'コンテンツモード';

  @override
  String get aiModeContentDescription => '入力に基づいた正確な質問';

  @override
  String aiWordCountIndicator(int count) {
    return '$count 単語';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return '精度: $level';
  }

  @override
  String get aiPrecisionLow => '低';

  @override
  String get aiPrecisionMedium => '中';

  @override
  String get aiPrecisionHigh => '高';

  @override
  String get aiMoreWordsMorePrecision => '単語が多いほど精度が高い';

  @override
  String get aiKeepDraftTitle => 'AIドラフトを保持';

  @override
  String get aiKeepDraftDescription =>
      'AI生成ダイアログに入力されたテキストを自動的に保存し、ダイアログが閉じられても失われないようにします。';

  @override
  String get aiAttachFile => 'ファイルを添付';

  @override
  String get aiRemoveFile => 'ファイルを削除';

  @override
  String get aiFileMode => 'ファイルモード';

  @override
  String get aiFileModeDescription => '添付されたファイルから質問が生成されます';

  @override
  String get aiCommentsLabel => 'コメント（任意）';

  @override
  String get aiCommentsHint => '添付ファイルに関する指示やコメントを追加...';

  @override
  String get aiCommentsHelperText => '必要に応じて、ファイルから質問を生成する方法に関する指示を追加してください';

  @override
  String get aiFilePickerError => '選択したファイルを読み込めませんでした';

  @override
  String get studyModeLabel => '学習モード';

  @override
  String get studyModeDescription => '即時フィードバック、タイマーなし';

  @override
  String get examModeLabel => '試験モード';

  @override
  String get examModeDescription => '標準時間、最後に結果表示';

  @override
  String get checkAnswer => '確認';

  @override
  String get quizModeTitle => 'クイズモード';

  @override
  String get settingsTitle => '設定';

  @override
  String get askAiAssistant => 'AIアシスタントに聞く';

  @override
  String get sorteosLabel => 'Raffles';

  @override
  String get edit => '編集';

  @override
  String get enable => '有効化';

  @override
  String get disable => '無効化';

  @override
  String get quizPreviewTitle => 'クイズプレビュー';

  @override
  String get select => '選択';

  @override
  String get done => '完了';

  @override
  String get importButton => 'インポート';

  @override
  String get reorderButton => '並べ替え';

  @override
  String get startQuizButton => 'クイズを開始';

  @override
  String get deleteConfirmation => 'このクイズを削除してもよろしいですか？';

  @override
  String get saveSuccess => 'ファイルが正常に保存されました';

  @override
  String get errorSavingFile => 'ファイルの保存中にエラーが発生しました';

  @override
  String get deleteSingleQuestionConfirmation => 'この質問を削除してもよろしいですか？';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return '$count 個の質問を削除してもよろしいですか？';
  }

  @override
  String get keepPracticing => '改善のために練習を続けましょう！';

  @override
  String get tryAgain => 'もう一度試す';

  @override
  String get review => '復習する';

  @override
  String get home => 'ホーム';

  @override
  String get allLabel => 'すべて';

  @override
  String get subtractPointsLabel => '不正解でポイントを減点';

  @override
  String get penaltyAmountLabel => 'ペナルティ額';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount 点 / 誤答';
  }

  @override
  String get allQuestionsLabel => 'すべての問題';

  @override
  String startWithSelectedQuestions(int count) {
    return '$count問を選択して開始';
  }

  @override
  String get advancedSettingsTitle => '詳細設定 (デバッグ)';

  @override
  String get appLanguageLabel => 'アプリの言語';

  @override
  String get appLanguageDescription => 'テスト用にアプリの言語を上書きする';
}
