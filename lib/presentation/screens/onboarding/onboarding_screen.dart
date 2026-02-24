import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizlab_ai/presentation/blocs/onboarding_cubit/onboarding_cubit.dart';
import 'package:quizlab_ai/presentation/blocs/onboarding_cubit/onboarding_state.dart';
import 'package:quizlab_ai/presentation/screens/onboarding/widgets/onboarding_desktop_layout.dart';
import 'package:quizlab_ai/presentation/screens/onboarding/widgets/onboarding_mobile_layout.dart';
import 'package:quizlab_ai/presentation/screens/onboarding/widgets/onboarding_widgets.dart';
import 'package:quizlab_ai/routes/app_router.dart';

class OnboardingScreen extends StatefulWidget {
  final bool fromSettings;

  const OnboardingScreen({super.key, this.fromSettings = false});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 350),
      curve: Curves.linear,
    );
  }

  Future<void> _finish(BuildContext context) async {
    await context.read<OnboardingCubit>().completeOnboarding();
    if (context.mounted) {
      if (widget.fromSettings) {
        context.pop();
        return;
      }
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          _animateToPage(state.currentPage);
        },
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          final pages = buildOnboardingPages(context);

          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 720;
                  if (isWide) {
                    return OnboardingDesktopLayout(
                      state: state,
                      pages: pages,
                      pageController: _pageController,
                      cubit: cubit,
                      onFinish: () => _finish(context),
                    );
                  }
                  return OnboardingMobileLayout(
                    state: state,
                    pages: pages,
                    pageController: _pageController,
                    cubit: cubit,
                    onFinish: () => _finish(context),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
