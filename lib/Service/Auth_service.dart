import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Pages/HomePage.dart';
class Authclass {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  final storage = const FlutterSecureStorage();

  Future<void> googleSignIn(BuildContext context) async {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        try {
          UserCredential userCredential =
          await auth.signInWithCredential(credential);
          storeTokenAndData(userCredential);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => HomePage()),
                  (route) => false);
        } catch (e) {
          final snackBar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        showSnackbar(context, "Unable to login");
      }

  }

  Future<void> storeTokenAndData(UserCredential userCredential) async {
    await storage.write(
        key: "token", value: userCredential.credential?.token.toString());
    await storage.write(
        key: "userCredential", value: userCredential.toString());
  }
  Future<String?> gettoken() async{
    return await storage.read(key: "token");
  }

  // Future<void> verifyPhoneNumber(String phonenumber,
  //     BuildContext context,Function setData) async {
  //   try {
  //     PhoneVerificationCompleted verificationCompleted = (
  //         PhoneAuthCredential phoneAuthCredential) async {
  //       showSnackbar(context, "Verification Sucessful");
  //     };
  //     PhoneVerificationFailed verificationFailed = (FirebaseAuthException exception) {
  //       showSnackbar(context, exception.toString());
  //     };
  //     PhoneCodeSent codeSent = (String? verificationID,
  //         [int? forceResendingtoken]) {
  //       showSnackbar(context, "Code Sent");
  //       setData(verificationID);
  //     };
  //     PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (
  //         String verificationID) {
  //       showSnackbar(context, "Time Out");
  //     };
  //     await auth.verifyPhoneNumber(phoneNumber: phonenumber,
  //         verificationCompleted: verificationCompleted,
  //         verificationFailed: verificationFailed,
  //         codeSent: codeSent,
  //         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  //   } catch (e) {
  //     showSnackbar(context, e.toString());
  //   }
  // }
  // Future<void> signInWithPhoneNumber(String verificationID, String smsCode,BuildContext context)async {
  //   try{
  //   AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: smsCode);
  //   UserCredential userCredential = await auth.signInWithCredential(credential);
  //   storeTokenAndData(userCredential);
  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (builder) => HomePage()),
  //           (route) => false);
  //   showSnackbar(context, "Logged In");
  //   }catch(e){
  //   showSnackbar(context, e.toString());
  //   print(e);
  //   }
  // }
  Future<void> logout()async {
    try{
    await _googleSignIn.signOut();
    await auth.signOut();
    await storage.delete(key: "token");
    }catch(e){

    }
  }
  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
