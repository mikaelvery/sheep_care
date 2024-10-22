import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sheep_care/layers/layer_one.dart';
import 'package:sheep_care/layers/layer_two.dart';
import 'package:sheep_care/layers/layer_three.dart';
import 'package:sheep_care/screens/home.dart';
import 'package:sheep_care/screens/parcels_screen.dart';

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
      routes: {
        '/home': (context) => const HomeScreen(),
        '/parcels': (context) => const ParcelsScreen(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 11, 94, 89), 
        child: const Stack(
          children: <Widget>[
            Positioned(top: 180, right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: 190, right: 0, bottom: 15, child: LayerTwo()),
            Positioned(top: 190, right: 0, bottom: 60, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}
