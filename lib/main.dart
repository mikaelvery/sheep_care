import 'package:flutter/material.dart';
import 'package:sheep_care/screens/loading.dart'; // Assurez-vous d'importer votre écran de chargement
import 'package:sheep_care/layers/layer_one.dart';
import 'package:sheep_care/layers/layer_two.dart';
import 'package:sheep_care/layers/layer_three.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sheep Care',
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    debugShowCheckedModeBanner: false,
    home: const LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/primaryBg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: <Widget>[
            Positioned(
              top: 200,
              left: 59,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(top: 290, right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: 318, right: 0, bottom: 28, child: LayerTwo()),
            Positioned(top: 320, right: 0, bottom: 48, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}
