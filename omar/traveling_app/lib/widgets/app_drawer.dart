import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/category_trips_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget newMethod(String title, IconData icon, VoidCallback onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Color.fromARGB(255, 27, 72, 139),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Amiri', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            color: Color.fromARGB(255, 66, 110, 146),
            child: Text(
              'Ton conseiller touristique',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          newMethod('agences', Icons.card_travel, () {
            Navigator.of(context).pushNamed('/');
          }),
          newMethod('filtres', Icons.filter_list, () {
            Navigator.of(context).pushNamed(FiltresScreen.screenRoute);
          }),
        ],
      ),
    );
  }
}
