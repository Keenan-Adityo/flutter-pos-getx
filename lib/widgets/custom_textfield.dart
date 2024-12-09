import 'package:flutter/material.dart';
import 'package:uas_kasir/styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final IconData icon;
  final bool isObscure;
  final bool isNumber;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.isObscure,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kSubTitle,
        ),
        Container(
          height: 35,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black))),
          child: TextFormField(
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            obscureText: isObscure,
            controller: controller,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: Icon(
                icon,
                color: Colors.black,
              ),
              fillColor: Colors.black,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
