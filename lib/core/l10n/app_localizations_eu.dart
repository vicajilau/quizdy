// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get abortQuizTitle => 'Quiz-a abortatu?';

  @override
  String get abortQuizMessage =>
      'Fitxategi berri bat irekitzeak uneko galdetegia geldituko du.';

  @override
  String get stopAndOpenButton => 'Gelditu eta Ireki';

  @override
  String get titleAppBar => 'Quiz - Azterketa Simuladorea';

  @override
  String get create => 'Sortu';

  @override
  String get preview => 'Aurrebista';

  @override
  String get previewLabel => 'Aurrebista:';

  @override
  String get emptyPlaceholder => '(hutsik)';

  @override
  String get latexSyntaxTitle => 'LaTeX sintaxia:';

  @override
  String get latexSyntaxHelp =>
      'Lineako matematika: Erabili \$...\$ LaTeX adierazpenetarako\nAdibidea: \$x^2 + y^2 = z^2\$';

  @override
  String get previewLatexTooltip => 'Ikusi LaTeX errendatzea';

  @override
  String get okButton => 'Ados';

  @override
  String get load => 'Kargatu';

  @override
  String fileLoaded(String filePath) {
    return 'Fitxategia kargatuta: $filePath';
  }

  @override
  String fileSaved(String filePath) {
    return 'Fitxategia gordeta: $filePath';
  }

  @override
  String get dropFileHere =>
      'Egin klik logoan edo arrastatu .quiz fitxategi bat pantailara';

  @override
  String get errorOpeningFile => 'Errorea fitxategia irekitzean';

  @override
  String get replaceFileTitle => 'Quiz berria kargatu';

  @override
  String get replaceFileMessage =>
      'Dagoeneko Quiz bat kargatuta dago. Fitxategi berriarekin ordezkatu nahi duzu?';

  @override
  String get replaceButton => 'Kargatu';

  @override
  String get clickOrDragFile =>
      'Egin klik kargatzeko edo arrastatu .quiz fitxategi bat pantailara';

  @override
  String get errorInvalidFile =>
      'Errorea: Fitxategi baliogabea. .quiz fitxategia izan behar da.';

  @override
  String errorLoadingFile(String error) {
    return 'Errorea Quiz fitxategia kargatzean: $error';
  }

  @override
  String errorExportingFile(String error) {
    return 'Errorea fitxategia esportatzen: $error';
  }

  @override
  String get cancelButton => 'Utzi';

  @override
  String get saveButton => 'Gorde';

  @override
  String get confirmDeleteTitle => 'Ezabaketa Berretsi';

  @override
  String confirmDeleteMessage(String processName) {
    return 'Ziur zaude `$processName` prozesua ezabatu nahi duzula?';
  }

  @override
  String get deleteButton => 'Ezabatu';

  @override
  String get confirmExitTitle => 'Irteera Berretsi';

  @override
  String get confirmExitMessage =>
      'Gorde gabeko aldaketak daude. Aldaketak baztertuz irten nahi duzu?';

  @override
  String get exitButton => 'Irten gorde gabe';

  @override
  String get saveDialogTitle => 'Hautatu irteera fitxategia:';

  @override
  String get createQuizFileTitle => 'Quiz Fitxategia Sortu';

  @override
  String get editQuizFileTitle => 'Quiz Fitxategia Editatu';

  @override
  String get fileNameLabel => 'Fitxategiaren Izena';

  @override
  String get fileDescriptionLabel => 'Fitxategiaren Deskribapena';

  @override
  String get createButton => 'Sortu';

  @override
  String get fileNameRequiredError => 'Fitxategiaren izena beharrezkoa da.';

  @override
  String get fileDescriptionRequiredError =>
      'Fitxategiaren deskribapena beharrezkoa da.';

  @override
  String get versionLabel => 'Bertsioa';

  @override
  String get authorLabel => 'Egilea';

  @override
  String get authorRequiredError => 'Egilea beharrezkoa da.';

  @override
  String get requiredFieldsError => 'Beharrezko eremu guztiak bete behar dira.';

  @override
  String get requestFileNameTitle => 'Sartu Quiz fitxategiaren izena';

  @override
  String get fileNameHint => 'Fitxategiaren izena';

  @override
  String get emptyFileNameMessage => 'Fitxategiaren izena ezin da hutsik egon.';

  @override
  String get acceptButton => 'Onartu';

  @override
  String get saveTooltip => 'Fitxategia gorde';

  @override
  String get saveDisabledTooltip => 'Ez da aldaketarik gorde behar';

  @override
  String get executeTooltip => 'Azterketa exekutatu';

  @override
  String get addTooltip => 'Galdera berria gehitu';

  @override
  String get backSemanticLabel => 'Itzuli botoia';

  @override
  String get createFileTooltip => 'Quiz fitxategi berria sortu';

  @override
  String get loadFileTooltip => 'Dagoen Quiz fitxategia kargatu';

  @override
  String questionNumber(int number) {
    return 'Galdera $number';
  }

  @override
  String questionOfTotal(int current, int total) {
    return '$current. galdera $total(e)tik';
  }

  @override
  String get previous => 'Aurrekoa';

  @override
  String get skip => 'Saltatu';

  @override
  String get questionsOverview => 'Galdera mapa';

  @override
  String get next => 'Hurrengoa';

  @override
  String get finish => 'Amaitu';

  @override
  String get finishQuiz => 'Quiz Amaitu';

  @override
  String get finishQuizConfirmation =>
      'Ziur zaude quiz-a amaitu nahi duzula? Ezingo dituzu zure erantzunak aldatu gero.';

  @override
  String finishQuizUnansweredQuestions(int unansweredCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unansweredCount,
      locale: localeName,
      other: '$unansweredCount erantzun gabeko galdera',
      one: 'erantzun gabeko galdera 1',
    );
    return '$_temp0 dituzu. Ziur galdetegia amaitu nahi duzula?';
  }

  @override
  String get resolveUnansweredQuestions => 'Galderak ebatzi';

  @override
  String get abandonQuiz => 'Quiz Utzi';

  @override
  String get abandonQuizConfirmation =>
      'Ziur zaude quiz-a utzi nahi duzula? Aurrerapen guztia galduko da.';

  @override
  String get abandon => 'Utzi';

  @override
  String get quizCompleted => 'Quiz Osatuta!';

  @override
  String score(String score) {
    return 'Puntuazioa: $score%';
  }

  @override
  String correctAnswers(int correct, int total) {
    return '$correct / $total erantzun zuzen';
  }

  @override
  String get retry => 'Berriro saiatu';

  @override
  String get goBack => 'Amaitu';

  @override
  String get retryFailedQuestions => 'Huts egindakoak Berriro';

  @override
  String question(String question) {
    return 'Galdera: $question';
  }

  @override
  String get selectQuestionCountTitle => 'Galdera Kopurua Hautatu';

  @override
  String get selectQuestionCountMessage =>
      'Zenbat galderari erantzun nahi diezu quiz honetan?';

  @override
  String allQuestions(int count) {
    return 'Galdera guztiak ($count)';
  }

  @override
  String get startQuiz => 'Quiz Hasi';

  @override
  String get maxIncorrectAnswersLabel => 'Errore muga';

  @override
  String get maxIncorrectAnswersDescription =>
      'Gai/Ez gai azterketa. Ez dago zenbakizko notarik, gainditu edo huts egin.';

  @override
  String get maxIncorrectAnswersOffDescription =>
      'Azterketak 0 eta 100 arteko zenbakizko nota du.';

  @override
  String get maxIncorrectAnswersLimitLabel => 'Gehienezko errore kopurua';

  @override
  String get quizFailedLimitReached =>
      'Quiz-a Geldituta: Errore Muga Gaindituta';

  @override
  String get errorInvalidNumber => 'Mesedez, sartu zenbaki baliozkoa';

  @override
  String get errorNumberMustBePositive =>
      'Zenbakia 0 baino handiagoa izan behar da';

  @override
  String get customNumberLabel => 'Edo sartu zenbaki pertsonalizatua:';

  @override
  String get numberInputLabel => 'Galdera kopurua';

  @override
  String get questionOrderConfigTitle => 'Galdera Ordenaren Konfigurazioa';

  @override
  String get questionOrderConfigDescription =>
      'Hautatu galderak azterketaren zehar nola agertu nahi dituzun:';

  @override
  String get questionOrderAscending => 'Orden Gorakorra';

  @override
  String get questionOrderAscendingDesc =>
      'Galderak 1etik azkenera ordenean agertuko dira';

  @override
  String get questionOrderDescending => 'Orden Beherakorra';

  @override
  String get questionOrderDescendingDesc =>
      'Galderak azkenatik 1era ordenean agertuko dira';

  @override
  String get questionOrderRandom => 'Galderen ordena ausazkotu';

  @override
  String get questionOrderRandomDesc =>
      'Galderak orden ausazkoan agertuko dira';

  @override
  String get questionOrderConfigTooltip => 'Galdera ordenaren konfigurazioa';

  @override
  String get reorderQuestionsTooltip => 'Galderak berrantolatu';

  @override
  String get save => 'Gorde';

  @override
  String get examConfigurationTitle => 'Azterketaren konfigurazioa';

  @override
  String get examTimeLimitTitle => 'Azterketaren Denbora Muga';

  @override
  String get examTimeLimitDescription =>
      'Ezarri denbora-muga azterketarako. Atzerako kontagailua agertuko da galdetegian.';

  @override
  String get examTimeLimitOffDescription =>
      'Azterketa honetarako ez dago denbora mugarik.';

  @override
  String get enableTimeLimit => 'Denbora muga gaitu';

  @override
  String get timeLimitMinutes => 'Denbora muga (minutuak)';

  @override
  String get examTimeExpiredTitle => 'Denbora Amaitu da!';

  @override
  String get examTimeExpiredMessage =>
      'Azterketaren denbora amaitu da. Zure erantzunak automatikoki bidali dira.';

  @override
  String remainingTime(String hours, String minutes, String seconds) {
    return '$hours:$minutes:$seconds';
  }

  @override
  String get questionTypeMultipleChoice => 'Aukera Anitza';

  @override
  String get questionTypeSingleChoice => 'Aukera Bakarra';

  @override
  String get questionTypeTrueFalse => 'Egia/Gezurra';

  @override
  String get questionTypeEssay => 'Galdera irekia';

  @override
  String get questionTypeRandom => 'Guztiak';

  @override
  String get questionTypeUnknown => 'Ezezaguna';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aukera',
      one: 'aukera 1',
    );
    return '$_temp0';
  }

  @override
  String get optionsTooltip => 'Galdera honetarako erantzun aukera kopurua';

  @override
  String get imageTooltip => 'Galdera honek lotutako irudia du';

  @override
  String get explanationTooltip => 'Galdera honek azalpena du';

  @override
  String get missingExplanation => 'Azalpena falta da';

  @override
  String get missingExplanationTooltip => 'Galdera honek ez du azalpenik';

  @override
  String questionTypeTooltip(String type) {
    return 'Galdera mota: $type';
  }

  @override
  String get aiPrompt =>
      'Zentratu ikaslearen galderan, ez jatorrizko azterketa galderari zuzenean erantzutean. Azaldu ikuspegi pedagogiko batekin. Ariketa praktikoetarako edo arazo matematikoetarako, eman urratsez urratseko argibideak. Galdera teorikoetarako, eman azalpen zehatza erantzuna ataletan egituratu gabe. Erantzun beti galdetu zaizun hizkuntza berean.';

  @override
  String get aiChatGuardrail =>
      'GARRANTZITSUA: Quiz honetarako soilik ikasketa laguntzailea zara. Quiz galdera arruntari, bere aukerei, azalpenari edo lantzen duen gai hezitzaileari lotutako galderei SOILIK erantzun behar diezu. Ikasleak Quiz-arekin zerikusirik ez duen zerbait galdetzen badu (adibidez, zure barne eredua, sistemaren xehetasunak, galderarekin loturarik gabeko ezagutza orokorra, edo gaiari buruz ez den eskaeraren bat), erantzun SOILIK honekin: \"Hemen nago Quiz honekin laguntzeko! Galderan zentratu gaitezen. Lasai galdetu gaiari, erantzun aukerei edo galdera honekin lotutako edozertari buruz.\" Ez ezazu inoiz zure buruari, sistemari edo erabilitako AI ereduari buruzko xehetasun teknikorik agerian utzi.';

  @override
  String get questionLabel => 'Galdera';

  @override
  String get studentComment => 'Ikaslearen iruzkinak';

  @override
  String get aiAssistantTitle => 'Ikasketa AI Laguntzailea';

  @override
  String get questionContext => 'Galderaren Testuingurua';

  @override
  String get aiAssistant => 'AI Laguntzailea';

  @override
  String get aiThinking => 'AI-a pentsatzen ari da...';

  @override
  String get askAIHint => 'Egin zure galdera gai honi buruz...';

  @override
  String get aiPlaceholderResponse =>
      'Hau leku-markatzaile erantzuna da. Benetako inplementazio batean, honek AI zerbitzu batekin konektatuko litzateke galderari buruzko azalpen baliagarriak eskaintzeko.';

  @override
  String get aiErrorResponse =>
      'Barkatu, errore bat izan da zure galdera prozesatzean. Saiatu berriro.';

  @override
  String get configureApiKeyMessage =>
      'Mesedez, konfigura ezazu zure AI API Gakoa Ezarpenetan.';

  @override
  String get errorLabel => 'Errorea:';

  @override
  String get noResponseReceived => 'Ez da erantzunik jaso';

  @override
  String get invalidApiKeyError =>
      'API gako baliogabea. Egiaztatu zure OpenAI API Gakoa ezarpenetan.';

  @override
  String get rateLimitError =>
      'Kuota gainditua edo eredua ez dago erabilgarri zure mailan. Egiaztatu zure plana.';

  @override
  String get modelNotFoundError =>
      'Modeloa ez da aurkitu. Egiaztatu zure API sarbidea.';

  @override
  String get unknownError => 'Errore ezezaguna';

  @override
  String get networkErrorOpenAI =>
      'Sare errorea: Ezin da OpenAI-ra konektatu. Egiaztatu zure internet konexioa.';

  @override
  String get networkErrorGemini =>
      'Sare errorea: Ezin da Gemini-ra konektatu. Egiaztatu zure internet konexioa.';

  @override
  String get openaiApiKeyNotConfigured =>
      'OpenAI API Gakoa ez dago konfiguratuta';

  @override
  String get geminiApiKeyNotConfigured =>
      'Gemini API Gakoa ez dago konfiguratuta';

  @override
  String get geminiApiKeyLabel => 'Gemini API Gakoa';

  @override
  String get geminiApiKeyHint => 'Sartu zure Gemini API Gakoa';

  @override
  String get geminiApiKeyDescription =>
      'Gemini AI funtzionalitaterako beharrezkoa. Zure gakoa modu seguruan gordetzen da.';

  @override
  String get getGeminiApiKeyTooltip => 'Google AI Studio-tik API Gakoa lortu';

  @override
  String get aiRequiresAtLeastOneApiKeyError =>
      'AI Ikasketa Laguntzaileak gutxienez API gako bat behar du (Gemini edo OpenAI). Mesedez, sartu API gako bat edo desgaitu AI Laguntzailea.';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get aiButtonTooltip => 'Ikasketa AI Laguntzailea';

  @override
  String get aiButtonText => 'AI';

  @override
  String get aiAssistantSettingsTitle =>
      'Ikasketa AI Laguntzailea (Aurrebista)';

  @override
  String get aiAssistantSettingsDescription =>
      'Gaitu edo desaktibatu galderetarako ikasketa ai laguntzailea';

  @override
  String get aiDefaultModelTitle => 'AI Modelo Lehenetsia';

  @override
  String get aiDefaultModelDescription =>
      'Hautatu AI zerbitzu eta modelo lehenetsia galderen sorrerarako';

  @override
  String get openaiApiKeyLabel => 'OpenAI API Gakoa';

  @override
  String get openaiApiKeyHint => 'Sartu zure OpenAI API Gakoa (sk-...)';

  @override
  String get openaiApiKeyDescription =>
      'Beharrezkoa da OpenAI integratzeko. Zure OpenAI gakoa modu seguruan gordetzen da.';

  @override
  String get aiAssistantRequiresApiKeyError =>
      'Ikasketa AI Laguntzaileak OpenAI API Gako bat behar du. Sartu zure API gakoa edo desaktibatu AI Laguntzailea.';

  @override
  String get getApiKeyTooltip => 'OpenAI-tik API Gakoa lortu';

  @override
  String get deleteAction => 'Ezabatu';

  @override
  String get explanationLabel => 'Azalpena (aukerakoa)';

  @override
  String get explanationHint => 'Sartu erantzun zuzen(ar)entzako azalpena';

  @override
  String get explanationTitle => 'Azalpena';

  @override
  String get imageLabel => 'Irudia';

  @override
  String get changeImage => 'Irudia aldatu';

  @override
  String get removeImage => 'Irudia kendu';

  @override
  String get addImageTap => 'Ukitu irudia gehitzeko';

  @override
  String get imageFormats => 'Formatuak: JPG, PNG, GIF';

  @override
  String get imageLoadError => 'Errorea irudia kargatzean';

  @override
  String imagePickError(String error) {
    return 'Errorea irudia kargatzean: $error';
  }

  @override
  String get tapToZoom => 'Ukitu handitzeko';

  @override
  String get trueLabel => 'Egia';

  @override
  String get falseLabel => 'Gezurra';

  @override
  String get addQuestion => 'Galdera Gehitu';

  @override
  String get editQuestion => 'Galdera Editatu';

  @override
  String get questionText => 'Galderaren Testua';

  @override
  String get questionType => 'Galdera Mota';

  @override
  String get addOption => 'Aukera Gehitu';

  @override
  String get optionsLabel => 'Aukerak';

  @override
  String get optionLabel => 'Aukera';

  @override
  String get questionTextRequired => 'Galdera testua beharrezkoa da';

  @override
  String get atLeastOneOptionRequired =>
      'Gutxienez aukera batek testua izan behar du';

  @override
  String get atLeastOneCorrectAnswerRequired =>
      'Gutxienez erantzun zuzen bat hautatu behar da';

  @override
  String get onlyOneCorrectAnswerAllowed =>
      'Galdera mota honetarako erantzun zuzen bakarra onartzen da';

  @override
  String get removeOption => 'Aukera kendu';

  @override
  String get selectCorrectAnswer => 'Erantzun zuzena hautatu';

  @override
  String get selectCorrectAnswers => 'Erantzun zuzenak hautatu';

  @override
  String emptyOptionsError(String optionNumbers) {
    return '$optionNumbers aukerak hutsik daude. Gehitu testua edo kendu itzazu.';
  }

  @override
  String emptyOptionError(String optionNumber) {
    return '$optionNumber aukera hutsik dago. Gehitu testua edo kendu ezazu.';
  }

  @override
  String get optionEmptyError => 'Aukera hau ezin da hutsik egon';

  @override
  String get hasImage => 'Irudia';

  @override
  String get hasExplanation => 'Azalpena';

  @override
  String errorLoadingSettings(String error) {
    return 'Errorea ezarpenak kargatzean: $error';
  }

  @override
  String couldNotOpenUrl(String url) {
    return 'Ezin izan da $url ireki';
  }

  @override
  String get loadingAiServices => 'AI zerbitzuak kargatzen...';

  @override
  String usingAiService(String serviceName) {
    return 'Erabiltzen: $serviceName';
  }

  @override
  String get aiServiceLabel => 'AI Zerbitzua:';

  @override
  String get aiModelLabel => 'Modeloa:';

  @override
  String get importQuestionsTitle => 'Galderak Inportatu';

  @override
  String importQuestionsMessage(int count, String fileName) {
    return '$count galdera aurkitu dira \"$fileName\"-n. Non inportatu nahi dituzu?';
  }

  @override
  String get importQuestionsPositionQuestion =>
      'Non gehitu nahi dituzu galdera hauek?';

  @override
  String get importAtBeginning => 'Hasieran';

  @override
  String get importAtEnd => 'Amaieran';

  @override
  String questionsImportedSuccess(int count) {
    return '$count galdera arrakastaz inportatuta';
  }

  @override
  String get importQuestionsTooltip =>
      'Beste quiz fitxategi batetik galderak inportatu';

  @override
  String get dragDropHintText =>
      'Galderak inportatzeko .quiz fitxategiak hona arrastatu eta utz ditzakezu ere';

  @override
  String get randomizeQuestionsTitle => 'Galderak Ausazkotu';

  @override
  String get randomizeQuestionsDescription =>
      'Quiz exekuzioan galderen ordena nahastu';

  @override
  String get randomizeQuestionsOffDescription =>
      'Galderak jatorrizko ordenan agertuko dira';

  @override
  String get randomizeAnswersTitle => 'Erantzunen ordena ausazkotu';

  @override
  String get randomizeAnswersDescription =>
      'Quiz exekuzioan erantzun aukeren ordena nahastu';

  @override
  String get randomizeAnswersOffDescription =>
      'Erantzun-aukerak jatorrizko ordenan agertuko dira';

  @override
  String get showCorrectAnswerCountTitle => 'Erantzun Zuzen Kopurua Erakutsi';

  @override
  String get showCorrectAnswerCountDescription =>
      'Erantzun zuzenen kopurua erakutsi aukera anitzeko galderetan';

  @override
  String get showCorrectAnswerCountOffDescription =>
      'Aukera anitzeko galderetan ez da erantzun zuzenen kopurua erakutsiko';

  @override
  String correctAnswersCount(int count) {
    return 'Hautatu $count erantzun zuzen';
  }

  @override
  String get correctSelectedLabel => 'Zuzena';

  @override
  String get correctMissedLabel => 'Zuzena';

  @override
  String get incorrectSelectedLabel => 'Okerra';

  @override
  String get aiGenerateDialogTitle => 'AI-rekin Galderak Sortu';

  @override
  String get aiQuestionCountLabel => 'Galdera Kopurua (Aukerakoa)';

  @override
  String get aiQuestionCountHint => 'Utzi hutsik AI-ak erabaki dezan';

  @override
  String get aiQuestionCountValidation =>
      '1 eta 50 arteko zenbakia izan behar da';

  @override
  String get aiQuestionTypeLabel => 'Galdera Mota';

  @override
  String get aiQuestionTypeRandom => 'Ausazkoa (Mistoa)';

  @override
  String get aiLanguageLabel => 'Galderen Hizkuntza';

  @override
  String get aiContentLabel => 'Galderak sortzeko edukia';

  @override
  String aiWordCount(int current, int max) {
    return '$current / $max hitz';
  }

  @override
  String get aiContentHint =>
      'Sartu testua, gaia, edo edukia zeinetatik galderak sortu nahi dituzun...';

  @override
  String get aiContentHelperText =>
      'AI-ak eduki honen oinarrian galderak sortuko ditu';

  @override
  String aiWordLimitError(int max) {
    return '$max hitzen muga gainditu duzu';
  }

  @override
  String get aiContentRequiredError =>
      'Galderak sortzeko edukia eman behar duzu';

  @override
  String aiContentLimitError(int max) {
    return 'Edukiak $max hitzen muga gainditzen du';
  }

  @override
  String get aiMinWordsError =>
      'Kalitatezkoak galderak sortzeko gutxienez 10 hitz eman';

  @override
  String get aiInfoTitle => 'Informazioa';

  @override
  String get aiInfoDescription =>
      '• AI-ak edukia aztertuko du eta galdera garrantzitsuak sortuko ditu\n• 10 hitz baino gutxiago idazten badituzu, Gai moduan sartuko zara eta gai zehatz horiei buruzko galderak egingo ditu\n• 10 hitz baino gehiagorekin, Eduki moduan sartuko zara eta testu berari buruzko galderak egingo ditu (hitz gehiago = doitasun handiagoa)\n• Testua, definizioak, azalpenak, edo edozein hezkuntza material sar dezakezu\n• Galderek erantzun aukerak eta azalpenak izango dituzte\n• Prozesuak segundo batzuk har ditzake';

  @override
  String get aiGenerateButton => 'Galderak Sortu';

  @override
  String get aiEnterContentTitle => 'Sartu edukia';

  @override
  String get aiEnterContentDescription =>
      'Sartu gaia edo itsatsi edukia galderak sortzeko';

  @override
  String get aiContentFieldHint =>
      'Sartu gai bat, adibidez \"Bigarren Mundu Gerrako historia\" edo itsatsi testua hemen...';

  @override
  String get aiAttachFileHint => 'Erantsi fitxategia (PDF, TXT, MP3, MP4,...)';

  @override
  String get dropAttachmentHere => 'Askatu fitxategia hemen';

  @override
  String get dropImageHere => 'Askatu irudia hemen';

  @override
  String get aiNumberQuestionsLabel => 'Galdera kopurua';

  @override
  String get backButton => 'Itzuli';

  @override
  String get generateButton => 'Sortu';

  @override
  String aiTopicModeCount(int count) {
    return 'Gai modua ($count hitz)';
  }

  @override
  String aiTextModeCount(int count) {
    return 'Testu modua ($count hitz)';
  }

  @override
  String get aiGenerationCategoryLabel => 'Eduki Modua';

  @override
  String get aiGenerationCategoryTheory => 'Teoria';

  @override
  String get aiGenerationCategoryExercises => 'Ariketak';

  @override
  String get aiGenerationCategoryBoth => 'Nahasia';

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
  String get aiServicesLoading => 'AI zerbitzuak kargatzen...';

  @override
  String get aiServicesNotConfigured => 'Ez da AI zerbitzurik konfiguratu';

  @override
  String get aiGeneratedQuestions => 'AI-ak sortutakoak';

  @override
  String get aiApiKeyRequired =>
      'Konfiguratu gutxienez AI API gako bat Ezarpenetan AI sorkuntza erabiltzeko.';

  @override
  String get aiGenerationFailed =>
      'Ezin izan dira galderak sortu. Saiatu eduki ezberdinarekin.';

  @override
  String get aiGenerationErrorTitle => 'Errorea galderak sortzean';

  @override
  String get noQuestionsInFile =>
      'Ez da galderarik aurkitu inportatutako fitxategian';

  @override
  String get couldNotAccessFile => 'Ezin izan da hautatutako fitxategira sartu';

  @override
  String get defaultOutputFileName => 'irteera-fitxategia.quiz';

  @override
  String get generateQuestionsWithAI => 'AI-rekin galderak sortu';

  @override
  String get addQuestionsWithAI => 'Gehitu galderak AI bidez';

  @override
  String aiServiceLimitsWithChars(int words, int chars) {
    return 'Muga: $words hitz edo $chars karaktere';
  }

  @override
  String aiServiceLimitsWordsOnly(int words) {
    return 'Muga: $words hitz';
  }

  @override
  String get aiAssistantDisabled => 'AI Laguntzailea Desgaituta';

  @override
  String get enableAiAssistant =>
      'AI laguntzailea desgaituta dago. Mesedez, gaitu ezazu konfigurazioan AI funtzioak erabiltzeko.';

  @override
  String aiMinWordsRequired(int minWords) {
    return 'Gutxienez $minWords hitz behar dira';
  }

  @override
  String aiWordsReadyToGenerate(int wordCount) {
    return '$wordCount hitz ✓ Sortzeko prest';
  }

  @override
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded) {
    return '$currentWords/$minWords hitz ($moreNeeded gehiago behar dira)';
  }

  @override
  String aiValidationMinWords(int minWords, int moreNeeded) {
    return 'Gutxienez $minWords hitz behar dira ($moreNeeded gehiago behar dira)';
  }

  @override
  String get enableQuestion => 'Galdera gaitu';

  @override
  String get disableQuestion => 'Galdera desgaitu';

  @override
  String get questionDisabled => 'Desgaituta';

  @override
  String get noEnabledQuestionsError =>
      'Ez dago gaitutako galderarik eskuragarri galdetegia exekutatzeko';

  @override
  String get evaluateWithAI => 'Ebaluatu AIrekin';

  @override
  String get aiEvaluation => 'AI Ebaluazioa';

  @override
  String aiEvaluationError(String error) {
    return 'Errorea erantzuna ebaluatzean: $error';
  }

  @override
  String get aiEvaluationPromptSystemRole =>
      'Ikasleen saiakera galderen erantzunak ebaluatzen espezializatutako irakaslea zara. Zure zeregina ebaluazio zehatz eta eraikitzaileak ematea da. Erantzun ikaslearen erantzunaren hizkuntza berean.';

  @override
  String get aiEvaluationPromptQuestion => 'Galdera:';

  @override
  String get aiEvaluationPromptStudentAnswer => 'Ikaslearen erantzuna:';

  @override
  String get aiEvaluationPromptCriteria =>
      'Ebaluazio irizpideak (irakaslearen azalpenean oinarrituta):';

  @override
  String get aiEvaluationPromptSpecificInstructions =>
      'Jarraibide zehatzak:\n- Ebaluatu ikaslearen erantzuna ezarritako irizpideetara zenbateraino egokitzen den\n- Aztertu erantzunean integrazioaren eta egituraren maila\n- Identifikatu irizpideen arabera zerbait garrantzitsua kontuan hartu ez den\n- Kontuan hartu analisiari sakontasuna eta zehaztasuna';

  @override
  String get aiEvaluationPromptGeneralInstructions =>
      'Jarraibide orokorrak:\n- Irizpide zehatzik ezarri ez denez, ebaluatu erantzuna oinarrizko estandar akademikoen arabera\n- Kontuan hartu erantzunaren argitasuna, koherentzia eta egitura\n- Ebaluatu erantzunak gaiaren ulermena erakusten duen\n- Aztertu analisiaren sakontasuna eta argumentazioaren kalitatea';

  @override
  String get aiEvaluationPromptResponseFormat =>
      'Erantzun formatua:\n1. Puntuazioa: [X/10] - Justifikatu labur puntuazioa\n2. Indar puntuak: Adierazi erantzunaren alderdi positiboak\n3. Hobekuntza arloak: Seinalatu hobetu daitezkeen alderdiak\n4. Iruzkin zehatzak: Eman feedback zehatza eta eraikitzailea\n5. Iradokizunak: Eskaini hobetzeko gomendio zehatzak\n\nIzan eraikitzailea, zehatza eta hezigarria zure ebaluazioan. Helburua ikaslea ikastera eta hobetzen laguntzea da. Zuzendu pertsona bigarrenean eta erabili tonu profesionala baina hurbilgarria.';

  @override
  String get aiModeTopicTitle => 'Gai Modua';

  @override
  String get aiModeTopicDescription => 'Gaiaren esploraketa sormentsua';

  @override
  String get aiModeContentTitle => 'Eduki Modua';

  @override
  String get aiModeContentDescription =>
      'Galdera zehatzak zure sarreran oinarrituta';

  @override
  String aiWordCountIndicator(int count) {
    return '$count hitz';
  }

  @override
  String aiPrecisionIndicator(String level) {
    return 'Zehaztasuna: $level';
  }

  @override
  String get aiPrecisionLow => 'Baxua';

  @override
  String get aiPrecisionMedium => 'Ertaina';

  @override
  String get aiPrecisionHigh => 'Altua';

  @override
  String get aiMoreWordsMorePrecision => 'Hitz gehiago = zehaztasun handiagoa';

  @override
  String get aiKeepDraftTitle => 'AI zirriborroa mantendu';

  @override
  String get aiKeepDraftDescription =>
      'Gorde automatikoki AI sortzeko elkarrizketan sartutako testua, elkarrizketa ixten bada galdu ez dadin.';

  @override
  String get aiAttachFile => 'Erantsi fitxategia';

  @override
  String get aiRemoveFile => 'Kendu fitxategia';

  @override
  String get aiFileMode => 'Fitxategi modua';

  @override
  String get aiFileModeDescription =>
      'Galderak erantsitako fitxategitik sortuko dira';

  @override
  String get aiCommentsLabel => 'Iruzkinak (Aukerakoa)';

  @override
  String get aiCommentsHint =>
      'Gehitu erantsitako fitxategiari buruzko argibideak edo iruzkinak...';

  @override
  String get aiCommentsHelperText =>
      'Aukeran, gehitu fitxategitik galderak nola sortu jakiteko argibideak';

  @override
  String get aiFilePickerError => 'Ezin izan da hautatutako fitxategia kargatu';

  @override
  String get studyModeLabel => 'Ikasteko Modua';

  @override
  String get studyModeDescription =>
      'AI laguntza eskuragarri. Erantzun bakoitzaren ondoren feedbacka berehala, denbora-mugarik eta zigorrrik gabe.';

  @override
  String get examModeLabel => 'Azterketa Modua';

  @override
  String get examModeDescription =>
      'AI laguntzarik gabe. Denbora-mugak eta erantzun okerrengatiko zigorrak aplika daitezke.';

  @override
  String get checkAnswer => 'Egiaztatu';

  @override
  String get quizModeTitle => 'Galdetegi Modua';

  @override
  String get settingsTitle => 'Ezarpenak';

  @override
  String get askAiAssistant => 'Galdetu AI Laguntzaileari';

  @override
  String get askAiAboutQuestion => 'Galdetu AIri galdera honi buruz';

  @override
  String get aiHelpWithQuestion => 'Lagundu galdera hau ulertzen';

  @override
  String get edit => 'Editatu';

  @override
  String get enable => 'Gaitu';

  @override
  String get disable => 'Desgaitu';

  @override
  String get quizPreviewTitle => 'Galdetegiaren Aurrebista';

  @override
  String get select => 'Hautatu';

  @override
  String get done => 'Eginda';

  @override
  String get importButton => 'Inportatu';

  @override
  String get reorderButton => 'Berrantolatu';

  @override
  String get startQuizButton => 'Hasi Galdetegia';

  @override
  String get deleteConfirmation =>
      'Ziur zaude galdetegi hau ezabatu nahi duzula?';

  @override
  String get saveSuccess => 'Fitxategia ondo gorde da';

  @override
  String get errorSavingFile => 'Errorea fitxategia gordetzean';

  @override
  String get deleteSingleQuestionConfirmation =>
      'Ziur zaude galdera hau ezabatu nahi duzula?';

  @override
  String deleteMultipleQuestionsConfirmation(int count) {
    return 'Ziur zaude $count galdera ezabatu nahi dituzula?';
  }

  @override
  String get keepPracticing => 'Jarraitu praktikatzen hobetzeko!';

  @override
  String get tryAgain => 'Berriro saiatu';

  @override
  String get review => 'Berrikusi';

  @override
  String get home => 'Hasiera';

  @override
  String get allLabel => 'Guztiak';

  @override
  String get subtractPointsLabel => 'Kendu puntuak erantzun okerrengatik';

  @override
  String get subtractPointsDescription =>
      'Kendu puntuak erantzun oker bakoitzeko.';

  @override
  String get subtractPointsOffDescription =>
      'Erantzun okerrek ez dute punturik kentzen.';

  @override
  String get penaltyAmountLabel => 'Penalizazio kopurua';

  @override
  String penaltyPointsLabel(String amount) {
    return '-$amount puntu / errore';
  }

  @override
  String get allQuestionsLabel => 'Galdera guztiak';

  @override
  String startWithSelectedQuestions(int count) {
    return 'Hasi $count hautatuekin';
  }

  @override
  String get advancedSettingsTitle => 'Ezarpen Aurreratuak (Debug)';

  @override
  String get appLanguageLabel => 'Aplikazioaren hizkuntza';

  @override
  String get appLanguageDescription =>
      'Aplikazioaren hizkuntza gainidatzi probetarako';

  @override
  String get pasteFromClipboard => 'Itsatsi arbeletik';

  @override
  String get pasteImage => 'Itsatsi';

  @override
  String get clipboardNoImage => 'Ez da irudirik aurkitu arbelean';

  @override
  String get close => 'Itxi';

  @override
  String get scoringAndLimitsTitle => 'Puntuazioa eta mugak';

  @override
  String get congratulations => '🎉 Zorionak! 🎉';

  @override
  String get validationMin1Error => 'Gutxienez minutu 1';

  @override
  String remainingTimeWithDays(
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${days}e $hours:$minutes:$seconds';
  }

  @override
  String remainingTimeWithWeeks(
    String weeks,
    String days,
    String hours,
    String minutes,
    String seconds,
  ) {
    return '${weeks}a ${days}e $hours:$minutes:$seconds';
  }

  @override
  String get validationMax30DaysError => 'Gehienez 30 egun';

  @override
  String get validationMin0GenericError => 'Gutxienez 0';
}
