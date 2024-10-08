import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/favorite_button/widgets/favorite_button.dart';

import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/home/cubit/play_list_cubit.dart';

import '../../../domain/entities/song/song.dart';

class PlayListItem extends StatelessWidget {
  const PlayListItem({super.key, required this.song, required this.index});
  final SongEntity song;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed('song-player', extra: song);
      },
      child: Row(
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
              FavoriteButton(
                song: song,
                function: () =>
                    context.read<PlayListCubit>().refreshFavoriteSongAt(index),
              )
            ],
          )
        ],
      ),
    );
  }
}
