import 'package:flutter/material.dart';

class TextfieldCustom extends StatelessWidget {
  const TextfieldCustom({
    Key? key,
    this.keyboard,
    this.icon,
    this.hint,
    this.controller,
    required this.validator,
    this.labelText,
    this.prefixIcon,
  }) : super(key: key);
  final TextInputType? keyboard;
  final Icon? icon;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Icon ? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 40
      ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        keyboardType: keyboard,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelStyle: TextStyle(
            color: Colors.white
          ),
          labelText: labelText,
          disabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ), 
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: icon,
          suffixIconColor: Colors.black54,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: Colors.red, // Match the color of the error border with the regular border
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 93, 201, 173),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 227, 8, 12),
            ),
          ),
        ),
      ),
    );
  }
}
