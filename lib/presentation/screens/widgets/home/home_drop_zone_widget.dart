import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/core/theme/extensions/home_theme.dart';

class HomeDropZoneWidget extends StatelessWidget {
  final bool isDragging;
  final VoidCallback onTap;

  const HomeDropZoneWidget({
    super.key,
    required this.isDragging,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(32),
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 480,
                  maxHeight: 320,
                ),
                width: double.infinity,
                height: 320,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: isDragging
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).dividerColor,
                    width: 3,
                  ),
                  boxShadow: isDragging
                      ? [
                          BoxShadow(
                            color: context.homeTheme.dropZoneShadowColor,
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/QUIZ.png',
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Icon(
                          LucideIcons.upload,
                          size: 32,
                          color: Theme.of(context).hintColor,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          AppLocalizations.of(context)!.dropFileHere,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
