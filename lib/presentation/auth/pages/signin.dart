import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/common/widgets/appbar/basic_app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';

import '../../../gen/assets.gen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: Assets.vectors.spotifyLogo.svg(height: 40.0, width: 40.0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        child: Column(
          children: [
            _signinText(),
            const Gap(50.0),
            _emailField(),
            const Gap(20.0),
            _passField(),
            const Gap(20.0),
            BasicAppButton(onPressed: () {}, title: 'Sign In')
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
      textAlign: TextAlign.center,
    );
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

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Not A Member?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0)),
          TextButton(
            onPressed: () => context.pushReplacement('/sign-up'),
            child: const Text('Register now'),
          )
        ],
      ),
    );
  }
}
