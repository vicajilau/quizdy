import 'package:flutter/material.dart';
import 'package:quiz_app/data/services/configuration_service.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/extensions/ai_assistant_theme.dart';
import 'package:quiz_app/data/services/ai/ai_service.dart';
import 'package:quiz_app/data/services/ai/ai_service_selector.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AiServiceModelSelector extends StatefulWidget {
  final String? initialService;
  final String? initialModel;
  final ValueChanged<AIService?>? onServiceChanged;
  final ValueChanged<String?>? onModelChanged;
  final ValueChanged<bool>? onLoadingChanged;
  final bool enabled;
  final bool saveToPreferences;

  final String? geminiApiKey;
  final String? openaiApiKey;

  const AiServiceModelSelector({
    super.key,
    this.initialService,
    this.initialModel,
    this.onServiceChanged,
    this.onModelChanged,
    this.onLoadingChanged,
    this.enabled = true,
    this.saveToPreferences = false,
    this.geminiApiKey,
    this.openaiApiKey,
  });

  @override
  State<AiServiceModelSelector> createState() => _AiServiceModelSelectorState();
}

class _AiServiceModelSelectorState extends State<AiServiceModelSelector> {
  static const String _defaultModelFallback = 'gemini-flash-latest';

  List<AIService> _availableServices = [];
  AIService? _selectedService;
  String? _selectedModel;
  bool _isExpanded = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAvailableServices();
  }

  @override
  void didUpdateWidget(AiServiceModelSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reload services when API keys change or initial values change
    if (oldWidget.geminiApiKey != widget.geminiApiKey ||
        oldWidget.openaiApiKey != widget.openaiApiKey ||
        oldWidget.initialService != widget.initialService ||
        oldWidget.initialModel != widget.initialModel) {
      _loadAvailableServices();
    }
  }

  Future<void> _loadAvailableServices() async {
    try {
      // Load saved preferences
      final savedServiceName = await ConfigurationService.instance
          .getDefaultAIService();
      final savedModel = await ConfigurationService.instance
          .getDefaultAIModel();

      // Get available services
      final services = await AIServiceSelector.instance.getAvailableServices();

      if (mounted) {
        AIService? newService;
        String? newModel;

        // Try to find saved service, or use first available
        if (widget.initialService != null &&
            services.any((s) => s.serviceName == widget.initialService)) {
          newService = services.firstWhere(
            (s) => s.serviceName == widget.initialService,
          );
        } else if (savedServiceName != null &&
            services.any((s) => s.serviceName == savedServiceName)) {
          newService = services.firstWhere(
            (s) => s.serviceName == savedServiceName,
          );
        } else if (services.isNotEmpty) {
          newService = services.first;
        }

        // Set model: use saved, or initialModel from widget, or find default
        if (savedModel != null &&
            newService != null &&
            newService.availableModels.contains(savedModel)) {
          newModel = savedModel;
        } else if (widget.initialModel != null &&
            newService != null &&
            newService.availableModels.contains(widget.initialModel)) {
          newModel = widget.initialModel;
        } else if (newService != null) {
          // Try to use _defaultModelFallback if available
          if (newService.availableModels.contains(_defaultModelFallback)) {
            newModel = _defaultModelFallback;
          } else {
            newModel = newService.defaultModel;
          }
        }

        setState(() {
          _availableServices = services;
          _selectedService = newService;
          _selectedModel = newModel;
          _isLoading = false;
        });

        // Notify parent of initial values
        widget.onServiceChanged?.call(newService);
        widget.onModelChanged?.call(newModel);
        widget.onLoadingChanged?.call(false);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        widget.onLoadingChanged?.call(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final aiTheme = Theme.of(context).extension<AiAssistantTheme>()!;
    final headerBg = aiTheme.selectorHeaderBg;
    final contentBg = aiTheme.selectorContentBg;
    final borderColor = aiTheme.selectorBorderColor;
    final labelColor = aiTheme.selectorLabelColor;
    final textColor = aiTheme.selectorTextColor;
    final chevronColor = aiTheme.selectorLabelColor;

    Widget buildSelector({
      required String label,
      required String? value,
      required List<DropdownMenuItem<String>> items,
      required ValueChanged<String?>? onChanged,
      bool isLoading = false,
      String? loadingText,
      String? emptyText,
      bool isEnabled = true,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: labelColor,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: headerBg,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.centerLeft,
            child: isLoading
                ? Text(
                    loadingText ?? 'Loading...',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  )
                : (items.isEmpty && emptyText != null)
                ? Text(
                    emptyText,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  )
                : DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: value,
                      isExpanded: true,
                      icon: Icon(
                        LucideIcons.chevronDown,
                        color: chevronColor,
                        size: 16,
                      ),
                      dropdownColor: headerBg,
                      selectedItemBuilder: (context) {
                        return items.map((item) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.value ?? '',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList();
                      },
                      items: items.map((item) {
                        return DropdownMenuItem<String>(
                          value: item.value,
                          child: Text(
                            item.value ?? '',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: isEnabled ? onChanged : null,
                    ),
                  ),
          ),
        ],
      );
    }

    Widget buildHeader(bool expanded) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: headerBg,
          borderRadius: BorderRadius.vertical(
            top: const Radius.circular(12),
            bottom: Radius.circular(expanded ? 0 : 12),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              LucideIcons.sparkles,
              size: 16,
              color: Color(0xFF8B5CF6), // Violet 500
            ),
            const SizedBox(width: 8),
            Text(
              localizations.aiDefaultModelTitle,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            const Spacer(),
            Icon(
              expanded ? LucideIcons.chevronUp : LucideIcons.chevronDown,
              size: 16,
              color: chevronColor,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          borderRadius: BorderRadius.circular(12),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.easeInOut,
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.easeInOut,
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: buildHeader(false),
            secondChild: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildHeader(true),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 14,
                    left: 14,
                    right: 14,
                  ),
                  decoration: BoxDecoration(
                    color: contentBg,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                    border: Border(
                      left: BorderSide(color: borderColor),
                      right: BorderSide(color: borderColor),
                      bottom: BorderSide(color: borderColor),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AI Service Selector
                      buildSelector(
                        label: '${localizations.aiServiceLabel}:',
                        value: _selectedService?.serviceName,
                        items: _availableServices
                            .map(
                              (s) => DropdownMenuItem(
                                value: s.serviceName,
                                child: Text(s.serviceName),
                              ),
                            )
                            .toList(),
                        onChanged: widget.enabled
                            ? (val) async {
                                final service = _availableServices.firstWhere(
                                  (s) => s.serviceName == val,
                                );

                                if (service.serviceName !=
                                    _selectedService?.serviceName) {
                                  final newModel = service.defaultModel;
                                  setState(() {
                                    _selectedService = service;
                                    _selectedModel = newModel;
                                  });
                                  widget.onServiceChanged?.call(service);
                                  widget.onModelChanged?.call(newModel);
                                  if (widget.saveToPreferences) {
                                    await ConfigurationService.instance
                                        .saveDefaultAIService(
                                          service.serviceName,
                                        );
                                    await ConfigurationService.instance
                                        .saveDefaultAIModel(newModel);
                                  }
                                }
                              }
                            : null,
                        isLoading: _isLoading,
                        loadingText: localizations.aiServicesLoading,
                        emptyText: localizations.aiServicesNotConfigured,
                        isEnabled: widget.enabled,
                      ),

                      if (_selectedService != null &&
                          _availableServices.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        // Model Selector
                        buildSelector(
                          label: localizations.aiModelLabel,
                          value: _selectedModel,
                          items: _selectedService!.availableModels
                              .map(
                                (m) =>
                                    DropdownMenuItem(value: m, child: Text(m)),
                              )
                              .toList(),
                          onChanged: widget.enabled
                              ? (val) async {
                                  if (val != null) {
                                    setState(() {
                                      _selectedModel = val;
                                    });
                                    widget.onModelChanged?.call(val);
                                    if (widget.saveToPreferences) {
                                      await ConfigurationService.instance
                                          .saveDefaultAIModel(val);
                                    }
                                  }
                                }
                              : null,
                          isEnabled: widget.enabled,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
