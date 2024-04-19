import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';

import 'noteragence.dart';

class TripDetailScreen extends StatefulWidget {
  static const screenRoute = '/trip-detail';

  final Function manageFavorite;
  final Function isFavorite;

  const TripDetailScreen(this.manageFavorite, this.isFavorite);

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10), //plusieurs choses qui sécrivent de la meme facon
        alignment: Alignment.topLeft,
        child: Text(
          titleText,
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 66, 110, 146),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final tripID2 = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripID2);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 110, 146),
        title: Text('${selectedTrip.title}'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedTrip.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, "Plus d'informations"),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Text(
                  "Nom du directeur : ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    selectedTrip.directeur,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(4),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 23.0,
                  color: Color.fromARGB(255, 55, 123, 179),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    selectedTrip.adresse,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(4),
            child: Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 23.0,
                  color: Color.fromARGB(255, 55, 123, 179),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    selectedTrip.email,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Ink(
            decoration: ShapeDecoration(
              shape: CircleBorder(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AgencyRating.screenRoute,
                );
              },
              icon: Icon(Icons.edit),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child:
            Icon(widget.isFavorite(tripID2) ? Icons.star : Icons.star_border),
        onPressed: () => widget.manageFavorite(tripID2),
      ),
    );
  }
}
