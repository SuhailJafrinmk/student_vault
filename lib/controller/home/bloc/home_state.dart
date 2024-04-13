part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ImageAddedCompletedState extends HomeState{}

class ImageAddingErrorState extends HomeState{
 final String message;

  ImageAddingErrorState({required this.message});
}
class ImageAddingLoadingState extends HomeState{}

class NavigateToAddDetailsPageState extends HomeState{}

class NavigateToViewProfilePageState extends HomeState{}

