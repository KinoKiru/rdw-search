import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final String? Function(String?)? validation;
  final int? maxLength;

  const Input({
    super.key,
    this.prefixIcon,
    required this.controller,
    required this.validation,
    this.labelText = "Kenteken",
    this.hintText = "Voer hier een kenteken in",
    this.maxLength = 0,
  });

  @override
  State<Input> createState() => _Input();
}

class _Input extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        maxLength: widget.maxLength == 0 ? null : widget.maxLength,
        expands: false,
        decoration: InputDecoration(
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          labelText: widget.labelText,
          hintText: widget.hintText,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
        validator: widget.validation);
  }
}
