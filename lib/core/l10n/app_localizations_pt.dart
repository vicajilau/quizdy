// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get abortQuizTitle => 'Abortar Quiz?';

  @override
  String get abortQuizMessage =>
      'Abrir um novo arquivo interromperá o quiz atual.';

  @override
  String get stopAndOpenButton => 'Parar e Abrir';

  @override
  String get titleAppBar => 'Quiz - Simulador de Exames';

  @override
  String get create => 'Criar';

  @override
  String get preview => 'Visualização';

  @override
  String get previewLabel => 'Pré-visualização:';

  @override
  String get emptyPlaceholder => '(vazio)';

  @override
  String get latexSyntaxTitle => 'Sintaxe LaTeX:';

  @override
  String get latexSyntaxHelp =>
      'Matemática inline: Use \$...\$ para expressões LaTeX\nExemplo: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'Pré-visualizar renderização LaTeX';

  @override
  String get okButton => 'OK';

  @override
  String get load => 'Carregar';

  @override
  String fileLoaded(String filePath) {
    return 'Arquivo carregado: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'Arquivo salvo: $filePath';
  }

  @override
  String get dropFileHere =>
      'Clique no logotipo ou arraste um arquivo .quiz para a tela';

  @override
  String get errorOpeningFile => 'Erro ao abrir o arquivo';

  @override
  String get replaceFileTitle => 'Carregar novo Quiz';

  @override
  String get replaceFileMessage =>
      'Um Quiz já está carregado. Deseja substituí-lo pelo novo arquivo?';

  @override
  String get replaceButton => 'Carregar';

  @override
  String get clickOrDragFile =>
      'Clique para carregar ou arraste um arquiro .quiz para a tela';

  @override
  String get errorInvalidFile =>
      'Erro: Arquivo inválido. Deve ser um arquivo .quiz.';

  @override
  String errorLoadingFile(String error) {
    return 'Erro ao carregar o arquivo Quiz: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Erro ao exportar o arquivo: $error';
  }

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get saveButton => 'Salvar';

  @override
  String get confirmDeleteTitle => 'Confirmar exclusão';

  @override
  String confirmDeleteMessage(String processName) {
    return 'Tem certeza de que deseja excluir o processo `$processName`?';
  }

  @override
  String get deleteButton => 'Excluir';

  @override
  String get confirmExitTitle => 'Confirmar saída';

  @override
  String get confirmExitMessage =>
      'Existem alterações não salvas. Deseja sair e descartar as alterações?';

  @override
  String get exitButton => 'Sair sem guardar';

  @override
  String get saveDialogTitle => 'Selecione um arquivo de saída:';

  @override
  String get createQuizFileTitle => 'Criar arquivo Quiz';

  @override
  String get editQuizFileTitle => 'Editar arquivo Quiz';

  @override
  String get fileNameLabel => 'Nome do arquivo';

  @override
  String get fileDescriptionLabel => 'Descrição do arquivo';

  @override
  String get createButton => 'Criar';

  @override
  String get fileNameRequiredError => 'O nome do arquivo é obrigatório.';

  @override
  String get fileDescriptionRequiredError =>
      'A descrição do arquivo é obrigatória.';

  @override
  String get versionLabel => 'Versão';

  @override
  String get authorLabel => 'Autor';

  @override
  String get authorRequiredError => 'O autor é obrigatório.';

  @override
  String get requiredFieldsError =>
      'Todos os campos obrigatórios devem ser preenchidos.';

  @override
  String get requestFileNameTitle => 'Digite o nome do arquivo Quiz';

  @override
  String get fileNameHint => 'Nome do arquivo';

  @override
  String get emptyFileNameMessage => 'O nome do arquivo não pode estar vazio.';

  @override
  String get acceptButton => 'Aceitar';

  @override
  String get saveTooltip => 'Salvar o arquivo';

  @override
  String get saveDisabledTooltip => 'Nenhuma alteração para salvar';

  @override
  String get executeTooltip => 'Executar o exame';

  @override
  String get addTooltip => 'Adicionar uma nova pergunta';

  @override
  String get backSemanticLabel => 'Botão voltar';

  @override
  String get createFileTooltip => 'Criar um novo arquivo Quiz';

  @override
  String get loadFileTooltip => 'Carregar um arquivo Quiz existente';

  @override
  String questionNumber(int number) {
    return 'Pergunta $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return 'Pergunta $current de $total';
  }

  @override
  String get previous => 'Anterior';

  @override
  String get skip => 'Pular';

  @override
  String get questionsOverview => 'Mapa de questões';

  @override
  String get next => 'Próximo';

  @override
  String get finish => 'Finalizar';

  @override
  String get finishQuiz => 'Finalizar quiz';

  @override
  String get finishQuizConfirmation =>
      'Tem certeza de que deseja finalizar o quiz? Você não poderá mais alterar suas respostas depois.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount perguntas não respondidas',
      one: '1 pergunta não respondida',
    );
    return 'Você tem $_temp0. Tem certeza de que deseja finalizar o quiz?';
  }

  @override
  String get resolveUnansweredQuestions => 'Resolver perguntas';

  @override
  String get abandonQuiz => 'Abandone o questionário';

  @override
  String get abandonQuizConfirmation =>
      'Tem certeza de que deseja abandonar o quiz? Todo o progresso será perdido.';

  @override
  String get abandon => 'Abandonar';

  @override
  String get quizCompleted => 'Quiz Concluído!';

  @override
  String score(String score) {
    return 'Pontuação: $score%';
  }

  @override
  String correctAnswers(int correct, int total) {
    return '$correct de $total respostas corretas';
  }

  @override
  String get retry => 'Repetir';

  @override
  String get goBack => 'Finalizar';

  @override
  String get retryFailedQuestions => 'Repetir Falhadas';

  @override
  String question(String question) {
    return 'Pergunta: $question';
  }

  @override
  String get selectQuestionCountTitle => 'Selecionar número de perguntas';

  @override
  String get selectQuestionCountMessage =>
      'Quantas perguntas você gostaria de responder neste quiz?';

  @override
  String allQuestions(int count) {
    return 'Todas as perguntas ($count)';
  }

  @override
  String get startQuiz => 'Iniciar Quiz';

  @override
  String get maxIncorrectAnswersLabel => 'Limitar respostas incorretas';

  @override
  String get maxIncorrectAnswersDescription =>
      'O quiz terminará imediatamente se atingir este limite.';

  @override
  String get maxIncorrectAnswersLimitLabel => 'Máximo de erros permitidos';

  @override
  String get quizFailedLimitReached =>
      'Quiz interrompido: Limite de erros atingido';

  @override
  String get errorInvalidNumber => 'Por favor, digite um número válido';

  @override
  String get errorNumberMustBePositive => 'O número deve ser maior que 0';

  @override
  String get customNumberLabel => 'Ou digite um número personalizado:';

  @override
  String get numberInputLabel => 'Número de perguntas';

  @override
  String get questionOrderConfigTitle => 'Configuração da ordem das perguntas';

  @override
  String get questionOrderConfigDescription =>
      'Selecione a ordem na qual deseja que as perguntas apareçam durante o exame:';

  @override
  String get questionOrderAscending => 'Ordem crescente';

  @override
  String get questionOrderAscendingDesc =>
      'As perguntas aparecerão em ordem de 1 ao final';

  @override
  String get questionOrderDescending => 'Ordem decrescente';

  @override
  String get questionOrderDescendingDesc =>
      'As perguntas aparecerão do final a 1';

  @override
  String get questionOrderRandom => 'Aleatório';

  @override
  String get questionOrderRandomDesc =>
      'As perguntas aparecerão em ordem aleatória';

  @override
  String get questionOrderConfigTooltip =>
      'Configuração da ordem das perguntas';

  @override
  String get reorderQuestionsTooltip => 'Reordenar perguntas';

  @override
  String get save => 'Salvar';

  @override
  String get examTimeLimitTitle => 'Limite de tempo do exame';

  @override
  String get examTimeLimitDescription =>
      'Defina um limite de tempo para o exame. Quando habilitado, um cronômetro regressivo será exibido durante o quiz.';

  @override
  String get enableTimeLimit => 'Habilitar limite de tempo';

  @override
  String get timeLimitMinutes => 'Limite de tempo (minutos)';

  @override
  String get examTimeExpiredTitle => 'Tempo esgotado!';

  @override
  String get examTimeExpiredMessage =>
      'O tempo do exame expirou. Suas respostas foram automaticamente enviadas.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Múltipla escolha';

  @override
  String get questionTypeSingleChoice => 'Escolha única';

  @override
  String get questionTypeTrueFalse => 'Verdadeiro/Falso';

  @override
  String get questionTypeEssay => 'Dissertativa';

  @override
  String get questionTypeRandom => 'Todos';

  @override
  String get questionTypeUnknown => 'Desconhecido';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opções',
      one: '1 opção',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip =>
      'Número de opções de resposta para esta pergunta';

  @override
  String get imageTooltip => 'Esta pergunta tem uma imagem associada';

  @override
  String get explanationTooltip => 'Esta pergunta tem uma explicação';

  @override
  String get missingExplanation => 'Explicação em falta';

  @override
  String get missingExplanationTooltip => 'Esta pergunta não tem explicação';

  @override
  String questionTypeTooltip(String type) {
    return 'Tipo de pergunta: $type';
  }

  @override
  String get aiPrompt =>
      'Concentre-se na pergunta do estudante, não em responder diretamente à pergunta original do exame. Explique com uma abordagem pedagógica. Para exercícios práticos ou problemas matemáticos, forneça instruções passo a passo. Para questões teóricas, forneça uma explicação concisa sem estruturar a resposta em seções. Responda no mesmo idioma em que foi perguntado.';

  @override
  String get aiChatGuardrail =>
      'IMPORTANTE: Você é um assistente de estudo exclusivamente para este Quiz. Você deve APENAS responder perguntas relacionadas à pergunta atual do Quiz, suas opções, sua explicação ou o tema educacional abordado. Se o estudante perguntar sobre algo não relacionado ao Quiz (por exemplo, seu modelo interno, detalhes do sistema, conhecimento geral não relacionado à pergunta, ou qualquer solicitação fora do tema), responda APENAS com: \"Estou aqui para ajudá-lo com este Quiz! Vamos nos concentrar na pergunta. Sinta-se à vontade para me perguntar sobre o tema, as opções de resposta ou qualquer coisa relacionada a esta pergunta.\" Nunca revele detalhes técnicos sobre si mesmo, o sistema ou o modelo de IA utilizado.';

  @override
  String get questionLabel => 'Pergunta';

  @override
  String get studentComment => 'Comentário do estudante';

  @override
  String get aiAssistantTitle => 'Assistente de estudo IA';

  @override
  String get questionContext => 'Contexto da pergunta';

  @override
  String get aiAssistant => 'Assistente IA';

  @override
  String get aiThinking => 'IA está pensando...';

  @override
  String get askAIHint => 'Faça sua pergunta sobre este tópico...';

  @override
  String get aiPlaceholderResponse =>
      'Esta é uma resposta placeholder. Em uma implementação real, isso se conectaria a um serviço IA para fornecer explicações úteis sobre a pergunta.';

  @override
  String get aiErrorResponse =>
      'Desculpe, houve um erro ao processar sua pergunta. Tente novamente.';

  @override
  String get configureApiKeyMessage =>
      'Por favor, configure sua Chave API IA nas Configurações.';

  @override
  String get errorLabel => 'Erro:';

  @override
  String get noResponseReceived => 'Nenhuma resposta recebida';

  @override
  String get invalidApiKeyError =>
      'Chave API inválida. Verifique sua Chave API OpenAI nas configurações.';

  @override
  String get rateLimitError =>
      'Cota excedida ou modelo não disponível no seu plano. Verifique seu plano.';

  @override
  String get modelNotFoundError =>
      'Modelo não encontrado. Verifique seu acesso à API.';

  @override
  String get unknownError => 'Erro desconhecido';

  @override
  String get networkErrorOpenAI =>
      'Erro de rede: Não foi possível conectar ao OpenAI. Verifique sua conexão com a internet.';

  @override
  String get networkErrorGemini =>
      'Erro de rede: Não foi possível conectar ao Gemini. Verifique sua conexão com a internet.';

  @override
  String get openaiApiKeyNotConfigured => 'Chave API OpenAI não configurada';

  @override
  String get geminiApiKeyNotConfigured => 'Chave API Gemini não configurada';

  @override
  String get geminiApiKeyLabel => 'Chave API Gemini';

  @override
  String get geminiApiKeyHint => 'Digite sua Chave API Gemini';

  @override
  String get geminiApiKeyDescription =>
      'Necessário para funcionalidade IA Gemini. Sua chave é armazenada com segurança.';

  @override
  String get getGeminiApiKeyTooltip => 'Obter Chave API do Google AI Studio';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'O Assistente de Estudo IA requer pelo menos uma Chave API (Gemini ou OpenAI). Por favor, insira uma chave API ou desative o Assistente de IA.';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get aiButtonTooltip => 'Assistente de Estudo IA';

  @override
  String get aiButtonText => 'IA';

  @override
  String get aiAssistantSettingsTitle => 'Assistente de Estudo IA (Prévia)';

  @override
  String get aiAssistantSettingsDescription =>
      'Habilitar ou desabilitar o assistente de estudo IA para perguntas';

  @override
  String get aiDefaultModelTitle => 'Modelo IA padrão';

  @override
  String get aiDefaultModelDescription =>
      'Selecione o serviço e modelo IA padrão para a geração de perguntas';

  @override
  String get openaiApiKeyLabel => 'Chave API OpenAI';

  @override
  String get openaiApiKeyHint => 'Digite sua Chave API OpenAI (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Necessário para integração com OpenAI. Sua chave OpenAI é armazenada com segurança.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'Assistente de Estudo IA requer uma Chave API OpenAI. Digite sua chave API ou desabilite o Assistente IA.';

  @override
  String get getApiKeyTooltip => 'Obter Chave API do OpenAI';

  @override
  String get deleteAction => 'Excluir';

  @override
  String get explanationLabel => 'Explicação (opcional)';

  @override
  String get explanationHint =>
      'Digite uma explicação para a(s) resposta(s) correta(s)';

  @override
  String get explanationTitle => 'Explicação';

  @override
  String get imageLabel => 'Imagem';

  @override
  String get changeImage => 'Alterar imagem';

  @override
  String get removeImage => 'Remover imagem';

  @override
  String get addImageTap => 'Toque para adicionar imagem';

  @override
  String get imageFormats => 'Formatos: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Erro ao carregar imagem';

  @override
  String imagePickError(String error) {
    return 'Erro ao carregar imagem: $error';
  }

  @override
  String get tapToZoom => 'Toque para ampliar';

  @override
  String get trueLabel => 'Verdadeiro';

  @override
  String get falseLabel => 'Falso';

  @override
  String get addQuestion => 'Adicionar pergunta';

  @override
  String get editQuestion => 'Editar pergunta';

  @override
  String get questionText => 'Texto da pergunta';

  @override
  String get questionType => 'Tipo de pergunta';

  @override
  String get addOption => 'Adicionar opção';

  @override
  String get optionsLabel => 'Opções';

  @override
  String get optionLabel => 'Opção';

  @override
  String get questionTextRequired => 'Texto da pergunta é obrigatório';

  @override
  String get atLeastOneOptionRequired => 'Pelo menos uma opção deve ter texto';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'Pelo menos uma resposta correta deve ser selecionada';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'Apenas uma resposta correta é permitida para este tipo de pergunta';

  @override
  String get removeOption => 'Remover opção';

  @override
  String get selectCorrectAnswer => 'Selecionar resposta correta';

  @override
  String get selectCorrectAnswers => 'Selecionar respostas corretas';

  @override
  String emptyOptionsError(String optionNumbers) {
    return 'Opções $optionNumbers estão vazias. Adicione texto a elas ou remova-as.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return 'Opção $optionNumber está vazia. Adicione texto a ela ou remova-a.';
  }

  @override
  String get optionEmptyError => 'Esta opção não pode estar vazia';

  @override
  String get hasImage => 'Imagem';

  @override
  String get hasExplanation => 'Explicação';

  @override
  String errorLoadingSettings(String error) {
    return 'Erro ao carregar configurações: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'Não foi possível abrir $url';
  }

  @override
  String get loadingAiServices => 'Carregando serviços IA...';

  @override
  String usingAiService(String serviceName) {
    return 'Usando: $serviceName';
  }

  @override
  String get aiServiceLabel => 'Serviço IA:';

  @override
  String get aiModelLabel => 'Modelo:';

  @override
  String get importQuestionsTitle => 'Importar perguntas';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return 'Encontradas $count perguntas em \"$fileName\". Onde você gostaria de importá-las?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'Onde você gostaria de adicionar essas perguntas?';

  @override
  String get importAtBeginning => 'No início';

  @override
  String get importAtEnd => 'No final';

  @override
  String questionsImportedSuccess(int count) {
    return 'Importadas com sucesso $count perguntas';
  }

  @override
  String get importQuestionsTooltip =>
      'Importar perguntas de outro arquivo quiz';

  @override
  String get dragDropHintText =>
      'Você também pode arrastar e soltar arquivos .quiz aqui para importar perguntas';

  @override
  String get randomizeAnswersTitle => 'Aleatorizar opções de resposta';

  @override
  String get randomizeAnswersDescription =>
      'Embaralhar a ordem das opções de resposta durante a execução do quiz';

  @override
  String get showCorrectAnswerCountTitle =>
      'Mostrar número de respostas corretas';

  @override
  String get showCorrectAnswerCountDescription =>
      'Exibir o número de respostas corretas em perguntas de múltipla escolha';

  @override
  String correctAnswersCount(int count) {
    return 'Selecione $count respostas corretas';
  }

  @override
  String get correctSelectedLabel => 'Correto';

  @override
  String get correctMissedLabel => 'Correto';

  @override
  String get incorrectSelectedLabel => 'Incorreto';

  @override
  String get aiGenerateDialogTitle => 'Gerar perguntas com IA';

  @override
  String get aiQuestionCountLabel => 'Número de perguntas (Opcional)';

  @override
  String get aiQuestionCountHint => 'Deixe vazio para a IA decidir';

  @override
  String get aiQuestionCountValidation => 'Deve ser um número entre 1 e 50';

  @override
  String get aiQuestionTypeLabel => 'Tipo de pergunta';

  @override
  String get aiQuestionTypeRandom => 'Aleatório (Misto)';

  @override
  String get aiLanguageLabel => 'Idioma das perguntas';

  @override
  String get aiContentLabel => 'Conteúdo para gerar perguntas';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max palavras';
  }

  @override
  String get aiContentHint =>
      'Digite o texto, tópico, ou conteúdo a partir do qual deseja gerar perguntas...';

  @override
  String get aiContentHelperText =>
      'IA criará perguntas baseadas neste conteúdo';

  @override
  String aiWordLimitError(int max) {
    return 'Você excedeu o limite de $max palavras';
  }

  @override
  String get aiContentRequiredError =>
      'Você deve fornecer conteúdo para gerar perguntas';

  @override
  String aiContentLimitError(int max) {
    return 'Conteúdo excede o limite de $max palavras';
  }

  @override
  String get aiMinWordsError =>
      'Forneça pelo menos 10 palavras para gerar perguntas de qualidade';

  @override
  String get aiInfoTitle => 'Informação';

  @override
  String get aiInfoDescription =>
      '• IA analisará o conteúdo e gerará perguntas relevantes\n• Se escreveres menos de 10 palavras entrarás no modo Tema, onde serão feitas perguntas sobre esses temas específicos\n• Com mais de 10 palavras entrarás no modo Conteúdo, que fará perguntas sobre o mesmo texto (mais palavras = mais precisão)\n• Você pode incluir texto, definições, explicações, o qualquer material educativo\n• Perguntas incluirão opções de resposta e explicações\n• O processo pode levar alguns segundos';

  @override
  String get aiGenerateButton => 'Gerar Perguntas';

  @override
  String get aiEnterContentTitle => 'Inserir Conteúdo';

  @override
  String get aiEnterContentDescription =>
      'Insira o tópico ou cole o conteúdo para gerar perguntas';

  @override
  String get aiContentFieldHint =>
      'Insira um tópico como \"História da Segunda Guerra Mundial\" ou cole o texto aqui...';

  @override
  String get aiAttachFileHint => 'Anexar arquivo (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Solte o arquivo aqui';

  @override
  String get dropImageHere => 'Solte a imagem aqui';

  @override
  String get aiNumberQuestionsLabel => 'Número de perguntas';

  @override
  String get backButton => 'Voltar';

  @override
  String get generateButton => 'Gerar';

  @override
  String aiTopicModeCount(int count) {
    return 'Modo Tópico ($count palavras)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Modo Texto ($count palavras)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Modo de Conteúdo';

  @override
  String get aiGenerationCategoryTheory => 'Teoria';

  @override
  String get aiGenerationCategoryExercises => 'Exercícios';

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
  String get aiServicesLoading => 'Carregando serviços IA...';

  @override
  String get aiServicesNotConfigured => 'Nenhum serviço IA configurado';

  @override
  String get aiGeneratedQuestions => 'Gerado por IA';

  @override
  String get aiApiKeyRequired =>
      'Configure pelo menos uma chave API IA nas Configurações para usar geração IA.';

  @override
  String get aiGenerationFailed =>
      'Não foi possível gerar perguntas. Tente com conteúdo diferente.';

  @override
  String get aiGenerationErrorTitle => 'Erro ao gerar perguntas';

  @override
  String get noQuestionsInFile =>
      'Nenhuma pergunta encontrada no arquivo importado';

  @override
  String get couldNotAccessFile =>
      'Não foi possível acessar o arquivo selecionado';

  @override
  String get defaultOutputFileName => 'arquivo-saida.quiz';

  @override
  String get generateQuestionsWithAI => 'Gerar perguntas com IA';

  @override
  String get addQuestionsWithAI => 'Adicionar perguntas com IA';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Limite: $words palavras ou $chars caracteres';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Limite: $words palavras';
  }

  @override
  String get aiAssistantDisabled => 'Assistente IA Desabilitado';

  @override
  String get enableAiAssistant =>
      'O assistente de IA está desabilitado. Por favor, habilite-o nas configurações para usar recursos de IA.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Mínimo de $minWords palavras necessárias';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount palavras ✓ Pronto para gerar';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords palavras ($moreNeeded mais necessárias)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Mínimo de $minWords palavras necessárias ($moreNeeded mais necessárias)';
  }

  @override
  String get enableQuestion => 'Ativar pergunta';

  @override
  String get disableQuestion => 'Desativar pergunta';

  @override
  String get questionDisabled => 'Desativada';

  @override
  String get noEnabledQuestionsError =>
      'Nenhuma pergunta ativada disponível para executar o quiz';

  @override
  String get evaluateWithAI => 'Avaliar com IA';

  @override
  String get aiEvaluation => 'Avaliação da IA';

  @override
  String aiEvaluationError(String error) {
    return 'Erro ao avaliar a resposta: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'Você é um professor especialista avaliando a resposta de um estudante a uma questão dissertativa. Sua tarefa é fornecer uma avaliação detalhada e construtiva. Responda no mesmo idioma da resposta do estudante.';

  @override
  String get aiEvaluationPromptQuestion => 'PERGUNTA:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'RESPOSTA DO ESTUDANTE:';

  @override
  String get aiEvaluationPromptCriteria =>
      'CRITÉRIOS DE AVALIAÇÃO (baseados na explicação do professor):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'INSTRUÇÕES ESPECÍFICAS:\n- Avalie quão bem a resposta do estudante se alinha com os critérios estabelecidos\n- Analise o grau de síntese e estrutura na resposta\n- Identifique se algo importante foi deixado de fora segundo os critérios\n- Considere a profundidade e precisão da análise';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'INSTRUÇÕES GERAIS:\n- Como não há critérios específicos estabelecidos, avalie a resposta baseando-se em padrões acadêmicos gerais\n- Considere clareza, coerência e estrutura da resposta\n- Avalie se a resposta demonstra compreensão do tópico\n- Analise a profundidade da análise e qualidade dos argumentos';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'FORMATO DA RESPOSTA:\n1. NOTA: [X/10] - Justifique brevemente a nota\n2. PONTOS FORTES: Mencione os aspectos positivos da resposta\n3. ÁREAS DE MELHORIA: Aponte aspectos que poderiam ser melhorados\n4. COMENTÁRIOS ESPECÍFICOS: Forneça feedback detalhado e construtivo\n5. SUGERÊNCIAS: Ofereça recomendações específicas para melhoria\n\nSeja construtivo, específico e educativo em sua avaliação. O objetivo é ajudar o estudante a aprender e melhorar. Dirija-se a ele em segunda pessoa e use um tom profissional e amigável.';

  @override
  String get aiModeTopicTitle => 'Modo tópico';

  @override
  String get aiModeTopicDescription => 'Exploração criativa do tema';

  @override
  String get aiModeContentTitle => 'Modo conteúdo';

  @override
  String get aiModeContentDescription =>
      'Perguntas precisas baseadas na sua entrada';

  @override
  String aiWordCountIndicator(int count) {
    return '$count palavras';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Precisão: $level';
  }

  @override
  String get aiPrecisionLow => 'Baixa';

  @override
  String get aiPrecisionMedium => 'Média';

  @override
  String get aiPrecisionHigh => 'Alta';

  @override
  String get aiMoreWordsMorePrecision => 'Mais palavras = mais precisão';

  @override
  String get aiKeepDraftTitle => 'Manter rascunho de IA';

  @override
  String get aiKeepDraftDescription =>
      'Salvar automaticamente o texto inserido na caixa de diálogo de geração de IA para que não seja perdido se a caixa de diálogo for fechada.';

  @override
  String get aiAttachFile => 'Anexar arquivo';

  @override
  String get aiRemoveFile => 'Remover arquivo';

  @override
  String get aiFileMode => 'Modo de arquivo';

  @override
  String get aiFileModeDescription =>
      'As perguntas serão geradas a partir do arquivo anexo';

  @override
  String get aiCommentsLabel => 'Comentários (Opcional)';

  @override
  String get aiCommentsHint =>
      'Adicionar instruções ou comentários sobre o arquivo anexo...';

  @override
  String get aiCommentsHelperText =>
      'Opcionalmente, adicione instruções sobre como gerar perguntas a partir do arquivo';

  @override
  String get aiFilePickerError =>
      'Não foi possível carregar o arquivo selecionato';

  @override
  String get studyModeLabel => 'Modo estudo';

  @override
  String get studyModeDescription => 'Feedback instantâneo e sem cronômetro';

  @override
  String get examModeLabel => 'Modo exame';

  @override
  String get examModeDescription => 'Cronômetro padrão e resultados no final';

  @override
  String get checkAnswer => 'Verificar';

  @override
  String get quizModeTitle => 'Modo quiz';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get askAiAssistant => 'Perguntar ao Assistente de IA';

  @override
  String get askAiAboutQuestion => 'Perguntar à IA sobre esta questão';

  @override
  String get aiHelpWithQuestion => 'Ajuda-me a entender esta questão';

  @override
  String get edit => 'Editar';

  @override
  String get enable => 'Ativar';

  @override
  String get disable => 'Desativar';

  @override
  String get quizPreviewTitle => 'Pré-visualização do Quiz';

  @override
  String get select => 'Selecionar';

  @override
  String get done => 'Concluído';

  @override
  String get importButton => 'Importar';

  @override
  String get reorderButton => 'Reordenar';

  @override
  String get startQuizButton => 'Iniciar Quiz';

  @override
  String get deleteConfirmation =>
      'Tem certeza de que deseja excluir este quiz?';

  @override
  String get saveSuccess => 'Arquivo salvo com sucesso';

  @override
  String get errorSavingFile => 'Erro ao salvar o arquivo';

  @override
  String get deleteSingleQuestionConfirmation =>
      'Tem certeza de que deseja excluir esta pergunta?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'Tem certeza de que deseja excluir $count perguntas?';
  }

  @override
  String get keepPracticing => 'Continue praticando para melhorar!';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get review => 'Revisar';

  @override
  String get home => 'Início';

  @override
  String get allLabel => 'Todas';

  @override
  String get subtractPointsLabel => 'Subtrair pontos por resposta errada';

  @override
  String get penaltyAmountLabel => 'Valor da penalidade';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount pts / erro';
  }

  @override
  String get allQuestionsLabel => 'Todas as perguntas';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Iniciar com $count selecionadas';
  }

  @override
  String get advancedSettingsTitle => 'Configurações Avançadas (Debug)';

  @override
  String get appLanguageLabel => 'Idioma do aplicativo';

  @override
  String get appLanguageDescription =>
      'Substituir o idioma do aplicativo para testes';

  @override
  String get pasteFromClipboard => 'Colar da área de transferência';

  @override
  String get pasteImage => 'Colar';

  @override
  String get clipboardNoImage =>
      'Nenhuma imagem encontrada na área de transferência';
}
