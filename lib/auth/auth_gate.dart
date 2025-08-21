import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // Listen to the authentication state changes from Firebase.
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If the snapshot has data, it means the user is logged in.
          if (snapshot.hasData) {
            // Show the HomePage if the user is authenticated.
            return const HomePage();
          } else {
            // Show the LoginPage if the user is not authenticated.
            return const LoginPage();
          }
        },
      ),
    );
  }
}
