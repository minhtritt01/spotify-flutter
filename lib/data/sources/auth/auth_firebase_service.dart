import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/auth/create_user_req.dart';

import '../../models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserReq user);
  Future<Either> signup(CreateUserReq createUserReq);
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
          .set({'email': data.user?.email, 'password': createUserReq.fullName});
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
}
