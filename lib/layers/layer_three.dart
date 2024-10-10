import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sheep_care/config.dart';
import 'package:sheep_care/screens/loading.dart';

class LayerThree extends StatelessWidget {
  const LayerThree({super.key});

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // authentification Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Connection à Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Redirige vers le loading
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    return SizedBox(
      height: 584,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          const Positioned(
            left: 59,
            top: 99,
            child: Text(
              'Username',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Positioned(
            left: 59,
            top: 129,
            child: SizedBox(
              width: 310,
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter User ID or Email',
                  hintStyle: TextStyle(color: hintText),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 59,
            top: 199,
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Positioned(
            left: 59,
            top: 229,
            child: SizedBox(
              width: 310,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: hintText),
                ),
              ),
            ),
          ),
          Positioned(
            left: 46,
            top: 361,
            child: Checkbox(
              checkColor: Colors.black,
              activeColor: checkbox,
              value: isChecked,
              onChanged: (bool? value) {
                isChecked = value!;
              },
            ),
          ),
          const Positioned(
            left: 87,
            top: 375,
            child: Text(
              'Remember Me',
              style: TextStyle(
                color: forgotPasswordText,
                fontSize: 16,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 365,
            right: 60,
            child: GestureDetector(
              onTap: () {
                signInWithGoogle(context); 
              },
              child: Container(
                width: 99,
                height: 35,
                decoration: const BoxDecoration(
                  color: signInButton,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 432,
            left: 59,
            child: Container(
              height: 0.5,
              width: 310,
              color: inputBorder,
            ),
          ),
           Positioned(
            top: 300,
            left: 120,
            right: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    signInWithGoogle(context);
                  },
                  child: Container(
                    width: 59,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(color: signInBox),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Image.asset(
                      'assets/icon_google.png',
                      width: 20,
                      height: 21,
                    ),
                  ),
                ),
                const Text(
                  'or',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins-Regular',
                    color: hintText,
                  ),
                ),
                Container(
                  width: 59,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: signInBox),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Image.asset(
                    'assets/icon_apple.png',
                    width: 20,
                    height: 21,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
