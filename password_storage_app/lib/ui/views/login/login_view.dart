import 'package:flutter/material.dart';
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
            _HomeView(),
            _LoginForm(),
          ],
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () => model.navigateToDashboard()),
      ), 
      
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

// The card when the user will try to login 
class _LoginForm extends HookViewModelWidget<LoginViewModel> {
  _LoginForm({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    LoginViewModel model,
  ) {
    if (model.pageState == 0) {
      model.loginCardYAxis = MediaQuery.of(context).size.height;
    }

    return AnimatedContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: oneSecondDuration,
      transform: Matrix4.translationValues(0, model.loginCardYAxis, 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only( 
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
      ),
      child: Column(
        children: <Widget> [
          Row(
            children: <Widget>[
              Spacer(),
              Container(
                margin: EdgeInsets.only(
                  top: 17,
                ),
                child: FlatButton (
                  onPressed: (){ model.toggleLoginCard(context); },
                  color: kDismissButtonCOlor,
                  shape: CircleBorder (
                    side: BorderSide(color: kDismissButtonCOlor),
                  ),
                  child: Text(
                    "X",
                    style: TextStyle(
                      color: textLightColor,
                      fontSize: fontSmall
                    ),
                  )
                ),
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
                fontSize: fontLargest
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
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50),
                  ),
                ),
                filled: true,
                hintStyle: GoogleFonts.getFont(
                  defaultFont,
                  fontSize: fontSmall,
                ),
                hintText: "Email Address",
                fillColor: Colors.white70
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
              decoration: InputDecoration(
                icon: Icon(Icons.settings),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                filled: true,
                hintStyle: GoogleFonts.getFont(
                  defaultFont,
                  fontSize: fontLarge,
                ),
                hintText: "Password",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 35,
            ),
            child: FlatButton (
              onPressed: (){ 
                // TODO Call Login validation method here 
              },
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: kPrimaryColor),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  color: textLightColor,
                  fontSize: fontSmall
                ),
              ),
              splashColor: kPrimaryLightColor,
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

// The default display when the user opens the application without session
class _HomeView extends HookViewModelWidget<LoginViewModel> {
  _HomeView({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    LoginViewModel model,
  ) {
    return AnimatedContainer(
      color: kBackgroundColor,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: oneSecondDuration,
      child: Column(
        children: <Widget>[
          Spacer(),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: MaterialButton(
              onPressed: () => model.toggleLoginCard(context),
              color: kPrimaryColor,
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(18),
              splashColor: kPrimaryLightColor,
              shape: StadiumBorder(),
              child: Text(
                "Get Started",
                style: TextStyle(
                  color: textLightColor,
                  fontSize: fontSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}