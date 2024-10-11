import 'package:flutter/material.dart';
import 'package:sheep_care/screens/home.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  void _redirect() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 56, 52),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/brebis.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  Text(
                    'Boujour Sacha !',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
