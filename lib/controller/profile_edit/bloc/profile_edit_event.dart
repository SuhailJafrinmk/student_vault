part of 'profile_edit_bloc.dart';

@immutable
sealed class ProfileEditEvent {}
class LoadCurrentDataEvent extends ProfileEditEvent{
  final String currentUser;

  LoadCurrentDataEvent({required this.currentUser});
}
