import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trifold/utils/status.dart';

class AuthViewModel extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");

  String _password;
  String _confirmPassword;
  String _email;
  Status _signUpStatus;
  Status _logInStatus;
  Status _checkPasswordStatus;
  bool  _tAndC=true;
  bool get tAndC=>_tAndC;

  String _errorMessage = '';

  bool _validEmail = false;
  bool _showPassword = false;
  bool has8minCharacters = false;
  bool hasNumber = false;
  bool hasLetters = false;

  void checkPassword(String password) {
    if (password.isEmpty) {
      _errorMessage = 'Password cannot be empty.';
      notifyListeners();
      return;
    }

    _checkPasswordStatus = Status.LOADING;
    notifyListeners();

    has8minCharacters = password.length >= 8;
    hasNumber = password.contains(RegExp(r'\d'));
    hasLetters = password.contains(new RegExp(r'[A-Z]')) ||
        password.contains(new RegExp(r'[a-z]'));

    if (has8minCharacters && hasNumber && hasLetters) {
      //signUp();
      _checkPasswordStatus = Status.SUCCESS;
      notifyListeners();
    } else {
      _errorMessage =
          'Your password should be a combination of at least 8 letters and numbers.';
    }
    notifyListeners();
  }

  void signUp() {
    _signUpStatus = Status.LOADING;
    notifyListeners();

    debugPrint('Starting');
    if (_email.isEmpty || _password.isEmpty) {
      _errorMessage = 'All fields are required';
      _signUpStatus = Status.FAILED;
      notifyListeners();
      return;
    }

    if (_password != _confirmPassword) {
      _errorMessage = 'Passwords do not match';
      _signUpStatus = Status.FAILED;
      notifyListeners();
      return;
    }

    if (_password.length < 8) {
      _errorMessage =
          'Your password should be a combination of at least 8 letters and numbers.';
      _signUpStatus = Status.FAILED;
      notifyListeners();
      return;
    }

    firebaseAuth
        .createUserWithEmailAndPassword(email: _email, password: _password)
        .then((value) async{

          await value.user.sendEmailVerification();
          debugPrint('Email sent');

      dbRef.child(value.user.uid).set({
        "email": _email,
        "password": _password,
      }).then((result) {
        _errorMessage = '';
        _signUpStatus = Status.SUCCESS;
        notifyListeners();
      });
    }).catchError((error) {
      _errorMessage = error.toString();
      _signUpStatus = Status.FAILED;
      notifyListeners();
    });
  }

  void login() {
    _logInStatus = Status.LOADING;
    notifyListeners();

    firebaseAuth
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((value) {

          print('Here--1');
          if(value.user.emailVerified){
            _errorMessage = '';
            print('Here--2');
            _logInStatus = Status.SUCCESS;
            notifyListeners();
          }else{
            print('Here--3');
            _errorMessage = 'E-mail address has not been verified';
            _logInStatus = Status.FAILED;
            notifyListeners();
          }


    }).catchError((error) {
      _errorMessage = error.toString();
      _logInStatus = Status.FAILED;
      notifyListeners();
    });

  }

  void resetPassword() async {
    debugPrint('Resetting');
    await firebaseAuth.sendPasswordResetEmail(email: _email);
    debugPrint('Done resetting');
  }

  void signInWithGoogle()async{

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await firebaseAuth.signInWithCredential(credential);
    final User user = authResult.user;

    if(user!=null){
      _logInStatus = Status.SUCCESS;
      notifyListeners();
    }
  }

  void setPassword(String password) {
    _errorMessage = '';
    _password = password;
    notifyListeners();
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }

  void setConfirmPassword(String password) {
    _errorMessage = '';
    _confirmPassword = password;
    notifyListeners();
  }

  void setEmail(String email) {
    _errorMessage = '';
    _email = email;
    notifyListeners();
  }

  void acceptTAndC(bool value){
    _tAndC=value;
    value==true?debugPrint('True'):debugPrint('False');
    notifyListeners();
  }

  String getErrorMessage() {
    return _errorMessage;
  }

  Status getSignUpStatus() {
    return _signUpStatus;
  }

  Status getLogInStatus() {
    return _logInStatus;
  }

  Status getCheckPasswordStatus() {
    return _checkPasswordStatus;
  }

  void clearStatus() {
    _errorMessage = '';
    _signUpStatus = null;
    _logInStatus = null;
    notifyListeners();
  }
}
