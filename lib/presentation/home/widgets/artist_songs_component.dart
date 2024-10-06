import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/presentation/home/cubit/artist_songs_cubit.dart';
import 'package:spotify/presentation/home/widgets/song_list.dart';

class ArtistSongsComponent extends StatelessWidget {
  const ArtistSongsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArtistSongsCubit()..getArtistSongs(),
      child: SizedBox(
        height: 200.0,
        child: BlocBuilder<ArtistSongsCubit, ArtistSongsState>(
          builder: (context, state) {
            if (state is ArtistSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ArtistSongsLoaded) {
              return SongList(
                songs: state.songs,
              );
            }
            if (state is ArtistSongsLoadFailure) {
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
