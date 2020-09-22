import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:trifold/utils/status.dart';

class AuthViewModel extends ChangeNotifier{
  FirebaseAuth firebaseAuth= FirebaseAuth.instance;
  DatabaseReference dbRef =
  FirebaseDatabase.instance.reference().child("Users");

  Status _signUpStatus;
  Status _checkEmailStatus;
  Status _checkPasswordStatus;

  String _errorMessage = '';


  bool _validEmail=false;
  bool _showPassword = false;
  bool has8minCharacters=false;
  bool hasNumber=false;
  bool hasLetters=false;

  void checkPassword(String password){

    if(password.isEmpty){
      _errorMessage = 'Password cannot be empty.';
      notifyListeners();
      return;
    }

    _checkPasswordStatus=Status.LOADING;
    notifyListeners();

    has8minCharacters = password.length >= 8;
    hasNumber = password.contains(RegExp(r'\d'));
    hasLetters = password.contains(new RegExp(r'[A-Z]')) || password.contains(new RegExp(r'[a-z]'));

    if(has8minCharacters && hasNumber && hasLetters){
      //signUp();
      _checkPasswordStatus=Status.SUCCESS;
      notifyListeners();
    }else{
      _errorMessage='Your password should be a combination of at least 8 letters and numbers.';
    }
    notifyListeners();
  }

  void signUp(String email,String password){

    _signUpStatus=Status.LOADING;
    notifyListeners();

    if(email.isEmpty || password.isEmpty){
      _errorMessage='All fields are required';
      _signUpStatus=Status.FAILED;
      notifyListeners();
      return;
    }

    firebaseAuth
        .createUserWithEmailAndPassword(
        email: email, password: password)
        .then((value) {
      dbRef.child(value.user.uid).set({
        "email": email,
        "password": password,
      }).then((result) {
        _signUpStatus=Status.SUCCESS;
        notifyListeners();

      });
    }).catchError((error){
      _signUpStatus=Status.FAILED;
      notifyListeners();
    });

  }
}