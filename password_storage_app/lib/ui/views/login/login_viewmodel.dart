import 'package:flutter/cupertino.dart';
import 'package:password_storage_app/app/locator.dart';
import 'package:password_storage_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  double _loginCardYAxis;
  double get loginCardYAxis => _loginCardYAxis;

  int _pageState = 0; // 0 - Home, 1 - Login, 2 - Sign up
  int get pageState => _pageState;

  set loginCardYAxis (double yAxis) {
    _loginCardYAxis = yAxis;
  }

  set pageState (int state) {
    _pageState = state;
  }

  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToDashboard() async {
    await _navigationService.navigateTo(Routes.DashboardViewRoute);
  }

  void toggleLoginCard(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;

    if (_pageState != 1) {
      _loginCardYAxis = windowHeight * 0.4;
      _pageState = 1;
    }
    else {
      _loginCardYAxis = windowHeight;
      _pageState = 0;
    }

    notifyListeners();
  }

  // TODO Login User
  
}