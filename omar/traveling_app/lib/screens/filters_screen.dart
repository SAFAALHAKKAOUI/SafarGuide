import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltresScreen extends StatefulWidget {
  static const screenRoute = '/filtres';
  final Function saveFiltres;
  final Map<String, bool> currentFilters;
  FiltresScreen(this.currentFilters, this.saveFiltres);

  @override
  State<FiltresScreen> createState() => _FiltresScreenState();
}

class _FiltresScreenState extends State<FiltresScreen> {
  var _isODV = false;
  var _isDV = false;

  @override
  initState() {
    _isODV = widget.currentFilters['ODV']!;
    _isDV = widget.currentFilters['DV']!;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filtres'),
        actions: [
          // ignore: prefer_const_constructors
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFlitres = {
                'ODV': _isODV,
                'DV': _isDV,
              };
              widget.saveFiltres(selectedFlitres);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                  title: Text('ODV'),
                  subtitle: Text('Organisateur_Distributeur_de_Voyage'),
                  value: _isODV,
                  onChanged: (newValue) {
                    setState(() {
                      //pour changer la valeur
                      _isODV = newValue;
                    });
                  }),

              SwitchListTile(
                  title: Text('DV'),
                  subtitle: Text('Distributeur_de_Voyage'),
                  value: _isDV,
                  onChanged: (newValue) {
                    setState(() {
                      //pour changer la valeur
                      _isDV = newValue;
                    });
                  }), //comme botton de notificatio
            ],
          ))
        ],
      ),
    );
  }
}
