import 'package:bloc_sample_app/constants/constants.dart';
import 'package:bloc_sample_app/presentation/widgets/mobile_login_ui.dart';
import 'package:bloc_sample_app/presentation/widgets/web_login_ui.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 100, 89),
      body: isMobile(context)
          ? MobilLoginUI(
              onLoginPressed: () => onLogin(context),
            )
          : WebLoginUI(
              onLoginPressed: () => onLogin(context),
            ),
    );
  }

  void onLogin(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (context) => false);
  }
}
