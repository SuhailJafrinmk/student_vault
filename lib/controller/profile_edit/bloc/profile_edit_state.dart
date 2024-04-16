part of 'profile_edit_bloc.dart';

@immutable
sealed class ProfileEditState {}

class ProfileEditInitial extends ProfileEditState {}
class ProfileDataLoadingState extends ProfileEditState{}
class ProfileDataErrorState extends ProfileEditState{
  final String message;

  ProfileDataErrorState({required this.message});
}
class ProfileDataLoadedState extends ProfileEditState{
  final Map<String,dynamic>data;
  ProfileDataLoadedState({required this.data});
}
