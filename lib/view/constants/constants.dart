import 'dart:ui';

import 'package:flutter/material.dart';

const Color secondary =  Color(0xFFFDD835);
const Color  primary= Color(0xFF455A64);
const Color tertiary = Color(0xFF607D8B);

 Text setText({String text='enter',double size=16,Color color=Colors.black,FontWeight fontWeight=FontWeight.normal}){
  return Text(text,
  style: TextStyle(
    fontSize: size,
    color: color,
    fontWeight: fontWeight
  ),
  );
 }

double setScreenHeight(BuildContext context,double value){
  return MediaQuery.of(context).size.height*value;
}

double setScreenWidth(BuildContext context,double value){
  return MediaQuery.of(context).size.width*value;
}
 final phoneRegExp = RegExp(r'^[6-9]\d{9}$');

 final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');