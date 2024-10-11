import 'package:flutter/material.dart';
import '../models/parcels.dart';
import 'parcels_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listes de parcelles séparées
    final List<Parcels> prairieParcels = [
      Parcels(
        nom: 'La Bancarel',
        surface: 0.79,
        culturePrecedente: 'Prairie',
        cultureActuelle: 'Prairie',
        premierCoupe: 11,
        bottesHa1: 13.9,
        deuxiemeCoupe: null,
        bottesHa2: null,
        imageUrl: 'brebis_1.jpg',
      ),
      Parcels(
        nom: 'Les Combes',
        surface: 5.17,
        culturePrecedente: 'Prairie',
        cultureActuelle: 'Prairie',
        premierCoupe: 59,
        bottesHa1: 11.4,
        deuxiemeCoupe: null,
        bottesHa2: null,
        imageUrl: 'brebis_2.jpg',
      ),
      Parcels(
        nom: 'Le Puech Alucadou',
        surface: 1.74,
        culturePrecedente: 'Prairie',
        cultureActuelle: 'Prairie',
        premierCoupe: 14,
        bottesHa1: 8.0,
        deuxiemeCoupe: null,
        bottesHa2: null,
        imageUrl: 'brebis_3.jpg',
      ),
      Parcels(
        nom: 'Les Plots',
        surface: 2.01,
        culturePrecedente: 'Prairie',
        cultureActuelle: 'Prairie',
        premierCoupe: 20,
        bottesHa1: 10.0,
        deuxiemeCoupe: null,
        bottesHa2: null,
        imageUrl: 'brebis_4.jpg',
      ),
      Parcels(
        nom: 'Le Coustel',
        surface: 2.48,
        culturePrecedente: 'Prairie',
        cultureActuelle: 'Prairie',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: null,
        imageUrl: 'brebis_5.jpg',
      ),
      Parcels(
        nom: 'La Baume',
        surface: 1.82,
        culturePrecedente: 'Prairie',
        cultureActuelle: 'Prairie',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: null,
        imageUrl: 'brebis_6.jpg',
      ),
      Parcels(
        nom: 'Les Bournious',
        surface: 3.1,
        culturePrecedente: 'Prairie',
        cultureActuelle: 'Prairie',
        premierCoupe: 35,
        bottesHa1: 11.3,
        deuxiemeCoupe: null,
        bottesHa2: null,
        imageUrl: 'brebis_1.jpg', 
      ),
      Parcels(
        nom: 'Causse',
        surface: 65.31,
        culturePrecedente: 'Prairie',
        cultureActuelle: 'Prairie',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: null,
        imageUrl: 'brebis_2.jpg', 
      ),
    ];

    final List<Parcels> labourableParcels = [
      Parcels(
        nom: 'La Devèze de Vernhe',
        surface: 1.81,
        culturePrecedente: 'Méteil',
        cultureActuelle: 'TV/RGH',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_1.jpg',
      ),
      Parcels(
        nom: 'Limagne',
        surface: 5.3,
        culturePrecedente: 'Méteil',
        cultureActuelle: 'TV/RGH',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_2.jpg',
      ),
      Parcels(
        nom: 'Le Mayran',
        surface: 2.15,
        culturePrecedente: 'Trèfle',
        cultureActuelle: 'Méteil',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_3.jpg',
      ),
      Parcels(
        nom: 'Les Veyssieres',
        surface: 5.12,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: 81,
        bottesHa1: 15.8,
        deuxiemeCoupe: 63,
        bottesHa2: 12.3,
        imageUrl: 'brebis_4.jpg',
      ),
      Parcels(
        nom: 'Le Puech',
        surface: 3.63,
        culturePrecedente: 'Sainfoin',
        cultureActuelle: 'Sainfoin',
        premierCoupe: 50,
        bottesHa1: 13.8,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_5.jpg',
      ),
      Parcels(
        nom: 'Le Champ Grand',
        surface: 2.71,
        culturePrecedente: 'Méteil',
        cultureActuelle: 'Luzerne',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_6.jpg',
      ),
      Parcels(
        nom: 'Le Champ de la Maison',
        surface: 0.9,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: 1,
        bottesHa2: 1.1,
        imageUrl: 'brebis_1.jpg', 
      ),
      Parcels(
        nom: 'Les Saraguines',
        surface: 2.69,
        culturePrecedente: 'Trèfle',
        cultureActuelle: 'Méteil',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: 18,
        bottesHa2: 6.7,
        imageUrl: 'brebis_2.jpg',
      ),
      Parcels(
        nom: 'Luméral',
        surface: 3.28,
        culturePrecedente: 'Sainfoin',
        cultureActuelle: 'RGI',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_3.jpg', 
      ),
      Parcels(
        nom: 'Champ de la Croix',
        surface: 1,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_4.jpg', 
      ),
      Parcels(
        nom: 'Le Champ des Cades',
        surface: 4.72,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: 22,
        bottesHa1: 4.7,
        deuxiemeCoupe: 20,
        bottesHa2: 4.2,
        imageUrl: 'brebis_5.jpg',
      ),
      Parcels(
        nom: 'Le Champ du Causse',
        surface: 4.4,
        culturePrecedente: 'Sainfoin',
        cultureActuelle: 'Sainfoin',
        premierCoupe: 55,
        bottesHa1: 27.5,
        deuxiemeCoupe: 23,
        bottesHa2: 5.2,
        imageUrl: 'brebis_6.jpg',
      ),
      Parcels(
        nom: 'Le Champ du Coucou',
        surface: 2.44,
        culturePrecedente: 'Sainfoin',
        cultureActuelle: 'Sainfoin',
        premierCoupe: 57,
        bottesHa1: 23.4,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_1.jpg', 
      ),
      Parcels(
        nom: 'Le Champ des Arbres',
        surface: 5.02,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Méteil',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_2.jpg',
      ),
      Parcels(
        nom: 'Peyrelade',
        surface: 6.09,
        culturePrecedente: 'Méteil',
        cultureActuelle: 'Méteil',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_3.jpg', 
      ),
      Parcels(
        nom: 'Le Champ du Dolmen',
        surface: 3.97,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: 24,
        bottesHa1: 6.0,
        deuxiemeCoupe: 19,
        bottesHa2: 4.8,
        imageUrl: 'brebis_4.jpg',
      ),
      Parcels(
        nom: 'La Bouzigue',
        surface: 4.18,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: 17,
        bottesHa1: 4.1,
        deuxiemeCoupe: 21,
        bottesHa2: 5.0,
        imageUrl: 'brebis_5.jpg',
      ),
      Parcels(
        nom: 'Champ de Marcel',
        surface: 5.53,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: 44,
        bottesHa1: 8.0,
        deuxiemeCoupe: 38,
        bottesHa2: 6.9,
        imageUrl: 'brebis_6.jpg',
      ),
      Parcels(
        nom: 'Le Devezou de Costes',
        surface: 1.86,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_1.jpg', 
      ),
      Parcels(
        nom: 'La Bouzigue de Costes',
        surface: 2.66,
        culturePrecedente: 'Sainfoin',
        cultureActuelle: 'Sainfoin',
        premierCoupe: 33,
        bottesHa1: 12.4,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_2.jpg', 
      ),
      Parcels(
        nom: 'Le Champ de la Route',
        surface: 4.6,
        culturePrecedente: 'Trèfle',
        cultureActuelle: 'Méteil',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_3.jpg', 
      ),
      Parcels(
        nom: 'Les Mazeries',
        surface: 3.1,
        culturePrecedente: 'Sainfoin',
        cultureActuelle: 'Sainfoin',
        premierCoupe: 51,
        bottesHa1: 16.5,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_4.jpg', 
      ),
      Parcels(
        nom: 'Le Champ de la Cazelle',
        surface: 3.5,
        culturePrecedente: 'Méteil',
        cultureActuelle: 'Méteil',
        premierCoupe: 63,
        bottesHa1: 18.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_5.jpg',
      ),
      Parcels(
        nom: 'Les Gaillagues',
        surface: 3.34,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: 14,
        bottesHa1: 4.2,
        deuxiemeCoupe: 22,
        bottesHa2: 6.6,
        imageUrl: 'brebis_6.jpg',
      ),
      Parcels(
        nom: 'Ramon de Ponce',
        surface: 4.69,
        culturePrecedente: 'Luzerne',
        cultureActuelle: 'Luzerne',
        premierCoupe: 17,
        bottesHa1: 3.6,
        deuxiemeCoupe: 25,
        bottesHa2: 5.3,
        imageUrl: 'brebis_1.jpg', 
      ),
      Parcels(
        nom: 'Champ de Costes',
        surface: 3.78,
        culturePrecedente: 'Sainfoin',
        cultureActuelle: 'Sainfoin',
        premierCoupe: 168,
        bottesHa1: 44.4,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_2.jpg', 
      ),
      Parcels(
        nom: 'Champ de L\'Oustal',
        surface: 2.46,
        culturePrecedente: "",
        cultureActuelle: 'Méteil',
        premierCoupe: null,
        bottesHa1: 0.0,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_3.jpg', 
      ),
      Parcels(
        nom: 'Les Maries',
        surface: 2.79,
        culturePrecedente: 'Prairie',
        cultureActuelle: 'Prairie',
        premierCoupe: 35,
        bottesHa1: 12.5,
        deuxiemeCoupe: null,
        bottesHa2: 0.0,
        imageUrl: 'brebis_4.jpg', 
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 56, 90, 83),
                Color.fromARGB(255, 38, 56, 52),
              ],
            ),
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'Sheep Care',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: 'Parcelles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 38, 56, 52),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section Prairie
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Prairies Naturelles',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Défilement horizontal des cartes de prairie
            SizedBox(
              height: 200,
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                scrollDirection: Axis.horizontal,
                itemCount: prairieParcels.length,
                itemBuilder: (context, index) {
                  final currentParcel = prairieParcels[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParcelsDetailScreen(parcel: currentParcel),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.asset(
                                  'assets/${currentParcel.imageUrl}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                currentParcel.nom,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Surface: ${currentParcel.surface} ha',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Section Parcelles Labourables
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Parcelles Labourables',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Défilement horizontal des cartes de parcelles labourables
            SizedBox(
              height: 200, 
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                scrollDirection: Axis.horizontal,
                itemCount: labourableParcels.length,
                itemBuilder: (context, index) {
                  final currentParcel = labourableParcels[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParcelsDetailScreen(parcel: currentParcel),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: SizedBox(
                        width: 150, 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.asset(
                                  'assets/${currentParcel.imageUrl}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                currentParcel.nom,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Surface: ${currentParcel.surface} ha',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
