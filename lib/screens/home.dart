import 'package:flutter/material.dart';
import 'package:sheep_care/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0), 
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/appBar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 65.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Avatar à gauche
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 185, 255),
                        radius: 24,
                        backgroundImage: AssetImage('assets/brebis.png'),
                      ),
                      // Notification à droite
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: IconButton(
                          icon: const Icon(Icons.notifications, color: Colors.black),
                          onPressed: () {
                            // Action de notification
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6), // Espace entre l'avatar et le texte
                  const Text(
                    'Hi, Sacha',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              'Bienvenue à Lagnac',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Gérez efficacement tous les aspects de la ferme.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 25),
            SectionTitle(title: 'Gestion de la Ferme'),
            Row(
              children: [
                Expanded(
                  child: CustomCard(
                    icon: Icons.inventory_2,
                    title: 'Gestion des Stocks',
                    subtitle: 'Gestion des stocks efficacement.',
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomCard(
                    icon: Icons.pets,
                    title: 'Gestion des Brebis',
                    subtitle: 'Suivez et gérez vos brebis facilement.',
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'Suivi des Cultures et Équipements'),
            Row(
              children: [
                Expanded(
                  child: CustomCard(
                    icon: Icons.agriculture,
                    title: 'Suivi des Cultures',
                    subtitle: 'Suivi des cultures et récoltes.',
                    color: Colors.orangeAccent,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomCard(
                    icon: Icons.build,
                    title: 'Suivi du Matériel',
                    subtitle: 'Gestion des outils et machines.',
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'Statistiques et Notifications'),
            Row(
              children: [
                Expanded(
                  child: CustomCard(
                    icon: Icons.bar_chart,
                    title: 'Statistiques',
                    subtitle: 'Visualisez les statistiques.',
                    color: Colors.purpleAccent,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomCard(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    subtitle: 'Rappels pour les semis et traitements.',
                    color: Colors.tealAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const CustomCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
