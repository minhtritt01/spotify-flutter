import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/song/song.dart';
import '../../../../domain/usecases/song/get_user_favorite_songs.dart';
import '../../../../service_locator.dart';

part 'favorite_songs_state.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());
  List<SongEntity> favoriteSongs = [];
  Future<void> getUserFavoriteSongs() async {
    var user = await sl<GetUserFavoriteSongsUseCase>().call();
    user.fold((error) {
      emit(FavoriteSongsLoadFailure());
    }, (songs) {
      favoriteSongs = songs;
      emit(FavoriteSongsLoaded(songs: favoriteSongs));
    });
  }

  void removeFavoriteSong(int index) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongsLoaded(songs: favoriteSongs));
  }
}
