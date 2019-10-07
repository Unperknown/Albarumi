import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

class UserProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<List<Inquiry>> fetchInquiries() async {
    // TO-DO: fetch user list in firebase DB
  }

  Future<bool> signIn(String id, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: id,
      password: password,
    );

    return isSignedIn();
  }

  Future<bool> register(String username, String id, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: id, password: password);
    print(result.additionalUserInfo.toString());
    return true;
  }

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAuthentication authentication = await loginedGoogleUserAuthentication();

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);

    return _firebaseAuth.currentUser();
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<GoogleSignInAuthentication> loginedGoogleUserAuthentication() async {
    final GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleSignInAuthentication = await _googleSignInAccount.authentication;

    return _googleSignInAuthentication;
  }
}