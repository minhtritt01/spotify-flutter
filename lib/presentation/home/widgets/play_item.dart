import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:spotify/common/helpers/is_dark_mode.dart';

import 'package:spotify/core/configs/theme/app_colors.dart';

import '../../../domain/entities/song/song.dart';

class PlayListItem extends StatelessWidget {
  const PlayListItem({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? AppColors.darkGrey
                      : const Color(0xffe6e6e6)),
              child: Icon(
                Icons.play_arrow_rounded,
                color: context.isDarkMode
                    ? const Color(0xff959595)
                    : const Color(0xff555555),
              ),
            ),
            const Gap(10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Text(
                  song.artist,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(song.duration.toString().replaceAll('.', ':')),
            const Gap(20.0),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_rounded,
                  color: AppColors.darkGrey,
                ))
          ],
        )
      ],
    );
  }
}
