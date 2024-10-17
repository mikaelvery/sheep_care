import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sheep_care/models/parcels_coordinates.dart';
import 'package:sheep_care/screens/parcels_detail_screen.dart';
import 'package:sheep_care/widgets/app_bar.dart';
import '../../widgets/bottom_navigation_bar.dart';

class ParcelsScreen extends StatefulWidget {
  const ParcelsScreen({super.key});

  @override
  ParcelsScreenState createState() => ParcelsScreenState();
}

class ParcelsScreenState extends State<ParcelsScreen> {
  GoogleMapController? mapController;
  List<Marker> markers = [];
  List<Polygon> polygons = [];
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      // Vérifiez que la route existe et qu'elle ne plante pas
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      // Reste sur l'écran des parcelles
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/settings');
    }
  }

  @override
  void initState() {
    super.initState();
    _createMarkers();
    _createPolygons();
  }

  void _createMarkers() {
    for (var parcel in prairieParcels) {
      markers.add(
        Marker(
          markerId: MarkerId(parcel.nom),
          position: parcel.coordinates,
          infoWindow: InfoWindow(
            title: parcel.nom,
            snippet: parcel.cultureActuelle,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ParcelsDetailScreen(parcel: parcel),
                ),
              );
            },
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
    }

    for (var parcel in labourableParcels) {
      markers.add(
        Marker(
          markerId: MarkerId(parcel.nom),
          position: parcel.coordinates,
          infoWindow: InfoWindow(
            title: parcel.nom,
            snippet: parcel.cultureActuelle,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ParcelsDetailScreen(parcel: parcel),
                ),
              );
            },
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    }
  }
  
  // polygones pour les parcelles de prairie
  void _createPolygons() {
    for (var parcel in prairieParcels) {
      if (parcel.polygonCoordinates.isNotEmpty) {
        polygons.add(
          Polygon(
            polygonId: PolygonId(parcel.nom),
            points: parcel.polygonCoordinates,
            strokeColor: const Color.fromARGB(255, 243, 89, 33),
            strokeWidth: 2,
            fillColor: const Color.fromARGB(255, 243, 156, 33).withOpacity(0.1),
          ),
        );
      }
    }

    // polygones pour les parcelles labourables
    for (var parcel in labourableParcels) {
      if (parcel.polygonCoordinates.isNotEmpty) {
        polygons.add(
          Polygon(
            polygonId: PolygonId(parcel.nom),
            points: parcel.polygonCoordinates,
            strokeColor:
                const Color.fromARGB(255, 117, 243, 33).withOpacity(0.8),
            fillColor: const Color.fromARGB(255, 82, 243, 33).withOpacity(0.5),
            strokeWidth: 2,
          ),
        );
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _setMapMarkers();
    _setMapPolygons();
  }

  void _setMapMarkers() {
    for (var parcel in prairieParcels) {
      markers.add(Marker(
        markerId: MarkerId(parcel.nom),
        position: parcel.coordinates,
        infoWindow: InfoWindow(
          title: parcel.nom,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ParcelsDetailScreen(parcel: parcel),
              ),
            );
          },
        ),
      ));
    }

    for (var parcel in labourableParcels) {
      markers.add(Marker(
        markerId: MarkerId(parcel.nom),
        position: parcel.coordinates,
        infoWindow: InfoWindow(
          title: parcel.nom,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ParcelsDetailScreen(parcel: parcel),
              ),
            );
          },
        ),
      ));
    }
  }

  void _setMapPolygons() {
    setState(() {
      for (var parcel in labourableParcels) {
        if (parcel.polygonCoordinates.isNotEmpty) {
          polygons.add(Polygon(
            polygonId: PolygonId(parcel.nom),
            points: parcel.polygonCoordinates,
            strokeColor:
                const Color.fromARGB(255, 33, 243, 201).withOpacity(0.8),
            fillColor: const Color.fromARGB(255, 33, 243, 194).withOpacity(0.5),
            strokeWidth: 2,
          ));
        }
      }

      for (var parcel in prairieParcels) {
        if (parcel.polygonCoordinates.isNotEmpty) {
          polygons.add(Polygon(
            polygonId: PolygonId(parcel.nom),
            points: parcel.polygonCoordinates,
            strokeColor:
                const Color.fromARGB(255, 31, 102, 90).withOpacity(0.8),
            fillColor: const Color.fromARGB(255, 82, 243, 33).withOpacity(0.5),
            strokeWidth: 2,
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleWidget: Center( 
          child: Text(
            'Nos Parcelles',
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
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(markers),
        polygons: Set<Polygon>.of(polygons),
        initialCameraPosition: const CameraPosition(
          target: LatLng(44.486708, 2.608853),
          zoom: 14.2,
        ),
        mapType: MapType.satellite, 
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        
      ),backgroundColor: Colors.transparent,
    );
  }
}
