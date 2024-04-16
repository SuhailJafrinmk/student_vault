import 'dart:ui';
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterPageNavigateState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignUpPageWrapper()));
          } else if (state is LoggedInErrorState) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is LogginLoadedState) {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child:  CircularProgressIndicator(
                        color: secondary,
                      ),
                    ));
          } else if (state is LoggedInSuccessState) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged in successfully')));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePageWrapper()));
          }
        },
        child: Scaffold(
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
                            duration: const Duration(seconds: 2),
                            swingRange: 10),
                      )),
                  Positioned(
                      bottom: 0,
                      child: Transform.rotate(
                        angle: 0.5,
                        child: PendulumAnimation(
                            width: width * .7,
                            height: height * .4,
                            color: secondary,
                            duration: const Duration(seconds: 2),
                            swingRange: 10),
                      )),
                  Positioned(
                      top: height * .35,
                      left: 10,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
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
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  setText(
                                      text: 'Welcome Back!!!',
                                      size: 40,
                                      color: Colors.white),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextfieldCustom(
                                    prefixIcon: const Icon(Icons.email,color: Colors.white,),
                                      labelText: 'Email',
                                      controller: emailController,
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
                                      prefixIcon: const Icon(Icons.lock,color: Colors.white,),
                                      labelText: 'Password',
                                      controller: passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please provide a password';
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomButton(
                                    onTap: () async {
                                      if (formkey.currentState!.validate()) {
                                        BlocProvider.of<AuthBloc>(context).add(
                                            LoginButtonClickedEvent(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text));
                                        emailController.clear();
                                        passwordController.clear();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Invalid credentials')));
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
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      setText(
                                          text: 'Don\'t have an account?',
                                          color: Colors.white),
                                      TextButton(
                                          onPressed: () {
                                            BlocProvider.of<AuthBloc>(context).add(
                                                LoginPageSignupButtonClickedEvent());
                                          },
                                          child: setText(
                                              text: 'SignUp',
                                              color: secondary)),
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
        ));
  }
}
