import 'package:flutter/material.dart';
import 'package:sheep_care/screens/stock_management_screen.dart';
import 'package:sheep_care/screens/sheep_management_screen.dart';
import 'package:sheep_care/screens/crop_tracking_screen.dart';
import 'package:sheep_care/screens/statistics_screen.dart';
import 'package:sheep_care/screens/notifications_screen.dart';
import 'package:sheep_care/screens/equipment_management_screen.dart';
import 'package:sheep_care/screens/home.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  void _navigateToPage(BuildContext context, String title) {
    Widget page;

    switch (title) {
      case 'Gestion des Stocks':
        page = const StockManagementScreen();
        break;
      case 'Gestion des Brebis':
        page = const SheepManagementScreen();
        break;
      case 'Suivi des Cultures':
        page = const CropTrackingScreen();
        break;
      case 'Suivi du Matériel':
        page = const EquipmentManagementScreen();
        break;
      case 'Statistiques':
        page = const StatisticsScreen();
        break;
      case 'Notifications':
        page = const NotificationsScreen();
        break;
      default:
        page = const HomeScreen();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToPage(context, title),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        color: const Color.fromARGB(255, 29, 145, 145),
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image à gauche
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),
              const SizedBox(width: 15),

              // Colonne avec le texte au centre
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              // Flèche à droite pour la redirection
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
