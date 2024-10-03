import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/presentation/home/pages/cubit/news_songs_cubit.dart';
import 'package:spotify/presentation/home/pages/widgets/song_list.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200.0,
        child: BlocBuilder<NewSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewSongsLoaded) {
              return SongList(
                songs: state.songs,
              );
            }
            if (state is NewSongsLoadFailure) {
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
