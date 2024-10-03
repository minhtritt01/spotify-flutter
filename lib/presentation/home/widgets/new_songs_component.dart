import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/presentation/home/cubit/news_songs_cubit.dart';
import 'package:spotify/presentation/home/widgets/song_list.dart';

class NewsSongsComponent extends StatelessWidget {
  const NewsSongsComponent({super.key});

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
