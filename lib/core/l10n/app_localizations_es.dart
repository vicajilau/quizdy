// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get abortQuizTitle => '¿Abortar Quiz?';

  @override
  String get abortQuizMessage =>
      'Abrir un nuevo archivo detendrá el cuestionario actual.';

  @override
  String get stopAndOpenButton => 'Detener y Abrir';

  @override
  String get titleAppBar => 'Quiz - Simulador de exámenes';

  @override
  String get create => 'Crear';

  @override
  String get preview => 'Vista previa';

  @override
  String get previewLabel => 'Vista previa:';

  @override
  String get emptyPlaceholder => '(vacío)';

  @override
  String get latexSyntaxTitle => 'Sintaxis LaTeX:';

  @override
  String get latexSyntaxHelp =>
      'Matemáticas en línea: Usa \$...\$ para expresiones LaTeX\nEjemplo: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'Vista previa del renderizado LaTeX';

  @override
  String get okButton => 'Aceptar';

  @override
  String get load => 'Cargar';

  @override
  String fileLoaded(String filePath) {
    return 'Archivo cargado: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'Archivo guardado: $filePath';
  }

  @override
  String get dropFileHere =>
      'Haz clic en el logo o arrastra un archivo .quiz a la pantalla';

  @override
  String get errorOpeningFile => 'Error al abrir el archivo';

  @override
  String get replaceFileTitle => 'Cargar nuevo Quiz';

  @override
  String get replaceFileMessage =>
      'Ya hay un Quiz cargado. ¿Deseas reemplazarlo con el nuevo archivo?';

  @override
  String get replaceButton => 'Cargar';

  @override
  String get clickOrDragFile =>
      'Haz clic para cargar o arrastra un archivo .quiz a la pantalla';

  @override
  String get errorInvalidFile =>
      'Error: archivo no válido. Debe ser un archivo .quiz.';

  @override
  String errorLoadingFile(String error) {
    return 'Error al cargar el archivo: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Error al exportar el archivo: $error';
  }

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get saveButton => 'Guardar';

  @override
  String get confirmDeleteTitle => 'Confirmar eliminación';

  @override
  String confirmDeleteMessage(String processName) {
    return '¿Estás seguro de que quieres eliminar `$processName`?';
  }

  @override
  String get deleteButton => 'Eliminar';

  @override
  String get confirmExitTitle => 'Confirmar salida';

  @override
  String get confirmExitMessage =>
      'Existen cambios sin guardar. ¿Quieres salir descartando los cambios?';

  @override
  String get exitButton => 'Salir sin guardar';

  @override
  String get saveDialogTitle => 'Por favor selecciona un archivo de salida:';

  @override
  String get createQuizFileTitle => 'Crear archivo Quiz';

  @override
  String get editQuizFileTitle => 'Editar archivo de cuestionario';

  @override
  String get fileNameLabel => 'Nombre del archivo';

  @override
  String get fileDescriptionLabel => 'Descripción del archivo';

  @override
  String get createButton => 'Crear';

  @override
  String get fileNameRequiredError => 'El nombre del archivo es requerido.';

  @override
  String get fileDescriptionRequiredError =>
      'La descripción del archivo es requerida.';

  @override
  String get versionLabel => 'Versión';

  @override
  String get authorLabel => 'Autor';

  @override
  String get authorRequiredError => 'El autor es requerido.';

  @override
  String get requiredFieldsError =>
      'Todos los campos requeridos deben ser completados.';

  @override
  String get requestFileNameTitle => 'Ingresa el nombre del archivo Quiz';

  @override
  String get fileNameHint => 'Nombre del archivo (opcional)';

  @override
  String get emptyFileNameMessage => 'Por favor, ingresa un nombre de archivo';

  @override
  String get acceptButton => 'Aceptar';

  @override
  String get saveTooltip => 'Guardar el archivo';

  @override
  String get saveDisabledTooltip => 'No hay cambios que guardar';

  @override
  String get executeTooltip => 'Ejecutar el examen';

  @override
  String get addTooltip => 'Agregar una nueva pregunta';

  @override
  String get backSemanticLabel => 'Botón volver';

  @override
  String get createFileTooltip => 'Crear un nuevo archivo Quiz';

  @override
  String get loadFileTooltip => 'Cargar un archivo Quiz existente';

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
  String get questionsOverview => 'Ver mapa de preguntas';

  @override
  String get next => 'Siguiente';

  @override
  String get finish => 'Finalizar';

  @override
  String get finishQuiz => 'Finalizar Quiz';

  @override
  String get finishQuizConfirmation =>
      '¿Estás seguro de que quieres finalizar el quiz? No podrás cambiar tus respuestas después.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount preguntas sin responder',
      one: '1 pregunta sin responder',
    );
    return 'Tienes $_temp0. ¿Estás seguro de que quieres terminar el cuestionario?';
  }

  @override
  String get resolveUnansweredQuestions => 'Resolver preguntas';

  @override
  String get abandonQuiz => 'Abandonar Quiz';

  @override
  String get abandonQuizConfirmation =>
      '¿Estás seguro de que quieres abandonar el quiz? Se perderá todo el progreso.';

  @override
  String get abandon => 'Abandonar';

  @override
  String get quizCompleted => '¡Quiz completado!';

  @override
  String score(String score) {
    return 'Puntuación';
  }

  @override
  String correctAnswers(String correct, int total) {
    return '$correct de $total respuestas correctas';
  }

  @override
  String get retry => 'Repetir';

  @override
  String get goBack => 'Finalizar';

  @override
  String get retryFailedQuestions => 'Reintentar errores';

  @override
  String question(String question) {
    return 'Pregunta: $question';
  }

  @override
  String get selectQuestionCountTitle => 'Seleccionar número de preguntas';

  @override
  String get selectQuestionCountMessage =>
      '¿Cuántas preguntas te gustaría responder en este quiz?';

  @override
  String allQuestions(int count) {
    return 'Todas las preguntas ($count)';
  }

  @override
  String get startQuiz => 'Iniciar Quiz';

  @override
  String get maxIncorrectAnswersLabel => 'Limitar respuestas incorrectas';

  @override
  String get maxIncorrectAnswersDescription =>
      'Examen de Apto / No Apto. No hay nota numérica, apruebas o suspendes.';

  @override
  String get maxIncorrectAnswersOffDescription =>
      'El examen tiene una nota numérica del 0 al 100.';

  @override
  String get maxIncorrectAnswersLimitLabel => 'Máximo de errores permitidos';

  @override
  String get examFailedStatus => 'Examen NO APTO';

  @override
  String get examPassedStatus => 'Examen APTO';

  @override
  String get quizFailedLimitReached =>
      'Examen Finalizado: Se ha alcanzado el límite máximo de errores';

  @override
  String get errorInvalidNumber => 'Por favor ingresa un número válido';

  @override
  String get errorNumberMustBePositive => 'El número debe ser mayor que 0';

  @override
  String get customNumberLabel => 'O introduce un número personalizado:';

  @override
  String get numberInputLabel => 'Número de preguntas';

  @override
  String get questionOrderConfigTitle => 'Configuración del Orden de Preguntas';

  @override
  String get questionOrderConfigDescription =>
      'Selecciona el orden en que deseas que aparezcan las preguntas durante el examen:';

  @override
  String get questionOrderAscending => 'Orden ascendente';

  @override
  String get questionOrderAscendingDesc =>
      'Las preguntas aparecerán en orden del 1 al final';

  @override
  String get questionOrderDescending => 'Orden descendente';

  @override
  String get questionOrderDescendingDesc =>
      'Las preguntas aparecerán del final al 1';

  @override
  String get questionOrderRandom => 'Aleatorizar el orden de las preguntas';

  @override
  String get questionOrderRandomDesc =>
      'Las preguntas aparecerán en orden aleatorio';

  @override
  String get questionOrderConfigTooltip =>
      'Configuración del orden de preguntas';

  @override
  String get reorderQuestionsTooltip => 'Reordenar preguntas';

  @override
  String get save => 'Guardar';

  @override
  String get examConfigurationTitle => 'Configuración del examen';

  @override
  String get examTimeLimitTitle => 'Límite de tiempo del examen';

  @override
  String get examTimeLimitDescription =>
      'Establece un límite de tiempo para el examen. Se mostrará un cronómetro durante el quiz.';

  @override
  String get examTimeLimitOffDescription =>
      'No hay límite de tiempo para este examen.';

  @override
  String get enableTimeLimit => 'Habilitar límite de tiempo';

  @override
  String get timeLimitMinutes => 'Límite de tiempo (minutos)';

  @override
  String get examTimeExpiredTitle => '¡Se acabó el tiempo!';

  @override
  String get examTimeExpiredMessage =>
      'El tiempo del examen ha expirado. Tus respuestas han sido enviadas automáticamente.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Opción múltiple';

  @override
  String get questionTypeSingleChoice => 'Opción única';

  @override
  String get questionTypeTrueFalse => 'Verdadero/Falso';

  @override
  String get questionTypeEssay => 'Desarrollo';

  @override
  String get questionTypeRandom => 'Todos';

  @override
  String get questionTypeUnknown => 'Desconocido';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opciones',
      one: '1 opción',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip =>
      'Número de opciones de respuesta para esta pregunta';

  @override
  String get imageTooltip => 'Esta pregunta tiene una imagen asociada';

  @override
  String get explanationTooltip => 'Esta pregunta tiene una explicación';

  @override
  String get missingExplanation => 'Falta explicación';

  @override
  String get missingExplanationTooltip => 'Esta pregunta no tiene explicación';

  @override
  String questionTypeTooltip(String type) {
    return 'Tipos de pregunta: $type';
  }

  @override
  String get aiPrompt =>
      'Enfócate en la pregunta del estudiante, no en responder directamente la pregunta original del examen. Explica con un enfoque pedagógico. Para ejercicios prácticos o problemas matemáticos, proporciona instrucciones paso a paso. Para preguntas teóricas, proporciona una explicación concisa sin estructurar la respuesta en secciones. Responde en el mismo idioma en que te pregunten.';

  @override
  String get aiChatGuardrail =>
      'IMPORTANTE: Eres un asistente de estudio exclusivamente para este Quiz. SOLO debes responder preguntas relacionadas con la pregunta actual del Quiz, sus opciones, su explicación o el tema educativo que cubre. Si el estudiante pregunta sobre algo no relacionado con el Quiz (por ejemplo, tu modelo interno, detalles del sistema, conocimiento general no relacionado con la pregunta, o cualquier solicitud fuera de tema), responde ÚNICAMENTE con: \"¡Estoy aquí para ayudarte con este Quiz! Centrémonos en la pregunta. No dudes en preguntarme sobre el tema, las opciones de respuesta o cualquier cosa relacionada con esta pregunta.\" Nunca reveles detalles técnicos sobre ti mismo, el sistema o el modelo de IA utilizado.';

  @override
  String get questionLabel => 'Pregunta';

  @override
  String get studentComment => 'Comentario del estudiante';

  @override
  String get aiAssistantTitle => 'Asistente de estudio IA';

  @override
  String get questionContext => 'Contexto de la pregunta';

  @override
  String get aiAssistant => 'Asistente IA';

  @override
  String get aiThinking => 'La IA está pensando...';

  @override
  String get askAIHint => 'Haz tu pregunta sobre este tema...';

  @override
  String get aiPlaceholderResponse =>
      'Esta es una respuesta de ejemplo. En una implementación real, esto se conectaría a un servicio de IA para proporcionar explicaciones útiles sobre la pregunta.';

  @override
  String get aiErrorResponse =>
      'Lo siento, hubo un error al procesar tu pregunta. Por favor, inténtalo de nuevo.';

  @override
  String get evaluatingResponses => 'Evaluando respuestas...';

  @override
  String pendingEvaluationsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count preguntas de desarrollo pendientes de evaluación por IA',
      one: '1 pregunta de desarrollo pendiente de evaluación por IA',
    );
    return '$_temp0';
  }

  @override
  String get pendingStatus => 'Pendiente';

  @override
  String get notEvaluatedStatus => 'Sin evaluar';

  @override
  String get configureApiKeyMessage =>
      'Por favor, configura tu clave API de IA en Ajustes.';

  @override
  String get errorLabel => 'Error:';

  @override
  String get retryButton => 'Reintentar Evaluación';

  @override
  String get noResponseReceived => 'No se recibió respuesta';

  @override
  String get invalidApiKeyError =>
      'Clave API inválida. Por favor, verifica tu clave API de OpenAI en ajustes.';

  @override
  String get rateLimitError =>
      'Cuota excedida o modelo no disponible en tu plan.';

  @override
  String get modelNotFoundError =>
      'Modelo no encontrado. Por favor, verifica tu acceso a la API.';

  @override
  String get unknownError => 'Error desconocido';

  @override
  String get networkErrorOpenAI =>
      'Error de red: No se puede conectar a OpenAI. Por favor, verifica tu conexión a internet.';

  @override
  String get networkErrorGemini =>
      'Error de red: No se puede conectar a Google Gemini. Por favor, verifica tu conexión a internet.';

  @override
  String get openaiApiKeyNotConfigured => 'Clave API de OpenAI no configurada';

  @override
  String get geminiApiKeyNotConfigured => 'Clave API de Gemini no configurada';

  @override
  String get geminiApiKeyLabel => 'Clave API de Gemini';

  @override
  String get geminiApiKeyHint => 'Ingresa tu clave API de Gemini';

  @override
  String get geminiApiKeyDescription =>
      'Requerida para la funcionalidad de IA Gemini. Tu clave se guarda de forma segura.';

  @override
  String get getGeminiApiKeyTooltip => 'Obtener clave API de Google AI Studio';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'El Asistente de estudio IA requiere al menos una clave API (Gemini u OpenAI). Por favor, ingresa una clave API o deshabilita el Asistente de IA.';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get aiButtonTooltip => 'Asistente de estudio IA';

  @override
  String get aiButtonText => 'IA';

  @override
  String get aiAssistantSettingsTitle => 'Asistente de estudio IA (Preview)';

  @override
  String get aiAssistantSettingsDescription =>
      'Habilitar o deshabilitar el asistente de IA para las preguntas';

  @override
  String get aiDefaultModelTitle => 'Modelo de IA por defecto';

  @override
  String get aiDefaultModelDescription =>
      'Selecciona el servicio y modelo de IA por defecto para la generación de preguntas';

  @override
  String get openaiApiKeyLabel => 'Clave API de OpenAI';

  @override
  String get openaiApiKeyHint => 'Ingresa tu clave API de OpenAI (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Requerido para la integración con OpenAI. Tu clave de OpenAI se almacena de forma segura.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'El Asistente de estudio IA requiere una clave API de OpenAI. Por favor, ingresa tu clave API o desactiva el Asistente de IA.';

  @override
  String get getApiKeyTooltip => 'Obtener clave API de OpenAI';

  @override
  String get deleteAction => 'Eliminar';

  @override
  String get explanationLabel => 'Explicación (opcional)';

  @override
  String get explanationHint =>
      'Ingresa una explicación para la(s) respuesta(s) correcta(s)';

  @override
  String get explanationTitle => 'Explicación';

  @override
  String get imageLabel => 'Imagen';

  @override
  String get changeImage => 'Cambiar imagen';

  @override
  String get removeImage => 'Quitar imagen';

  @override
  String get addImageTap => 'Toca para agregar imagen';

  @override
  String get imageFormats => 'Formatos: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Error al cargar la imagen';

  @override
  String imagePickError(String error) {
    return 'Error al cargar la imagen: $error';
  }

  @override
  String get tapToZoom => 'Toca para ampliar';

  @override
  String get trueLabel => 'Verdadero';

  @override
  String get falseLabel => 'Falso';

  @override
  String get addQuestion => 'Agregar pregunta';

  @override
  String get editQuestion => 'Editar pregunta';

  @override
  String get questionText => 'Texto de la pregunta';

  @override
  String get questionType => 'Tipo de pregunta';

  @override
  String get addOption => 'Agregar opción';

  @override
  String get optionsLabel => 'Opciones';

  @override
  String get optionLabel => 'Opción';

  @override
  String get questionTextRequired => 'El texto de la pregunta es obligatorio';

  @override
  String get atLeastOneOptionRequired => 'Al menos una opción debe tener texto';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'Debe seleccionar al menos una respuesta correcta';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'Solo se permite una respuesta correcta para este tipo de pregunta';

  @override
  String get removeOption => 'Eliminar opción';

  @override
  String get selectCorrectAnswer => 'Seleccionar respuesta correcta';

  @override
  String get selectCorrectAnswers => 'Seleccionar respuestas correctas';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'Las opciones $optionNumbers están vacías. Por favor añade texto o elimínalas.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'La opción $optionNumber está vacía. Por favor añade texto o elimínala.';
  }

  @override
  String get optionEmptyError => 'Esta opción no puede estar vacía';

  @override
  String get hasImage => 'Imagen';

  @override
  String get hasExplanation => 'Explicación';

  @override
  String errorLoadingSettings(String error) {
    return 'Error al cargar configuraciones: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'No se pudo abrir $url';
  }

  @override
  String get loadingAiServices => 'Cargando servicios de IA...';

  @override
  String usingAiService(String serviceName) {
    return 'Usando: $serviceName';
  }

  @override
  String get aiServiceLabel => 'Servicio de IA:';

  @override
  String get aiModelLabel => 'Modelo:';

  @override
  String get importQuestionsTitle => 'Importar Preguntas';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return 'Se encontraron $count preguntas en \"$fileName\". ¿Dónde te gustaría importarlas?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      '¿Dónde te gustaría añadir estas preguntas?';

  @override
  String get importAtBeginning => 'Al inicio';

  @override
  String get importAtEnd => 'Al final';

  @override
  String questionsImportedSuccess(int count) {
    return 'Se importaron exitosamente $count preguntas';
  }

  @override
  String get importQuestionsTooltip =>
      'Importar preguntas desde otro archivo de quiz';

  @override
  String get dragDropHintText =>
      'También puedes arrastrar y soltar archivos .quiz aquí para importar preguntas';

  @override
  String get randomizeQuestionsTitle => 'Aleatorizar preguntas';

  @override
  String get randomizeQuestionsDescription =>
      'Mezclar el orden de las preguntas durante la ejecución del quiz';

  @override
  String get randomizeQuestionsOffDescription =>
      'Las preguntas aparecerán en su orden original';

  @override
  String get randomizeAnswersTitle => 'Aleatorizar el orden de las respuestas';

  @override
  String get randomizeAnswersDescription =>
      'Mezclar el orden de las opciones de respuesta durante la ejecución del quiz';

  @override
  String get randomizeAnswersOffDescription =>
      'Las opciones de respuesta aparecerán en su orden original';

  @override
  String get showCorrectAnswerCountTitle =>
      'Mostrar número de respuestas correctas';

  @override
  String get showCorrectAnswerCountDescription =>
      'Mostrar el número de respuestas correctas en preguntas de opción múltiple';

  @override
  String get showCorrectAnswerCountOffDescription =>
      'No se mostrará el número de respuestas correctas en las preguntas de opción múltiple';

  @override
  String correctAnswersCount(int count) {
    return 'Selecciona $count respuestas correctas';
  }

  @override
  String get correctSelectedLabel => 'Correcta';

  @override
  String get correctMissedLabel => 'Correcta';

  @override
  String get incorrectSelectedLabel => 'Incorrecta';

  @override
  String get aiGenerateDialogTitle => 'Generar preguntas con IA';

  @override
  String get aiQuestionCountLabel => 'Número de preguntas (Opcional)';

  @override
  String get aiQuestionCountHint => 'Déjalo vacío para que la IA decida';

  @override
  String get aiQuestionCountValidation => 'Debe ser un número entre 1 y 50';

  @override
  String get aiQuestionTypeLabel => 'Tipo de preguntas';

  @override
  String get aiQuestionTypeRandom => 'Aleatorio (Mezcla)';

  @override
  String get aiLanguageLabel => 'Idioma de las preguntas';

  @override
  String get aiContentLabel => 'Contenido para generar preguntas';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max palabras';
  }

  @override
  String get aiContentHint =>
      'Introduce el texto, tema o contenido del cual quieres generar preguntas...';

  @override
  String get aiContentHelperText =>
      'La IA creará preguntas basadas en este contenido';

  @override
  String aiWordLimitError(int max) {
    return 'Has superado el límite de $max palabras';
  }

  @override
  String get aiContentRequiredError =>
      'Debes proporcionar contenido para generar las preguntas';

  @override
  String aiContentLimitError(int max) {
    return 'El contenido supera el límite de $max palabras';
  }

  @override
  String get aiMinWordsError =>
      'Proporciona al menos 10 palabras para generar preguntas de calidad';

  @override
  String get aiInfoTitle => 'Información';

  @override
  String get aiInfoDescription =>
      '• La IA analizará el contenido y generará preguntas relevantes\n• Si escribes menos de 10 palabras entrarás en modo Tema donde se realizarán preguntas sobre esos temas específicos\n• Con más de 10 palabras entrarás en modo Contenido que hará preguntas sobre ese mismo texto (más palabras = más precisión)\n• Puedes incluir texto, definiciones, explicaciones o cualquier material educativo\n• Las preguntas incluirán opciones de respuesta y explicaciones\n• El proceso puede tardar unos segundos';

  @override
  String get aiGenerateButton => 'Generar preguntas';

  @override
  String get aiEnterContentTitle => 'Introducir contenido';

  @override
  String get aiEnterContentDescription =>
      'Introduce el tema o pega el contenido para generar preguntas';

  @override
  String get aiContentFieldHint =>
      'Introduce un tema como \"Historia de la Segunda Guerra Mundial\" o pega el contenido de texto aquí...';

  @override
  String get aiAttachFileHint => 'Adjunta un archivo (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Suelta el archivo aquí';

  @override
  String get dropImageHere => 'Suelta la imagen aquí';

  @override
  String get aiNumberQuestionsLabel => 'Número de preguntas';

  @override
  String get backButton => 'Volver';

  @override
  String get generateButton => 'Generar';

  @override
  String aiTopicModeCount(int count) {
    return 'Modo Tema ($count palabras)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Modo Texto ($count palabras)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Modo de Contenido';

  @override
  String get aiGenerationCategoryTheory => 'Teoría';

  @override
  String get aiGenerationCategoryExercises => 'Ejercicios';

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
  String get aiServicesLoading => 'Cargando servicios de IA...';

  @override
  String get aiServicesNotConfigured => 'No hay servicios de IA configurados';

  @override
  String get aiGeneratedQuestions => 'IA Generadas';

  @override
  String get aiApiKeyRequired =>
      'Por favor, configura al menos una clave API de IA en Ajustes para usar la generación con IA.';

  @override
  String get aiGenerationFailed =>
      'No se pudieron generar preguntas. Intenta con un contenido diferente.';

  @override
  String get aiGenerationErrorTitle => 'Error al generar preguntas';

  @override
  String get noQuestionsInFile =>
      'No se encontraron preguntas en el archivo importado';

  @override
  String get couldNotAccessFile => 'No se pudo acceder al archivo seleccionado';

  @override
  String get defaultOutputFileName => 'archivo-salida.quiz';

  @override
  String get generateQuestionsWithAI => 'Generar preguntas con IA';

  @override
  String get addQuestionsWithAI => 'Añadir preguntas con IA';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Límite: $words palabras o $chars caracteres';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Límite: $words palabras';
  }

  @override
  String get aiAssistantDisabled => 'Asistente de IA Deshabilitado';

  @override
  String get enableAiAssistant =>
      'El asistente de IA está deshabilitado. Por favor, actívalo en la configuración para usar las funciones de IA.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Mínimo $minWords palabras requeridas';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount palabras ✓ Listo para generar';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords palabras ($moreNeeded más necesarias)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Mínimo $minWords palabras necesarias ($moreNeeded más necesarias)';
  }

  @override
  String get enableQuestion => 'Activar la pregunta';

  @override
  String get disableQuestion => 'Desactivar la pregunta';

  @override
  String get questionDisabled => 'Desactivada';

  @override
  String get noEnabledQuestionsError =>
      'No hay preguntas habilitadas para ejecutar el examen';

  @override
  String get evaluateWithAI => 'Evaluar con IA';

  @override
  String get aiEvaluation => 'Evaluación IA';

  @override
  String aiEvaluationError(String error) {
    return 'Error al evaluar la respuesta: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'Eres un profesor experto evaluando la respuesta de un estudiante a una pregunta de desarrollo. Tu tarea es proporcionar una evaluación detallada y constructiva. Responde en el mismo idioma que la respuesta del estudiante.';

  @override
  String get aiEvaluationPromptQuestion => 'PREGUNTA:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'RESPUESTA DEL ESTUDIANTE:';

  @override
  String get aiEvaluationPromptCriteria =>
      'CRITERIOS DE EVALUACIÓN (basados en la explicación del profesor):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'INSTRUCCIONES ESPECÍFICAS:\n- Evalúa qué tan bien la respuesta del estudiante se alinea con los criterios establecidos\n- Analiza el grado de síntesis y estructura de la respuesta\n- Identifica si se ha dejado algo importante por mencionar según los criterios\n- Considera la profundidad y precisión del análisis';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'INSTRUCCIONES GENERALES:\n- Como no hay criterios específicos establecidos, evalúa la respuesta basándote en estándares académicos generales\n- Considera la claridad, coherencia y estructura de la respuesta\n- Evalúa si la respuesta demuestra comprensión del tema\n- Analiza la profundidad del análisis y la calidad de los argumentos';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'FORMATO DE RESPUESTA:\n1. CALIFICACIÓN: [X/10] - Justifica brevemente la nota\n2. FORTALEZAS: Menciona los aspectos positivos de la respuesta\n3. ÁREAS DE MEJORA: Señala qué aspectos podrían mejorarse\n4. COMENTARIOS ESPECÍFICOS: Proporciona feedback detallado y constructivo\n5. SUGERENCIAS: Ofrece recomendaciones específicas para mejorar\n\nSé constructivo, específico y educativo en tu evaluación. El objetivo es ayudar al estudiante a aprender y mejorar. Dirígite a él en segunda persona y utiliza un tono profesional y amigable.';

  @override
  String get aiModeTopicTitle => 'Modo Tema';

  @override
  String get aiModeTopicDescription => 'Exploración creativa del tema';

  @override
  String get aiModeContentTitle => 'Modo Contenido';

  @override
  String get aiModeContentDescription =>
      'Preguntas precisas basadas en tu entrada';

  @override
  String aiWordCountIndicator(int count) {
    return '$count palabras';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Precisión: $level';
  }

  @override
  String get aiPrecisionLow => 'Baja';

  @override
  String get aiPrecisionMedium => 'Media';

  @override
  String get aiPrecisionHigh => 'Alta';

  @override
  String get aiMoreWordsMorePrecision => 'Más palabras = más precisión';

  @override
  String get aiKeepDraftTitle => 'Mantener borrador de IA';

  @override
  String get aiKeepDraftDescription =>
      'Guardar automáticamente el texto ingresado en el diálogo de generación de IA para que no se pierda si se cierra el diálogo.';

  @override
  String get aiAttachFile => 'Adjuntar archivo';

  @override
  String get aiRemoveFile => 'Eliminar archivo';

  @override
  String get aiFileMode => 'Modo archivo';

  @override
  String get aiFileModeDescription =>
      'Las preguntas se generarán a partir del archivo adjunto';

  @override
  String get aiCommentsLabel => 'Comentarios (Opcional)';

  @override
  String get aiCommentsHint =>
      'Añade instrucciones o comentarios sobre el archivo adjunto...';

  @override
  String get aiCommentsHelperText =>
      'Opcionalmente, añade instrucciones sobre cómo generar preguntas a partir del archivo';

  @override
  String get aiFilePickerError => 'No se pudo cargar el archivo seleccionado';

  @override
  String get studyModeLabel => 'Modo Estudio';

  @override
  String get studyModeDescription =>
      'Asistencia de IA disponible. Feedback instantáneo tras cada respuesta, sin límites de tiempo ni penalizaciones.';

  @override
  String get examModeLabel => 'Modo Examen';

  @override
  String get examModeDescription =>
      'Sin asistencia de IA. Pueden aplicar límites de tiempo y penalizaciones por respuestas incorrectas.';

  @override
  String get checkAnswer => 'Comprobar';

  @override
  String get quizModeTitle => 'Modo Cuestionario';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get askAiAssistant => 'Preguntar a la IA';

  @override
  String get askAiAboutQuestion => 'Preguntar a la IA sobre esta pregunta';

  @override
  String get aiHelpWithQuestion => 'Ayúdame a entender esta pregunta';

  @override
  String get edit => 'Editar';

  @override
  String get enable => 'Activar';

  @override
  String get disable => 'Desactivar';

  @override
  String get quizPreviewTitle => 'Vista Previa del Quiz';

  @override
  String get select => 'Seleccionar';

  @override
  String get done => 'Listo';

  @override
  String get importButton => 'Importar';

  @override
  String get reorderButton => 'Reordenar';

  @override
  String get startQuizButton => 'Comenzar Quiz';

  @override
  String get deleteConfirmation => '¿Seguro que quieres eliminar este quiz?';

  @override
  String get saveSuccess => 'Archivo guardado exitosamente';

  @override
  String get errorSavingFile => 'Error al guardar el archivo';

  @override
  String get deleteSingleQuestionConfirmation =>
      '¿Estás seguro de que quieres eliminar esta pregunta?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return '¿Estás seguro de que quieres eliminar $count preguntas?';
  }

  @override
  String get keepPracticing => '¡Sigue practicando para mejorar!';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get review => 'Repasar';

  @override
  String get home => 'Inicio';

  @override
  String get allLabel => 'Todas';

  @override
  String get subtractPointsLabel => 'Restar puntos por respuesta incorrecta';

  @override
  String get subtractPointsDescription =>
      'Resta puntos por cada respuesta incorrecta.';

  @override
  String get subtractPointsOffDescription =>
      'Las respuestas incorrectas no restan puntos.';

  @override
  String get penaltyAmountLabel => 'Cantidad de penalización';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount pts / error';
  }

  @override
  String get allQuestionsLabel => 'Todas las preguntas';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Iniciar con $count seleccionadas';
  }

  @override
  String get advancedSettingsTitle => 'Ajustes Avanzados (Debug)';

  @override
  String get appLanguageLabel => 'Idioma de la aplicación';

  @override
  String get appLanguageDescription =>
      'Sobrescribir el idioma de la aplicación para pruebas';

  @override
  String get pasteFromClipboard => 'Pegar desde portapapeles';

  @override
  String get pasteImage => 'Pegar';

  @override
  String get clipboardNoImage => 'No se encontró imagen en el portapapeles';

  @override
  String get close => 'Cerrar';

  @override
  String get scoringAndLimitsTitle => 'Puntuación y límites';

  @override
  String get congratulations => '🎉 ¡Enhorabuena! 🎉';

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
  String get validationMin0GenericError => 'Mínimo 0';

  @override
  String get errorStatus => 'Error';

  @override
  String get featureComingSoon =>
      '¡Próximamente disponible! Mantente al tanto de las novedades.';

  @override
  String get showOnboarding => 'Mostrar onboarding';

  @override
  String get showOnboardingDescription =>
      'Ver el tutorial de bienvenida de nuevo';

  @override
  String get onboardingBack => 'Atrás';

  @override
  String get onboardingGetStarted => 'Comenzar';

  @override
  String get onboardingWelcomeTitle => 'Bienvenido a QuizLab AI';

  @override
  String get onboardingWelcomeDescription =>
      'Tu compañero interactivo de cuestionarios con funciones impulsadas por IA, preguntas personalizables y puntuación en tiempo real.';

  @override
  String get onboardingWelcomeSubtitle =>
      'Tu compañero interactivo de cuestionarios';

  @override
  String get onboardingStartQuizTitle => 'Iniciar un cuestionario';

  @override
  String get onboardingStartQuizDescription =>
      'Carga un archivo .quiz existente o crea uno nuevo desde cero. Arrastra y suelta archivos directamente o usa el selector de archivos.';

  @override
  String get onboardingStartQuizSubtitle => 'Carga, crea y juega';

  @override
  String get onboardingCreateQuestionsTitle => 'Crear preguntas';

  @override
  String get onboardingCreateQuestionsDescription =>
      'Crea cuestionarios con múltiples tipos de preguntas. Personaliza cada pregunta con opciones, respuestas correctas y explicaciones.';

  @override
  String get onboardingCreateQuestionsSubtitle =>
      'Diseña tus propios cuestionarios';

  @override
  String get onboardingAiFeaturesTitle => 'Funciones con IA';

  @override
  String get onboardingAiFeaturesDescription =>
      'Genera preguntas automáticamente con IA, obtén asistencia de estudio en tiempo real y aprende de forma más inteligente con tutoría inteligente.';

  @override
  String get onboardingAiFeaturesSubtitle => 'Impulsado por IA';

  @override
  String get onboardingFeatureAiTitle => 'Generación de preguntas con IA';

  @override
  String get onboardingFeatureAiDescription =>
      'Genera cuestionarios desde cualquier texto con GPT o Gemini';

  @override
  String get onboardingFeatureTypesTitle => 'Múltiples tipos de preguntas';

  @override
  String get onboardingFeatureTypesDescription =>
      'Opción única, opción múltiple, verdadero/falso y ensayo';

  @override
  String get onboardingFeatureLanguagesTitle => '13 idiomas soportados';

  @override
  String get onboardingFeatureLanguagesDescription =>
      'Crea y realiza cuestionarios en múltiples idiomas';

  @override
  String get onboardingStepCreateTitle => 'Crear cuestionario';

  @override
  String get onboardingStepCreateDescription =>
      'Empieza desde cero con tus propias preguntas';

  @override
  String get onboardingStepLoadTitle => 'Cargar archivo';

  @override
  String get onboardingStepLoadDescription =>
      'Importa un archivo .quiz desde tu dispositivo';

  @override
  String get onboardingStepTakeTitle => 'Realizar el cuestionario';

  @override
  String get onboardingStepTakeDescription =>
      'Responde preguntas y obtén puntuación en tiempo real';

  @override
  String get onboardingAiAutoGenerateTitle => 'Auto-generar preguntas';

  @override
  String get onboardingAiAutoGenerateDescription =>
      'Desde cualquier texto con GPT o Gemini';

  @override
  String get onboardingAiStudyAssistantTitle => 'Asistente de estudio IA';

  @override
  String get onboardingAiStudyAssistantDescription =>
      'Obtén explicaciones mientras aprendes';

  @override
  String get onboardingAiMultiLanguageTitle => 'Soporte multiidioma';

  @override
  String get onboardingAiMultiLanguageDescription =>
      'Genera en 13 idiomas diferentes';
}
