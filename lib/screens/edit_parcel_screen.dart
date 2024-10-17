import 'package:flutter/material.dart';
import '../models/parcels.dart';

class EditParcelScreen extends StatelessWidget {
  final Parcels parcel;

  const EditParcelScreen({required this.parcel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modifier la parcelle',
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: const Color(0xFF007B5F),
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
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom de la parcelle',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                  ),
                  controller: TextEditingController(text: parcel.nom), 
                ),
                const SizedBox(height: 16), 
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Surface (ha)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                  ),
                  controller: TextEditingController(text: parcel.surface.toString()), 
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Culture précédente',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                  ),
                  controller: TextEditingController(text: parcel.culturePrecedente), 
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Culture actuelle',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                  ),
                  controller: TextEditingController(text: parcel.cultureActuelle),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Logique pour enregistrer les modifications
                    // mise à jour de la base de données
                    Navigator.pop(context); 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 102, 90),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), 
                    ),
                  ),
                  child: const Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 18, color: Colors.white), 
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
