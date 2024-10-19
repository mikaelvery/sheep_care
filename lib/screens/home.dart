import 'package:flutter/material.dart';
import 'package:sheep_care/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  // Exemple de liste dynamique de données pour les cartes
  final List<Map<String, String>> _cardData = [
    {
      'title': 'Gestion des Stocks',
      'subtitle': 'Gérez vos stocks efficacement.',
      'imagePath': 'assets/images/foin.png',
    },
    {
      'title': 'Gestion des Brebis',
      'subtitle': 'Suivez et gérez vos brebis.',
      'imagePath': 'assets/brebis.png',
    },
    {
      'title': 'Suivi des Cultures',
      'subtitle': 'Suivez les cultures et récoltes.',
      'imagePath': 'assets/images/trefle.png',
    },
    {
      'title': 'Suivi du Matériel',
      'subtitle': 'Gérez les outils et machines.',
      'imagePath': 'assets/images/materiel.png',
    },
    {
      'title': 'Statistiques',
      'subtitle': 'Visualisez les statistiques.',
      'imagePath': 'assets/images/statistique.png',
    },
    {
      'title': 'Notifications',
      'subtitle': 'Rappels pour les semis et traitements.',
      'imagePath': 'assets/images/notification.png',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 116, 116),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Sacha',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '18 Oct 2024',
                        style: TextStyle(
                            color: Color.fromARGB(255, 200, 255, 200)),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 70, 173, 142),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Search bar
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 248, 248, 248),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search,
                          color: Colors.black54.withOpacity(0.6)),
                      const SizedBox(width: 6),
                      const Expanded(
                        child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: 'Search Parcel',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.black54.withOpacity(0.6)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // List of Cards
              Expanded(
                child: ListView.builder(
                  itemCount: _cardData.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Action à réaliser lors du clic sur la carte
                      },
                      child: CustomCard(
                        title: _cardData[index]['title']!,
                        subtitle: _cardData[index]['subtitle']!,
                        imagePath: _cardData[index]['imagePath']!,
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

  @override
  Widget build(BuildContext context) {
    return Card(
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
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(width: 15), // Espacement entre l'image et le texte

            // Colonne avec le texte au centre
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Flèche à droite pour la redirection
            GestureDetector(
              onTap: () {
                // Action future pour redirection vers la page de détails
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
