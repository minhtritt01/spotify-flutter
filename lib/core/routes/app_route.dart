import 'package:go_router/go_router.dart';
import '../../presentation/auth/pages/signup.dart';
import '../../presentation/auth/pages/signup_or_signin.dart';
import '../../presentation/choose_mode/pages/choose_mode.dart';
import '../../presentation/intro/pages/get_started.dart';
import '../../presentation/splash/pages/splash.dart';

import '../../presentation/auth/pages/signin.dart';

final router = GoRouter(initialLocation: '/splash', routes: [
  GoRoute(
    path: '/get-started',
    builder: (context, state) => const GetStarted(),
  ),
  GoRoute(
    path: '/splash',
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
    path: '/choose-mode',
    builder: (context, state) => const ChooseModePage(),
  ),
  GoRoute(
    path: '/sign-up-or-sign-in',
    builder: (context, state) => const SignUpOrSignIn(),
  ),
  GoRoute(
    path: '/sign-up',
    builder: (context, state) => const SignUpPage(),
  ),
  GoRoute(
    path: '/sign-in',
    builder: (context, state) => const SignInPage(),
  ),
]);
