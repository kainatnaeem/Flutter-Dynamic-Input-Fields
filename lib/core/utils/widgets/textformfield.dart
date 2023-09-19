import 'package:flutter/material.dart';
import '../constants.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hinttext;
  final IconData? icon;
  final Function(String) onChanged;
  final bool myObscureText;

  final IconButton? suffixicon;
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.icon,
    required this.suffixicon,
    required this.myObscureText,
    required this.hinttext,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: myObscureText,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: textStyle06,
        suffixIcon: suffixicon,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        contentPadding:
            icon != null ? null : const EdgeInsets.fromLTRB(16, 20, 0, 20),
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
      textAlignVertical: TextAlignVertical.center,
      style: textStyle03,
    );
  }
}
