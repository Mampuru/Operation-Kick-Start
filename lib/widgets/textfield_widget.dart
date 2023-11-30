import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool? obscureText;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    minLines: 1,
    maxLines: obscureText != null ? 1:5,
    obscureText: obscureText != null ? true : false,
    controller: controller,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      hintText: label,
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}