import 'package:flutter/material.dart';
import 'package:sheep_care/widgets/app_bar.dart';
import '../models/parcels.dart';
import 'edit_parcel_screen.dart';

class ParcelsDetailScreen extends StatelessWidget {
  final Parcels parcel;

  const ParcelsDetailScreen({required this.parcel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Text(
          parcel.nom,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        showBackButton: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            tooltip: 'Modifier',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditParcelScreen(parcel: parcel),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/${parcel.imageUrl}',
                    fit: BoxFit.cover,
                    height: 200, 
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Nom : ${parcel.nom}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Surface : ${parcel.surface} ha',
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                Text(
                  'Culture précédente : ${parcel.culturePrecedente}',
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                Text(
                  'Culture actuelle : ${parcel.cultureActuelle}',
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Logique pour modifier les informations de la parcelle
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditParcelScreen(parcel: parcel), 
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 102, 90), 
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Modifier les informations',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
