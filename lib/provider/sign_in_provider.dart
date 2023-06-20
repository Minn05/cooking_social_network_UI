import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  //instance of FirebaseAuth, facebook and google
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  //hasError, errorCode, provider, uid, email, name, imaegUrl
  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  String? _provider;
  String? get provider => _provider;

  String? _uid;
  String? get uid => _uid;

  String? _email;
  String? get email => _email;

  String? _name;
  String? get name => _name;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  SignInProvider() {
    checkSignInUser();
  }

  Future checkSignInUser() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("signed_in") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("signed_in") ?? false;
    notifyListeners();
  }

//sign with Google
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      //excusting our authentication
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        //sigin to firebase user instance
        final User userDetails =
            (await firebaseAuth.signInWithCredential(credential)).user!;
        // save all values
        _name = userDetails.displayName;
        _email = userDetails.email;
        _imageUrl = userDetails.photoURL;
        _uid = userDetails.uid;
        _provider = "GOOGLE";
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode =
                "You  are have an account  with us. Use correct provider";
            _hasError = true;
            notifyListeners();
            break;
          case "null":
            _errorCode = "Some unexpected error while trying to sign in";
            _hasError = true;
            notifyListeners();
            break;
          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
        }
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  //entry for cloudfirestore
  Future getUserDataFromFirestore(uid, name) async {
    await FirebaseFirestore.instance.collection('Users').doc(uid).get().then(
          (DocumentSnapshot snapshot) => {
            _uid = snapshot['uid'],
            _name = snapshot['name'],
            _email = snapshot['email'],
            _imageUrl = snapshot['imageUsrl'],
            _provider = snapshot['provider'],
          },
        );
  }

  Future saveDataForFireStore() async {
    final DocumentReference r =
        FirebaseFirestore.instance.collection('users').doc(uid);
    await r.set({
      "uid": _uid,
      "name": _name,
      "email": _email,
      "imageUrl": _imageUrl,
      "provider": _provider,
    });
    notifyListeners();
  }

  Future saveDataToSharedPreferences() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString('uid', _uid!);
    await s.setString('name', _name!);
    await s.setString('email', _email!);
    await s.setString('imageUrl', _imageUrl!);
    await s.setString('provider', _provider!);
    notifyListeners();
  }

  //checkUser exists or not  in cloudfirestore
  Future<bool> checkUserExists() async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    if (snap.exists) {
      print('EXISTING USER');
      return false;
    } else {
      print('NEW USER');
      return false;
    }
  }

  //signout
  Future userSignOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signIn();
    _isSignedIn = false;
    notifyListeners();
    //clear all  storage  information
    clearStoredata();
  }

  Future clearStoredata() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
  }
}