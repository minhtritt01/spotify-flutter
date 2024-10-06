import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/presentation/home/cubit/video_songs_cubit.dart';
import 'package:spotify/presentation/home/widgets/song_list.dart';

class VideoSongsComponent extends StatelessWidget {
  const VideoSongsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoSongsCubit()..getVideoSongs(),
      child: SizedBox(
        height: 200.0,
        child: BlocBuilder<VideoSongsCubit, VideoSongsState>(
          builder: (context, state) {
            if (state is VideoSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is VideoSongsLoaded) {
              return SongList(
                songs: state.songs,
              );
            }
            if (state is VideoSongsLoadFailure) {
              return const Center(child: Text('Load failed'));
            }
            return const Center(
              child: Text('None'),
            );
          },
        ),
      ),
    );
  }
}
