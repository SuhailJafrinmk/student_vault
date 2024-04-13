import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_vault/controller/home/bloc/home_bloc.dart';
import 'package:student_vault/view/constants/constants.dart';
import 'package:student_vault/view/screens/additional_details.dart';
import 'package:student_vault/view/screens/profile_view.dart';
import 'package:student_vault/view/widgets/custom_button.dart';
import 'package:student_vault/view/widgets/custom_tile.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentuser = FirebaseAuth.instance.currentUser;
  String defaultImage =
      'https://res.cloudinary.com/dccos4vab/image/upload/v1712903228/73-730477_first-name-profile-image-placeholder-png_ddrkew.png';
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ImageAddingLoadingState) {
          showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        } else if (state is ImageAddedCompletedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('image added')));
        } else if (state is NavigateToAddDetailsPageState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddDetailsWrapper()));
        }else if(state is NavigateToViewProfilePageState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProfilePage()));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: setText(
              size: 25,
              color: Colors.black,
              text: 'StudentVault',
              fontWeight: FontWeight.w900),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('studentdata')
                .doc(currentuser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              final data = snapshot.data?.data() as Map<String, dynamic>?;
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: setScreenHeight(context, 1),
                      height: setScreenHeight(context, .25),
                      decoration: const BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: setScreenHeight(context, .09),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  setText(text: 'Name:${data?['username']}'),
                                  setText(text: 'Email:${data?['email']}'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomButton(
                                    onTap: () {
                                      BlocProvider.of<HomeBloc>(context).add(
                                          AddDetailsButtonClickedEvent(
                                              currentUser: currentuser!.uid));
                                    },
                                    height: 30,
                                    width: 80,
                                    elevation: 10,
                                    color: secondary,
                                    radius: 20,
                                    child: const Text('Add details'),
                                  )
                                ],
                              ),
                              SizedBox(
                                child: Stack(
                                  children: [
                                    DottedBorder(
                                        color: secondary,
                                        dashPattern: [40, 20, 40, 20],
                                        borderType: BorderType.Circle,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              data?['userProfile'] ??
                                                  defaultImage),
                                          radius: 50,
                                        )),
                                    Positioned(
                                        bottom: -15,
                                        right: -13,
                                        child: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<HomeBloc>(context)
                                                  .add(
                                                      ImagePickerButtonClickedEvent(
                                                          uid: currentuser!
                                                              .uid));
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: secondary,
                                              size: 30,
                                            )))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: GridView(
                      padding: const EdgeInsets.all(10),
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: [
                        DashboardItemCard(
                            iconData: Icons.book,
                            headingText: 'Course details',
                            subText: 'Explore course info and details'),
                        DashboardItemCard(
                          onTap: (){
                            BlocProvider.of<HomeBloc>(context).add(ViewProfileCardClickedEvent());
                            print('event added');
                          },
                            iconData: Icons.person,
                            headingText: 'Profile',
                            subText: 'View Your Profile'),
                        DashboardItemCard(
                            iconData: Icons.format_list_bulleted,
                            headingText: 'Attendance',
                            subText: 'Attendance Details'),
                        DashboardItemCard(
                            iconData: Icons.grade,
                            headingText: 'Grades',
                            subText: 'View grades and Achievements'),
                        DashboardItemCard(
                            iconData: Icons.schedule,
                            headingText: 'TimeTable',
                            subText: 'Schedules for the day'),
                        DashboardItemCard(
                            iconData: Icons.edit,
                            headingText: 'Edit',
                            subText: 'Edit your profile')
                      ],
                    )),
                  ],
                );
              }
              return const Center(
                child: Dialog(
                  child: Text('no data '),
                ),
              );
            }),
      ),
    );
  }
}



























// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// // class _HomePageState extends State<HomePage> {
// //   final currentuser=FirebaseAuth.instance.currentUser;
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocListener<HomeBloc, HomeState>(
// //       listener: (context, state) {
// //         if(state is ImageAddingErrorState){
// //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
// //         }
// //       },
// //       child: 
// //       Scaffold(
// //       body: Container(
// //         height: setScreenHeight(context, 1),
// //         width: setScreenWidth(context, 1),
// //         child: Stack(
// //           children: [
// //             Positioned(
// //               top: -100,
// //               child: Container(
// //                 height: setScreenHeight(context, .4),
// //                 width: setScreenWidth(context, 1),
// //                 decoration: BoxDecoration(
// //                   color: primary,
// //                   borderRadius: BorderRadius.circular(20)
// //                 ),
// //                 child: SafeArea(child: Column(children: [
// //                   SizedBox(height: setScreenHeight(context, .2),),
// //                   Row(children: [
// //                     SizedBox(width: setScreenWidth(context, .6),
// //                     child: Padding(
// //                       padding: const EdgeInsets.only(left: 10),
// //                       child: StreamBuilder<DocumentSnapshot>(stream:FirebaseFirestore
// //                       .instance
// //                       .collection('studentdata')
// //                       .doc(currentuser!.uid)
// //                       .snapshots(),
                      
// //                         builder: (context,snapshot){
// //                           if(snapshot.connectionState==ConnectionState.waiting){
// //                             return Center(
// //                               child: CircularProgressIndicator(),
// //                             );
// //                           }
// //                           if(snapshot.hasData){
// //                             final data=snapshot.data?.data() as Map<String,dynamic>?;
// //                             return Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
                          
// //                          setText(text: 'Name: ${data!['username']}'),
// //                          setText(text: 'Email: ${data['email']}'),
                       
                        
// //                         ],
// //                       );
                            
// //                           }return Container();
// //                         })
// //                     ),
// //                     ),
// //                     DottedBorder(
                      // color: secondary,
                      // dashPattern: [40, 20,40,20],
                      // borderType: BorderType.Circle,
// //                       child: CircleAvatar(
// //                         radius: 50,
// //                         child: IconButton(onPressed: (){
// //                           BlocProvider.of<HomeBloc>(context).add(ImagePickerButtonClickedEvent(uid: currentuser!.uid));
// //                         }, icon: Icon(Icons.add),iconSize: 50,),
// //                         ))
// //                   ],),
// //                 ],)),
// //               ))
// //           ],
// //         ),
// //       ),

// //     )
// //     );
// //   }
// // }