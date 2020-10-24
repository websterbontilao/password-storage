import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:password_storage_app/constants.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: <Widget>[
            _LoginForm(),
          ],
        ),
      ), 
      
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

class _LoginForm extends HookViewModelWidget<LoginViewModel> {
  _LoginForm({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    LoginViewModel model,
  ) {
    return Container(
      color: commonColorGrey,
      child: Column(
        children: <Widget> [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                ),
                child: FlatButton(
                  onPressed: () => model.navigateToHome(),
                  child: Icon(Icons.arrow_left),
                )
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: 13,
              right: 0,
              left: 0
            ),
            child: Text(
              "Use App Now",
              style: GoogleFonts.getFont(
                defaultFont,
                fontSize: fontSizeLargest
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Spacer(),
          // Email Field
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
                  onPressed: () => model.toggleHidePassword(),
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
          Container(
            margin: EdgeInsets.only(
              top: 10,
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
                "Login",
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
              top: 10,
              left: 20,
              right: 20
            ),
            child: MaterialButton(
              onPressed: () => model.navigateToSignUp(),
              color: kBackgroundColor,
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(18),
              splashColor: kBackgroundColor,
              shape: StadiumBorder(),
              child: Text(
                "Sign Up",
                style: GoogleFonts.getFont(
                  defaultFont,
                  fontSize: fontSizeDefault,
                  color: textDarkColor,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10
            ),
          ),
        ],
      ),
    );
  }
}