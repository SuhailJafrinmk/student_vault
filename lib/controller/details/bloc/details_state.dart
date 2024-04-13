part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
class DetailsAddedSuccessState extends DetailsState{
  final String message;

  DetailsAddedSuccessState({required this.message});
}

class DetailsAddedErrorState extends DetailsState{
  final String error;

  DetailsAddedErrorState({required this.error});
}

class DetailsAddingLoadingState extends DetailsState{

}

