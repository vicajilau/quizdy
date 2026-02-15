import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/l10n/extensions/app_localizations_extension.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quiz_app/presentation/blocs/locale_cubit/locale_cubit.dart';
import 'package:quiz_app/presentation/blocs/locale_cubit/locale_state.dart';

class AdvancedSettingsSection extends StatelessWidget {
  const AdvancedSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              LucideIcons.binary,
              size: 20,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context)!.advancedSettingsTitle,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colors.title,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.appLanguageLabel,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: colors.title,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppLocalizations.of(context)!.appLanguageDescription,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: colors.subtitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  BlocBuilder<LocaleCubit, LocaleState>(
                    buildWhen: (previous, current) =>
                        previous.locale != current.locale,
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: colors.card,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: colors.border),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Locale>(
                            value:
                                state.locale ?? Localizations.localeOf(context),
                            icon: Icon(
                              LucideIcons.chevronDown,
                              size: 16,
                              color: colors.subtitle,
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: colors.title,
                            ),
                            dropdownColor: colors.card,
                            borderRadius: BorderRadius.circular(8),
                            items: AppLocalizations.supportedLocales.map((
                              locale,
                            ) {
                              return DropdownMenuItem(
                                value: locale,
                                child: Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.getLanguageName(locale.languageCode),
                                ),
                              );
                            }).toList(),
                            onChanged: (Locale? newLocale) {
                              if (newLocale != null) {
                                context.read<LocaleCubit>().changeLocale(
                                  newLocale,
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
