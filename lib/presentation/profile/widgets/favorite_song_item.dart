import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/profile/cubit/favorite_songs_cubit.dart';

import '../../../common/widgets/favorite_button/widgets/favorite_button.dart';
import '../../../core/configs/constants/app_urls.dart';

class FavoriteSongItem extends StatelessWidget {
  const FavoriteSongItem({super.key, required this.song, required this.index});
  final SongEntity song;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          '${AppURLs.coverFirestorage}${song.artist} - ${song.title}.jpg?${AppURLs.mediaAlt}'))),
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
            FavoriteButton(
              key: UniqueKey(),
              song: song,
              function: () {
                context.read<FavoriteSongsCubit>().removeFavoriteSong(index);
              },
            )
          ],
        )
      ],
    );
  }
}
