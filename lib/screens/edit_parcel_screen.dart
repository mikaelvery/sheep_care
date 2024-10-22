import 'package:flutter/material.dart';
import 'package:sheep_care/widgets/app_bar.dart';
import '../models/parcels.dart';

class EditParcelScreen extends StatelessWidget {
  final Parcels parcel;

  const EditParcelScreen({required this.parcel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0), 
        child: CustomAppBar(
          titleWidget: Center(
            child: Text(
              'Modifier la parcelle',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          showBackButton: true,
          actions: [],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 11, 94, 89), 
        child: SingleChildScrollView(
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
                  _buildTextField('Nom de la parcelle', parcel.nom, isEditable: false, isBold: true),
                  const SizedBox(height: 16),
                  _buildTextField('Surface (ha)', parcel.surface.toString()),
                  const SizedBox(height: 16),
                  _buildTextField('Culture précédente', parcel.culturePrecedente),
                  const SizedBox(height: 16),
                  _buildTextField('Culture actuelle', parcel.cultureActuelle),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
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
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, {bool isEditable = true, bool isBold = false}) {
    return TextField(
      enabled: isEditable,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      controller: TextEditingController(text: initialValue),
      style: TextStyle(color: Colors.black, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
