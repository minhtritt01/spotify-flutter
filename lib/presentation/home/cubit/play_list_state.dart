part of 'play_list_cubit.dart';

@immutable
sealed class PlayListState {}

final class PlayListLoading extends PlayListState {}

final class PlayListLoadFailure extends PlayListState {}

final class PlayListLoaded extends PlayListState {
  final List<SongEntity> songs;

  PlayListLoaded({required this.songs});
}
