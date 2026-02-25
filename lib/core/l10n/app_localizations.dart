// Copyright (C) 2026 Víctor Carreras
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('ca'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('eu'),
    Locale('fr'),
    Locale('gl'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('zh'),
  ];

  /// No description provided for @abortQuizTitle.
  ///
  /// In en, this message translates to:
  /// **'Abort Quiz?'**
  String get abortQuizTitle;

  /// No description provided for @abortQuizMessage.
  ///
  /// In en, this message translates to:
  /// **'Opening a new file will stop the current quiz.'**
  String get abortQuizMessage;

  /// No description provided for @stopAndOpenButton.
  ///
  /// In en, this message translates to:
  /// **'Stop & Open'**
  String get stopAndOpenButton;

  /// Title of the application displayed in the AppBar.
  ///
  /// In en, this message translates to:
  /// **'Quiz - Exam Simulator'**
  String get titleAppBar;

  /// Label for the Create Quiz file button in the AppBar.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// Label for the LaTeX preview section in question dialogs.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// Label text for preview section
  ///
  /// In en, this message translates to:
  /// **'Preview:'**
  String get previewLabel;

  /// Placeholder text when content is empty
  ///
  /// In en, this message translates to:
  /// **'(empty)'**
  String get emptyPlaceholder;

  /// Title for LaTeX syntax help section
  ///
  /// In en, this message translates to:
  /// **'LaTeX Syntax:'**
  String get latexSyntaxTitle;

  /// Help text explaining LaTeX syntax
  ///
  /// In en, this message translates to:
  /// **'Inline math: Use \$...\$ for LaTeX expressions\nExample: \$x^2 + y^2 = z^2\$'**
  String get latexSyntaxHelp;

  /// Tooltip for preview LaTeX button
  ///
  /// In en, this message translates to:
  /// **'Preview LaTeX rendering'**
  String get previewLatexTooltip;

  /// Generic OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButton;

  /// Label for the Load Quiz file button in the AppBar.
  ///
  /// In en, this message translates to:
  /// **'Load'**
  String get load;

  /// Message displayed when a file is successfully loaded.
  ///
  /// In en, this message translates to:
  /// **'File loaded: {filePath}'**
  String fileLoaded(String filePath);

  /// Message displayed when a file is successfully saved.
  ///
  /// In en, this message translates to:
  /// **'File saved: {filePath}'**
  String fileSaved(String filePath);

  /// Text displayed inside the drop area for dragging files.
  ///
  /// In en, this message translates to:
  /// **'Click logo or drag a .quiz file to the screen'**
  String get dropFileHere;

  /// Generic error message when opening a file fails.
  ///
  /// In en, this message translates to:
  /// **'Error opening file'**
  String get errorOpeningFile;

  /// Title of the confirmation dialog to replace the current file.
  ///
  /// In en, this message translates to:
  /// **'Load new Quiz'**
  String get replaceFileTitle;

  /// Message of the confirmation dialog to replace the current file.
  ///
  /// In en, this message translates to:
  /// **'A Quiz is already loaded. Do you want to replace it with the new file?'**
  String get replaceFileMessage;

  /// Button to confirm replacing the file.
  ///
  /// In en, this message translates to:
  /// **'Load'**
  String get replaceButton;

  /// Text displayed below the drop area
  ///
  /// In en, this message translates to:
  /// **'Click to load or drag a .quiz file to the screen'**
  String get clickOrDragFile;

  /// Message displayed when the dropped file is not a .quiz file.
  ///
  /// In en, this message translates to:
  /// **'Error: Invalid file. Must be a .quiz file.'**
  String get errorInvalidFile;

  /// Message displayed when there is an error while loading a Quiz file.
  ///
  /// In en, this message translates to:
  /// **'Error loading the Quiz file: {error}'**
  String errorLoadingFile(String error);

  /// Message displayed when there is an error while exporting a file.
  ///
  /// In en, this message translates to:
  /// **'Error exporting the file: {error}'**
  String errorExportingFile(String error);

  /// Cancel button.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// Save button.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// Title for the confirmation dialog when deleting a process.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get confirmDeleteTitle;

  /// Message in the confirmation dialog for deletion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete `{processName}` process?'**
  String confirmDeleteMessage(String processName);

  /// Button text for confirming deletion.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteButton;

  /// Title for the confirmation dialog when exiting.
  ///
  /// In en, this message translates to:
  /// **'Confirm Exit'**
  String get confirmExitTitle;

  /// Message in the confirmation dialog for exiting.
  ///
  /// In en, this message translates to:
  /// **'There are unsaved changes. Do you want to leave and discard changes?'**
  String get confirmExitMessage;

  /// Exit button text.
  ///
  /// In en, this message translates to:
  /// **'Exit without saving'**
  String get exitButton;

  /// Title for the save dialog.
  ///
  /// In en, this message translates to:
  /// **'Please select an output file:'**
  String get saveDialogTitle;

  /// Title for create quiz file dialog.
  ///
  /// In en, this message translates to:
  /// **'Create Quiz File'**
  String get createQuizFileTitle;

  /// Title for edit quiz file dialog.
  ///
  /// In en, this message translates to:
  /// **'Edit Quiz File'**
  String get editQuizFileTitle;

  /// Label for file name input.
  ///
  /// In en, this message translates to:
  /// **'File Name'**
  String get fileNameLabel;

  /// Label for file description input.
  ///
  /// In en, this message translates to:
  /// **'File Description'**
  String get fileDescriptionLabel;

  /// Create button text.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createButton;

  /// Error message when file name is empty.
  ///
  /// In en, this message translates to:
  /// **'The file name is required.'**
  String get fileNameRequiredError;

  /// Error message when file description is empty.
  ///
  /// In en, this message translates to:
  /// **'The file description is required.'**
  String get fileDescriptionRequiredError;

  /// Label for quiz version field
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versionLabel;

  /// Label for quiz author field
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get authorLabel;

  /// Error message when author field is empty
  ///
  /// In en, this message translates to:
  /// **'The author is required.'**
  String get authorRequiredError;

  /// Error message when required fields are missing
  ///
  /// In en, this message translates to:
  /// **'All required fields must be completed.'**
  String get requiredFieldsError;

  /// Title for request file name dialog.
  ///
  /// In en, this message translates to:
  /// **'Enter the Quiz file name'**
  String get requestFileNameTitle;

  /// Hint text for file name input.
  ///
  /// In en, this message translates to:
  /// **'File name'**
  String get fileNameHint;

  /// Error message when file name is empty.
  ///
  /// In en, this message translates to:
  /// **'The file name cannot be empty.'**
  String get emptyFileNameMessage;

  /// Accept button text.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get acceptButton;

  /// Tooltip for save button.
  ///
  /// In en, this message translates to:
  /// **'Save the file'**
  String get saveTooltip;

  /// Tooltip for disabled save button.
  ///
  /// In en, this message translates to:
  /// **'No changes to save'**
  String get saveDisabledTooltip;

  /// Tooltip for execute button.
  ///
  /// In en, this message translates to:
  /// **'Execute the exam'**
  String get executeTooltip;

  /// Tooltip for add button.
  ///
  /// In en, this message translates to:
  /// **'Add a new question'**
  String get addTooltip;

  /// Semantic label for back button.
  ///
  /// In en, this message translates to:
  /// **'Back button'**
  String get backSemanticLabel;

  /// Tooltip for create file button.
  ///
  /// In en, this message translates to:
  /// **'Create a new Quiz file'**
  String get createFileTooltip;

  /// Tooltip for load file button.
  ///
  /// In en, this message translates to:
  /// **'Load an existing Quiz file'**
  String get loadFileTooltip;

  /// Question number label in quiz execution
  ///
  /// In en, this message translates to:
  /// **'Question {number}'**
  String questionNumber(int number);

  /// Label showing current question number and total questions
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String questionOfTotal(int current, int total);

  /// Previous button text in quiz navigation
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// Label for skip button
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Title for the questions overview bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Questions Map'**
  String get questionsOverview;

  /// Next button text in quiz navigation
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Finish button text in quiz navigation
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// Title of finish quiz dialog
  ///
  /// In en, this message translates to:
  /// **'Finish Quiz'**
  String get finishQuiz;

  /// Confirmation message for finishing quiz
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to finish the quiz? You won\'t be able to change your answers afterwards.'**
  String get finishQuizConfirmation;

  /// Confirmation message for finishing quiz with unanswered questions
  ///
  /// In en, this message translates to:
  /// **'You have {unansweredCount, plural, =1{1 unanswered question} other{{unansweredCount} unanswered questions}}. Are you sure you want to finish?'**
  String finishQuizUnansweredQuestions(int unansweredCount);

  /// Button text to resolve unanswered questions
  ///
  /// In en, this message translates to:
  /// **'Resolve questions'**
  String get resolveUnansweredQuestions;

  /// Title of abandon quiz dialog
  ///
  /// In en, this message translates to:
  /// **'Abandon Quiz'**
  String get abandonQuiz;

  /// Confirmation message for abandoning quiz
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to abandon the quiz? All progress will be lost.'**
  String get abandonQuizConfirmation;

  /// Abandon button text
  ///
  /// In en, this message translates to:
  /// **'Abandon'**
  String get abandon;

  /// Quiz completed message
  ///
  /// In en, this message translates to:
  /// **'Quiz Completed!'**
  String get quizCompleted;

  /// Score display
  ///
  /// In en, this message translates to:
  /// **'Score: {score}%'**
  String score(String score);

  /// Correct answers count
  ///
  /// In en, this message translates to:
  /// **'{correct} of {total} correct answers'**
  String correctAnswers(String correct, int total);

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get retry;

  /// Go back button text
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get goBack;

  /// Button text to retry only the questions that were answered incorrectly
  ///
  /// In en, this message translates to:
  /// **'Retry Failed'**
  String get retryFailedQuestions;

  /// Question text in results
  ///
  /// In en, this message translates to:
  /// **'Question: {question}'**
  String question(String question);

  /// Title for the dialog to select number of questions for the quiz
  ///
  /// In en, this message translates to:
  /// **'Select Number of Questions'**
  String get selectQuestionCountTitle;

  /// Message explaining the question count selection
  ///
  /// In en, this message translates to:
  /// **'How many questions would you like to answer in this quiz?'**
  String get selectQuestionCountMessage;

  /// Option to select all available questions
  ///
  /// In en, this message translates to:
  /// **'All questions ({count})'**
  String allQuestions(int count);

  /// Button text to start the quiz
  ///
  /// In en, this message translates to:
  /// **'Start Quiz'**
  String get startQuiz;

  /// Label for the toggle to limit incorrect answers
  ///
  /// In en, this message translates to:
  /// **'Limit incorrect answers'**
  String get maxIncorrectAnswersLabel;

  /// Description for the limit incorrect answers feature
  ///
  /// In en, this message translates to:
  /// **'Pass/Fail Exam. No numeric grade; you either pass or fail.'**
  String get maxIncorrectAnswersDescription;

  /// Description shown when max incorrect answers is disabled
  ///
  /// In en, this message translates to:
  /// **'The exam has a numeric grade from 0 to 100.'**
  String get maxIncorrectAnswersOffDescription;

  /// Label for the input field of maximum incorrect answers
  ///
  /// In en, this message translates to:
  /// **'Maximum allowed errors'**
  String get maxIncorrectAnswersLimitLabel;

  /// Status of a failed exam
  ///
  /// In en, this message translates to:
  /// **'Exam FAILED (Fail)'**
  String get examFailedStatus;

  /// Status of a passed exam
  ///
  /// In en, this message translates to:
  /// **'Exam PASSED (Pass)'**
  String get examPassedStatus;

  /// Title for the results screen when the error limit is reached
  ///
  /// In en, this message translates to:
  /// **'Exam Finished: Maximum error limit has been reached'**
  String get quizFailedLimitReached;

  /// Error message for invalid number input
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get errorInvalidNumber;

  /// Error message when number is zero or negative
  ///
  /// In en, this message translates to:
  /// **'Number must be greater than 0'**
  String get errorNumberMustBePositive;

  /// Label for custom number input field
  ///
  /// In en, this message translates to:
  /// **'Or enter a custom number:'**
  String get customNumberLabel;

  /// Label for the number input field
  ///
  /// In en, this message translates to:
  /// **'Number of questions'**
  String get numberInputLabel;

  /// Title for the question order configuration dialog
  ///
  /// In en, this message translates to:
  /// **'Question Order Configuration'**
  String get questionOrderConfigTitle;

  /// Description text for the question order configuration dialog
  ///
  /// In en, this message translates to:
  /// **'Select the order in which you want questions to appear during the exam:'**
  String get questionOrderConfigDescription;

  /// Label for ascending question order option
  ///
  /// In en, this message translates to:
  /// **'Ascending Order'**
  String get questionOrderAscending;

  /// Description for ascending question order option
  ///
  /// In en, this message translates to:
  /// **'Questions will appear in order from 1 to the end'**
  String get questionOrderAscendingDesc;

  /// Label for descending question order option
  ///
  /// In en, this message translates to:
  /// **'Descending Order'**
  String get questionOrderDescending;

  /// Description for descending question order option
  ///
  /// In en, this message translates to:
  /// **'Questions will appear from the end to 1'**
  String get questionOrderDescendingDesc;

  /// Label for random question order option
  ///
  /// In en, this message translates to:
  /// **'Randomize Questions Order'**
  String get questionOrderRandom;

  /// Description for random question order option
  ///
  /// In en, this message translates to:
  /// **'Questions will appear in random order'**
  String get questionOrderRandomDesc;

  /// Tooltip for the question order configuration button
  ///
  /// In en, this message translates to:
  /// **'Question order configuration'**
  String get questionOrderConfigTooltip;

  /// Tooltip for the reorder questions button
  ///
  /// In en, this message translates to:
  /// **'Reorder Questions'**
  String get reorderQuestionsTooltip;

  /// Label for the save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Title for the advanced settings / exam configuration section
  ///
  /// In en, this message translates to:
  /// **'Exam Configuration'**
  String get examConfigurationTitle;

  /// Title for exam time limit section
  ///
  /// In en, this message translates to:
  /// **'Exam Time Limit'**
  String get examTimeLimitTitle;

  /// Description for exam time limit feature
  ///
  /// In en, this message translates to:
  /// **'Set a time limit for the exam. A countdown timer will be displayed during the quiz.'**
  String get examTimeLimitDescription;

  /// Description shown when time limit is disabled
  ///
  /// In en, this message translates to:
  /// **'There is no time limit for this exam.'**
  String get examTimeLimitOffDescription;

  /// Label for enable exam time limit switch
  ///
  /// In en, this message translates to:
  /// **'Enable time limit'**
  String get enableTimeLimit;

  /// Label for exam time minutes input
  ///
  /// In en, this message translates to:
  /// **'Time limit (minutes)'**
  String get timeLimitMinutes;

  /// Title for exam time expired dialog
  ///
  /// In en, this message translates to:
  /// **'Time\'s Up!'**
  String get examTimeExpiredTitle;

  /// Message for exam time expired dialog
  ///
  /// In en, this message translates to:
  /// **'The exam time has expired. Your answers have been automatically submitted.'**
  String get examTimeExpiredMessage;

  /// Format for remaining time display (hours:minutes:seconds)
  ///
  /// In en, this message translates to:
  /// **'{hours}:{minutes}:{seconds}'**
  String remainingTime(String hours, String minutes, String seconds);

  /// Label for multiple choice question type
  ///
  /// In en, this message translates to:
  /// **'Multiple Choice'**
  String get questionTypeMultipleChoice;

  /// Label for single choice question type
  ///
  /// In en, this message translates to:
  /// **'Single Choice'**
  String get questionTypeSingleChoice;

  /// Label for true/false question type
  ///
  /// In en, this message translates to:
  /// **'True/False'**
  String get questionTypeTrueFalse;

  /// Label for essay question type
  ///
  /// In en, this message translates to:
  /// **'Essay'**
  String get questionTypeEssay;

  /// Label for random question type
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get questionTypeRandom;

  /// Label for unknown question type
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get questionTypeUnknown;

  /// Text showing the number of options in a question
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 option} other{{count} options}}'**
  String optionsCount(int count);

  /// Tooltip text for the options count badge
  ///
  /// In en, this message translates to:
  /// **'Number of answer options for this question'**
  String get optionsTooltip;

  /// Tooltip text for the image indicator badge
  ///
  /// In en, this message translates to:
  /// **'This question has an associated image'**
  String get imageTooltip;

  /// Tooltip text for the explanation indicator badge
  ///
  /// In en, this message translates to:
  /// **'This question has an explanation'**
  String get explanationTooltip;

  /// Label indicating that a question is missing an explanation
  ///
  /// In en, this message translates to:
  /// **'Missing explanation'**
  String get missingExplanation;

  /// Tooltip text for the missing explanation badge
  ///
  /// In en, this message translates to:
  /// **'This question is missing an explanation'**
  String get missingExplanationTooltip;

  /// Tooltip text for the question type badge
  ///
  /// In en, this message translates to:
  /// **'Question type: {type}'**
  String questionTypeTooltip(String type);

  /// Base prompt for AI assistant
  ///
  /// In en, this message translates to:
  /// **'Focus on the student\'s question, not on directly answering the original exam question. Explain with a pedagogical approach. For practical exercises or math problems, provide step-by-step instructions. For theoretical questions, provide a concise explanation without structuring the response in sections. Respond in the same language you are asked in.'**
  String get aiPrompt;

  /// Guardrail prompt to keep AI focused on quiz content
  ///
  /// In en, this message translates to:
  /// **'IMPORTANT: You are a study assistant exclusively for this Quiz. You must ONLY answer questions related to the current Quiz question, its options, its explanation, or the educational topic it covers. If the student asks about anything unrelated to the Quiz (e.g., your internal model, system details, general knowledge not related to the question, or any off-topic request), respond ONLY with: \"I\'m here to help you with this Quiz! Let\'s focus on the question at hand. Feel free to ask me about the topic, the answer options, or anything related to this question.\" Never reveal technical details about yourself, the system, or the AI model being used.'**
  String get aiChatGuardrail;

  /// Label for question in AI dialog
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get questionLabel;

  /// Label for student comment in AI dialog
  ///
  /// In en, this message translates to:
  /// **'Student comment'**
  String get studentComment;

  /// Title for AI assistant dialog
  ///
  /// In en, this message translates to:
  /// **'AI Study Assistant'**
  String get aiAssistantTitle;

  /// Label for question context section
  ///
  /// In en, this message translates to:
  /// **'Question Context'**
  String get questionContext;

  /// AI assistant label in chat
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get aiAssistant;

  /// Loading message while AI processes
  ///
  /// In en, this message translates to:
  /// **'AI is thinking...'**
  String get aiThinking;

  /// Hint text for AI question input
  ///
  /// In en, this message translates to:
  /// **'Ask your question about this topic...'**
  String get askAIHint;

  /// Placeholder AI response for demo
  ///
  /// In en, this message translates to:
  /// **'This is a placeholder response. In a real implementation, this would connect to an AI service to provide helpful explanations about the question.'**
  String get aiPlaceholderResponse;

  /// Error message when AI request fails
  ///
  /// In en, this message translates to:
  /// **'Sorry, there was an error processing your question. Please try again.'**
  String get aiErrorResponse;

  /// Text shown in the results screen when AI evaluations are pending
  ///
  /// In en, this message translates to:
  /// **'Evaluating responses...'**
  String get evaluatingResponses;

  /// Subtitle showing the number of pending AI evaluations
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 development question pending AI evaluation} other{{count} development questions pending AI evaluation}}'**
  String pendingEvaluationsCount(int count);

  /// Status label for a pending AI evaluation
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingStatus;

  /// Status label for an essay question that was not evaluated by AI
  ///
  /// In en, this message translates to:
  /// **'Not evaluated'**
  String get notEvaluatedStatus;

  /// Message to configure API key when not set
  ///
  /// In en, this message translates to:
  /// **'Please configure your AI API Key in Settings.'**
  String get configureApiKeyMessage;

  /// Error label prefix for error messages
  ///
  /// In en, this message translates to:
  /// **'Error:'**
  String get errorLabel;

  /// Button text to retry an AI evaluation
  ///
  /// In en, this message translates to:
  /// **'Retry Evaluation'**
  String get retryButton;

  /// Message when no response is received from AI
  ///
  /// In en, this message translates to:
  /// **'No response received'**
  String get noResponseReceived;

  /// Error message for invalid API key
  ///
  /// In en, this message translates to:
  /// **'Invalid API Key. Please check your OpenAI API Key in settings.'**
  String get invalidApiKeyError;

  /// Error message for rate limit exceeded or quota issues
  ///
  /// In en, this message translates to:
  /// **'Quota exceeded or model not available in your tier. Check your plan.'**
  String get rateLimitError;

  /// Error message for model not found
  ///
  /// In en, this message translates to:
  /// **'Model not found. Please check your API access.'**
  String get modelNotFoundError;

  /// Generic unknown error message
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// Network connectivity error message for OpenAI
  ///
  /// In en, this message translates to:
  /// **'Network error: Unable to connect to OpenAI. Please check your internet connection.'**
  String get networkErrorOpenAI;

  /// Network connectivity error message for Google Gemini
  ///
  /// In en, this message translates to:
  /// **'Network error: Unable to connect to Google Gemini. Please check your internet connection.'**
  String get networkErrorGemini;

  /// Error message when API key is not configured
  ///
  /// In en, this message translates to:
  /// **'OpenAI API Key not configured'**
  String get openaiApiKeyNotConfigured;

  /// Error message when Gemini API key is not configured
  ///
  /// In en, this message translates to:
  /// **'Gemini API Key not configured'**
  String get geminiApiKeyNotConfigured;

  /// Label for Gemini API Key field
  ///
  /// In en, this message translates to:
  /// **'Gemini API Key'**
  String get geminiApiKeyLabel;

  /// Hint text for Gemini API Key field
  ///
  /// In en, this message translates to:
  /// **'Enter your Gemini API Key'**
  String get geminiApiKeyHint;

  /// Description for Gemini API Key field
  ///
  /// In en, this message translates to:
  /// **'Required for Gemini AI functionality. Your key is stored securely.'**
  String get geminiApiKeyDescription;

  /// Tooltip for the button to get Gemini API key
  ///
  /// In en, this message translates to:
  /// **'Get API Key from Google AI Studio'**
  String get getGeminiApiKeyTooltip;

  /// Error message when AI Assistant is enabled but no API keys are provided
  ///
  /// In en, this message translates to:
  /// **'AI Study Assistant requires at least one API Key (Gemini or OpenAI). Please enter an API key or disable the AI Assistant.'**
  String get aiRequiresAtLeastOneApiKeyError;

  /// Abbreviation for minutes
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get minutesAbbreviation;

  /// Tooltip for AI assistant button
  ///
  /// In en, this message translates to:
  /// **'AI Study Assistant'**
  String get aiButtonTooltip;

  /// Text for AI assistant button
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get aiButtonText;

  /// Title for AI assistant settings section
  ///
  /// In en, this message translates to:
  /// **'AI Study Assistant (Preview)'**
  String get aiAssistantSettingsTitle;

  /// Description for AI assistant settings
  ///
  /// In en, this message translates to:
  /// **'Enable or disable the AI study assistant for questions'**
  String get aiAssistantSettingsDescription;

  /// Title for default AI model settings section
  ///
  /// In en, this message translates to:
  /// **'Default AI Model'**
  String get aiDefaultModelTitle;

  /// Description for default AI model settings
  ///
  /// In en, this message translates to:
  /// **'Select the default AI service and model for question generation'**
  String get aiDefaultModelDescription;

  /// Label for OpenAI API Key field
  ///
  /// In en, this message translates to:
  /// **'OpenAI API Key'**
  String get openaiApiKeyLabel;

  /// Hint text for OpenAI API Key field
  ///
  /// In en, this message translates to:
  /// **'Enter your OpenAI API Key (sk-...)'**
  String get openaiApiKeyHint;

  /// Description for OpenAI API Key field
  ///
  /// In en, this message translates to:
  /// **'Required for integration with OpenAI. Your OpenAI key is stored securely.'**
  String get openaiApiKeyDescription;

  /// Error message when AI Assistant is enabled but no API key is provided
  ///
  /// In en, this message translates to:
  /// **'AI Study Assistant requires an OpenAI API Key. Please enter your API key or disable the AI Assistant.'**
  String get aiAssistantRequiresApiKeyError;

  /// Tooltip for the button to get API key from OpenAI
  ///
  /// In en, this message translates to:
  /// **'Get API Key from OpenAI'**
  String get getApiKeyTooltip;

  /// Delete action text shown when swiping to delete
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteAction;

  /// Label for the explanation input field
  ///
  /// In en, this message translates to:
  /// **'Explanation (optional)'**
  String get explanationLabel;

  /// Hint text for the explanation input field
  ///
  /// In en, this message translates to:
  /// **'Enter an explanation for the correct answer(s)'**
  String get explanationHint;

  /// Title for the explanation section in quiz results
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get explanationTitle;

  /// Label for the image section in question editor
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get imageLabel;

  /// Text for button to change current image
  ///
  /// In en, this message translates to:
  /// **'Change image'**
  String get changeImage;

  /// Text for button to remove current image
  ///
  /// In en, this message translates to:
  /// **'Remove image'**
  String get removeImage;

  /// Instructional text for adding an image
  ///
  /// In en, this message translates to:
  /// **'Tap to add image'**
  String get addImageTap;

  /// Text indicating supported image formats
  ///
  /// In en, this message translates to:
  /// **'Formats: JPG, PNG, GIF'**
  String get imageFormats;

  /// Error message when image cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'Error loading image'**
  String get imageLoadError;

  /// Error message when image selection fails
  ///
  /// In en, this message translates to:
  /// **'Error loading image: {error}'**
  String imagePickError(String error);

  /// Instructional text to indicate image can be zoomed
  ///
  /// In en, this message translates to:
  /// **'Tap to zoom'**
  String get tapToZoom;

  /// Label for true option in true/false questions
  ///
  /// In en, this message translates to:
  /// **'True'**
  String get trueLabel;

  /// Label for false option in true/false questions
  ///
  /// In en, this message translates to:
  /// **'False'**
  String get falseLabel;

  /// Title for adding a new question dialog
  ///
  /// In en, this message translates to:
  /// **'Add Question'**
  String get addQuestion;

  /// Title for editing an existing question dialog
  ///
  /// In en, this message translates to:
  /// **'Edit Question'**
  String get editQuestion;

  /// Label for question text input field
  ///
  /// In en, this message translates to:
  /// **'Question Text'**
  String get questionText;

  /// Label for question type dropdown
  ///
  /// In en, this message translates to:
  /// **'Question Type'**
  String get questionType;

  /// Label for add option button
  ///
  /// In en, this message translates to:
  /// **'Add Option'**
  String get addOption;

  /// Label for options section
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get optionsLabel;

  /// Label for individual option input field
  ///
  /// In en, this message translates to:
  /// **'Option'**
  String get optionLabel;

  /// Error message when question text is empty
  ///
  /// In en, this message translates to:
  /// **'Question text is required'**
  String get questionTextRequired;

  /// Error message when all options are empty
  ///
  /// In en, this message translates to:
  /// **'At least one option must have text'**
  String get atLeastOneOptionRequired;

  /// Error message when no correct answer is selected
  ///
  /// In en, this message translates to:
  /// **'At least one correct answer must be selected'**
  String get atLeastOneCorrectAnswerRequired;

  /// Error message when multiple correct answers are selected for single choice questions
  ///
  /// In en, this message translates to:
  /// **'Only one correct answer is allowed for this question type'**
  String get onlyOneCorrectAnswerAllowed;

  /// Tooltip for remove option button
  ///
  /// In en, this message translates to:
  /// **'Remove option'**
  String get removeOption;

  /// Tooltip for radio button to select correct answer
  ///
  /// In en, this message translates to:
  /// **'Select correct answer'**
  String get selectCorrectAnswer;

  /// Tooltip for checkbox to select correct answers
  ///
  /// In en, this message translates to:
  /// **'Select correct answers'**
  String get selectCorrectAnswers;

  /// Error message when some options are empty
  ///
  /// In en, this message translates to:
  /// **'Options {optionNumbers} are empty. Please add text to them or remove them.'**
  String emptyOptionsError(String optionNumbers);

  /// Error message when one option is empty
  ///
  /// In en, this message translates to:
  /// **'Option {optionNumber} is empty. Please add text to it or remove it.'**
  String emptyOptionError(String optionNumber);

  /// Error message for individual empty option field
  ///
  /// In en, this message translates to:
  /// **'This option cannot be empty'**
  String get optionEmptyError;

  /// Label indicating that a question has an image
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get hasImage;

  /// Label indicating that a question has an explanation
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get hasExplanation;

  /// Message displayed when there is an error while loading application settings.
  ///
  /// In en, this message translates to:
  /// **'Error loading settings: {error}'**
  String errorLoadingSettings(String error);

  /// Message displayed when a URL cannot be opened.
  ///
  /// In en, this message translates to:
  /// **'Could not open {url}'**
  String couldNotOpenUrl(String url);

  /// Message displayed while loading available AI services.
  ///
  /// In en, this message translates to:
  /// **'Loading AI services...'**
  String get loadingAiServices;

  /// Message displayed showing which AI service is being used.
  ///
  /// In en, this message translates to:
  /// **'Using: {serviceName}'**
  String usingAiService(String serviceName);

  /// Label for the AI service selector.
  ///
  /// In en, this message translates to:
  /// **'AI Service:'**
  String get aiServiceLabel;

  /// Label for the AI model selector.
  ///
  /// In en, this message translates to:
  /// **'Model:'**
  String get aiModelLabel;

  /// Title for the import questions dialog.
  ///
  /// In en, this message translates to:
  /// **'Import Questions'**
  String get importQuestionsTitle;

  /// Message asking where to import questions from another file.
  ///
  /// In en, this message translates to:
  /// **'Found {count} questions in \"{fileName}\". Where would you like to import them?'**
  String importQuestionsMessage(int count, String fileName);

  /// Question asking about import position.
  ///
  /// In en, this message translates to:
  /// **'Where would you like to add these questions?'**
  String get importQuestionsPositionQuestion;

  /// Button to import questions at the beginning of the list.
  ///
  /// In en, this message translates to:
  /// **'At Beginning'**
  String get importAtBeginning;

  /// Button to import questions at the end of the list.
  ///
  /// In en, this message translates to:
  /// **'At End'**
  String get importAtEnd;

  /// Success message when questions are imported.
  ///
  /// In en, this message translates to:
  /// **'Successfully imported {count} questions'**
  String questionsImportedSuccess(int count);

  /// Tooltip for the import questions button.
  ///
  /// In en, this message translates to:
  /// **'Import questions from another quiz file'**
  String get importQuestionsTooltip;

  /// Hint text shown when the question list is empty, indicating drag and drop functionality.
  ///
  /// In en, this message translates to:
  /// **'You can also drag and drop .quiz files here to import questions'**
  String get dragDropHintText;

  /// Title for the setting to randomize questions.
  ///
  /// In en, this message translates to:
  /// **'Randomize Questions'**
  String get randomizeQuestionsTitle;

  /// Description for the randomize questions setting.
  ///
  /// In en, this message translates to:
  /// **'Shuffle the order of questions during quiz execution'**
  String get randomizeQuestionsDescription;

  /// Description for the randomize questions setting when disabled.
  ///
  /// In en, this message translates to:
  /// **'Questions will appear in their original order'**
  String get randomizeQuestionsOffDescription;

  /// Title for the setting to randomize answer options.
  ///
  /// In en, this message translates to:
  /// **'Randomize Answers Order'**
  String get randomizeAnswersTitle;

  /// Description for the randomize answers setting.
  ///
  /// In en, this message translates to:
  /// **'Shuffle the order of answer options during quiz execution'**
  String get randomizeAnswersDescription;

  /// Description for the randomize answers setting when disabled.
  ///
  /// In en, this message translates to:
  /// **'Answer options will appear in their original order'**
  String get randomizeAnswersOffDescription;

  /// Title for the setting to show correct answer count.
  ///
  /// In en, this message translates to:
  /// **'Show Correct Answer Count'**
  String get showCorrectAnswerCountTitle;

  /// Description for the show correct answer count setting.
  ///
  /// In en, this message translates to:
  /// **'Display the number of correct answers in multiple choice questions'**
  String get showCorrectAnswerCountDescription;

  /// Description for the show correct answer count setting when disabled.
  ///
  /// In en, this message translates to:
  /// **'The number of correct answers will not be shown for multiple-choice questions'**
  String get showCorrectAnswerCountOffDescription;

  /// Text showing how many correct answers to select in a multiple choice question.
  ///
  /// In en, this message translates to:
  /// **'Select {count} correct answers'**
  String correctAnswersCount(int count);

  /// Label for correctly selected answers in quiz results.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get correctSelectedLabel;

  /// Label for correct answers that were not selected in quiz results.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get correctMissedLabel;

  /// Label for incorrectly selected answers in quiz results.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get incorrectSelectedLabel;

  /// Title of the AI question generation dialog.
  ///
  /// In en, this message translates to:
  /// **'Generate Questions with AI'**
  String get aiGenerateDialogTitle;

  /// Label for the question count field.
  ///
  /// In en, this message translates to:
  /// **'Number of Questions (Optional)'**
  String get aiQuestionCountLabel;

  /// Hint text for the question count field.
  ///
  /// In en, this message translates to:
  /// **'Leave empty for AI to decide'**
  String get aiQuestionCountHint;

  /// Validation message for question count.
  ///
  /// In en, this message translates to:
  /// **'Must be a number between 1 and 50'**
  String get aiQuestionCountValidation;

  /// Label for the question type selector.
  ///
  /// In en, this message translates to:
  /// **'Question Type'**
  String get aiQuestionTypeLabel;

  /// Random type option for questions.
  ///
  /// In en, this message translates to:
  /// **'Random (Mixed)'**
  String get aiQuestionTypeRandom;

  /// Label for the language selector.
  ///
  /// In en, this message translates to:
  /// **'Question Language'**
  String get aiLanguageLabel;

  /// Label for the content field.
  ///
  /// In en, this message translates to:
  /// **'Content to generate questions from'**
  String get aiContentLabel;

  /// Word counter for content.
  ///
  /// In en, this message translates to:
  /// **'{current} / {max} words'**
  String aiWordCount(int current, int max);

  /// Hint text for the content field.
  ///
  /// In en, this message translates to:
  /// **'Enter the text, topic, or content from which you want to generate questions...'**
  String get aiContentHint;

  /// Additional helper text for the content field.
  ///
  /// In en, this message translates to:
  /// **'AI will create questions based on this content'**
  String get aiContentHelperText;

  /// Error when word limit is exceeded.
  ///
  /// In en, this message translates to:
  /// **'You have exceeded the limit of {max} words'**
  String aiWordLimitError(int max);

  /// Error when no content is provided.
  ///
  /// In en, this message translates to:
  /// **'You must provide content to generate questions'**
  String get aiContentRequiredError;

  /// Validation error for word limit.
  ///
  /// In en, this message translates to:
  /// **'Content exceeds the limit of {max} words'**
  String aiContentLimitError(int max);

  /// Error when content is too short.
  ///
  /// In en, this message translates to:
  /// **'Provide at least 10 words to generate quality questions'**
  String get aiMinWordsError;

  /// Title of the information section.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get aiInfoTitle;

  /// Informative description about the AI generation process.
  ///
  /// In en, this message translates to:
  /// **'• AI will analyze the content and generate relevant questions\n• If you write fewer than 10 words, you\'ll enter Topic mode where questions will be asked about those specific topics\n• With more than 10 words, you\'ll enter Content mode which will ask questions about that same text (more words = more precision)\n• You can include text, definitions, explanations, or any educational material\\n• Questions will include answer options and explanations\\n• The process may take a few seconds'**
  String get aiInfoDescription;

  /// Text for the generate questions button.
  ///
  /// In en, this message translates to:
  /// **'Generate Questions'**
  String get aiGenerateButton;

  /// Title for the step 2 of AI question generation
  ///
  /// In en, this message translates to:
  /// **'Enter Content'**
  String get aiEnterContentTitle;

  /// Description for the content input step
  ///
  /// In en, this message translates to:
  /// **'Enter the topic or paste content to generate questions from'**
  String get aiEnterContentDescription;

  /// Hint text for the content input field
  ///
  /// In en, this message translates to:
  /// **'Enter a topic like \"World War II history\" or paste text content here...'**
  String get aiContentFieldHint;

  /// Hint text for the file attachment area
  ///
  /// In en, this message translates to:
  /// **'Attach a file (PDF, TXT, MP3, MP4,...)'**
  String get aiAttachFileHint;

  /// Hint shown when dragging a file over the attachment area
  ///
  /// In en, this message translates to:
  /// **'Drop file here'**
  String get dropAttachmentHere;

  /// Hint shown when dragging an image over the image section
  ///
  /// In en, this message translates to:
  /// **'Drop image here'**
  String get dropImageHere;

  /// Label for number of questions input
  ///
  /// In en, this message translates to:
  /// **'Number of Questions'**
  String get aiNumberQuestionsLabel;

  /// Generic back button text
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// Generic generate button text
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get generateButton;

  /// Topic mode with word count
  ///
  /// In en, this message translates to:
  /// **'Topic Mode ({count} words)'**
  String aiTopicModeCount(int count);

  /// Text mode with word count
  ///
  /// In en, this message translates to:
  /// **'Text Mode ({count} words)'**
  String aiTextModeCount(int count);

  /// Label for AI generation category selector
  ///
  /// In en, this message translates to:
  /// **'Content Mode'**
  String get aiGenerationCategoryLabel;

  /// Label for theory category
  ///
  /// In en, this message translates to:
  /// **'Theory'**
  String get aiGenerationCategoryTheory;

  /// Label for exercises category
  ///
  /// In en, this message translates to:
  /// **'Exercises'**
  String get aiGenerationCategoryExercises;

  /// Label for mixed category
  ///
  /// In en, this message translates to:
  /// **'Mixed'**
  String get aiGenerationCategoryBoth;

  /// Spanish language name.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// English language name.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// French language name.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageFrench;

  /// German language name.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get languageGerman;

  /// Greek language name.
  ///
  /// In en, this message translates to:
  /// **'Ελληνικά'**
  String get languageGreek;

  /// Italian language name.
  ///
  /// In en, this message translates to:
  /// **'Italiano'**
  String get languageItalian;

  /// Portuguese language name.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get languagePortuguese;

  /// Catalan language name.
  ///
  /// In en, this message translates to:
  /// **'Català'**
  String get languageCatalan;

  /// Basque language name.
  ///
  /// In en, this message translates to:
  /// **'Euskera'**
  String get languageBasque;

  /// Galician language name.
  ///
  /// In en, this message translates to:
  /// **'Galego'**
  String get languageGalician;

  /// Hindi language name.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get languageHindi;

  /// Chinese language name.
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get languageChinese;

  /// Arabic language name.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get languageArabic;

  /// Japanese language name.
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get languageJapanese;

  /// Message shown while loading available AI services.
  ///
  /// In en, this message translates to:
  /// **'Loading AI services...'**
  String get aiServicesLoading;

  /// Message shown when no AI services are configured.
  ///
  /// In en, this message translates to:
  /// **'No AI services configured'**
  String get aiServicesNotConfigured;

  /// Name for AI generated questions in the import dialog.
  ///
  /// In en, this message translates to:
  /// **'AI Generated'**
  String get aiGeneratedQuestions;

  /// Message shown when no API keys are configured for AI.
  ///
  /// In en, this message translates to:
  /// **'Please configure at least one AI API key in Settings to use AI generation.'**
  String get aiApiKeyRequired;

  /// Message shown when AI question generation fails.
  ///
  /// In en, this message translates to:
  /// **'Could not generate questions. Try with different content.'**
  String get aiGenerationFailed;

  /// Title for the error dialog when generating questions with AI.
  ///
  /// In en, this message translates to:
  /// **'Error generating questions'**
  String get aiGenerationErrorTitle;

  /// Message shown when an imported file contains no questions.
  ///
  /// In en, this message translates to:
  /// **'No questions found in the imported file'**
  String get noQuestionsInFile;

  /// Message shown when a selected file cannot be accessed.
  ///
  /// In en, this message translates to:
  /// **'Could not access the selected file'**
  String get couldNotAccessFile;

  /// Default name for output files.
  ///
  /// In en, this message translates to:
  /// **'output-file.quiz'**
  String get defaultOutputFileName;

  /// Tooltip for the generate questions with AI button.
  ///
  /// In en, this message translates to:
  /// **'Generate questions with AI'**
  String get generateQuestionsWithAI;

  /// Label for the button to add more questions using AI when some already exist.
  ///
  /// In en, this message translates to:
  /// **'Add questions with AI'**
  String get addQuestionsWithAI;

  /// Description of AI service limits with both word and character limits.
  ///
  /// In en, this message translates to:
  /// **'Limit: {words} words or {chars} characters'**
  String aiServiceLimitsWithChars(int words, int chars);

  /// Description of AI service limits with only word limit.
  ///
  /// In en, this message translates to:
  /// **'Limit: {words} words'**
  String aiServiceLimitsWordsOnly(int words);

  /// Title for dialog when AI assistant is disabled
  ///
  /// In en, this message translates to:
  /// **'AI Assistant Disabled'**
  String get aiAssistantDisabled;

  /// Message to show when AI assistant is disabled
  ///
  /// In en, this message translates to:
  /// **'The AI assistant is disabled. Please enable it in settings to use AI features.'**
  String get enableAiAssistant;

  /// Message showing minimum words required for AI generation
  ///
  /// In en, this message translates to:
  /// **'Minimum {minWords} words required'**
  String aiMinWordsRequired(int minWords);

  /// Message when enough words are provided for AI generation
  ///
  /// In en, this message translates to:
  /// **'{wordCount} words ✓ Ready to generate'**
  String aiWordsReadyToGenerate(int wordCount);

  /// Message showing word count progress
  ///
  /// In en, this message translates to:
  /// **'{currentWords}/{minWords} words ({moreNeeded} more needed)'**
  String aiWordsProgress(int currentWords, int minWords, int moreNeeded);

  /// Validation message when not enough words are provided
  ///
  /// In en, this message translates to:
  /// **'Minimum {minWords} words required ({moreNeeded} more needed)'**
  String aiValidationMinWords(int minWords, int moreNeeded);

  /// Button text to enable a question
  ///
  /// In en, this message translates to:
  /// **'Enable question'**
  String get enableQuestion;

  /// Button text to disable a question
  ///
  /// In en, this message translates to:
  /// **'Disable question'**
  String get disableQuestion;

  /// Text indicating that a question is disabled
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get questionDisabled;

  /// Error message when trying to start quiz with no enabled questions
  ///
  /// In en, this message translates to:
  /// **'No enabled questions available to run the quiz'**
  String get noEnabledQuestionsError;

  /// Button text to evaluate essay answers with AI
  ///
  /// In en, this message translates to:
  /// **'Evaluate with AI'**
  String get evaluateWithAI;

  /// Title for AI evaluation section
  ///
  /// In en, this message translates to:
  /// **'AI Evaluation'**
  String get aiEvaluation;

  /// Error message when AI evaluation fails
  ///
  /// In en, this message translates to:
  /// **'Error evaluating response: {error}'**
  String aiEvaluationError(String error);

  /// System role for AI evaluation prompt
  ///
  /// In en, this message translates to:
  /// **'You are an expert teacher evaluating a student\'s response to an essay question. Your task is to provide detailed and constructive evaluation. Respond in the same language as the student\'s answer.'**
  String get aiEvaluationPromptSystemRole;

  /// Question label in evaluation prompt
  ///
  /// In en, this message translates to:
  /// **'QUESTION:'**
  String get aiEvaluationPromptQuestion;

  /// Student answer label in evaluation prompt
  ///
  /// In en, this message translates to:
  /// **'STUDENT\'S ANSWER:'**
  String get aiEvaluationPromptStudentAnswer;

  /// Evaluation criteria label in prompt
  ///
  /// In en, this message translates to:
  /// **'EVALUATION CRITERIA (based on teacher\'s explanation):'**
  String get aiEvaluationPromptCriteria;

  /// Specific instructions for evaluation with criteria
  ///
  /// In en, this message translates to:
  /// **'SPECIFIC INSTRUCTIONS:\n- Evaluate how well the student\'s response aligns with the established criteria\n- Analyze the degree of synthesis and structure in the response\n- Identify if anything important has been left out according to the criteria\n- Consider the depth and accuracy of the analysis'**
  String get aiEvaluationPromptSpecificInstructions;

  /// General instructions for evaluation without criteria
  ///
  /// In en, this message translates to:
  /// **'GENERAL INSTRUCTIONS:\n- Since there are no specific criteria established, evaluate the response based on general academic standards\n- Consider clarity, coherence, and structure of the response\n- Evaluate if the response demonstrates understanding of the topic\n- Analyze the depth of analysis and quality of arguments'**
  String get aiEvaluationPromptGeneralInstructions;

  /// Response format instructions for evaluation
  ///
  /// In en, this message translates to:
  /// **'RESPONSE FORMAT:\n1. GRADE: [X/10] - Briefly justify the grade\n2. STRENGTHS: Mention positive aspects of the response\n3. AREAS FOR IMPROVEMENT: Point out aspects that could be improved\n4. SPECIFIC COMMENTS: Provide detailed and constructive feedback\n5. SUGGESTIONS: Offer specific recommendations for improvement\n\nBe constructive, specific, and educational in your evaluation. The goal is to help the student learn and improve. Address them in second person and use a professional and friendly tone.'**
  String get aiEvaluationPromptResponseFormat;

  /// Title for topic mode in AI assistant
  ///
  /// In en, this message translates to:
  /// **'Topic Mode'**
  String get aiModeTopicTitle;

  /// Description for topic mode
  ///
  /// In en, this message translates to:
  /// **'Creative exploration of the topic'**
  String get aiModeTopicDescription;

  /// Title for content mode in AI assistant
  ///
  /// In en, this message translates to:
  /// **'Content Mode'**
  String get aiModeContentTitle;

  /// Description for content mode
  ///
  /// In en, this message translates to:
  /// **'Precise questions based on your input'**
  String get aiModeContentDescription;

  /// Word count indicator
  ///
  /// In en, this message translates to:
  /// **'{count} words'**
  String aiWordCountIndicator(int count);

  /// Precision level indicator for content mode
  ///
  /// In en, this message translates to:
  /// **'Precision: {level}'**
  String aiPrecisionIndicator(String level);

  /// Low precision level
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get aiPrecisionLow;

  /// Medium precision level
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get aiPrecisionMedium;

  /// High precision level
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get aiPrecisionHigh;

  /// Hint text explaining that more words lead to more precise answers
  ///
  /// In en, this message translates to:
  /// **'More words = more precision'**
  String get aiMoreWordsMorePrecision;

  /// Title for the setting to keep AI generated text draft
  ///
  /// In en, this message translates to:
  /// **'Keep AI Draft'**
  String get aiKeepDraftTitle;

  /// Description for the setting to keep AI generated text draft
  ///
  /// In en, this message translates to:
  /// **'Automatically save the text entered in the AI generation dialog so it is not lost if the dialog is closed.'**
  String get aiKeepDraftDescription;

  /// Label for the attach file button in AI generation dialog
  ///
  /// In en, this message translates to:
  /// **'Attach File'**
  String get aiAttachFile;

  /// Tooltip for the remove file button
  ///
  /// In en, this message translates to:
  /// **'Remove file'**
  String get aiRemoveFile;

  /// Title for the file mode indicator
  ///
  /// In en, this message translates to:
  /// **'File Mode'**
  String get aiFileMode;

  /// Description for the file mode indicator
  ///
  /// In en, this message translates to:
  /// **'Questions will be generated from the attached file'**
  String get aiFileModeDescription;

  /// Label for the comments field when a file is attached
  ///
  /// In en, this message translates to:
  /// **'Comments (Optional)'**
  String get aiCommentsLabel;

  /// Hint text for the comments field when a file is attached
  ///
  /// In en, this message translates to:
  /// **'Add instructions or comments about the attached file...'**
  String get aiCommentsHint;

  /// Helper text for the comments field when a file is attached
  ///
  /// In en, this message translates to:
  /// **'Optionally add instructions on how to generate questions from the file'**
  String get aiCommentsHelperText;

  /// Error message when file picker fails
  ///
  /// In en, this message translates to:
  /// **'Could not load the selected file'**
  String get aiFilePickerError;

  /// Label for study mode option
  ///
  /// In en, this message translates to:
  /// **'Study Mode'**
  String get studyModeLabel;

  /// Description for study mode
  ///
  /// In en, this message translates to:
  /// **'AI assistance available. Instant feedback after each answer with no time limits or penalties.'**
  String get studyModeDescription;

  /// Label for exam mode option
  ///
  /// In en, this message translates to:
  /// **'Exam Mode'**
  String get examModeLabel;

  /// Description for exam mode
  ///
  /// In en, this message translates to:
  /// **'No AI assistance. Time limits and penalties for incorrect answers may apply.'**
  String get examModeDescription;

  /// Button label to check the answer in study mode
  ///
  /// In en, this message translates to:
  /// **'Check Answer'**
  String get checkAnswer;

  /// Title for the quiz mode selection section
  ///
  /// In en, this message translates to:
  /// **'Quiz Mode'**
  String get quizModeTitle;

  /// Title for the settings dialog
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Button label to open AI assistant for current question
  ///
  /// In en, this message translates to:
  /// **'Ask AI Assistant'**
  String get askAiAssistant;

  /// Button label in quiz to open AI chat sidebar for the current question
  ///
  /// In en, this message translates to:
  /// **'Ask AI about this question'**
  String get askAiAboutQuestion;

  /// Auto-filled text in AI chat when user clicks ask AI about question button
  ///
  /// In en, this message translates to:
  /// **'Help me understand this question'**
  String get aiHelpWithQuestion;

  /// Button label to edit a question
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Button label to enable a question
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// Button label to disable a question
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// Title for the Quiz Preview screen
  ///
  /// In en, this message translates to:
  /// **'Quiz Preview'**
  String get quizPreviewTitle;

  /// Label for select button
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// Label for done button
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Label for import button
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get importButton;

  /// Label for reorder button
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorderButton;

  /// Label for start quiz button
  ///
  /// In en, this message translates to:
  /// **'Start Quiz'**
  String get startQuizButton;

  /// Confirmation message for deleting a quiz
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this quiz?'**
  String get deleteConfirmation;

  /// Message displayed when file is saved successfully
  ///
  /// In en, this message translates to:
  /// **'File saved successfully'**
  String get saveSuccess;

  /// Message displayed when saving file fails
  ///
  /// In en, this message translates to:
  /// **'Error saving file'**
  String get errorSavingFile;

  /// Confirmation message for deleting a single question
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this question?'**
  String get deleteSingleQuestionConfirmation;

  /// Confirmation message for deleting multiple questions
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count} questions?'**
  String deleteMultipleQuestionsConfirmation(int count);

  /// Encouraging message for lower quiz scores
  ///
  /// In en, this message translates to:
  /// **'Keep practicing to improve!'**
  String get keepPracticing;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Label for the option to select all questions
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allLabel;

  /// Label for the checkbox to subtract points for incorrect answers
  ///
  /// In en, this message translates to:
  /// **'Subtract points for wrong answer'**
  String get subtractPointsLabel;

  /// No description provided for @subtractPointsDescription.
  ///
  /// In en, this message translates to:
  /// **'Subtract points for each incorrect answer.'**
  String get subtractPointsDescription;

  /// Description shown when subtract points for incorrect answers is disabled
  ///
  /// In en, this message translates to:
  /// **'Incorrect answers do not deduct points.'**
  String get subtractPointsOffDescription;

  /// Label for the input field to set the penalty amount
  ///
  /// In en, this message translates to:
  /// **'Penalty amount'**
  String get penaltyAmountLabel;

  /// Label showing the points deducted per mistake
  ///
  /// In en, this message translates to:
  /// **'-{amount} pts / mistake'**
  String penaltyPointsLabel(String amount);

  /// Label for the toggle to select all questions
  ///
  /// In en, this message translates to:
  /// **'All Questions'**
  String get allQuestionsLabel;

  /// Button text to start the quiz with only the selected questions
  ///
  /// In en, this message translates to:
  /// **'Start with {count} selected'**
  String startWithSelectedQuestions(int count);

  /// Title for the advanced settings section shown in debug mode
  ///
  /// In en, this message translates to:
  /// **'Advanced Settings (Debug)'**
  String get advancedSettingsTitle;

  /// Label for the application language override setting
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get appLanguageLabel;

  /// Description for the application language override setting
  ///
  /// In en, this message translates to:
  /// **'Override application language for testing'**
  String get appLanguageDescription;

  /// Label for the paste from clipboard button
  ///
  /// In en, this message translates to:
  /// **'Paste from clipboard'**
  String get pasteFromClipboard;

  /// Short label for paste button when image is already present
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get pasteImage;

  /// Error message when no image is found in the clipboard
  ///
  /// In en, this message translates to:
  /// **'No image found in clipboard'**
  String get clipboardNoImage;

  /// Close button text
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Title for the scoring and limits section in advanced settings
  ///
  /// In en, this message translates to:
  /// **'Scoring and Limits'**
  String get scoringAndLimitsTitle;

  /// Congratulations message in winner dialog
  ///
  /// In en, this message translates to:
  /// **'🎉 Congratulations! 🎉'**
  String get congratulations;

  /// Validation message indicating the time limit must be at least 1 minute.
  ///
  /// In en, this message translates to:
  /// **'Minimum 1 minute'**
  String get validationMin1Error;

  /// Format for remaining time display when it exceeds 24 hours (days hours:minutes:seconds)
  ///
  /// In en, this message translates to:
  /// **'{days}d {hours}:{minutes}:{seconds}'**
  String remainingTimeWithDays(
    String days,
    String hours,
    String minutes,
    String seconds,
  );

  /// Format for remaining time display when it exceeds 7 days (weeks days hours:minutes:seconds)
  ///
  /// In en, this message translates to:
  /// **'{weeks}w {days}d {hours}:{minutes}:{seconds}'**
  String remainingTimeWithWeeks(
    String weeks,
    String days,
    String hours,
    String minutes,
    String seconds,
  );

  /// Validation message indicating the time limit cannot exceed 30 days.
  ///
  /// In en, this message translates to:
  /// **'Maximum 30 days'**
  String get validationMax30DaysError;

  /// Error message when a field requires a minimum value of 0 without specifying units.
  ///
  /// In en, this message translates to:
  /// **'Minimum 0'**
  String get validationMin0GenericError;

  /// Status label for a failed AI evaluation
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorStatus;

  /// Message for features that are not yet available
  ///
  /// In en, this message translates to:
  /// **'Coming soon! Stay tuned for updates.'**
  String get featureComingSoon;

  /// Label for the button to re-open the onboarding flow
  ///
  /// In en, this message translates to:
  /// **'Show onboarding'**
  String get showOnboarding;

  /// Description for the button to re-open the onboarding flow
  ///
  /// In en, this message translates to:
  /// **'View the welcome tutorial again'**
  String get showOnboardingDescription;

  /// Back button in onboarding navigation
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get onboardingBack;

  /// Get Started button on the last onboarding page
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// Title for the first onboarding page
  ///
  /// In en, this message translates to:
  /// **'Welcome to QuizLab AI'**
  String get onboardingWelcomeTitle;

  /// Description for the first onboarding page
  ///
  /// In en, this message translates to:
  /// **'Your interactive quiz companion with AI-powered features, customizable questions, and real-time scoring.'**
  String get onboardingWelcomeDescription;

  /// Subtitle for the first onboarding page in desktop layout
  ///
  /// In en, this message translates to:
  /// **'Your interactive quiz companion'**
  String get onboardingWelcomeSubtitle;

  /// Title for the second onboarding page
  ///
  /// In en, this message translates to:
  /// **'Start a Quiz'**
  String get onboardingStartQuizTitle;

  /// Description for the second onboarding page
  ///
  /// In en, this message translates to:
  /// **'Load an existing .quiz file or create a new one from scratch. Drag and drop files directly or use the file picker.'**
  String get onboardingStartQuizDescription;

  /// Subtitle for the second onboarding page in desktop layout
  ///
  /// In en, this message translates to:
  /// **'Load, create, and play'**
  String get onboardingStartQuizSubtitle;

  /// Title for the third onboarding page
  ///
  /// In en, this message translates to:
  /// **'Create Questions'**
  String get onboardingCreateQuestionsTitle;

  /// Description for the third onboarding page
  ///
  /// In en, this message translates to:
  /// **'Build quizzes with multiple question types. Customize each question with options, correct answers, and explanations.'**
  String get onboardingCreateQuestionsDescription;

  /// Subtitle for the third onboarding page in desktop layout
  ///
  /// In en, this message translates to:
  /// **'Design your own quizzes'**
  String get onboardingCreateQuestionsSubtitle;

  /// Title for the fourth onboarding page
  ///
  /// In en, this message translates to:
  /// **'AI-Powered Features'**
  String get onboardingAiFeaturesTitle;

  /// Description for the fourth onboarding page
  ///
  /// In en, this message translates to:
  /// **'Generate questions automatically with AI, get real-time study assistance, and learn smarter with intelligent tutoring.'**
  String get onboardingAiFeaturesDescription;

  /// Subtitle for the fourth onboarding page in desktop layout
  ///
  /// In en, this message translates to:
  /// **'Powered by AI'**
  String get onboardingAiFeaturesSubtitle;

  /// Feature title in onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'AI-powered question generation'**
  String get onboardingFeatureAiTitle;

  /// Feature description in onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'Generate quizzes from any text with GPT or Gemini'**
  String get onboardingFeatureAiDescription;

  /// Feature title in onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'Multiple question types'**
  String get onboardingFeatureTypesTitle;

  /// Feature description in onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'Single choice, multiple choice, true/false, and essay'**
  String get onboardingFeatureTypesDescription;

  /// Feature title in onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'13 languages supported'**
  String get onboardingFeatureLanguagesTitle;

  /// Feature description in onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'Create and take quizzes in multiple languages'**
  String get onboardingFeatureLanguagesDescription;

  /// Step title in onboarding start quiz page
  ///
  /// In en, this message translates to:
  /// **'Create Quiz'**
  String get onboardingStepCreateTitle;

  /// Step description in onboarding start quiz page
  ///
  /// In en, this message translates to:
  /// **'Start from scratch with your own questions'**
  String get onboardingStepCreateDescription;

  /// Step title in onboarding start quiz page
  ///
  /// In en, this message translates to:
  /// **'Load File'**
  String get onboardingStepLoadTitle;

  /// Step description in onboarding start quiz page
  ///
  /// In en, this message translates to:
  /// **'Import a .quiz file from your device'**
  String get onboardingStepLoadDescription;

  /// Step title in onboarding start quiz page
  ///
  /// In en, this message translates to:
  /// **'Take the Quiz'**
  String get onboardingStepTakeTitle;

  /// Step description in onboarding start quiz page
  ///
  /// In en, this message translates to:
  /// **'Answer questions and get scored in real-time'**
  String get onboardingStepTakeDescription;

  /// AI feature title in onboarding
  ///
  /// In en, this message translates to:
  /// **'Auto-Generate Questions'**
  String get onboardingAiAutoGenerateTitle;

  /// AI feature description in onboarding
  ///
  /// In en, this message translates to:
  /// **'From any text with GPT or Gemini'**
  String get onboardingAiAutoGenerateDescription;

  /// AI feature title in onboarding
  ///
  /// In en, this message translates to:
  /// **'AI Study Assistant'**
  String get onboardingAiStudyAssistantTitle;

  /// AI feature description in onboarding
  ///
  /// In en, this message translates to:
  /// **'Get explanations while you learn'**
  String get onboardingAiStudyAssistantDescription;

  /// AI feature title in onboarding
  ///
  /// In en, this message translates to:
  /// **'Multi-Language Support'**
  String get onboardingAiMultiLanguageTitle;

  /// AI feature description in onboarding
  ///
  /// In en, this message translates to:
  /// **'Generate in 13 different languages'**
  String get onboardingAiMultiLanguageDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'ca',
    'de',
    'el',
    'en',
    'es',
    'eu',
    'fr',
    'gl',
    'hi',
    'it',
    'ja',
    'pt',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'ca':
      return AppLocalizationsCa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'eu':
      return AppLocalizationsEu();
    case 'fr':
      return AppLocalizationsFr();
    case 'gl':
      return AppLocalizationsGl();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
