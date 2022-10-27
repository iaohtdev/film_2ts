import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:movie_info/page/login/login_controller.dart';
import 'package:movie_info/routers/app_pages.dart';

class FirebaseFunction {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = "";
        final login = Get.put(LoginController());

  Future registerWithEmail(String email, String password, String name) async {
    User? user;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      //add user detail

      user = userCredential.user;

      uid = user!.uid;
      addUserDetail(email, password, name);
    }  on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        login.textError =e.code;
       
      }
    }
    return user;
  }

  Future addUserDetail(String email, String password, String name) async {
    await FirebaseFirestore.instance.collection("users").add({
      "email": email.trim(),
      "password": password.trim(),
      "name": name.trim(),
      "photoUrl": "",
      "uid": uid,
      "datetime": "",
      "phone": "",
    }).then((value){

    });
  }

  Future loginWithEmail(
    String email,
    String password,
  ) async {
    User? user;
    await Firebase.initializeApp();

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      if (user != null) {
        uid = user.uid;
        email = user.email!;
        
        
      }
    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        login.textError =e.code;
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        login.textError =e.code;
        print('Wrong password provided.');
      }
    }

    return user;
  }

  Future<String> signOut() async {
    await _auth.signOut();
   
    Get.offAllNamed(Routes.loginpage);

    return 'User signed out';
  }
}
