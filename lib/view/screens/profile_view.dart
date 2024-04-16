import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_vault/view/constants/constants.dart';
import 'package:student_vault/view/widgets/viewpage_items_tile.dart';

class ViewProfilePage extends StatelessWidget {
  final currentUser=FirebaseAuth.instance.currentUser;
    String defaultImage =
      'https://res.cloudinary.com/dccos4vab/image/upload/v1712903228/73-730477_first-name-profile-image-placeholder-png_ddrkew.png';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  setText(
              size: 25,
              color: Colors.black,
              text: 'View profile',
              fontWeight: FontWeight.w900),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
        .collection('studentdata')
        .doc(currentUser!.uid)
        .snapshots(),
       builder: (context,snapshot){
        final data=snapshot.data?.data() as Map<String,dynamic>?;
return Stack(
  children: [
    // First Container
    Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: setScreenHeight(context, .2),
      child: Container(
        width: setScreenWidth(context, 1),
        color: primary,
        child: Center(
          child: Material(
            elevation: 10,
            color: Colors.transparent,
            child: setText(text: 'StudentVault',size: 30,fontWeight: FontWeight.w900)),
        ),
      ),
    ),
    Positioned.fill(
      top: setScreenHeight(context, .18), 
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 60,),
            ViewPageTile(children: [
              setText(size: 25,text: 'Personal Details---------',color: quaternary,fontWeight: FontWeight.w900),
              setText(text: 'Firstname:${data?['firstName']}',color: quaternary),
              setText(text: 'Lastname:${data?['lastName']}',color: quaternary),
              setText(text: 'Birthday:${data?['birthday']}',color: quaternary),
              setText(text: 'Age:${data?['age']}',color: quaternary),
              setText(text: 'Email:${data?['email']}',color: quaternary),
              setText(text: 'Address:${data?['address']}',color: quaternary)
            ]),
            const SizedBox(height: 10,),
            ViewPageTile(children: [
              setText(size: 25,text: 'Parents information-----------',color: quaternary,fontWeight: FontWeight.w900),
              setText(text: 'Fathers name:${data?['fathersName']}',color: quaternary),
              setText(text: 'Mothers name:${data?['mothersName']}',color: quaternary),
              setText(text: 'Parent contact:${data?['parentContact']}',color: quaternary),
            ]),
            SizedBox(height: 10,),
            ViewPageTile(children: [
              setText(size: 25,text: 'Academic information------------',color: quaternary,fontWeight: FontWeight.w900),
              setText(text: 'School name:${data?['schoolName']}',color: quaternary),
              setText(text: 'Class:${data?['studentclass']}',color: quaternary),
              setText(text: 'Division:${data?['division']}',color: quaternary),
              setText(text: 'Roll number:${data?['rollNo']}',color: quaternary),
              setText(text: 'Admission number:${data?['admissionNumber']}',color: quaternary),
            ]),
          ],
        ),
      ),
    ),
    Positioned(
      top: 90,
      left: 30,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(data?['userProfile'] ?? defaultImage),
      ),
    ),
  ],
);
       }),
    );
  }
}