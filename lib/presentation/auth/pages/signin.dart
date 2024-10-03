import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/common/widgets/appbar/basic_app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';

import '../../../gen/assets.gen.dart';
import '../../../service_locator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController _email;
  late final TextEditingController _pass;

  @override
  void initState() {
    _email = TextEditingController(text: 'minhtritt01@gmail.com');
    _pass = TextEditingController(text: '12345612');
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: Assets.vectors.spotifyLogo.svg(height: 40.0, width: 40.0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        child: Column(
          children: [
            _signinText(),
            const Gap(50.0),
            _emailField(),
            const Gap(20.0),
            _passField(),
            const Gap(20.0),
            BasicAppButton(
                onPressed: () async {
                  var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
                          email: _email.text, password: _pass.text));
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
                    context.pushReplacement('/');
                  });
                },
                title: 'Sign In')
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
