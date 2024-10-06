part of 'artist_songs_cubit.dart';

@immutable
sealed class ArtistSongsState {}

final class ArtistSongsLoading extends ArtistSongsState {}

final class ArtistSongsLoaded extends ArtistSongsState {
  final List<SongEntity> songs;

  ArtistSongsLoaded({required this.songs});
}

final class ArtistSongsLoadFailure extends ArtistSongsState {}
