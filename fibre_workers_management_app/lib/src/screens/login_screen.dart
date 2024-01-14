import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';
import '../widgets/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  // sign user in method
  Future<void> signUserIn(context) async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    // check if email and password are empty

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erreur'),
            content: const Text('Veuillez remplir tous les champs'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // valid mail format check

    if (!email.contains('@') || !email.contains('.')) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Email invalide'),
            content: const Text('Veuillez entrer un email valide'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success!'),
          content: const Text('Vous êtes connecté'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushNamed(context, '/main_screen');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );


    /*

    final email = emailController.text.trim();
    /*// Validate email

    final emailError = Validation.validateEmail(email);
    if (emailError != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Email invalide'),
            content: Text(emailError),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }*/

    // Validate password
    final password = passwordController.text;
    /*
    final passwordError = Validation.validatePassword(password);
    if (passwordError != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Mot de passe invalide'),
            content: Text(passwordError),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }*/

    // call auth_service.dart to sign user in
    bool isLoggedIn = await AuthService.login(email, password);

    if (!isLoggedIn) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erreur'),
            content: const Text('Email ou mot de passe incorrect'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    passwordController.clear();
    emailController.clear();

    //alert user that they have been signed in
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success!'),
          content: const Text('Vous êtes connecté'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushNamed(context, '/travaux_liste');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView( // Wrap your content with SingleChildScrollView
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),

                // logo
                const Text(
                  'G&C',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF2A901),
                    fontSize: 30,
                    fontFamily: 'Ramabhadra',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),

                const SizedBox(height: 10),

                const SizedBox(
                  width: 221,
                  child: Text(
                    'organisation des taches ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                const Text(
                  'Connectez-vous à votre compte',
                  style: TextStyle(
                    color: Color(0xFF474747),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),

                const SizedBox(height: 50),

                // email textfield
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                const SizedBox(height: 20),

                // sign in button
                MyButton(
                  onTap: () => signUserIn(context),
                  text: 'Se connecter',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
