import 'package:flutter/material.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_trips_screen.dart';
import '../screens/filters_screen.dart';

import '../screens/trip_detail_screen.dart';

import 'app_data.dart';
import 'models/trip.dart';
import 'screens/favorites_screen.dart';
import 'screens/noteragence.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'ODV': false,
    'DV': false,
  };
  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters['ODV'] == true && trip.isODV != true) {
          return false;
        }
        if (_filters['DV'] == true && trip.isDV != true) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          Trips_data.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFovarite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveling_app',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Color.fromARGB(255, 238, 189, 44),
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: TextStyle(
                  color: Color.fromARGB(255, 55, 123, 179),
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
                headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteTrips),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (ctx) =>
            TripDetailScreen(_manageFavorite, _isFovarite),
        AgencyRating.screenRoute: (ctx) => AgencyRating(),
        FiltresScreen.screenRoute: (ctx) =>
            FiltresScreen(_filters, _changeFilters),
      },
    );
  }
}
