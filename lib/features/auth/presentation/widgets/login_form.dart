import 'package:clean_todo/features/auth/domain/usecases/login.dart';
import 'package:clean_todo/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  String? emailValidatorFn(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? passwordValidatorFn(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void loginBtnFn() {
    if (!_formKey.currentState!.validate()) return;
    LoginParams loginParams = LoginParams(
      email: _emailController.text,
      password: _passwordController.text,
    );
    ref.watch(authControllerProvider.notifier).onlogin(loginParams);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authControllerProvider, (state, next) {
      if (next == AuthState.loggedIn) {
        debugPrint('Logged In');
      }
    });
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Clean Todo'),
            const SizedBox(height: 4),
            const Text('Productivity Redifined'),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: emailValidatorFn,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validator: passwordValidatorFn,
            ),
            const SizedBox(height: 8),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: loginBtnFn,
              child: const Text('LOGIN'),
            ),
          ],
        ));
  }
}
