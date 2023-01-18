import 'package:diskspacerenting/Constants/constants.dart';
import 'package:flutter/material.dart';

class inputText extends StatelessWidget {
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final String labelheading;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  const inputText({
    required this.onChanged,
    required this.hintText,
    required this.labelheading,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            labelheading,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 25,
              color: kTextLightColor,
            ),
          ),
        ),
        TextFormField(
          cursorColor: Colors.grey,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            hintText: hintText,
            fillColor: Colors.black,
            filled: true,
            errorStyle: const TextStyle(height: 0, color: Colors.transparent),
            hintStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 25,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.white, width: .5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.white, width: .5),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.white, width: .5)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: kRedColor, width: .5),
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
