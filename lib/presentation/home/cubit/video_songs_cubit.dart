import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:spotify/domain/usecases/song/get_video_songs.dart';
import '../../../domain/entities/song/song.dart';
import '../../../service_locator.dart';

part 'video_songs_state.dart';

class VideoSongsCubit extends Cubit<VideoSongsState> {
  VideoSongsCubit() : super(VideoSongsLoading());
  Future<void> getVideoSongs() async {
    var returnedSongs = await sl<GetVideoSongsUseCase>().call();

    returnedSongs.fold((left) {
      emit(VideoSongsLoadFailure());
    }, (data) {
      emit(VideoSongsLoaded(songs: data));
    });
  }
}
