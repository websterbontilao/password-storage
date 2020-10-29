import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:password_storage_app/ui/widgets/button_widget.dart';
import 'package:password_storage_app/ui/widgets/textfield_widget.dart';
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
        resizeToAvoidBottomInset: false,
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
                  onPressed: () => model.navigateToHome(),
                  child: Icon(Icons.keyboard_backspace),
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
          TextFieldWidget(
            prefixIcon: Icon(
              Icons.perm_identity,
              size: iconSize,
              color: commonColorGrey,
            ),
            labelText: "Email Address"
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
          ),
          // Password Field
          TextFieldWidget(
            obscureText: model.hidePassword,
            prefixIcon: Icon(
              Icons.lock,
              size: iconSize,
            ),
            suffixIcon: Icon(
              model.hidePassword == true ? Icons.visibility : Icons.visibility_off,
              size: iconSize,
              color: commonColorGrey,
            ),
            suffixIconOnPressed: () => model.togglePasswordVisibility(),
            labelText: "Password",
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
          ),
          ButtonWidget(
            title: "Login",
            color: kPrimaryColor,
            splashColor: kPrimaryLightColor,
            fontColor: textLightColor,
            onPressed: () { /* TODO Add login logic */},
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10
            ),
          ),
          ButtonWidget(
            title: "Sign Up",
            color: kBackgroundColor,
            splashColor: kBackgroundColor,
            onPressed: () => model.navigateToSignUp(),
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