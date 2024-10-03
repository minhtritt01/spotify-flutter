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
}
