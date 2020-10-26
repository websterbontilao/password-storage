import 'package:auto_route/auto_route_annotations.dart';
import 'package:password_storage_app/ui/views/dashboard/dashboard_view.dart';
import 'package:password_storage_app/ui/views/login/login_view.dart';
import 'package:password_storage_app/ui/views/home/home_view.dart';
import 'package:password_storage_app/ui/views/signup/signup_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView, initial: true, name: "HomeViewRoute"),
    MaterialRoute(page: LoginView, name: "LoginViewRoute"),
    MaterialRoute(page: SignUpView, name: "SignUpViewRoute"),
    MaterialRoute(page: DashboardView, name: "DashboardViewRoute")
  ]
)
class $Router {}