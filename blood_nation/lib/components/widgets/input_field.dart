import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final Widget? trailing;
  final bool isVisible;

  final List<TextInputFormatter>? inputFormat;

  const InputField(
      {super.key,
      this.label = "Label Name",
      this.icon,
      this.validator,
      this.controller,
      this.inputFormat,
      this.inputType,
      this.trailing,
      this.isVisible = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        inputFormatters: inputFormat,
        keyboardType: inputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isVisible,
        decoration: InputDecoration(
          label: Text(label),
          hintText: label,
          prefixIcon: Icon(icon),
          suffixIcon: trailing,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xffC31C2B), width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xffce8b91), width: 2.5)),
        ),
      ),
    );
  }
}