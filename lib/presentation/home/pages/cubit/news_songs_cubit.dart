import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/usecases/song/get_new_songs.dart';
import '../../../../domain/entities/song/song.dart';
import '../../../../service_locator.dart';

part 'news_songs_state.dart';

class NewSongsCubit extends Cubit<NewsSongsState> {
  NewSongsCubit() : super(NewSongsLoading());
  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold((left) {
      emit(NewSongsLoadFailure());
    }, (data) {
      emit(NewSongsLoaded(songs: data));
    });
  }
}
