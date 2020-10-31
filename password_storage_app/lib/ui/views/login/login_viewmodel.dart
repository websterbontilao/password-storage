import 'package:flutter/cupertino.dart';
import 'package:password_storage_app/app/locator.dart';
import 'package:password_storage_app/app/router.gr.dart';
import 'package:password_storage_app/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:password_storage_app/services/user_service.dart';

class LoginViewModel extends BaseViewModel {
  final _emailAddress = TextEditingController();
  final _password = TextEditingController();
  final _userService = locator<UserService>();


  get emailAddress => _emailAddress;
  get password => _password;

  bool _hidePassword = true;
  bool get hidePassword => _hidePassword;

  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToDashboard() async {
    await _navigationService.navigateTo(Routes.DashboardViewRoute);
  }


  void navigateToSignUp() async {
    await _navigationService.navigateTo(Routes.SignUpViewRoute);
  }

  void navigateToHome() async {
    await _navigationService.navigateTo(Routes.HomeViewRoute);
  }

  void togglePasswordVisibility(){
    _hidePassword = !_hidePassword;
    notifyListeners();
  }

  Future<void> onPressedLoginButtion() async {
    User user = new User(
      email: _emailAddress.text,
      password: _password.text
    );

    try {
      _userService.loginUser(user);
    } catch (e) {
      print("WRONGGG !!!");
    }
  }
  // Add Validation of email
  
}