import 'package:firebase01/view/signup.dart';
import 'package:firebase01/view/succes.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Loginone extends StatefulWidget {
  const Loginone({super.key});

  @override
  State<Loginone> createState() => _LoginoneState();
}

class _LoginoneState extends State<Loginone> {
  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late FirebaseRemoteConfig _remoteConfig;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    _fetchRemoteConfig();
  }

  Future<void> _fetchRemoteConfig() async {
    _remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await _remoteConfig.fetchAndActivate();
      String welcome = _remoteConfig.getString('welcome');
      Get.snackbar("Hello", welcome);
    } catch (e) {
      print('Failed to fetch remote config: $e');
    }
  }

  Future<void> _login() async {
    String email = emailController.text.trim();
    String password = passController.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(Succesful01());
      Get.snackbar("Success", "Welcome back!");
    } catch (e) {
      Get.snackbar("Login Failed",
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
      print("Google sign-in error: $e");
      Get.snackbar("Error", "Google sign-in failed. Try again.");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
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
                  "Login to your Account",
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
            // Login button for email and password
            Container(
              width: 0.8 * w,
              height: 0.07 * h,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: _login,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            // Google Sign-In Button
            Container(
              width: 0.8 * w,
              height: 0.07 * h,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent),
                ),
                onPressed: () async {
                  User? user = await _signInWithGoogle();
                  if (user != null) {
                    Get.offAll(Succesful01());
                    Get.snackbar("Success",
                        "Signed in with Google as ${user.displayName}");
                  }
                },
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => Signup01());
              },
              child: Text("Don’t have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
