import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_vault/view/constants/constants.dart';

class ViewPageTile extends StatelessWidget {

  List<Widget> children;
  ViewPageTile({required this.children});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: setScreenWidth(context, .99),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
          ),
        ),
      ),
    );
  }
}