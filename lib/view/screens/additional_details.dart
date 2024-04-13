import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_vault/controller/details/bloc/details_bloc.dart';
import 'package:student_vault/model/additional_data_model.dart';
import 'package:student_vault/view/constants/constants.dart';
import 'package:student_vault/view/widgets/custom_button.dart';
import 'package:student_vault/view/widgets/textform_widget.dart';

class AddDetailsWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc(),
      child: AddDetailsPage(),
    );
  }
}

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({super.key});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  final currentuseruid=FirebaseAuth.instance.currentUser!.uid;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _fathersNameController = TextEditingController();
  TextEditingController _mothersNameController = TextEditingController();
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _parentContactController = TextEditingController();
  TextEditingController _rollNoController = TextEditingController();
  TextEditingController _admissionNumberController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _schoolNameController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  TextEditingController _divisionController = TextEditingController();
  TextEditingController _alternatePhoneNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add details"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: primary,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _firstNameController,
                      labelText: 'First name',
                      hint: 'Enter your firstname',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _lastNameController,
                      labelText: 'lastname',
                      hint: 'Enter your lastname',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _fathersNameController,
                      labelText: 'Fathers name',
                      hint: 'Enter your fathers name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _mothersNameController,
                      labelText: 'Mothers name',
                      hint: 'Enter your Mothers name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _nationalityController,
                      labelText: 'Nationality',
                      hint: 'Your nationality',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _parentContactController,
                      labelText: 'Contact',
                      hint: 'Parent contact number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _rollNoController,
                      labelText: 'Roll no',
                      hint: 'Enter class roll number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _admissionNumberController,
                      labelText: 'Admission number',
                      hint: 'Enter your Admission number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _birthdayController,
                      labelText: 'Birthday',
                      hint: 'dd/mm/yyyy',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _addressController,
                      labelText: 'Address',
                      hint: 'Current address',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _schoolNameController,
                      labelText: 'School',
                      hint: 'Name of current studying school',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _classController,
                      labelText: 'Class',
                      hint: 'Enter your Class',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _divisionController,
                      labelText: 'Division',
                      hint: 'Enter your division',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextfieldCustom(
                      controller: _alternatePhoneNumberController,
                      labelText: 'Alternate number',
                      hint: 'Alternate number in case of emergncy',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      }),
                ),
                CustomButton(
                  height: 60,
                  width: setScreenWidth(context, .85),
                  elevation: 10,
                  color: secondary,
                  radius: 20,
                  child: setText(
                      text: 'Submit',
                      color: primary,
                      size: 20,
                      fontWeight: FontWeight.bold),
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                    BlocProvider.of<DetailsBloc>(context).add(
                        DetailsSubmitButtonClickedEvent(
                            studentDetails: StudentDetails(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                fathersName: _fathersNameController.text,
                                mothersName: _mothersNameController.text,
                                nationality: _nationalityController.text,
                                parentContact: _parentContactController.text,
                                rollNo: _rollNoController.text,
                                admissionNumber:
                                    _admissionNumberController.text,
                                birthday: _birthdayController.text,
                                address: _addressController.text,
                                schoolName: _schoolNameController.text,
                                studentclass: _classController.text,
                                division: _divisionController.text,
                                alternatePhoneNumber:
                                    _alternatePhoneNumberController.text),
                                    currentUserUid: currentuseruid,
                                    ));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
