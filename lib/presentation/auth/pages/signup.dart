import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widgets/appbar/basic_app_bar.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../data/models/auth/create_user_req.dart';
import '../../../domain/usecases/auth/singup.dart';
import '../../../service_locator.dart';

import '../../../gen/assets.gen.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
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
            BasicAppButton(
                onPressed: () async {
                  var result = await sl<SignupUseCase>().call(
                      params: CreateUserReq(
                          fullName: _fullName.text,
                          email: _email.text,
                          password: _pass.text));
                  result.fold((l) {
                    var snackbar = SnackBar(
                      content: Text(l),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }, (r) {
                    while (context.canPop()) {
                      context.pop();
                    }
                    context.push('/');
                  });
                },
                title: 'Create account')
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
    return TextField(
        controller: _fullName,
        decoration: const InputDecoration(
          hintText: 'Full Name',
        ));
  }

  Widget _emailField() {
    return TextField(
        controller: _email,
        decoration: const InputDecoration(
          hintText: 'Enter Email',
        ));
  }

  Widget _passField() {
    return TextField(
        controller: _pass,
        decoration: const InputDecoration(
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
