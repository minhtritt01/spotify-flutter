import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/song/song.dart';
import '../../../domain/usecases/song/get_play_list.dart';
import '../../../service_locator.dart';

part 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());
  List<SongEntity> playlist=[];
  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();

    returnedSongs.fold((left) {
      emit(PlayListLoadFailure());
    }, (data) {
      playlist = data;
      emit(PlayListLoaded(songs: playlist));
    });
  }
  void refreshFavoriteSongAt(int index){
    playlist[index].isFavorite=!playlist[index].isFavorite;
    emit(PlayListLoaded(songs: playlist));
  }
}
