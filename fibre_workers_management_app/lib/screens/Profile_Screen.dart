import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://placekitten.com/200/200'), // Replace with your profile image URL
            ),
            const SizedBox(height: 16.0),
            Text(
              'Your Name',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Your Email',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your button press functionality here
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
