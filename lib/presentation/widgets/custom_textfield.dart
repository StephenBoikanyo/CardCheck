import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  late String fieldLabel;
  late TextEditingController fieldController;



  CustomTextField({required this.fieldLabel,required this.fieldController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      autofocus: false,
      decoration: InputDecoration(
        labelText: fieldLabel,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey[700]), // updated label color
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff006C52)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder( // added enabledBorder
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
