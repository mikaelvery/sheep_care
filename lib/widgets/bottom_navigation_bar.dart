import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sheep_care/screens/parcels_screen.dart';

const Color bottomNavBgColor = Color.fromARGB(255, 11, 94, 89);

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: bottomNavBgColor,
        border: Border(
          top: BorderSide(width: 1, color: const Color.fromARGB(255, 7, 56, 53)), 
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) {
          IconData iconData;
          String label;

          switch (index) {
            case 0:
              iconData = currentIndex == index ? Ionicons.home : Ionicons.home_outline;
              label = "Home";
              break;
            case 1:
              iconData = currentIndex == index ? Ionicons.map : Ionicons.map_outline;
              label = "Parcels";
              break;
            default:
              iconData = currentIndex == index ? Ionicons.person : Ionicons.person_outline;
              label = "Profile";
              break;
          }

          return GestureDetector(
            onTap: () {
              if (index == 1) {
                // Naviguer vers ParcelsScreen lorsque l'icône de carte est touchée
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => ParcelsScreen())
                );
              }
              onTap(index); // Appeler la fonction onTap fournie
            },
            child: Container(
              constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    size: 24,
                    color: index == currentIndex
                        ? Colors.white 
                        : const Color(0xFF8D8D8D),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: index == currentIndex ? FontWeight.bold : FontWeight.normal, 
                      color: index == currentIndex
                          ? Colors.white 
                          : const Color(0xFF8D8D8D),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
