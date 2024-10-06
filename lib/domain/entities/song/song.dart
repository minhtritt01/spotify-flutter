import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final Timestamp releaseDate;
  final num duration;
  bool isFavorite;
  final String songId;

  SongEntity(
      {required this.title,
      required this.songId,
      required this.isFavorite,
      required this.artist,
      required this.releaseDate,
      required this.duration});
}
