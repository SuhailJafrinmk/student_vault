import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_vault/controller/auth/bloc/auth_bloc.dart';
import 'package:student_vault/view/constants/constants.dart';
import 'package:student_vault/view/screens/home_page.dart';
import 'package:student_vault/view/screens/signup_page.dart';
import 'package:student_vault/view/widgets/custom_button.dart';
import 'package:student_vault/view/widgets/pendulum_animation.dart';
import 'package:student_vault/view/widgets/textform_widget.dart';

class LoginPageWrapper extends StatelessWidget {
  const LoginPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is LogginLoadedState){
          Center(child: CircularProgressIndicator(value: 100,backgroundColor: Colors.white,));
        }
        else if (state is LoginPageNavigatedState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePageWrapper()),
              (route) => false);
        } else if (state is LoggedInErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is RegisterPageNavigatedState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const SignUpPageWrapper()));
        }
      },
      builder: (context, state) {
        final double height = MediaQuery.of(context).size.height;
        final double width = MediaQuery.of(context).size.width;

        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: height,
              width: width,
              child: Stack(
                children: [
                  Positioned(
                      right: 0,
                      top: 0,
                      child: Transform.rotate(
                        angle: 0.5,
                        child: PendulumAnimation(
                            width: width * .7,
                            height: height * .4,
                            color: primary,
                            duration: const Duration(seconds: 1),
                            swingRange: 20),
                      )),
                  Positioned(
                      bottom: 0,
                      child: Transform.rotate(
                        angle: 0.5,
                        child: PendulumAnimation(
                            width: width * .7,
                            height: height * .4,
                            color: secondary,
                            duration: Duration(seconds: 1),
                            swingRange: 20),
                      )),
                  
                  Positioned(
                      top: height * .35,
                      left: 10,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            height: height * .55,
                            width: width * .95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primary,
                            ),
                            child: Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  SizedBox(height: 15,),
                                  setText(
                                      text: 'Welcome Back!!!', size: 40, color: Colors.white),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextfieldCustom(
                                    labelText: 'Email',
                                      controller: emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'please provide an email';
                                        }
                                        return null;
                                      }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextfieldCustom(
                                    labelText: 'Password',
                                      controller: passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please provide a password';
                                        }
                                        return null;
                                      }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomButton(
                                    onTap: () async {
                                      if (formkey.currentState!.validate()) {
                                         
                                        BlocProvider.of<AuthBloc>(context).add(
                                            LoginButtonClickedEvent(
                                                email: emailController.text,
                                                password: passwordController.text));
                                      }
                                    },
                                    height: 60,
                                    width: width * .9,
                                    elevation: 20,
                                    color: secondary,
                                    radius: 20,
                                    child: setText(
                                        text: 'Login',
                                        color: primary,
                                        size: 25,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      setText(
                                          text: 'Don\'t have an account?',
                                          color: Colors.white),
                                      TextButton(
                                          onPressed: () {
                                      BlocProvider.of<AuthBloc>(context).add(RegisterPageNavigateEvent());
                                          },
                                          child: setText(
                                              text: 'SignUp', color: secondary)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
