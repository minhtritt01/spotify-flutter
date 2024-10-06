import 'package:dartz/dartz.dart';
import '../../../data/sources/song/song_firebase_service.dart';
import '../../../domain/repository/song/song.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return sl<SongFirebaseService>().isFavoriteSong(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }

  @override
  Future<Either> getVideoSongs() async {
    return await sl<SongFirebaseService>().getVideoSongs();
  }

  @override
  Future<Either> getArtistSongs() async {
    return await sl<SongFirebaseService>().getArtistSongs();
  }
}
