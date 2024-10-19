import 'package:flutter/material.dart';
import 'package:sheep_care/screens/home.dart';
import 'package:sheep_care/screens/parcels_screen.dart';

const Color bottomNavBgColor = Color.fromARGB(255, 9, 77, 77);

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
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF134E4E), // Couleur de fond mise à jour
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
            offset: const Offset(0, 20),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) {
          return GestureDetector(
            onTap: () {
              onTap(index);
              _handleNavigation(index, context);
            },
            child: SizedBox(
              height: 36,
              width: 36,
              child: Icon(
                index == 0
                    ? Icons.home
                    : index == 1
                        ? Icons.map
                        : Icons.person,
                color: index == currentIndex
                    ? const Color(
                        0xFFEFEBE2) 
                    : const Color(
                        0xFF8D8D8D), 
              ),
            ),
          );
        }),
      ),
    );
  }
}
