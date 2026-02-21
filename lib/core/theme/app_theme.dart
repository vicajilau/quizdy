import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quiz_app/core/theme/extensions/custom_colors.dart';
import 'package:quiz_app/core/theme/extensions/exam_timer_theme.dart';
import 'package:quiz_app/core/theme/extensions/home_theme.dart';
import 'package:quiz_app/core/theme/extensions/file_loaded_theme.dart';
import 'package:quiz_app/core/theme/extensions/question_dialog_theme.dart';
import 'package:quiz_app/core/theme/extensions/ai_assistant_theme.dart';

class AppTheme {
  // Define main application colors
  static const Color primaryColor = Color(0xFF8B5CF6);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Colors.white;
  static const Color cardColorLight = Color(0xFFF4F4F5); // Zinc 100
  static const Color surfaceColor = Colors.white;
  static const Color errorColor = Color(0xFFEF4444); // Lucide red
  static const Color textColor = Color(0xFF18181B); // Zinc 900
  static const Color textSecondaryColor = Color(0xFF71717A); // Zinc 500
  static const Color borderColor = Color(0xFFE4E4E7); // Zinc 200
  static const Color cardColorDark = Color(0xFF27272A); // Zinc 800
  static const Color borderColorDark = Color(0xFF3F3F46); // Zinc 700
  static const Color zinc50 = Color(0xFFFAFAFA);
  static const Color zinc100 = Color(0xFFF4F4F5); // cardColorLight
  static const Color zinc200 = Color(0xFFE4E4E7); // borderColor
  static const Color zinc300 = Color(0xFFD4D4D8);
  static const Color zinc400 = Color(0xFFA1A1AA);
  static const Color zinc500 = Color(0xFF71717A); // textSecondaryColor
  static const Color zinc600 = Color(0xFF52525B);
  static const Color zinc700 = Color(0xFF3F3F46); // borderColorDark
  static const Color zinc800 = Color(0xFF27272A); // cardColorDark
  static const Color zinc900 = Color(0xFF18181B); // textColor

  static const Color violet100 = Color(0xFFEDE9FE);
  static const Color violet400 = Color(0xFFA78BFA);
  static const Color violet500 = Color(0xFF8B5CF6); // primaryColor
  static const Color violet900 = Color(0xFF4C1D95);

  static const Color shadowColor = Colors.black;
  static const Color transparent = Colors.transparent;

  // Define the light theme
  static ThemeData get lightTheme => ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColorLight,
    dividerColor: borderColor,
    hintColor: zinc400,
    fontFamily: GoogleFonts.inter().fontFamily,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: textColor,
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: surfaceColor,
      foregroundColor: textColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.plusJakartaSans(
        color: textColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: textColor),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.plusJakartaSans(
        fontSize: 48.0,
        fontWeight: FontWeight.w800,
        color: primaryColor,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      bodyLarge: GoogleFonts.inter(fontSize: 16.0, color: textColor),
      bodyMedium: GoogleFonts.inter(fontSize: 14.0, color: textSecondaryColor),
      labelLarge: GoogleFonts.inter(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: surfaceColor,
        side: const BorderSide(color: borderColor, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    iconTheme: const IconThemeData(color: textSecondaryColor, size: 24),
    extensions: [
      const ConfirmingDialogColorsExtension(
        card: Colors.white,
        title: textColor,
        subtitle: textSecondaryColor,
        surface: cardColorLight,
        border: borderColor,
      ),
      const CustomColors(
        aiIconColor: primaryColor,
        success: Color(0xFF10B981), // Emerald 500
        info: Color(0xFF3B82F6), // Blue 500
        warning: Color(0xFFFBBF24), // Amber 400
        warningContainer: Color(0xFFFEF3C7), // Amber 100
        onWarningContainer: Color(0xFFD97706), // Amber 600
      ),
      const ExamTimerTheme(
        dialogBackgroundColor: surfaceColor,
        dialogTextColor: textColor,
        dialogSubTextColor: textSecondaryColor, // Zinc 500
        dialogBorderColor: borderColor,
        dialogButtonColor: primaryColor,
        dialogButtonTextColor: Colors.white,
        dialogShadowColor: Color(
          0x1A000000,
        ), // Colors.black.withValues(alpha: 0.1)
        timerLowColor: errorColor,
        timerBackgroundColor: Color(
          0x338B5CF6,
        ), // primaryColor.withValues(alpha: 0.2)
        timerLowBackgroundColor: Color(
          0x33EF4444,
        ), // errorColor.withValues(alpha: 0.2)
        dialogCanvasColor: Colors.transparent,
      ),
      const HomeTheme(
        dropZoneShadowColor: Color(
          0x1A8B5CF6,
        ), // primaryColor.withValues(alpha: 0.1)
      ),
      const FileLoadedTheme(
        deleteDialogBackgroundColor: Color(0xFF27272A), // Zinc 800
        deleteDialogTextColor: Colors.white,
        deleteDialogSubTextColor: Colors.white70,
        appBarIconBackgroundColor: Color(
          0x33FFFFFF,
        ), // Colors.white.withValues(alpha: 0.2)
        selectionInactiveBackgroundColor: Color(
          0x33FFFFFF,
        ), // Colors.white.withValues(alpha: 0.2)
        dragOverlayColor: Color(
          0x1A8B5CF6,
        ), // primaryColor.withValues(alpha: 0.1)
        dragOverlayBorderColor: primaryColor,
        dragOverlayShadowColor: Color(
          0x338B5CF6,
        ), // primaryColor.withValues(alpha: 0.2)
      ),
      const QuestionDialogTheme(
        backgroundColor: surfaceColor,
        textColor: textColor,
        borderColor: borderColor,
        closeButtonColor: cardColorLight,
        closeIconColor: textSecondaryColor,
        shadowColor: shadowColor,
      ),
      const AiAssistantTheme(
        selectorHeaderBg: zinc100,
        selectorContentBg: zinc50,
        selectorBorderColor: zinc200,
        selectorLabelColor: zinc500,
        selectorTextColor: zinc900,
        sidebarBg: Colors.white,
        sidebarHeaderBtnBg: zinc100,
        sidebarBorderColor: zinc200,
        chatTitleColor: zinc900,
        inputFillColor: Colors.white,
        inputHintColor: zinc400,
        userBubbleBg: violet100,
        userBubbleTextColor: zinc900,
        aiBubbleBg: zinc100,
        aiBubbleLabelColor: primaryColor,
        aiAssistantLabelColor: primaryColor,
        errorBubbleBg: Color(0xFFFEE2E2), // Red 100
        errorBubbleBorderColor: Color(0xFFFECACA), // Red 200
      ),
    ],
  );

  // Define the dark theme
  static ThemeData get darkTheme => ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFF18181B), // Zinc 900
    cardColor: cardColorDark,
    dividerColor: borderColorDark,
    hintColor: zinc400,
    fontFamily: GoogleFonts.inter().fontFamily,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Color(0xFF18181B), // Zinc 900
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Color(0xFFFAFAFA), // Zinc 50
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF18181B),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.plusJakartaSans(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.plusJakartaSans(
        fontSize: 48.0,
        fontWeight: FontWeight.w800,
        color: primaryColor,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.inter(fontSize: 16.0, color: Colors.white),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14.0,
        color: const Color(0xFFA1A1AA), // Zinc 400
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: cardColorDark,
        side: const BorderSide(color: borderColorDark, width: 2), // Zinc 700
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFA1A1AA), // Zinc 400
      size: 24,
    ),
    extensions: [
      const ConfirmingDialogColorsExtension(
        card: cardColorDark,
        title: Colors.white,
        subtitle: zinc400,
        surface: borderColorDark,
        border: borderColorDark,
      ),
      CustomColors(
        aiIconColor: primaryColor,
        success: const Color(0xFF10B981), // Emerald 500
        info: const Color(0xFF3B82F6), // Blue 500
        warning: const Color(0xFFFBBF24), // Amber 400
        warningContainer: const Color(
          0xFFF59E0B,
        ).withValues(alpha: 0.2), // Amber 500 with opacity
        onWarningContainer: const Color(0xFFF59E0B), // Amber 500
      ),
      const ExamTimerTheme(
        dialogBackgroundColor: Color(0xFF27272A), // Zinc 800
        dialogTextColor: Colors.white,
        dialogSubTextColor: Color(0xFFA1A1AA), // Zinc 400
        dialogBorderColor: Color(0xFF3F3F46), // Zinc 700
        dialogButtonColor: primaryColor,
        dialogButtonTextColor: Colors.white,
        dialogShadowColor: Color(
          0x40000000,
        ), // Colors.black.withValues(alpha: 0.25)
        timerLowColor: errorColor,
        timerBackgroundColor: Color(
          0x338B5CF6,
        ), // primaryColor.withValues(alpha: 0.2)
        timerLowBackgroundColor: Color(
          0x33EF4444,
        ), // errorColor.withValues(alpha: 0.2)
        dialogCanvasColor: Colors.transparent,
      ),
      const HomeTheme(
        dropZoneShadowColor: Color(
          0x1A8B5CF6,
        ), // primaryColor.withValues(alpha: 0.1)
      ),
      const FileLoadedTheme(
        deleteDialogBackgroundColor: Color(0xFF27272A), // Zinc 800
        deleteDialogTextColor: Colors.white,
        deleteDialogSubTextColor: Colors.white70,
        appBarIconBackgroundColor: Color(
          0x33FFFFFF,
        ), // Colors.white.withValues(alpha: 0.2)
        selectionInactiveBackgroundColor: Color(
          0x33FFFFFF,
        ), // Colors.white.withValues(alpha: 0.2)
        dragOverlayColor: Color(
          0x1A8B5CF6,
        ), // primaryColor.withValues(alpha: 0.1)
        dragOverlayBorderColor: primaryColor,
        dragOverlayShadowColor: Color(
          0x338B5CF6,
        ), // primaryColor.withValues(alpha: 0.2)
      ),
      const QuestionDialogTheme(
        backgroundColor: cardColorDark,
        textColor: Colors.white,
        borderColor: borderColorDark,
        closeButtonColor: borderColorDark,
        closeIconColor: Color(0xFFA1A1AA), // hintColor
        shadowColor: Color(0x40000000), // black with opacity
      ),
      AiAssistantTheme(
        selectorHeaderBg: zinc700,
        selectorContentBg: const Color(0xFF1E1E22),
        selectorBorderColor: zinc700,
        selectorLabelColor: zinc400,
        selectorTextColor: Colors.white,
        sidebarBg: zinc800,
        sidebarHeaderBtnBg: zinc700,
        sidebarBorderColor: zinc700,
        chatTitleColor: Colors.white,
        inputFillColor: zinc800,
        inputHintColor: zinc400,
        userBubbleBg: const Color(
          0xFF4C1D95,
        ).withValues(alpha: 0.3), // violet900
        userBubbleTextColor: Colors.white,
        aiBubbleBg: zinc700.withValues(alpha: 0.3),
        aiBubbleLabelColor: primaryColor,
        aiAssistantLabelColor: primaryColor,
        errorBubbleBg: const Color(0xFF450A0A), // Red 950
        errorBubbleBorderColor: const Color(0xFF7F1D1D), // Red 900
      ),
    ],
  );
}
