import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  String? songId;
  Timestamp? releaseDate;
  num? duration;
  bool? isFavorite;

  SongModel(
      {required this.title,
      required this.isFavorite,
      required this.artist,
      required this.releaseDate,
      required this.duration});
  SongModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    artist = json["artist"];
    releaseDate = json["releaseDate"];
    duration = json["duration"];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      isFavorite: isFavorite!,
      title: title!,
      artist: artist!,
      releaseDate: releaseDate!,
      duration: duration!,
      songId: songId!,
    );
  }
}
