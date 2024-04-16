
import 'package:flutter/material.dart';

const Color secondary =  Color(0xFFFDD835);
const Color  primary= Color(0xFF455A64);
const Color tertiary = Color(0xFF607D8B);
const Color quaternary=Colors.black;

 Text setText({String text='enter',double size=16,Color color=Colors.white,FontWeight fontWeight=FontWeight.normal}){
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
final RegExp lengthRegExp = RegExp(r'^.{2,50}$');
final RegExp contentRegExp = RegExp(r'^[a-zA-Z\s]+$');
final RegExp rollNumberRegExp = RegExp(r'^[0-9]{2,20}$');
final RegExp birthdayRegExp = RegExp(r'^(0[1-9]|[1-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/\d{4}$');
final RegExp classDivisionRegExp = RegExp(r'^[A-Z]$');

