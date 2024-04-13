import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:student_vault/model/student_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  User? user;
  AuthBloc() : super(AuthInitial()) {
    on<LoginPageNavigateEvent>(loginPageNavigateEvent);
    on<LoginPageSignupButtonClickedEvent>(loginPageSignupButtonClickedEvent);
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
    on<RegisterButtonClickedEvent>(registerButtonClickedEvent);
  }

  FutureOr<void> loginPageNavigateEvent(
      LoginPageNavigateEvent event, Emitter<AuthState> emit) {
    emit(LoginPageNavigatedState());
  }
  
  //function to emit state for navigating to sign up page
  FutureOr<void> loginPageSignupButtonClickedEvent(
      LoginPageSignupButtonClickedEvent event, Emitter<AuthState> emit) { 
    emit(RegisterPageNavigateState());
    print('the state of sign up button clicked is emitted');
  }

  FutureOr<void> loginButtonClickedEvent(
      LoginButtonClickedEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LogginLoadedState());
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      user = credential.user;
      print('logged in success');
      emit(LoggedInSuccessState());
    } catch (e) {
      print('un able to login error occured');
      emit(LoggedInErrorState(message: e.toString()));
    }
  }

  FutureOr<void> registerButtonClickedEvent(
      RegisterButtonClickedEvent event, Emitter<AuthState> emit) async {
        print('funtoin stareted');
        
    try {
      emit(LogginLoadedState());
      UserCredential credential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      user = credential.user;
      await firebaseAuth.currentUser!.updateDisplayName(event.email);
      final currentuser = firebaseAuth.currentUser;
      print('errorrrr');
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      StudentModel model = StudentModel(
          uid: currentuser!.uid,
          username: event.userName,
          email: event.email,
          age: event.age,
          phone: event.phone);
      await firestore
          .collection('studentdata')
          .doc(currentuser.uid)
          .set(model.toMap());
           
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('email already in use');
      }
    } catch (e) {
      print(e.toString());
      emit(RegisterErrorState(message: e.toString()));
    }
  }
}
