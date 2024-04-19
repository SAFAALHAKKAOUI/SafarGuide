import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
import 'package:traveling_app/screens/noteragence.dart';

import '../widgets/app_drawer.dart';

// class TabsScreen extends StatelessWidget {         //tabbar en haut
//   const TabsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("conseiller touristique"),
//           bottom: TabBar(tabs: [
//             Tab(
//               icon: Icon(Icons.dashboard),
//               text: "agences",
//             ),
//             Tab(
//               icon: Icon(Icons.star),
//               text: "favoris",
//             )
//           ]),
//         ),
//         body: TabBarView(children: [
//           CategoriesScreen(),
//           FavoritesScreen(),
//         ]),
//       ),
//     );
//   }
// }
class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;

  const TabsScreen(@required this.favoriteTrips, {super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index; //changer la valeur de index
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    _screens = [
      {'Screen': CategoriesScreen(), 'Title': 'agences'},
      {'Screen': FavoritesScreen(widget.favoriteTrips), 'Title': 'favoris'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 110, 146),
        title: Text(_screens[_selectedScreenIndex]['Title']),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Color.fromARGB(255, 66, 110, 146),
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "agences"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "favoris",
          ),
        ],
      ),
    );
  }
}
