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
        // Action pour le troisième bouton (Paramètres par exemple)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Décoller la barre des bords
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Couleur de fond blanche neutre
          borderRadius: BorderRadius.circular(30), // Arrondir les bords
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Ombre légère
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3), // Décalage de l'ombre
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Fond transparent pour voir le style arrondi
          elevation: 0,
          selectedItemColor: const Color.fromARGB(255, 30, 224, 192), // Couleur verte pour l'icône active
          unselectedItemColor: Colors.grey, // Couleur grise pour les icônes inactives
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
