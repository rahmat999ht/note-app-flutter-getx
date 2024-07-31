import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.hintText,
    required this.iconData,
    required this.textEditingController,
    required this.validator,
    required this.obscureText,
  });

  final String hintText;
  final IconData iconData;
  final TextEditingController textEditingController;
  final String? Function(String?)?  validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: textEditingController,
        validator: validator,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
            color: Colors.grey,
          ),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.greenAccent,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.grey.shade800,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}