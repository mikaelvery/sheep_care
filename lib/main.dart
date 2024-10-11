import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sheep_care/layers/layer_one.dart';
import 'package:sheep_care/layers/layer_two.dart';
import 'package:sheep_care/layers/layer_three.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sheep Care',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
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
            
            Positioned(top: 330, right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: 350, right: 0, bottom: 15, child: LayerTwo()),
            Positioned(top: 330, right: 0, bottom: 48, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}
