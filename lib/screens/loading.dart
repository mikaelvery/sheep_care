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
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 94, 89), 
      body: Stack(
        children: [
          // Image de la brebis
          Positioned.fill(
            child: Center(
              child: Image.asset(
                'assets/brebis.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Texte et indicateur de progression
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40.0), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Indicateur de progression
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(height: 4.0), 
                  Text(
                    'Bonjour Sacha !',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
