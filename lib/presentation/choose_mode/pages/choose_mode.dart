import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/presentation/choose_mode/cubit/theme_cubit.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../gen/assets.gen.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Assets.images.chooseModeBg.provider(),
                      fit: BoxFit.fill)),
            ),
            Container(
              color: Colors.black.withOpacity(.15),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Assets.vectors.spotifyLogo.svg()),
                  const Spacer(),
                  const Text(
                    'Choose Mode',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () => context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.dark),
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff30393C)
                                          .withOpacity(.5),
                                      shape: BoxShape.circle),
                                  child:
                                      Assets.vectors.moon.svg(fit: BoxFit.none),
                                ),
                              ),
                            ),
                          ),
                          const Gap(15.0),
                          const Text(
                            'Dart Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      const Gap(40.0),
                      Column(
                        children: [
                          InkWell(
                            onTap: () => context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.light),
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff30393C)
                                          .withOpacity(.5),
                                      shape: BoxShape.circle),
                                  child:
                                      Assets.vectors.sun.svg(fit: BoxFit.none),
                                ),
                              ),
                            ),
                          ),
                          const Gap(15.0),
                          const Text(
                            'Light Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Gap(50),
                  BasicAppButton(
                    onPressed: () {
                      context.push('/sign-up-or-sign-in');
                    },
                    title: 'Continue',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
