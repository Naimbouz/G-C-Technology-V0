import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay (e.g., loading data) for the splash screen
    Future.delayed(
      const Duration(seconds: 2), // Adjust the duration as needed
          () {
        // Navigate to the main screen or login screen after the splash screen from the routes
        Navigator.of(context).pushReplacementNamed('/login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const CustomSplashScreen(); // Use your custom splash screen widget here
  }
}

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Your custom splash screen UI
    return Scaffold(
      backgroundColor: Colors.grey[300], // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Image.asset(
              'lib/src/images/logo.png', // Replace with the actual path to your logo image
              width: 300, // Adjust the width as needed
              height:300, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}
