import 'package:flutter/material.dart';
import 'package:fibre_workers_management_app/screens/Profile_Screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
      ],
      onTap: (index) {
        // Handle navigation when a tab is pressed
        switch (index) {
          case 1: // 'Profil' tab
            Navigator.pushNamed(context, ProfileScreen.routeName);
            break;
        // Add other cases for different tabs if needed
        }
      },
    );
  }
}
