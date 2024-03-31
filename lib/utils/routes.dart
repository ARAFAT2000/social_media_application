import 'package:flutter/material.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/view/dashboard/dashboard_screen.dart';
import 'package:social_media_application/view/forgot_password/forgot_password.dart';
import 'package:social_media_application/view/login/login_screen.dart';
import 'package:social_media_application/view/signup/sign_up_screen.dart';
import 'package:social_media_application/view/splass/splass_screen.dart';



class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LogInScreen());

      case RouteName.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteName.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashBoardScreen());

      case RouteName.forgotpassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());


      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}