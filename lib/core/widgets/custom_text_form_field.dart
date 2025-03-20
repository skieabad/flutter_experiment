import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool? obscureText;
  final void Function()? onTap;
  final bool? readOnly;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.obscureText,
    this.onTap,
    this.readOnly,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(labelText ?? '', style: TextStyle(fontSize: 16)),
            )
            : SizedBox.shrink(),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 16, 16, 16),
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFFCACACA)),
            filled: true,
            fillColor: Color(0xFFF4F7FB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText ?? false,
          onTap: onTap,
          readOnly: readOnly ?? false,
          validator: validator,
        ),
      ],
    );
  }
}
