import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:student_vault/model/additional_data_model.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
  on<DetailsSubmitButtonClickedEvent>(detailsSubmitButtonClickedEvent);
  }

  FutureOr<void> detailsSubmitButtonClickedEvent(DetailsSubmitButtonClickedEvent event, Emitter<DetailsState> emit) async{
    print('details adding function evoked');
    final data=event.studentDetails.toJson();
    try{
    await FirebaseFirestore.instance
    .collection('studentdata')
    .doc(event.currentUserUid)
    .update(data)
    .then((value) => emit(DetailsAddedSuccessState(message: 'Data updated successfully')));
    }catch(e){
      emit(DetailsAddedErrorState(error: e.toString()));
    }
    
  }
}
