import 'package:password_storage_app/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:password_storage_app/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToLogin() async {
    await _navigationService.navigateTo(Routes.LoginViewRoute);
  }
  
}