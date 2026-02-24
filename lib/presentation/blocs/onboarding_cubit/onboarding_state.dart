class OnboardingState {
  final int currentPage;
  final int totalPages;

  const OnboardingState({this.currentPage = 0, this.totalPages = 4});

  bool get isFirstPage => currentPage == 0;
  bool get isLastPage => currentPage == totalPages - 1;

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages,
    );
  }
}
