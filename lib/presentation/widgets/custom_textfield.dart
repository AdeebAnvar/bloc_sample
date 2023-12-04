import 'package:flutter/material.dart';

class CustomTextformfied extends StatelessWidget {
  const CustomTextformfied({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
