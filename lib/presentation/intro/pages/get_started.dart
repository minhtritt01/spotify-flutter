import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/gen/assets.gen.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Assets.images.introBg.provider(),
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
                    'Enjoy Listening To Music',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  const Gap(21),
                  const Text(
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque lauda.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(20),
                  BasicAppButton(
                      onPressed: () {
                        context.go('/choose-mode');
                      },
                      title: 'Get Started')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
