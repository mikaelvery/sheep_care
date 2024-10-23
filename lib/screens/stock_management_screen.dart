import 'package:flutter/material.dart';
import 'package:sheep_care/screens/home.dart';
import 'package:sheep_care/widgets/app_bar.dart';
import 'package:sheep_care/widgets/custom_pop_scope.dart';

class StockManagementScreen extends StatelessWidget {
  const StockManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> stockData = [
      {'name': 'Bottes de sainfoins', 'quantity': 100},
      {'name': 'Bottes de luzernes', 'quantity': 130},
      {'name': 'Bottes de trèfles', 'quantity': 48},
      {'name': 'Bottes de TV/RGH', 'quantity': 15},
      {'name': 'Bottes de méteils', 'quantity': 32},
      {'name': 'Bottes de RGI', 'quantity': 9},
      {'name': 'Bottes de prairies', 'quantity': 85},
    ];

    return CustomPopScope(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 11, 94, 89),
        appBar: CustomAppBar(
          titleWidget: const Text(
            'Gestion des Stocks',
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
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Liste des stocks
              Expanded(
                child: ListView.separated(
                  itemCount: stockData.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10), 
                  itemBuilder: (context, index) {
                    final item = stockData[index];
                    return Card(
                      elevation: 4, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), 
                        title: Text(
                          item['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500, 
                            fontSize: 16, 
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Quantité: ${item['quantity']} tonnes',
                          style: const TextStyle(fontSize: 14, color: Colors.black54), 
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
