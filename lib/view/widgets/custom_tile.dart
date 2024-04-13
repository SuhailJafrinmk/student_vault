import 'package:flutter/material.dart';
// ignore: must_be_immutable
class DashboardItemCard extends StatelessWidget {
  final IconData iconData;
  final String headingText;
  final String subText;
  void Function()? onTap;

   DashboardItemCard({super.key,this.onTap,required this.iconData, required this.headingText, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Card(
  elevation: 3,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  child: InkWell(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData,size: 40,), 
        SizedBox(height: 8),
        Text(
          headingText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          subText,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  ),
);

  }
}