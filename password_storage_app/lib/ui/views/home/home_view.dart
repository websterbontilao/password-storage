import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:password_storage_app/constants.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: <Widget>[
            _HomeView(),
          ],
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () => model.navigateToDashboard()),
      ), 
      
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

// The default display when the user opens the application without session
class _HomeView extends HookViewModelWidget<HomeViewModel> {
  _HomeView({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    HomeViewModel model,
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
              onPressed: () => model.navigateToLogin(),
              color: kPrimaryColor,
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(18),
              splashColor: kPrimaryLightColor,
              shape: StadiumBorder(),
              child: Text(
                "Get Started",
                style: TextStyle(
                  color: textLightColor,
                  fontSize: fontSizeSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}