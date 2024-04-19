import 'package:flutter/material.dart';

enum TripType {
  ODV,
  DV,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String adresse;
  final String email;
  final String directeur;
  final String imageUrl;
  final TripType tripType;
  final bool isODV;
  final bool isDV;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.adresse,
    required this.tripType,
    required this.isODV,
    required this.isDV,
    required this.email,
    required this.directeur,
  });
}
