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

import 'package:flutter/material.dart';

class AiAssistantTheme extends ThemeExtension<AiAssistantTheme> {
  // Selector colors
  final Color selectorHeaderBg;
  final Color selectorContentBg;
  final Color selectorBorderColor;
  final Color selectorLabelColor;
  final Color selectorTextColor;

  // Sidebar colors
  final Color sidebarBg;
  final Color sidebarHeaderBtnBg;
  final Color sidebarBorderColor;
  final Color chatTitleColor;
  final Color inputFillColor;
  final Color inputHintColor;

  // Chat Bubble colors
  final Color userBubbleBg;
  final Color userBubbleTextColor;
  final Color aiBubbleBg;
  final Color aiBubbleLabelColor;
  final Color aiAssistantLabelColor;
  final Color errorBubbleBg;
  final Color errorBubbleBorderColor;

  const AiAssistantTheme({
    required this.selectorHeaderBg,
    required this.selectorContentBg,
    required this.selectorBorderColor,
    required this.selectorLabelColor,
    required this.selectorTextColor,
    required this.sidebarBg,
    required this.sidebarHeaderBtnBg,
    required this.sidebarBorderColor,
    required this.chatTitleColor,
    required this.inputFillColor,
    required this.inputHintColor,
    required this.userBubbleBg,
    required this.userBubbleTextColor,
    required this.aiBubbleBg,
    required this.aiBubbleLabelColor,
    required this.aiAssistantLabelColor,
    required this.errorBubbleBg,
    required this.errorBubbleBorderColor,
  });

  @override
  AiAssistantTheme copyWith({
    Color? selectorHeaderBg,
    Color? selectorContentBg,
    Color? selectorBorderColor,
    Color? selectorLabelColor,
    Color? selectorTextColor,
    Color? sidebarBg,
    Color? sidebarHeaderBtnBg,
    Color? sidebarBorderColor,
    Color? chatTitleColor,
    Color? inputFillColor,
    Color? inputHintColor,
    Color? userBubbleBg,
    Color? userBubbleTextColor,
    Color? aiBubbleBg,
    Color? aiBubbleLabelColor,
    Color? aiAssistantLabelColor,
    Color? errorBubbleBg,
    Color? errorBubbleBorderColor,
  }) {
    return AiAssistantTheme(
      selectorHeaderBg: selectorHeaderBg ?? this.selectorHeaderBg,
      selectorContentBg: selectorContentBg ?? this.selectorContentBg,
      selectorBorderColor: selectorBorderColor ?? this.selectorBorderColor,
      selectorLabelColor: selectorLabelColor ?? this.selectorLabelColor,
      selectorTextColor: selectorTextColor ?? this.selectorTextColor,
      sidebarBg: sidebarBg ?? this.sidebarBg,
      sidebarHeaderBtnBg: sidebarHeaderBtnBg ?? this.sidebarHeaderBtnBg,
      sidebarBorderColor: sidebarBorderColor ?? this.sidebarBorderColor,
      chatTitleColor: chatTitleColor ?? this.chatTitleColor,
      inputFillColor: inputFillColor ?? this.inputFillColor,
      inputHintColor: inputHintColor ?? this.inputHintColor,
      userBubbleBg: userBubbleBg ?? this.userBubbleBg,
      userBubbleTextColor: userBubbleTextColor ?? this.userBubbleTextColor,
      aiBubbleBg: aiBubbleBg ?? this.aiBubbleBg,
      aiBubbleLabelColor: aiBubbleLabelColor ?? this.aiBubbleLabelColor,
      aiAssistantLabelColor:
          aiAssistantLabelColor ?? this.aiAssistantLabelColor,
      errorBubbleBg: errorBubbleBg ?? this.errorBubbleBg,
      errorBubbleBorderColor:
          errorBubbleBorderColor ?? this.errorBubbleBorderColor,
    );
  }

  @override
  AiAssistantTheme lerp(ThemeExtension<AiAssistantTheme>? other, double t) {
    if (other is! AiAssistantTheme) {
      return this;
    }
    return AiAssistantTheme(
      selectorHeaderBg: Color.lerp(
        selectorHeaderBg,
        other.selectorHeaderBg,
        t,
      )!,
      selectorContentBg: Color.lerp(
        selectorContentBg,
        other.selectorContentBg,
        t,
      )!,
      selectorBorderColor: Color.lerp(
        selectorBorderColor,
        other.selectorBorderColor,
        t,
      )!,
      selectorLabelColor: Color.lerp(
        selectorLabelColor,
        other.selectorLabelColor,
        t,
      )!,
      selectorTextColor: Color.lerp(
        selectorTextColor,
        other.selectorTextColor,
        t,
      )!,
      sidebarBg: Color.lerp(sidebarBg, other.sidebarBg, t)!,
      sidebarHeaderBtnBg: Color.lerp(
        sidebarHeaderBtnBg,
        other.sidebarHeaderBtnBg,
        t,
      )!,
      sidebarBorderColor: Color.lerp(
        sidebarBorderColor,
        other.sidebarBorderColor,
        t,
      )!,
      chatTitleColor: Color.lerp(chatTitleColor, other.chatTitleColor, t)!,
      inputFillColor: Color.lerp(inputFillColor, other.inputFillColor, t)!,
      inputHintColor: Color.lerp(inputHintColor, other.inputHintColor, t)!,
      userBubbleBg: Color.lerp(userBubbleBg, other.userBubbleBg, t)!,
      userBubbleTextColor: Color.lerp(
        userBubbleTextColor,
        other.userBubbleTextColor,
        t,
      )!,
      aiBubbleBg: Color.lerp(aiBubbleBg, other.aiBubbleBg, t)!,
      aiBubbleLabelColor: Color.lerp(
        aiBubbleLabelColor,
        other.aiBubbleLabelColor,
        t,
      )!,
      aiAssistantLabelColor: Color.lerp(
        aiAssistantLabelColor,
        other.aiAssistantLabelColor,
        t,
      )!,
      errorBubbleBg: Color.lerp(errorBubbleBg, other.errorBubbleBg, t)!,
      errorBubbleBorderColor: Color.lerp(
        errorBubbleBorderColor,
        other.errorBubbleBorderColor,
        t,
      )!,
    );
  }
}
