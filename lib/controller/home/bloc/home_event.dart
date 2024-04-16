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

class LogOutProfileCardClickedEvent extends HomeEvent{}

class CourseDetailsCardClickedEvent extends HomeEvent{}

class TimeTableCardClickedEvent extends HomeEvent{}

class ProfileEditCardClickedEvent extends HomeEvent{}

class LocationCardClickedEvent extends HomeEvent{}