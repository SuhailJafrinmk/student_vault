part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}
class DetailsSubmitButtonClickedEvent extends DetailsEvent{
  final StudentDetails studentDetails;
  final String currentUserUid;

  DetailsSubmitButtonClickedEvent({required this.studentDetails,required this.currentUserUid});
} 