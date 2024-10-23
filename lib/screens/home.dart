import 'package:flutter/material.dart';
import 'package:sheep_care/widgets/bottom_navigation_bar.dart';
import 'package:sheep_care/models/card_data.dart';
import 'package:sheep_care/widgets/custom_card.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int notificationCount = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy').format(now);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 94, 89),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi, Sacha',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 200, 255, 200),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none, // Désactiver le clipping
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 70, 173, 142),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      if (notificationCount > 0)
                        Positioned(
                          right: -6,
                          top: -6,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 244, 54, 54),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Center(
                              child: Text(
                                '$notificationCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                    ],
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: Colors.black54.withOpacity(0.6)),
                      const SizedBox(width: 6),
                      const Expanded(
                        child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: 'Search Parcel',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 16),
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
                  itemCount: cardData.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {

                      },
                      child: CustomCard(
                        title: cardData[index]['title']!,
                        subtitle: cardData[index]['subtitle']!,
                        imagePath: cardData[index]['imagePath']!,
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
