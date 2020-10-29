import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_storage_app/constants.dart';

class TextFieldWidget extends StatelessWidget {

  final String labelText;
  final String fontFamily;

  final bool obscureText;
  final bool filled;

  final double fontSize;

  final Color labelColor;
  final Color labelFocusColor;
  final Color fillColor;

  final Icon prefixIcon;
  final Icon suffixIcon;

  final Function prefixIconOnPressed;
  final Function suffixIconOnPressed;


  TextFieldWidget({
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.prefixIconOnPressed,
    this.suffixIconOnPressed,
    this.obscureText = false,
    this.filled = true,
    this.fontSize = fontSizeDefault,
    this.fontFamily = defaultFont,
    this.labelColor = commonColorGrey,
    this.labelFocusColor = commonColorGrey,
    this.fillColor = commonColorWhite,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? IconButton(
            icon: prefixIcon, 
            onPressed: prefixIconOnPressed,
          ) : Icon(null),
          suffixIcon: suffixIcon != null ? IconButton(
            icon: suffixIcon, 
            onPressed: suffixIconOnPressed,
          ) : Icon(null),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          filled: filled,
          labelText: labelText,
          labelStyle: GoogleFonts.getFont(
            fontFamily,
            fontSize: fontSize,
            color: labelColor
          ),
          focusColor: labelFocusColor,
          fillColor: fillColor,
        ),
      ),
    );
  }
}