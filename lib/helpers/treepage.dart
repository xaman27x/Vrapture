import 'package:flutter/material.dart';
import 'package:vrapture/helpers/register.dart';
import 'package:vrapture/intro_page.dart';
import 'package:vrapture/models/auth.dart';
import 'package:vrapture/views/login.dart';

class LoginTreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const IntroPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}

class RegisterTreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const IntroPage();
        } else {
          return const RegisterPage();
        }
      },
    );
  }
}
