import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_vault/controller/home/bloc/home_bloc.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}