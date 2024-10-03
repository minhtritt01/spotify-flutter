import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spotify/presentation/home/widgets/play_item.dart';
import '../../../domain/entities/song/song.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key, required this.songs});
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: songs.length,
      separatorBuilder: (context, index) {
        return const Gap(20.0);
      },
      itemBuilder: (context, index) {
        return PlayListItem(
          song: songs[index],
        );
      },
    );
  }
}
