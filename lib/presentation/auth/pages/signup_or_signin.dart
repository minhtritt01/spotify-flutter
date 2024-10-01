import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/basic_app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/gen/assets.gen.dart';

class SignUpOrSignIn extends StatelessWidget {
  const SignUpOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: Assets.vectors.topPattern.svg(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Assets.vectors.bottomPattern.svg(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Assets.images.authBg.image(),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.vectors.spotifyLogo.svg(),
                  const Gap(55.0),
                  const Text(
                    'Enjoy Listening To Music',
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                  const Gap(21.0),
                  const Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(30.0),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: BasicAppButton(
                              onPressed: () => context.push('/sign-up'),
                              title: 'Register')),
                      const Gap(20.0),
                      Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: () => context.push('/sign-in'),
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: context.isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                              )))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
