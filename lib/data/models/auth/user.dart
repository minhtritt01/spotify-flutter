import 'package:spotify/domain/entities/auth/user.dart';

class UserModel {
  String? imgURL;
  String? fullName;
  String? email;

  UserModel({this.imgURL, this.fullName, this.email});
  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['name'];
    email = json['email'];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(email: email, fullName: fullName, imgURL: imgURL);
  }
}
