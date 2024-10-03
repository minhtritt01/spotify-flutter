part of 'news_songs_cubit.dart';

@immutable
sealed class NewsSongsState {}

final class NewSongsLoading extends NewsSongsState {}

final class NewSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;

  NewSongsLoaded({required this.songs});
}

final class NewSongsLoadFailure extends NewsSongsState {}
