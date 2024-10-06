import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/domain/usecases/song/is_favorite_song.dart';

import '../../../service_locator.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavoriteSong(String songId);
  Future<Either> getUserFavoriteSongs();
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
        bool isFavorite =
            await sl<IsFavoriteSongUseCase>().call(params: doc.reference.id);
        var songModel = SongModel.fromJson(doc.data());
        songModel.isFavorite = isFavorite;
        songModel.songId = doc.reference.id;
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
        bool isFavorite =
            await sl<IsFavoriteSongUseCase>().call(params: doc.reference.id);
        var songModel = SongModel.fromJson(doc.data());
        songModel.isFavorite = isFavorite;
        songModel.songId = doc.reference.id;
        var entity = songModel.toEntity();
        songs.add(entity);
      }
      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, please try again later');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;

      late bool isFavorite;
      String uId = user!.uid;
      QuerySnapshot favoriteSongs = await firestore
          .collection('users')
          .doc(uId)
          .collection('favorites')
          .where('songId', isEqualTo: songId)
          .get();
      if (favoriteSongs.docs.isNotEmpty) {
        await favoriteSongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firestore
            .collection('users')
            .doc(uId)
            .collection('favorites')
            .add(
          {'songId': songId, 'addedDate': Timestamp.now()},
        );
        isFavorite = true;
      }
      return Right(isFavorite);
    } catch (e) {
      return const Left('An error occurred, please try again later');
    }
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;

      String uId = user!.uid;
      QuerySnapshot favoriteSongs = await firestore
          .collection('users')
          .doc(uId)
          .collection('favorites')
          .where('songId', isEqualTo: songId)
          .get();
      if (favoriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;
      List<SongEntity> favoriteSongs = [];
      String uId = user!.uid;
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .doc(uId)
          .collection('favorites')
          .get();
      for (var element in querySnapshot.docs) {
        String songId = element['songId'];
        var song = await firestore.collection('songs').doc(songId).get();
        SongModel songModel = SongModel.fromJson(song.data()!);
        songModel.isFavorite = true;
        songModel.songId = songId;
        favoriteSongs.add(songModel.toEntity());
      }
      return Right(favoriteSongs);
    } catch (e) {
      return const Left('An error occurred, please try again later');
    }
  }
}
