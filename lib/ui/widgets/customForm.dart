import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class customForm extends StatelessWidget {

  String textlable;
  TextEditingController controller;
  Validator? validator;
  TextInputType keyboard;
  bool obscure;
  Icon suffex;

  customForm(this.textlable,
      this.suffex,
     {
        required this.controller,
        this.validator,
        this.keyboard = TextInputType.text,
        this.obscure = false,
      });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            color: const Color(0x51f8aca2),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          keyboardType: keyboard,
          obscureText: obscure,
          controller: controller,
          validator: validator,
          decoration:  InputDecoration(
              border:
              OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: suffex,
              hintText:'$textlable' ),
        ),
      );
  }
}