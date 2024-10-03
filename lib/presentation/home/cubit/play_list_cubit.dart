import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/song/song.dart';
import '../../../domain/usecases/song/get_play_list.dart';
import '../../../service_locator.dart';

part 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());
  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();

    returnedSongs.fold((left) {
      emit(PlayListLoadFailure());
    }, (data) {
      emit(PlayListLoaded(songs: data));
    });
  }
}
