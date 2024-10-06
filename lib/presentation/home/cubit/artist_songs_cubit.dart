import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/usecases/song/get_artist_songs.dart';

import '../../../domain/entities/song/song.dart';
import '../../../service_locator.dart';

part 'artist_songs_state.dart';

class ArtistSongsCubit extends Cubit<ArtistSongsState> {
  ArtistSongsCubit() : super(ArtistSongsLoading());
  Future<void> getArtistSongs() async {
    var returnedSongs = await sl<GetArtistSongsUseCase>().call();

    returnedSongs.fold((left) {
      emit(ArtistSongsLoadFailure());
    }, (data) {
      emit(ArtistSongsLoaded(songs: data));
    });
  }
}
