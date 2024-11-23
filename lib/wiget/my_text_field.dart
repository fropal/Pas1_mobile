import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Color? textColor;
  final bool isObscure;
  final double? height;
  final Color? backgroundColor;
  final double verticalPadding;
  final String? fontFamily;
  final String? hintText;
  final Color? hintColor;
  final TextEditingController? controller;

  const MyTextField({
    super.key,
    this.textColor = Colors.black, // Default warna teks
    this.isObscure = false, // Default tidak tersembunyi
    this.height = 50.0, // Default tinggi widget
    this.backgroundColor = Colors.white, // Default warna latar
    this.verticalPadding = 0.0, // Default padding vertikal
    this.fontFamily = 'Roboto', // Default font family
    this.hintText, // Hint teks opsional
    this.hintColor = Colors.grey, // Default warna hint teks
    this.controller, // Controller opsional
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        cursorColor: const Color(0xFFd7dadf),
        obscureText: isObscure,
        style: TextStyle(color: textColor, fontFamily: fontFamily),
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
            fontFamily: fontFamily,
          ),
          contentPadding: EdgeInsets.only(top: verticalPadding, left: 10),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFd7dadf), width: 2.0),
          ),
        ),
      ),
    );
  }
}
