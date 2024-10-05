import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/data/models/auth/user.dart';
import 'package:spotify/domain/entities/auth/user.dart';
import '../../models/auth/create_user_req.dart';

import '../../models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserReq user);
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);
      return const Right('Signin successfully');
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'invalid-email') {
        errorMessage = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Wrong credentials';
      }
      return Left(errorMessage);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      FirebaseFirestore.instance
          .collection('users')
          .doc(data.user?.uid)
          .set({'email': data.user?.email, 'name': createUserReq.fullName});
      return const Right('User created successfully');
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The email address is already in use';
      }
      return Left(errorMessage);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      var user = await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid)
          .get();
      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.imgURL =
          firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('Failed to get user');
    }
  }
}
