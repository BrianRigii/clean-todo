import 'package:clean_todo/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const path = '/auth';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
