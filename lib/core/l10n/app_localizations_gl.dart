// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get abortQuizTitle => 'Abortar Quiz?';

  @override
  String get abortQuizMessage =>
      'Abrir un novo ficheiro deterá o cuestionario actual.';

  @override
  String get stopAndOpenButton => 'Deter e Abrir';

  @override
  String get titleAppBar => 'Quiz - Simulador de Exames';

  @override
  String get create => 'Crear';

  @override
  String get preview => 'Previsualizacion';

  @override
  String get previewLabel => 'Vista previa:';

  @override
  String get emptyPlaceholder => '(baldeiro)';

  @override
  String get latexSyntaxTitle => 'Sintaxe LaTeX:';

  @override
  String get latexSyntaxHelp =>
      'Matemáticas en liña: Use \$...\$ para expresións LaTeX\nExemplo: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'Vista previa do renderizado LaTeX';

  @override
  String get okButton => 'Aceptar';

  @override
  String get load => 'Cargar';

  @override
  String fileLoaded(String filePath) {
    return 'Ficheiro cargado: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'Ficheiro gardado: $filePath';
  }

  @override
  String get dropFileHere =>
      'Fai clic no logotipo ou arrastra un ficheiro .quiz á pantalla';

  @override
  String get errorOpeningFile => 'Erro ao abrir o ficheiro';

  @override
  String get replaceFileTitle => 'Cargar novo Quiz';

  @override
  String get replaceFileMessage =>
      'Xa hai un Quiz cargado. Queres substituílo polo novo ficheiro?';

  @override
  String get replaceButton => 'Cargar';

  @override
  String get clickOrDragFile =>
      'Preme para cargar ou arrastra un ficheiro .quiz á pantalla';

  @override
  String get errorInvalidFile =>
      'Erro: Ficheiro non válido. Debe ser un ficheiro .quiz.';

  @override
  String errorLoadingFile(String error) {
    return 'Erro cargando o ficheiro Quiz: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Erro exportando o ficheiro: $error';
  }

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get saveButton => 'Gardar';

  @override
  String get confirmDeleteTitle => 'Confirmar eliminación';

  @override
  String confirmDeleteMessage(String processName) {
    return 'Estás seguro de que queres eliminar o proceso `$processName`?';
  }

  @override
  String get deleteButton => 'Eliminar';

  @override
  String get confirmExitTitle => 'Confirmar saída';

  @override
  String get confirmExitMessage =>
      'Hai cambios sen gardar. Queres saír descartando os cambios?';

  @override
  String get exitButton => 'Saír sen gardar';

  @override
  String get saveDialogTitle => 'Selecciona un ficheiro de saída:';

  @override
  String get createQuizFileTitle => 'Crear ficheiro Quiz';

  @override
  String get editQuizFileTitle => 'Editar ficheiro Quiz';

  @override
  String get fileNameLabel => 'Nome do ficheiro';

  @override
  String get fileDescriptionLabel => 'Descrición do ficheiro';

  @override
  String get createButton => 'Crear';

  @override
  String get fileNameRequiredError => 'O nome do ficheiro é obrigatorio.';

  @override
  String get fileDescriptionRequiredError =>
      'A descrición do ficheiro é obrigatoria.';

  @override
  String get versionLabel => 'Versión';

  @override
  String get authorLabel => 'Autor';

  @override
  String get authorRequiredError => 'O autor é obrigatorio.';

  @override
  String get requiredFieldsError =>
      'Todos os campos obrigatorios deben ser completados.';

  @override
  String get requestFileNameTitle => 'Introduce o nome do ficheiro Quiz';

  @override
  String get fileNameHint => 'Nome do ficheiro';

  @override
  String get emptyFileNameMessage =>
      'O nome do ficheiro non pode estar baleiro.';

  @override
  String get acceptButton => 'Aceptar';

  @override
  String get saveTooltip => 'Gardar o ficheiro';

  @override
  String get saveDisabledTooltip => 'Non hai cambios que gardar';

  @override
  String get executeTooltip => 'Executar o exame';

  @override
  String get addTooltip => 'Engadir unha nova pregunta';

  @override
  String get backSemanticLabel => 'Botón volver';

  @override
  String get createFileTooltip => 'Crear un novo ficheiro Quiz';

  @override
  String get loadFileTooltip => 'Cargar un ficheiro Quiz existente';

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
  String get questionsOverview => 'Mapa de preguntas';

  @override
  String get next => 'Seguinte';

  @override
  String get finish => 'Rematar';

  @override
  String get finishQuiz => 'Rematar quiz';

  @override
  String get finishQuizConfirmation =>
      'Estás seguro de que queres rematar o quiz? Non poderás cambiar as túas respostas despois.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount preguntas sen contestar',
      one: '1 pregunta sen contestar',
    );
    return 'Tes $_temp0. Estás seguro de que queres finalizar o cuestionario?';
  }

  @override
  String get resolveUnansweredQuestions => 'Resolver preguntas';

  @override
  String get abandonQuiz => 'Abandonar quiz';

  @override
  String get abandonQuizConfirmation =>
      'Estás seguro de que queres abandonar o quiz? Todo o progreso perderase.';

  @override
  String get abandon => 'Abandonar';

  @override
  String get quizCompleted => 'Quiz Completado!';

  @override
  String score(String score) {
    return 'Puntuación: $score%';
  }

  @override
  String correctAnswers(String correct, int total) {
    return '$correct de $total respostas correctas';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get goBack => 'Rematar';

  @override
  String get retryFailedQuestions => 'Reintentar falladas';

  @override
  String question(String question) {
    return 'Pregunta: $question';
  }

  @override
  String get selectQuestionCountTitle => 'Seleccionar número de preguntas';

  @override
  String get selectQuestionCountMessage =>
      'A cantas preguntas te gustaría responder neste quiz?';

  @override
  String allQuestions(int count) {
    return 'Todas as preguntas ($count)';
  }

  @override
  String get startQuiz => 'Comezar quiz';

  @override
  String get maxIncorrectAnswersLabel => 'Límite de erros';

  @override
  String get maxIncorrectAnswersDescription =>
      'Exame de Apto/Non Apto. Non hai nota numérica, aprobas ou suspendes.';

  @override
  String get maxIncorrectAnswersOffDescription =>
      'O exame ten unha nota numérica do 0 ao 100.';

  @override
  String get maxIncorrectAnswersLimitLabel => 'Número máximo de erros';

  @override
  String get examFailedStatus => 'Exame NON APTO';

  @override
  String get examPassedStatus => 'Exame APTO';

  @override
  String get quizFailedLimitReached =>
      'Exame Finalizado: Superouse o límite máximo de erros permitidos';

  @override
  String get errorInvalidNumber => 'Por favor, introduce un número válido';

  @override
  String get errorNumberMustBePositive => 'O número debe ser maior que 0';

  @override
  String get customNumberLabel => 'Ou introduce un número personalizado:';

  @override
  String get numberInputLabel => 'Número de preguntas';

  @override
  String get questionOrderConfigTitle => 'Configuración da orde das preguntas';

  @override
  String get questionOrderConfigDescription =>
      'Selecciona a orde na que queres que aparezan as preguntas durante o exame:';

  @override
  String get questionOrderAscending => 'Orde ascendente';

  @override
  String get questionOrderAscendingDesc =>
      'As preguntas aparecerán en orde de 1 ao final';

  @override
  String get questionOrderDescending => 'Orde descendent';

  @override
  String get questionOrderDescendingDesc =>
      'As preguntas aparecerán do final a 1';

  @override
  String get questionOrderRandom => 'Aleatorizar a orde das preguntas';

  @override
  String get questionOrderRandomDesc =>
      'As preguntas aparecerán en orde aleatorio';

  @override
  String get questionOrderConfigTooltip =>
      'Configuración da orde das preguntas';

  @override
  String get reorderQuestionsTooltip => 'Reordenar preguntas';

  @override
  String get save => 'Gardar';

  @override
  String get examConfigurationTitle => 'Configuración do exame';

  @override
  String get examTimeLimitTitle => 'Límite de tempo do exame';

  @override
  String get examTimeLimitDescription =>
      'Establece un límite de tempo para o exame. Mostrarase un cronómetro durante o quiz.';

  @override
  String get examTimeLimitOffDescription =>
      'Non hai límite de tempo para este exame.';

  @override
  String get enableTimeLimit => 'Activar límite de tempo';

  @override
  String get timeLimitMinutes => 'Límite de tempo (minutos)';

  @override
  String get examTimeExpiredTitle => 'Tempo esgotado!';

  @override
  String get examTimeExpiredMessage =>
      'O tempo do exame expirou. As túas respostas enviáronse automaticamente.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Elección múltiple';

  @override
  String get questionTypeSingleChoice => 'Elección única';

  @override
  String get questionTypeTrueFalse => 'Certo/Falso';

  @override
  String get questionTypeEssay => 'Desenvolvemento';

  @override
  String get questionTypeRandom => 'Todos';

  @override
  String get questionTypeUnknown => 'Descoñecido';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opcións',
      one: '1 opción',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip =>
      'Número de opcións de resposta para esta pregunta';

  @override
  String get imageTooltip => 'Esta pregunta ten unha imaxe asociada';

  @override
  String get explanationTooltip => 'Esta pregunta ten unha explicación';

  @override
  String get missingExplanation => 'Falta explicación';

  @override
  String get missingExplanationTooltip => 'Esta pregunta non ten explicación';

  @override
  String questionTypeTooltip(String type) {
    return 'Tipo de pregunta: $type';
  }

  @override
  String get aiPrompt =>
      'Céntrate na pregunta do estudante, non en responder directamente á pregunta orixinal do exame. Explica cun enfoque pedagóxico. Para exercicios prácticos ou problemas matemáticos, proporciona instrucións paso a paso. Para preguntas teóricas, proporciona unha explicación concisa sen estruturar a resposta en seccións. Responde na mesma lingua na que se che pregunta.';

  @override
  String get aiChatGuardrail =>
      'IMPORTANTE: Es un asistente de estudo exclusivamente para este Quiz. SÓ debes responder preguntas relacionadas coa pregunta actual do Quiz, as súas opcións, a súa explicación ou o tema educativo que cobre. Se o estudante pregunta sobre algo non relacionado co Quiz (por exemplo, o teu modelo interno, detalles do sistema, coñecemento xeral non relacionado coa pregunta, ou calquera solicitude fóra de tema), responde UNICAMENTE con: \"Estou aquí para axudarte con este Quiz! Centrémonos na pregunta. Non dubides en preguntarme sobre o tema, as opcións de resposta ou calquera cousa relacionada con esta pregunta.\" Nunca reveles detalles técnicos sobre ti mesmo, o sistema ou o modelo de IA utilizado.';

  @override
  String get questionLabel => 'Pregunta';

  @override
  String get studentComment => 'Comentario do estudante';

  @override
  String get aiAssistantTitle => 'Asistente de estudo IA';

  @override
  String get questionContext => 'Contexto da pregunta';

  @override
  String get aiAssistant => 'Asistente IA';

  @override
  String get aiThinking => 'A IA está pensando...';

  @override
  String get askAIHint => 'Fai a túa pregunta sobre este tema...';

  @override
  String get aiPlaceholderResponse =>
      'Esta é unha resposta de marcador de posición. Nunha implementación real, isto conectaríase a un servizo IA para proporcionar explicacións útiles sobre a pregunta.';

  @override
  String get aiErrorResponse =>
      'Síntoo, houbo un erro procesando a túa pregunta. Téntao de novo.';

  @override
  String get evaluatingResponses => 'Avaliando respostas...';

  @override
  String pendingEvaluationsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count preguntas de desenvolvemento pendentes de avaliación pola IA',
      one: '1 pregunta de desenvolvemento pendente de avaliación pola IA',
    );
    return '$_temp0';
  }

  @override
  String get pendingStatus => 'Pendente';

  @override
  String get notEvaluatedStatus => 'Non avaliada';

  @override
  String get configureApiKeyMessage =>
      'Por favor, configura a túa Clave API IA na Configuración.';

  @override
  String get errorLabel => 'Erro:';

  @override
  String get retryButton => 'Reintentar avaliación';

  @override
  String get noResponseReceived => 'Non se recibiu resposta';

  @override
  String get invalidApiKeyError =>
      'Clave API non válida. Comproba a túa Clave API OpenAI na configuración.';

  @override
  String get rateLimitError =>
      'Cota excedida ou modelo non dispoñible no teu plan.';

  @override
  String get modelNotFoundError =>
      'Modelo non atopado. Comproba o teu acceso á API.';

  @override
  String get unknownError => 'Erro descoñecido';

  @override
  String get networkErrorOpenAI =>
      'Erro de rede: Non se pode conectar a OpenAI. Comproba a túa conexión a internet.';

  @override
  String get networkErrorGemini =>
      'Erro de rede: Non se pode conectar a Gemini. Comproba a túa conexión a internet.';

  @override
  String get openaiApiKeyNotConfigured => 'Clave API OpenAI non configurada';

  @override
  String get geminiApiKeyNotConfigured => 'Clave API Gemini non configurada';

  @override
  String get geminiApiKeyLabel => 'Clave API Gemini';

  @override
  String get geminiApiKeyHint => 'Introduce a túa Clave API Gemini';

  @override
  String get geminiApiKeyDescription =>
      'Requirido para a funcionalidade IA Gemini. A túa clave gárdase de forma segura.';

  @override
  String get getGeminiApiKeyTooltip => 'Obter Clave API de Google AI Studio';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'O Asistente de Estudo IA require polo menos unha clave API (Gemini ou OpenAI). Por favor, introduce unha clave API ou desactiva o Asistente de IA.';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get aiButtonTooltip => 'Asistente de Estudo IA';

  @override
  String get aiButtonText => 'IA';

  @override
  String get aiAssistantSettingsTitle =>
      'Asistente de Estudo IA (Vista previa)';

  @override
  String get aiAssistantSettingsDescription =>
      'Activar ou desactivar o asistente de estudo IA para as preguntas';

  @override
  String get aiDefaultModelTitle => 'Modelo IA por defecto';

  @override
  String get aiDefaultModelDescription =>
      'Selecciona o servizo e modelo IA por defecto para a xeración de preguntas';

  @override
  String get openaiApiKeyLabel => 'Clave API OpenAI';

  @override
  String get openaiApiKeyHint => 'Introduce a túa Clave API OpenAI (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Requirido para a integración con OpenAI. A túa clave de OpenAI gárdase de forma segura.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'O Asistente de Estudo IA require unha Clave API OpenAI. Introduce a túa clave API ou desactiva o Asistente IA.';

  @override
  String get getApiKeyTooltip => 'Obter Clave API de OpenAI';

  @override
  String get deleteAction => 'Eliminar';

  @override
  String get explanationLabel => 'Explicación (opcional)';

  @override
  String get explanationHint =>
      'Introduce unha explicación para a/as resposta/as correcta/as';

  @override
  String get explanationTitle => 'Explicación';

  @override
  String get imageLabel => 'Imaxe';

  @override
  String get changeImage => 'Cambiar imaxe';

  @override
  String get removeImage => 'Eliminar imaxe';

  @override
  String get addImageTap => 'Toca para engadir imaxe';

  @override
  String get imageFormats => 'Formatos: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Erro cargando a imaxe';

  @override
  String imagePickError(String error) {
    return 'Erro cargando a imaxe: $error';
  }

  @override
  String get tapToZoom => 'Toca para ampliar';

  @override
  String get trueLabel => 'Certo';

  @override
  String get falseLabel => 'Falso';

  @override
  String get addQuestion => 'Engadir pregunta';

  @override
  String get editQuestion => 'Editar pregunta';

  @override
  String get questionText => 'Texto da pregunta';

  @override
  String get questionType => 'Tipo de pregunta';

  @override
  String get addOption => 'Engadir opción';

  @override
  String get optionsLabel => 'Opcións';

  @override
  String get optionLabel => 'Opción';

  @override
  String get questionTextRequired => 'O texto da pregunta é obrigatorio';

  @override
  String get atLeastOneOptionRequired =>
      'Polo menos unha opción debe ter texto';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'Polo menos unha resposta correcta debe ser seleccionada';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'Só se permite unha resposta correcta para este tipo de pregunta';

  @override
  String get removeOption => 'Eliminar opción';

  @override
  String get selectCorrectAnswer => 'Seleccionar resposta correcta';

  @override
  String get selectCorrectAnswers => 'Seleccionar respostas correctas';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'As opcións $optionNumbers están baleiras. Engádelles texto ou elimínaas.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'A opción $optionNumber está baleira. Engádelle texto ou elimínaa.';
  }

  @override
  String get optionEmptyError => 'Esta opción non pode estar baleira';

  @override
  String get hasImage => 'Imaxe';

  @override
  String get hasExplanation => 'Explicación';

  @override
  String errorLoadingSettings(String error) {
    return 'Erro cargando a configuración: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'Non se puido abrir $url';
  }

  @override
  String get loadingAiServices => 'Cargando servizos IA...';

  @override
  String usingAiService(String serviceName) {
    return 'Usando: $serviceName';
  }

  @override
  String get aiServiceLabel => 'Servizo IA:';

  @override
  String get aiModelLabel => 'Modelo:';

  @override
  String get importQuestionsTitle => 'Importar preguntas';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return 'Atopadas $count preguntas en \"$fileName\". Onde queres importalas?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'Onde queres engadir estas preguntas?';

  @override
  String get importAtBeginning => 'Ao principio';

  @override
  String get importAtEnd => 'Ao final';

  @override
  String questionsImportedSuccess(int count) {
    return 'Importadas con éxito $count preguntas';
  }

  @override
  String get importQuestionsTooltip =>
      'Importar preguntas doutro ficheiro quiz';

  @override
  String get dragDropHintText =>
      'Tamén podes arrastrar e soltar ficheiros .quiz aquí para importar preguntas';

  @override
  String get randomizeQuestionsTitle => 'Randomizar Preguntas';

  @override
  String get randomizeQuestionsDescription =>
      'Baraxar a orde das preguntas durante a execución do quiz';

  @override
  String get randomizeQuestionsOffDescription =>
      'As preguntas aparecerán na súa orde orixinal';

  @override
  String get randomizeAnswersTitle => 'Aleatorizar a orde das respostas';

  @override
  String get randomizeAnswersDescription =>
      'Barallar a orde das opcións de resposta durante a execución do quiz';

  @override
  String get randomizeAnswersOffDescription =>
      'As opcións de resposta aparecerán na súa orde orixinal';

  @override
  String get showCorrectAnswerCountTitle =>
      'Mostrar número de respostas correctas';

  @override
  String get showCorrectAnswerCountDescription =>
      'Mostrar o número de respostas correctas en preguntas de elección múltiple';

  @override
  String get showCorrectAnswerCountOffDescription =>
      'O número de respostas correctas non se mostrará nas preguntas de opción múltiple';

  @override
  String correctAnswersCount(int count) {
    return 'Selecciona $count respostas correctas';
  }

  @override
  String get correctSelectedLabel => 'Correcta';

  @override
  String get correctMissedLabel => 'Correcta';

  @override
  String get incorrectSelectedLabel => 'Incorrecta';

  @override
  String get aiGenerateDialogTitle => 'Xerar preguntas con IA';

  @override
  String get aiQuestionCountLabel => 'Número de preguntas (Opcional)';

  @override
  String get aiQuestionCountHint => 'Deixa baleiro para que a IA decida';

  @override
  String get aiQuestionCountValidation => 'Debe ser un número entre 1 e 50';

  @override
  String get aiQuestionTypeLabel => 'Tipo de pregunta';

  @override
  String get aiQuestionTypeRandom => 'Aleatorio (Mixto)';

  @override
  String get aiLanguageLabel => 'Idioma das preguntas';

  @override
  String get aiContentLabel => 'Contido para xerar preguntas';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max palabras';
  }

  @override
  String get aiContentHint =>
      'Introduce o texto, tema, ou contido a partir do cal queres xerar preguntas...';

  @override
  String get aiContentHelperText =>
      'A IA creará preguntas baseadas neste contido';

  @override
  String aiWordLimitError(int max) {
    return 'Superaches o límite de $max palabras';
  }

  @override
  String get aiContentRequiredError =>
      'Debes proporcionar contido para xerar preguntas';

  @override
  String aiContentLimitError(int max) {
    return 'O contido supera o límite de $max palabras';
  }

  @override
  String get aiMinWordsError =>
      'Proporciona polo menos 10 palabras para xerar preguntas de calidade';

  @override
  String get aiInfoTitle => 'Información';

  @override
  String get aiInfoDescription =>
      '• A IA analizará o contido e xerará preguntas relevantes\n• Se escribes menos de 10 palabras entrarás no modo Tema onde se farán preguntas sobre eses temas específicos\n• Con máis de 10 palabras entrarás no modo Contido que fará preguntas sobre ese mesmo texto (máis palabras = máis precisión)\n• Podes incluír testo, definicións, explicacións, o calquera material educativo\n• As preguntas incluirán opcións de resposta e explicacións\n• O proceso pode tardar uns segundos';

  @override
  String get aiGenerateButton => 'Xerar Preguntas';

  @override
  String get aiEnterContentTitle => 'Introducir contido';

  @override
  String get aiEnterContentDescription =>
      'Introduza o tema ou pegue o contido para xerar preguntas';

  @override
  String get aiContentFieldHint =>
      'Introduza un tema como \"Historia da Segunda Guerra Mundial\" ou pegue texto aquí...';

  @override
  String get aiAttachFileHint => 'Anexar ficheiro (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Solte o ficheiro aquí';

  @override
  String get dropImageHere => 'Solte a imaxe aquí';

  @override
  String get aiNumberQuestionsLabel => 'Número de preguntas';

  @override
  String get backButton => 'Atrás';

  @override
  String get generateButton => 'Xerar';

  @override
  String aiTopicModeCount(int count) {
    return 'Modo Tema ($count palabras)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Modo Texto ($count palabras)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Modo de Contido';

  @override
  String get aiGenerationCategoryTheory => 'Teoría';

  @override
  String get aiGenerationCategoryExercises => 'Exercicios';

  @override
  String get aiGenerationCategoryBoth => 'Mixto';

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
  String get aiServicesLoading => 'Cargando servizos IA...';

  @override
  String get aiServicesNotConfigured => 'Non hai servizos IA configurados';

  @override
  String get aiGeneratedQuestions => 'Xerado por IA';

  @override
  String get aiApiKeyRequired =>
      'Configura polo menos unha clave API IA na Configuración para usar xeración IA.';

  @override
  String get aiGenerationFailed =>
      'Non se puideron xerar preguntas. Proba con contido diferente.';

  @override
  String get aiGenerationErrorTitle => 'Erro xerando preguntas';

  @override
  String get noQuestionsInFile =>
      'Non se atoparon preguntas no ficheiro importado';

  @override
  String get couldNotAccessFile =>
      'Non se puido acceder ao ficheiro seleccionado';

  @override
  String get defaultOutputFileName => 'ficheiro-saída.quiz';

  @override
  String get generateQuestionsWithAI => 'Xerar preguntas con IA';

  @override
  String get addQuestionsWithAI => 'Engadir preguntas con IA';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Límite: $words palabras ou $chars caracteres';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Límite: $words palabras';
  }

  @override
  String get aiAssistantDisabled => 'Asistente de IA Deshabilitado';

  @override
  String get enableAiAssistant =>
      'O asistente de IA está deshabilitado. Actívao na configuración para usar as funcionalidades de IA.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Mínimo $minWords palabras necesarias';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount palabras ✓ Listo para xerar';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords palabras ($moreNeeded máis necesarias)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Mínimo $minWords palabras necesarias ($moreNeeded máis necesarias)';
  }

  @override
  String get enableQuestion => 'Activar pregunta';

  @override
  String get disableQuestion => 'Desactivar pregunta';

  @override
  String get questionDisabled => 'Desactivada';

  @override
  String get noEnabledQuestionsError =>
      'Non hai preguntas activadas dispoñibles para executar o cuestionario';

  @override
  String get evaluateWithAI => 'Avaliar con IA';

  @override
  String get aiEvaluation => 'Avaliación de IA';

  @override
  String aiEvaluationError(String error) {
    return 'Erro ao avaliar a resposta: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'Es un profesor especializado en avaliar respostas de estudantes a preguntas de ensaio. A túa tarefa é proporcionar avaliacións detalladas e construtivas. Responde no mesmo idioma que a resposta do estudante.';

  @override
  String get aiEvaluationPromptQuestion => 'Pregunta:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'Resposta do estudante:';

  @override
  String get aiEvaluationPromptCriteria =>
      'Criterios de avaliación (baseados na explicación do profesor):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'Instrucións específicas:\n- Avalía ata que punto a resposta do estudante se axusta aos criterios establecidos\n- Analiza o grao de integración e estrutura na resposta\n- Identifica se non se tivo en conta algo importante segundo os criterios\n- Considera a profundidade e precisión da análise';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'Instrucións xerais:\n- Como non se estableceron criterios específicos, avalía a resposta baseándote en estándares académicos xerais\n- Considera a claridade, coherencia e estrutura da resposta\n- Avalía se a resposta demostra comprensión do tema\n- Analiza a profundidade da análise e a calidade da argumentación';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'Formato de resposta:\n1. Puntuación: [X/10] - Xustifica brevemente a puntuación\n2. Puntos fortes: Indica os aspectos positivos da resposta\n3. Áreas de mellora: Sinala os aspectos que se poden mellorar\n4. Comentarios específicos: Proporciona retroalimentación detallada e construtiva\n5. Suxestións: Ofrece recomendacións específicas para mellorar\n\nSé construtivo, específico e educativo na túa avaliación. O obxectivo é axudar ao estudante a aprender e mellorar. Diríxete a el en segunda persoa e utiliza un ton profesional pero accesible.';

  @override
  String get aiModeTopicTitle => 'Modo Tema';

  @override
  String get aiModeTopicDescription => 'Exploración creativa do tema';

  @override
  String get aiModeContentTitle => 'Modo Contido';

  @override
  String get aiModeContentDescription =>
      'Preguntas precisas baseadas na túa entrada';

  @override
  String aiWordCountIndicator(int count) {
    return '$count palabras';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Precisión: $level';
  }

  @override
  String get aiPrecisionLow => 'Baixa';

  @override
  String get aiPrecisionMedium => 'Media';

  @override
  String get aiPrecisionHigh => 'Alta';

  @override
  String get aiMoreWordsMorePrecision => 'Máis palabras = máis precisión';

  @override
  String get aiKeepDraftTitle => 'Manter o borrador da IA';

  @override
  String get aiKeepDraftDescription =>
      'Gardar automaticamente o texto introducido no diálogo de xeración de IA para que non se perda se se pecha o diálogo.';

  @override
  String get aiAttachFile => 'Anexar ficheiro';

  @override
  String get aiRemoveFile => 'Eliminar ficheiro';

  @override
  String get aiFileMode => 'Modo ficheiro';

  @override
  String get aiFileModeDescription =>
      'As preguntas xeraranse a partir do ficheiro anexado';

  @override
  String get aiCommentsLabel => 'Comentarios (Opcional)';

  @override
  String get aiCommentsHint =>
      'Engade instrucións ou comentarios sobre o ficheiro anexado...';

  @override
  String get aiCommentsHelperText =>
      'Opcionalmente, engade instrucións sobre como xerar preguntas a partir do ficheiro';

  @override
  String get aiFilePickerError => 'Non se puido cargar o ficheiro seleccionado';

  @override
  String get studyModeLabel => 'Modo estudo';

  @override
  String get studyModeDescription =>
      'Asistencia de IA dispoñible. Feedback instantáneo tras cada resposta, sen límites de tiempo nin penalizacións.';

  @override
  String get examModeLabel => 'Modo exame';

  @override
  String get examModeDescription =>
      'Sen asistencia de IA. Poden aplicarse límites de tempo e penalizacións por respostas incorrectas.';

  @override
  String get checkAnswer => 'Comprobar';

  @override
  String get quizModeTitle => 'Modo cuestionario';

  @override
  String get settingsTitle => 'Axustes';

  @override
  String get askAiAssistant => 'Preguntar ao asistente de IA';

  @override
  String get askAiAboutQuestion => 'Preguntar á IA sobre esta pregunta';

  @override
  String get aiHelpWithQuestion => 'Axúdame a entender esta pregunta';

  @override
  String get edit => 'Editar';

  @override
  String get enable => 'Activar';

  @override
  String get disable => 'Desactivar';

  @override
  String get quizPreviewTitle => 'Vista previa do cuestionario';

  @override
  String get select => 'Seleccionar';

  @override
  String get done => 'Feito';

  @override
  String get importButton => 'Importar';

  @override
  String get reorderButton => 'Reordenar';

  @override
  String get startQuizButton => 'Comezar cuestionario';

  @override
  String get deleteConfirmation =>
      'Estás seguro de que queres eliminar este cuestionario?';

  @override
  String get saveSuccess => 'Ficheiro gardado correctamente';

  @override
  String get errorSavingFile => 'Erro ao gardar o ficheiro';

  @override
  String get deleteSingleQuestionConfirmation =>
      'Estás seguro de que queres eliminar esta pregunta?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'Estás seguro de que queres eliminar $count preguntas?';
  }

  @override
  String get keepPracticing => 'Segue practicando para mellorar!';

  @override
  String get tryAgain => 'Intentalo de novo';

  @override
  String get review => 'Repasar';

  @override
  String get home => 'Inicio';

  @override
  String get allLabel => 'Todas';

  @override
  String get subtractPointsLabel => 'Restar puntos por resposta incorrecta';

  @override
  String get subtractPointsDescription =>
      'Resta puntos por cada resposta incorrecta.';

  @override
  String get subtractPointsOffDescription =>
      'As respostas incorrectas no restan puntos.';

  @override
  String get penaltyAmountLabel => 'Cantidade de penalización';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount pts / erro';
  }

  @override
  String get allQuestionsLabel => 'Todas as preguntas';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Iniciar con $count seleccionadas';
  }

  @override
  String get advancedSettingsTitle => 'Axustes Avanzados (Debug)';

  @override
  String get appLanguageLabel => 'Idioma da aplicación';

  @override
  String get appLanguageDescription =>
      'Sobrescribir o idioma da aplicación para probas';

  @override
  String get pasteFromClipboard => 'Pegar dende o portapapeis';

  @override
  String get pasteImage => 'Pegar';

  @override
  String get clipboardNoImage => 'Non se atopou imaxe no portapapeis';

  @override
  String get close => 'Pechar';

  @override
  String get scoringAndLimitsTitle => 'Puntuación e límites';

  @override
  String get congratulations => '🎉 Parabéns! 🎉';

  @override
  String get validationMin1Error => 'Mínimo 1 minuto';

  @override
  String remainingTimeWithDays(
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${days}d $hours:$minutes:$seconds';
  }

  @override
  String remainingTimeWithWeeks(
    String weeks,
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${weeks}s ${days}d $hours:$minutes:$seconds';
  }

  @override
  String get validationMax30DaysError => 'Máximo 30 días';

  @override
  String get validationMin0GenericError => 'Minimum 0';

  @override
  String get errorStatus => 'Error';

  @override
  String get featureComingSoon =>
      'Proximamente dispoñible! Mantente ao tanto das novidades.';

  @override
  String get showOnboarding => 'Amosar o acollemento';

  @override
  String get showOnboardingDescription => 'Ver o titorial de benvida de novo';

  @override
  String get onboardingBack => 'Atrás';

  @override
  String get onboardingGetStarted => 'Comezar';

  @override
  String get onboardingWelcomeTitle => 'Benvido a QuizLab AI';

  @override
  String get onboardingWelcomeDescription =>
      'O teu compañeiro interactivo de cuestionarios con funcións impulsadas por IA, preguntas personalizables e puntuación en tempo real.';

  @override
  String get onboardingWelcomeSubtitle =>
      'O teu compañeiro interactivo de cuestionarios';

  @override
  String get onboardingStartQuizTitle => 'Iniciar un Cuestionario';

  @override
  String get onboardingStartQuizDescription =>
      'Carga un ficheiro .quiz existente o crea un novo desde cero. Arrastra e solta ficheiros directamente ou usa o selector de ficheiros.';

  @override
  String get onboardingStartQuizSubtitle => 'Carga, crea e xoga';

  @override
  String get onboardingCreateQuestionsTitle => 'Crear Preguntas';

  @override
  String get onboardingCreateQuestionsDescription =>
      'Crea cuestionarios con múltiples tipos de preguntas. Personaliza cada pregunta con opcións, respostas correctas e explicacións.';

  @override
  String get onboardingCreateQuestionsSubtitle =>
      'Deseña os teus propios cuestionarios';

  @override
  String get onboardingAiFeaturesTitle => 'Funcións impulsadas por IA';

  @override
  String get onboardingAiFeaturesDescription =>
      'Xera preguntas automaticamente con IA, obtén asistencia de estudo en tempo real e aprende de forma máis intelixeinte con titoría intelixente.';

  @override
  String get onboardingAiFeaturesSubtitle => 'Impulsado por IA';

  @override
  String get onboardingFeatureAiTitle => 'Xeración de preguntas con IA';

  @override
  String get onboardingFeatureAiDescription =>
      'Xera cuestionarios desde calquera texto con GPT ou Gemini';

  @override
  String get onboardingFeatureTypesTitle => 'Múltiples tipos de preguntas';

  @override
  String get onboardingFeatureTypesDescription =>
      'Opción única, opción múltiple, verdadeiro/falso e ensaio';

  @override
  String get onboardingFeatureLanguagesTitle => '13 idiomas compatibles';

  @override
  String get onboardingFeatureLanguagesDescription =>
      'Crea e fai cuestionarios en varios idiomas';

  @override
  String get onboardingStepCreateTitle => 'Crear Cuestionario';

  @override
  String get onboardingStepCreateDescription =>
      'Comeza de cero coas túas propias preguntas';

  @override
  String get onboardingStepLoadTitle => 'Cargar Ficheiro';

  @override
  String get onboardingStepLoadDescription =>
      'Importa un ficheiro .quiz desde o teu dispositivo';

  @override
  String get onboardingStepTakeTitle => 'Facer o Cuestionario';

  @override
  String get onboardingStepTakeDescription =>
      'Responde ás preguntas e obtén a puntuación en tempo real';

  @override
  String get onboardingAiAutoGenerateTitle => 'Xerar preguntas automaticamente';

  @override
  String get onboardingAiAutoGenerateDescription =>
      'Desde calquera texto con GPT ou Gemini';

  @override
  String get onboardingAiStudyAssistantTitle => 'Asistente de Estudo IA';

  @override
  String get onboardingAiStudyAssistantDescription =>
      'Obtén explicacións mentres aprendes';

  @override
  String get onboardingAiMultiLanguageTitle => 'Soporte multi-idioma';

  @override
  String get onboardingAiMultiLanguageDescription =>
      'Xera en 13 idiomas diferentes';
}
