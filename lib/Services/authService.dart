import 'package:firebase_auth/firebase_auth.dart';
import 'package:upwork/firebaseApp.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<String> getCurrentUserUid() async {
    return auth.currentUser.uid;
  }

  Future signUp(
      String email, String password, Map<String, dynamic> data) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String uid =
          await AuthService().getCurrentUserUid().then((value) => value);
      database.collection("talent").doc(uid).set(data);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
