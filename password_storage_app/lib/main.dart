import 'package:flutter/material.dart';
import 'package:password_storage_app/app/locator.dart';
import 'package:password_storage_app/app/router.gr.dart';
import 'package:password_storage_app/ui/views/future_example/future_example_view.dart';
import 'package:password_storage_app/ui/views/login/login_view.dart';
// import 'package:password_storage_app/ui/views/partial_builds/partial_builds_view.dart';
import 'package:password_storage_app/ui/views/reactive_example/reactive_example_view.dart';
import 'package:password_storage_app/ui/views/stream_example/stream_example_view.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: Routes.LoginViewRoute,
      // Testing only
      home: LoginView(),
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
