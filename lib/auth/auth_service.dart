import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  //get the instance of firebase auth
   final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  //get current user
User? getCurrentUser(){
  return _firebaseAuth.currentUser;
}

  //sign in
   Future<UserCredential> signInWithEmailAndPassword(String email,password)async{
  try{
    UserCredential userCredential=await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }
   }
  //sign up
   Future<UserCredential> signUpWithEmailAndPassword(String email,password)async{
     try{
       UserCredential userCredential=
       await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
       return userCredential;
     }on FirebaseAuthException catch(e){
       throw Exception(e.code);
     }
   }

  //sign out
Future<void> SignOut(){
  return _firebaseAuth.signOut();
}
}