abstract class NewsStates {}
class NewsInitialState extends NewsStates{}
class ChangeNavBarState extends NewsStates {}
class ChangeModeState extends NewsStates {}
class GetBusinessSuccessState extends NewsStates {}
class GetBusinessErrorState extends NewsStates {
  final String error;
  GetBusinessErrorState(this.error);
}
class GetScienceSuccessState extends NewsStates {}
class GetScienceErrorState extends NewsStates {
  final String error;
  GetScienceErrorState(this.error);
}
class GetSportsSuccessState extends NewsStates {}
class GetSportsErrorState extends NewsStates {
  final String error;
  GetSportsErrorState(this.error);
}
class NewsGetSearchLoadingState extends NewsStates {}
class NewsGetSearchSuccessState extends NewsStates {}
class NewsGetSearchErrorState extends NewsStates {
  final String error;
  NewsGetSearchErrorState(this.error);
}

