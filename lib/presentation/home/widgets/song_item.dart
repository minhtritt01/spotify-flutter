import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

import '../../../domain/entities/song/song.dart';

class SongItem extends StatelessWidget {
  const SongItem({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed('song-player', extra: song);
      },
      child: SizedBox(
        width: 160.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            '${AppURLs.coverFirestorage}${song.artist} - ${song.title}.jpg?${AppURLs.mediaAlt}'))),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    transform: Matrix4.translationValues(10.0, 10.0, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode
                          ? AppColors.darkGrey
                          : const Color(0xffe6e6e6),
                    ),
                    height: 40.0,
                    width: 40.0,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: context.isDarkMode
                          ? const Color(0xff959595)
                          : const Color(0xff555555),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(10.0),
            Text(
              song.title,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
            const Gap(5.0),
            Text(
              song.artist,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
