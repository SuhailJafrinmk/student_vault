import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc() : super(ProfileEditInitial()) {
   on<LoadCurrentDataEvent>(loadCurrentDataEvent);
  }

FutureOr<void> loadCurrentDataEvent(LoadCurrentDataEvent event, Emitter<ProfileEditState> emit) async {
  try {
    emit(ProfileDataLoadingState());
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference docRef = firestore.collection('studentdata').doc(event.currentUser);
    final data = await docRef.get();
    if (data.exists) {
      emit(ProfileDataLoadedState(data: data.data() as Map<String, dynamic>));
    } else {
      emit(ProfileDataErrorState(message: 'User data not found'));
    }
  } catch (e) {
    emit(ProfileDataErrorState(message: 'Failed to load user data: $e'));
  }
}
}
