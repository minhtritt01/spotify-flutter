import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../domain/entities/song/song.dart';
import 'song_item.dart';

class SongList extends StatelessWidget {
  const SongList({super.key, required this.songs});
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: songs.length,
      separatorBuilder: (context, index) {
        return const Gap(14.0);
      },
      itemBuilder: (context, index) {
        return SongItem(
          song: songs[index],
        );
      },
    );
  }
}
