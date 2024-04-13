part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ImagePickerButtonClickedEvent extends HomeEvent{
  final String uid;

  ImagePickerButtonClickedEvent({required this.uid});
}

class AddDetailsButtonClickedEvent extends HomeEvent{
  final String currentUser;
  AddDetailsButtonClickedEvent({required this.currentUser});
}

class ViewProfileCardClickedEvent extends HomeEvent{}