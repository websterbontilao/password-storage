import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:password_storage_app/constants.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

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
            // _LoginForm(),
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
      curve: Curves.fastLinearToSlowEaseIn,
      duration: oneSecondDuration,
      transform: Matrix4.translationValues(0, model.loginCardYAxis, 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(100),
          )
      ),
      child: Column(
        children: <Widget> [
          Container(
            child: Text(
              "Login"
            ),
          ),
          FlatButton (
            onPressed: (){},
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(color: kPrimaryColor),
            ),
            child: Text("Material Button")
          )
        ] 
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
              onPressed: (){
                model.toggleLoginCard(context);
              },
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