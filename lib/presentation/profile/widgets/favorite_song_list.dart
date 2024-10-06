import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/profile/widgets/favorite_song_item.dart';

class FavoriteSongList extends StatelessWidget {
  const FavoriteSongList({super.key, required this.songs});
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return FavoriteSongItem(
          song: songs[index],
          index: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Gap(10);
      },
    );
  }
}
