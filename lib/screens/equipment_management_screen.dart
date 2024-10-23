import 'package:flutter/material.dart';
import 'package:sheep_care/screens/home.dart';
import 'package:sheep_care/widgets/app_bar.dart';

class EquipmentManagementScreen extends StatelessWidget {
  const EquipmentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: const Text(
          'équipements',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        showBackButton: true,
        onBackPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        actions: const [
          SizedBox(width: 48),
        ],
      ),
      body: Center(
        child: const Text('Page de gestion des équipements.'),
      ),
    );
  }
}
