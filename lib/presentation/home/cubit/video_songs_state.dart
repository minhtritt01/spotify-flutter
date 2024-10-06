part of 'video_songs_cubit.dart';

@immutable
sealed class VideoSongsState {}

final class VideoSongsLoading extends VideoSongsState {}

final class VideoSongsLoaded extends VideoSongsState {
  final List<SongEntity> songs;

  VideoSongsLoaded({required this.songs});
}

final class VideoSongsLoadFailure extends VideoSongsState {}
