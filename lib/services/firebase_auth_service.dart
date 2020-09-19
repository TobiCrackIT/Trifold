import 'package:firebase_auth/firebase_auth.dart';
import 'package:trifold/services/auth_service.dart';

class UserData {
  String displayName;
  String email;
  String uid;
  String password;

  UserData({this.displayName, this.email, this.uid, this.password});
}

class FirebaseAuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Stream<User> get onAuthStateChanged {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
    );
  }

  Future registerWithEmailAndPassword(String email, String password)async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Account Created Successfully";
    }catch (e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password)async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Account Created Successfully";
    }catch (e){
      print(e.toString());
      return null;
    }
  }

  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch (e){
      print(e.toString());
      return null;
    }
  }

}
