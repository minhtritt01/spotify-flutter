import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();
      for (var doc in data.docs) {
        var songModel = SongModel.fromJson(doc.data());
        var entity = songModel.toEntity();
        songs.add(entity);
      }
      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, please try again later');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .get();
      for (var doc in data.docs) {
        var songModel = SongModel.fromJson(doc.data());
        var entity = songModel.toEntity();
        songs.add(entity);
      }
      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, please try again later');
    }
  }
}
