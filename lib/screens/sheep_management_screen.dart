import 'package:flutter/material.dart';
import 'package:sheep_care/screens/home.dart';
import 'package:sheep_care/widgets/app_bar.dart';
import 'package:sheep_care/widgets/custom_pop_scope.dart';

class SheepManagementScreen extends StatelessWidget {
  const SheepManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPopScope(
      child: Scaffold(
        appBar: CustomAppBar(
          titleWidget: const Text(
            'brebis',
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
          child: const Text('Page de gestion des brebis.'),
        ),
      ),
    );
  }
}
