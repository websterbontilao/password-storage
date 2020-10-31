import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:password_storage_app/app/locator.dart';
import 'package:password_storage_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:password_storage_app/models/user.dart' as UserModel;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class UserService with ReactiveServiceMixin{
  // DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
  // Firebase
  
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final NavigationService _navigationService = locator<NavigationService>();
  

  void signUpUserToFirebase (UserModel.User user) {
    // FirebaseAuth.instance
    //   .createUserWithEmailAndPassword(
    //     email: user.email, 
    //     password: user.password
    //   ).then((result) {

    //   })
  }

  Future<void> loginUser(UserModel.User user) async {
    try {
      UserCredential appUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: user.email, 
        password: user.password
      );
      await _navigationService.navigateTo(Routes.DashboardViewRoute);
    } catch (e) {
      print(e.message);
    }
    
  }
}