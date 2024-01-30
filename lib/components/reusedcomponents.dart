import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

   InputField({super.key, 
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(231, 246, 246, 245),
        
        enabledBorder: InputBorder.none,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color.fromARGB(41, 93, 93, 93),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color.fromARGB(41, 93, 93, 93), 
         
            style: BorderStyle.solid
          ),
        ),
      ),
    ),
  );
}

}