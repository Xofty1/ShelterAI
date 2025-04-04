import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.isMuted = false,
    required this.onChange,
    this.initialValue,
  });

  final String text;
  final bool isMuted;
  final String? initialValue;
  final void Function(String value) onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: widget.isMuted,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        hintText: widget.text,
      ),
      maxLines: 5,
      textAlignVertical: TextAlignVertical.top,
    );
  }
}
