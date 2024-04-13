import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ImagePickerButtonClickedEvent>(imagePickerButtonClickedEvent);
    on<AddDetailsButtonClickedEvent>(addDetailsButtonClickedEvent);
    on<ViewProfileCardClickedEvent>(viewProfileCardClickedEvent);
  }

//adding image to the curresponding profile
  FutureOr<void> imagePickerButtonClickedEvent(ImagePickerButtonClickedEvent event, Emitter<HomeState> emit)async {
    String ? imageUrl;
   ImagePicker picker=ImagePicker();
   String useruid=event.uid;
   XFile ? pickedImage=await picker.pickImage(source: ImageSource.gallery);
  try{
    emit(ImageAddingLoadingState());
    if(pickedImage!=null){
      String fileName='images/${DateTime.now().millisecondsSinceEpoch}.png';
      Reference reference=FirebaseStorage.instance.ref().child(fileName);
      await reference.putFile(File(pickedImage.path))
      .whenComplete(() => emit(ImageAddedCompletedState()));
      imageUrl=await reference.getDownloadURL();
      await FirebaseFirestore.instance
      .collection('studentdata')
      .where('uid',isEqualTo: useruid)
      .get()
      .then((QuerySnapshot){
        QuerySnapshot.docs.forEach((doc) {
          doc.reference.update({'userProfile':imageUrl});
         });
      });
    }
    emit(ImageAddedCompletedState());
    print('user id of current user $useruid');
    print('image  added sucecess');
  }catch(e){
   emit(ImageAddingErrorState(message: e.toString()));
  }
  }

  //state emitted to navigate to add details page 
  FutureOr<void> addDetailsButtonClickedEvent(AddDetailsButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(NavigateToAddDetailsPageState());
  }

  //state emitted for naviagting to details page
  FutureOr<void> viewProfileCardClickedEvent(ViewProfileCardClickedEvent event, Emitter<HomeState> emit) {
    emit(NavigateToViewProfilePageState());
  }
}
