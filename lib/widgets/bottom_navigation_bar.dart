import 'package:flutter/material.dart';
import 'package:sheep_care/screens/home.dart';
import 'package:sheep_care/screens/parcels_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  void _handleNavigation(int index, BuildContext context) {
    if (currentIndex == index) return;

    switch (index) {
      case 0:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false,
        );
        break;
      case 1:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ParcelsScreen()),
          (Route<dynamic> route) => false,
        );
        break;
      case 2:
        // Action pour le troisième bouton 
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), 
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), 
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4), 
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30), 
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, 
          elevation: 0,
          selectedItemColor: const Color.fromARGB(255, 30, 224, 192), 
          unselectedItemColor: Colors.grey, 
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            onTap(index);
            _handleNavigation(index, context);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Parcelles',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres',
            ),
          ],
        ),
      ),
    );
  }
}
