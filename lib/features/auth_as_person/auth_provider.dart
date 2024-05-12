import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/features/agreement_acceptance_page/agreement_acceptance_page.dart';
import 'package:mekom_w_elykom/features/donations/donations.dart';
import 'package:mekom_w_elykom/features/hello_from_palstic_world/hello_from_palstic_world.dart';

class AuthhProvider extends ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;

  Future signInWithGoogleAsPerson(context) async {
    bool isFromSupplier = false;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    push(const Donations(
      isFromSupplier: false,
    ));
    user != null;
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signInWithGoogleAsSupplierCompany(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    push(const Donations(
      isFromSupplier: true,
    ));
    user != null;
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signInWithGoogleAsResyclyingCompany(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
//  Navigator.of(context).pushReplacementNamed();

    push(const HelloFromPalsticWorld());
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signOut(context) async {
    await FirebaseAuth.instance.signOut();
    user = null;
    notifyListeners();
  }
}
