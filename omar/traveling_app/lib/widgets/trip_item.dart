import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;

  final String title;
  final String imageUrl;
  final TripType tripType;

  //final Function removeItem;

  const TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.tripType,

    //required this.removeItem,
  });

  String get tripTypeText {
    switch (tripType) {
      case TripType.ODV:
        return 'ODV';
        break;
      case TripType.DV:
        return 'DV';
        break;

      default:
        return 'inconnu';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      TripDetailScreen.screenRoute,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        //removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Trip> data = Trips_data;
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8),
                  ],
                      stops: [
                    //le premier va commencer de 60% de widget, et l'autre 100%%
                    0.6,
                    1
                  ])),
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.fade, //palier au probleme de text long
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Row(
                //   children: [
                //     Icon(
                //       Icons.today,
                //       color: Theme.of(context).accentColor,
                //     ),
                //     SizedBox(
                //       width: 6,
                //     ),
                //     Text('$email email'),
                //   ],
                // ),
                Row(
                  children: [
                    Icon(
                      Icons.business,
                      size: 23.0,
                      color: Color.fromARGB(255, 117, 178, 228),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(tripTypeText)
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
