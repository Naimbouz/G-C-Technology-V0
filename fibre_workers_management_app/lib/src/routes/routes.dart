import 'package:flutter/material.dart';

import '../screens/main_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Handle named routes
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/main_screen':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
    // Add more routes as needed
      default:
      // Handle unknown routes, e.g., show an error screen
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('404 - Page not found'),
            ),
          ),
        );
    }
  }
}
