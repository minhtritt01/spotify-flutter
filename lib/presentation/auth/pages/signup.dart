import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/common/widgets/appbar/basic_app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';

import '../../../gen/assets.gen.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppbar(
        title: Assets.vectors.spotifyLogo.svg(height: 40.0, width: 40.0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        child: Column(
          children: [
            _registerText(),
            const Gap(50.0),
            _fullNameField(),
            const Gap(20.0),
            _emailField(),
            const Gap(20.0),
            _passField(),
            const Gap(20.0),
            BasicAppButton(onPressed: () {}, title: 'Create account')
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField() {
    return const TextField(
        decoration: InputDecoration(
      hintText: 'Full Name',
    ));
  }

  Widget _emailField() {
    return const TextField(
        decoration: InputDecoration(
      hintText: 'Enter Email',
    ));
  }

  Widget _passField() {
    return const TextField(
        decoration: InputDecoration(
      hintText: 'Password',
    ));
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Do you have an account?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0)),
          TextButton(
            onPressed: () {
              context.pushReplacement('/sign-in');
            },
            child: const Text('Sign In'),
          )
        ],
      ),
    );
  }
}
