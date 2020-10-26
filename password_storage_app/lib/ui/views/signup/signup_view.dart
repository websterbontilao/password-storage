import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import 'package:password_storage_app/constants.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import 'signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            _SignUpForm(),
          ],
        ),
      ), 
      
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}

class _SignUpForm extends HookViewModelWidget<SignUpViewModel> {
  _SignUpForm({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    SignUpViewModel model,
  ) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: <Widget> [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                ),
                child: FlatButton(
                  onPressed: () => model.navigateToLogin(),
                  child: Icon(Icons.keyboard_backspace),
                )
              ),
            ],
          ),
          Spacer(),
          // First Name
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.perm_identity),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50),
                  ),
                ),
                filled: true,
                hintStyle: GoogleFonts.getFont(
                  defaultFont,
                  fontSize: fontSizeDefault,
                ),
                hintText: "First Name",
                fillColor: commonColorWhite
              ),
            ),
          ),
          // Last Name
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.perm_identity),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50),
                  ),
                ),
                filled: true,
                hintStyle: GoogleFonts.getFont(
                  defaultFont,
                  fontSize: fontSizeDefault,
                ),
                hintText: "Last Name",
                fillColor: commonColorWhite
              ),
            ),
          ),
          // Email Address
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50),
                  ),
                ),
                filled: true,
                hintStyle: GoogleFonts.getFont(
                  defaultFont,
                  fontSize: fontSizeDefault,
                ),
                hintText: "Email Address",
                fillColor: commonColorWhite
              ),
            ),
          ),
          // Password Field
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            child: TextField(
              obscureText: model.hidePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                suffixIcon: IconButton(
                  icon: Icon(model.hidePassword == true ? Icons.visibility_off : Icons.visibility), 
                  onPressed: () => model.togglePasswordVisibility(),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                filled: true,
                hintStyle: GoogleFonts.getFont(
                  defaultFont,
                  fontSize: fontSizeDefault,
                ),
                hintText: "Password",
                fillColor: commonColorWhite
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
          ),
          Spacer(),
          // Register Button
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.10,
              left: 20,
              right: 20
            ),
            child: MaterialButton(
              onPressed: () {
                // On Pressed function here
              },
              color: kPrimaryColor,
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(18),
              splashColor: kPrimaryLightColor,
              shape: StadiumBorder(),
              child: Text(
                "Register",
                style: GoogleFonts.getFont(
                  defaultFont,
                  fontSize: fontSizeDefault,
                  color: textLightColor,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
        ],
      ),
    );
  }
}