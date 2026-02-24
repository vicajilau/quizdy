import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizlab_ai/data/services/configuration_service.dart';
import 'package:quizlab_ai/presentation/blocs/onboarding_cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void setPage(int page) {
    emit(state.copyWith(currentPage: page));
  }

  void nextPage() {
    if (!state.isLastPage) {
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  void previousPage() {
    if (!state.isFirstPage) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  Future<void> completeOnboarding() async {
    await ConfigurationService.instance.setOnboardingCompleted(true);
  }
}
