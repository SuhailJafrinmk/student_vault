import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_vault/controller/userlocation/bloc/user_location_bloc.dart';
import 'package:student_vault/view/constants/constants.dart';

class LocationPageWrapper extends StatelessWidget {
  const LocationPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLocationBloc(),
      child: UserLocation(),
    );
  }
}
class UserLocation extends StatefulWidget {
  const UserLocation({super.key});

  @override
  State<UserLocation> createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserLocationBloc, UserLocationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is UserLocationErrorState){
            return Container();
          }else if(state is UserLocationSuccessState){{
            return Container(
              height: setScreenHeight(context, 1),
              width: setScreenWidth(context, 1),
              child: Column(
                children: [],
              ),
            );

          }}
          return SizedBox();
        },
      )
    );
  }
}