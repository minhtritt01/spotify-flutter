import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spotify/common/widgets/appbar/basic_app_bar.dart';
import 'package:spotify/common/widgets/favorite_button/widgets/favorite_button.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/song_player/cubit/song_player_cubit.dart';

import '../../../core/configs/constants/app_urls.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({super.key, required this.songEntity});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: const Text(
          'Now playing',
          style: TextStyle(fontSize: 18.0),
        ),
        action: IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
      ),
      body: BlocProvider(
        create: (context) => SongPlayerCubit()
          ..loadLoading(
              '${AppURLs.songFirestorage}${songEntity.artist} - ${songEntity.title}.mp3?${AppURLs.mediaAlt}'),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            children: [
              _songCover(context),
              const Gap(20.0),
              _songDetail(),
              const Gap(30.0),
              _songPlayer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      height: MediaQuery.sizeOf(context).height / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  '${AppURLs.coverFirestorage}${songEntity.artist} - ${songEntity.title}.jpg?${AppURLs.mediaAlt}'))),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),
            ),
            const Gap(5.0),
            Text(
              songEntity.artist,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
            )
          ],
        ),
        FavoriteButton(song: songEntity)
      ],
    );
  }

  Widget _songPlayer() {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SongPlayerLoaded) {
          return Column(
            children: [
              Slider(
                  value: context
                      .read<SongPlayerCubit>()
                      .songPosition
                      .inSeconds
                      .toDouble(),
                  min: 0.0,
                  max: context
                      .read<SongPlayerCubit>()
                      .songDuration
                      .inSeconds
                      .toDouble(),
                  onChanged: (value) {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(
                      context.read<SongPlayerCubit>().songPosition)),
                  Text(formatDuration(
                      context.read<SongPlayerCubit>().songDuration))
                ],
              ),
              const Gap(20.0),
              GestureDetector(
                onTap: () {
                  context.read<SongPlayerCubit>().playOrPauseSong();
                },
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: Icon(context.read<SongPlayerCubit>().audioPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                ),
              )
            ],
          );
        }
        return Container();
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
