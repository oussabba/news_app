abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavBar extends NewsStates {}

class BusinessLoadingState extends NewsStates {}

class GetBusinessSuccessState extends NewsStates {}

class GetBusinessErrorState extends NewsStates {
  final String error;

  GetBusinessErrorState(this.error);
}

class SportsLoadingState extends NewsStates {}

class GetSportsSuccessState extends NewsStates {}

class GetSportsErrorState extends NewsStates {
  final String error;

  GetSportsErrorState(this.error);
}

class ScienceLoadingState extends NewsStates {}

class GetScienceSuccessState extends NewsStates {}

class GetScienceErrorState extends NewsStates {
  final String error;

  GetScienceErrorState(this.error);
}

class SearchLoadingState extends NewsStates {}

class GetSearchSuccessState extends NewsStates {}

class GetSearchErrorState extends NewsStates {
  final String error;

  GetSearchErrorState(this.error);
}

class ChangeModeState extends NewsStates {}
