import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Color.fromARGB(255, 38, 56, 52),
                Color.fromARGB(255, 56, 90, 83),
              ],
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Lagnac',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: -10,
                    child: Image.asset(
                      'assets/brebis.png',
                      fit: BoxFit.cover,
                      width: 70,
                      height: 65,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 56, 90, 83),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: List.generate(
          10,
          (index) => Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              title: Text('parcelle ${index + 1}'),
              subtitle: Text('Les luzernes ${index + 1}'),
              onTap: () {},
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: 'Paramètres',
            ),
          ],
          onTap: (index) {
            // implémenter la logique des icônes du bas de page
          },
        ),
      ),
    );
  }
}
