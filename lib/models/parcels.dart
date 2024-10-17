import 'package:google_maps_flutter/google_maps_flutter.dart';

class Parcels {
  final String nom;
  final double surface;
  final String culturePrecedente;
  final String cultureActuelle;
  final int? premierCoupe;
  final double? bottesHa1;
  final int? deuxiemeCoupe;
  final double? bottesHa2;
  final String imageUrl;
  final LatLng coordinates;
  final List<LatLng> polygonCoordinates;
  
  Parcels({
    required this.nom,
    required this.surface,
    required this.culturePrecedente,
    required this.cultureActuelle,
    this.premierCoupe,
    this.bottesHa1,
    this.deuxiemeCoupe,
    this.bottesHa2,
    required this.imageUrl,
    required this.coordinates,
    required this.polygonCoordinates,
  });
}
