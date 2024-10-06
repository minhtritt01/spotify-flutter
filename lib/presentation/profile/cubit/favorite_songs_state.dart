part of 'favorite_songs_cubit.dart';

@immutable
sealed class FavoriteSongsState {}

final class FavoriteSongsLoading extends FavoriteSongsState {}

final class FavoriteSongsLoadFailure extends FavoriteSongsState {}

final class FavoriteSongsLoaded extends FavoriteSongsState {
  final List<SongEntity> songs;

  FavoriteSongsLoaded({required this.songs});
}
