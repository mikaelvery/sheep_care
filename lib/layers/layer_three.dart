import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sheep_care/config.dart';
import 'package:sheep_care/screens/loading.dart';

class LayerThree extends StatefulWidget {
  const LayerThree({super.key});

  @override
  LayerThreeState createState() => LayerThreeState();
}

class LayerThreeState extends State<LayerThree> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  Future<void> signInWithEmailPassword(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur: $e')));
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
        );
      }
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur de connexion: $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800, // Augmenter la hauteur pour accueillir tous les éléments
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
          Positioned(
            left: 59,
            top: 129,
            child: SizedBox(
              width: 310,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter User ID or Email',
                  hintStyle: TextStyle(color: Colors.grey),
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
          Positioned(
            left: 59,
            top: 229,
            child: SizedBox(
              width: 310,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Positioned(
            left: 46,
            top: 299, // Ajuster la position vers le bas
            child: Checkbox(
              checkColor: Colors.black,
              activeColor: Colors.blue,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
          ),
          const Positioned(
            left: 87,
            top: 315, // Ajuster la position vers le bas
            child: Text(
              'Remember Me',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 305, 
            right: 60,
            child: GestureDetector(
              onTap: () {
                signInWithEmailPassword(context, emailController.text, passwordController.text);
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
            top: 385, 
            left: 59,
            child: Container(
              height: 0.5,
              width: 310,
              color: Colors.grey,
            ),
          ),
          Positioned(
            top: 400, 
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
                        bottomRight: Radius.circular(20),
                      ),
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
