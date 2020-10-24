import 'package:flutter/cupertino.dart';
import 'package:password_storage_app/app/locator.dart';
import 'package:password_storage_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  bool _hidePassword = true;
  bool get hidePassword => _hidePassword;

  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToDashboard() async {
    await _navigationService.navigateTo(Routes.DashboardViewRoute);
  }

  // TODO Validate User

  void navigateToSignUp() async {
    // TODO add Signup logic here
  }

  void navigateToHome() async {
    await _navigationService.navigateTo(Routes.HomeViewRoute);
  }

  void toggleHidePassword(){
    _hidePassword = !_hidePassword;
    notifyListeners();
  }
  
}