import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.text, required this.onChange});

  final String text;
  final void Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChange,
      decoration: InputDecoration(
        hintText: text,
      ),
      maxLines: 5,
      textAlignVertical: TextAlignVertical.top,
    );
  }
}
