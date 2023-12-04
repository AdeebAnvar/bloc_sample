import 'package:bloc_sample_app/presentation/pages/home_screen.dart';
import 'package:bloc_sample_app/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route fetchAppRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
