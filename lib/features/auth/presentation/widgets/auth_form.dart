import 'package:clean_todo/features/auth/domain/usecases/login.dart';
import 'package:clean_todo/features/auth/domain/usecases/signup.dart';
import 'package:clean_todo/features/auth/presentation/controllers/auth_controller.dart';
import 'package:clean_todo/features/dashboard/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AuthFormType { login, signup }

class AuthForm extends ConsumerStatefulWidget {
  const AuthForm({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  AuthFormType currentAuthForm = AuthFormType.login;

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

  void signUpBtnFn() {
    if (!_formKey.currentState!.validate()) return;
    SignUpParams signUpParams = SignUpParams(
        username: _userNameController.text,
        email: _emailController.text,
        password: _passwordController.text);
    ref.watch(authControllerProvider.notifier).onSignUp(signUpParams);
  }

  void toggelFormType() {
    if (currentAuthForm == AuthFormType.login) {
      setState(() {
        currentAuthForm = AuthFormType.signup;
      });
    } else {
      setState(() {
        currentAuthForm = AuthFormType.login;
      });
    }
  }

  TextStyle get headlineLarge => Theme.of(context).textTheme.headlineLarge!;

  bool get isLoginForm => currentAuthForm == AuthFormType.login;

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authControllerProvider, (state, next) {
      if (next == AuthState.loggedIn) {
        context.go(HomeScreen.path);
      }
    });
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Clean Todo',
              style: headlineLarge,
            ),
            const SizedBox(height: 4),
            const Text('Productivity Redefined'),
            const SizedBox(height: 8),
            if (currentAuthForm == AuthFormType.signup)
              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(labelText: 'User name'),
              ),
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
              onPressed: isLoginForm ? loginBtnFn : signUpBtnFn,
              child: Text(isLoginForm ? 'LOGIN' : 'SIGNUP'),
            ),
            Row(
              children: [
                Text(isLoginForm
                    ? 'Already have an account ?'
                    : 'Create Account'),
                TextButton(
                    onPressed: toggelFormType,
                    child: Text(isLoginForm ? 'Sign Up' : 'Login'))
              ],
            )
          ],
        ));
  }
}
