import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  SongPlayerCubit() : super(SongPlayerLoading()) {
    _audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
    });

    _audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
  }

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool get audioPlaying => _audioPlayer.playing;
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  void updateSongPlayer() {
    emit(SongPlayerLoaded());
  }

  Future<void> loadLoading(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  void playOrPauseSong() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    emit(SongPlayerLoaded());
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
