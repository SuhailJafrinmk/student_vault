import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_vault/controller/profile_edit/bloc/profile_edit_bloc.dart';
import 'package:student_vault/view/constants/constants.dart';
import 'package:student_vault/view/widgets/textform_widget.dart';
class EditPageWrapper extends StatelessWidget {
  const EditPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileEditBloc(),
      child: ProfileEditPage(),
    );
  }
}





class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final String currentUser=FirebaseAuth.instance.currentUser!.uid;
  TextEditingController userNameController=TextEditingController();
  TextEditingController userAgeController=TextEditingController();
  TextEditingController phonenoController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProfileEditBloc>(context).add(LoadCurrentDataEvent(currentUser: currentUser));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        title: setText(size: 25,text: 'Edit profile',color: quaternary),
      ),
      body: BlocConsumer<ProfileEditBloc, ProfileEditState>(
        listener: (context, state) {
          if(state is ProfileDataErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          print('current state:$state');
          if(state is ProfileDataLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is ProfileDataLoadedState){

            userNameController.text=state.data['username'];
            userAgeController.text=state.data['age'];
            phonenoController.text=state.data['phone'];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  setText(text: 'Edit your profile!!!',size: 35),
                  SizedBox(height: 20,),
                  TextfieldCustom(
                    labelText: 'Username',
                    controller: userNameController,
                    validator: (value){
              
              
                  }),
                  SizedBox(height: 10,),
                  TextfieldCustom(
                    labelText: 'Age',
                    controller: userAgeController,
                    validator: (value){
              
                  }),
                  SizedBox(height: 10,),
                  TextfieldCustom(
                    labelText: 'Mobile',
                    controller: phonenoController,
                    validator: (value){
                    
                  })
                ],
              ),
            );

          }
          return SizedBox();
        },
      ),
    );
  }
}