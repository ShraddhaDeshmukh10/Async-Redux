import 'package:firebase01/view/login01.dart';
import 'package:firebase01/view/succes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup01 extends StatefulWidget {
  const Signup01({super.key});

  @override
  State<Signup01> createState() => _Signup01State();
}

class _Signup01State extends State<Signup01> {
  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  Future<void> _signup() async {
    String email = emailController.text.trim();
    String password = passController.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Get.offAll(Succesful01());
      Get.snackbar("Success", "Account created successfully!");
    } catch (e) {
      Get.snackbar("Signup Failed",
          "Please check your email and password and try again.");
    }
  }

  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Sign In Failed");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 0.8 * w,
              height: 0.1 * h,
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  "Create a New Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: 0.8 * w,
              height: 0.1 * h,
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(CupertinoIcons.mail),
                  hintText: "Your Email",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              width: 0.8 * w,
              height: 0.1 * h,
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: passController,
                obscureText: passwordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(CupertinoIcons.lock),
                  hintText: "Your Password",
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: 0.8 * w,
              height: 0.07 * h,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: _signup,
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Container(
              width: 0.8 * w,
              height: 0.07 * h,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                  ),
                  onPressed: () {
                    _signInWithGoogle();
                  },
                  child: Text("sign in with google",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
