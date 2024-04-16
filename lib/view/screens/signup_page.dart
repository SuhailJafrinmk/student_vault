import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_vault/controller/auth/bloc/auth_bloc.dart';
import 'package:student_vault/view/constants/constants.dart';
import 'package:student_vault/view/screens/login_screen.dart';
import 'package:student_vault/view/widgets/custom_button.dart';
import 'package:student_vault/view/widgets/textform_widget.dart';

class SignUpPageWrapper extends StatelessWidget {
  const SignUpPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userAgeController = TextEditingController();
  final userPhoneController = TextEditingController();
  final userPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  return BlocListener<AuthBloc, AuthState>(
    listener: (context, state) {
      if(state is LogginLoadedState){
        showDialog(context: context, builder: (context)=>const Center(child: CircularProgressIndicator(color: secondary,),));
      }
      else if(state is RegisterSuccessState){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User registered successfully')));
        Navigator.push(context, MaterialPageRoute(builder:(context)=>const LoginPageWrapper()));
      }

    },
    child: Scaffold(
          backgroundColor: primary,
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              
            },
            child: SizedBox(
              height: setScreenHeight(context, 1),
              width: setScreenWidth(context, 1),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    setText(
                        text: 'Sign up',
                        size: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                    setText(
                        text: 'Create your account',
                        size: 30,
                        color: Colors.white),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextfieldCustom(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                labelText: 'Username',
                                controller: userNameController,
                                validator: (value) {
                                   final RegExp lengthRegExp = RegExp(r'^.{3,16}$');
                                  final RegExp contentRegExp = RegExp(r'^[a-zA-Z0-9_]+$');
                                  if (value == null || value.isEmpty) {
                                    return 'Name is required';
                                  }
                                  if(!lengthRegExp.hasMatch(value)){
                                    return 'Invalid username. Username must be between 3 and 16 characters long';
                                  }
                                  if (!contentRegExp.hasMatch(value)) {
                                     return 'Username can only contain letters, digits, and underscores';
                                     }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            TextfieldCustom(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                labelText: 'Email',
                                controller: userEmailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required.';
                                  }
                                  final emailRegExp = RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                  if (!emailRegExp.hasMatch(value)) {
                                    return 'Invalid email address.';
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            TextfieldCustom(
                                controller: userPhoneController,
                                keyboard: TextInputType.number,
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                labelText: 'Phone number',
                                validator: (value) {
                                  final phoneRegExp = RegExp(r'^[6-9]\d{9}$');
                                  if (!phoneRegExp.hasMatch(value!)) {
                                    return 'Invalid phone number format (10 digits required).';
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            TextfieldCustom(
                                controller: userAgeController,
                                keyboard: TextInputType.number,
                                prefixIcon: const Icon(
                                  Icons.cake,
                                  color: Colors.white,
                                ),
                                labelText: 'Age',
                                validator: (value) {
                                  final ageRegex =
                                      RegExp(r'^(1[0-4]\d|150|[1-9][0-9]|10)$');
                                  if (value == null || value.isEmpty) {
                                    return 'Age is required';
                                  }
                                  if (!ageRegex.hasMatch(value)) {
                                    return 'Invalid age';
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            TextfieldCustom(
                              controller: userPasswordController,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              labelText: 'Password',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                if (!value.contains(RegExp(r'[A-Z]'))) {
                                  return 'Password must contain at least one uppercase letter';
                                }
                                if (!value.contains(RegExp(r'[0-9]'))) {
                                  return 'Password must contain at least one number';
                                }
                                if (!value.contains(
                                    RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                  return 'Password must contain at least one special character';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              height: 60,
                              width: setScreenWidth(context, .87),
                              elevation: 20,
                              color: secondary,
                              radius: 20,
                              child: setText(
                                  text: 'Sign up',
                                  color: primary,
                                  size: 20,
                                  fontWeight: FontWeight.w900),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(RegisterButtonClickedEvent(
                                    userName: userNameController.text.trim(),
                                    email: userEmailController.text.trim(),
                                    age: userAgeController.text.trim(),
                                    phone: userPhoneController.text.trim(),
                                    password:
                                        userPasswordController.text.trim(),
                                  ));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
  );
  }
}
