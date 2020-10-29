import 'package:flutter/material.dart';
import 'package:password_storage_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final String fontStyle;

  final double fontSize;
  
  final Color splashColor;
  final Color color;
  final Color fontColor;
  
  final Function onPressed;

  ButtonWidget({
    this.title,
    this.onPressed,
    this.color = kPrimaryColor,
    this.splashColor = kBackgroundColor,
    this.fontSize = fontSizeDefault,
    this.fontStyle = defaultFont,
    this.fontColor = textDarkColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 25,
        left: 25,
      ),
      child: MaterialButton(
          onPressed: onPressed,
          color: color,
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(18),
          splashColor: splashColor,
          shape: StadiumBorder(),
          child: Text(
            title,
            style: GoogleFonts.getFont(
              defaultFont,
              fontSize: fontSizeDefault,
              color: fontColor,
            ),
          ),
        ),
    );
  }
}