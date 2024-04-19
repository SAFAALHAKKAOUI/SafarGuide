import 'package:flutter/material.dart';
import '../database.dart';

class AgencyRating extends StatefulWidget {
  static const screenRoute = '/avis';

  @override
  _AgencyRatingState createState() => _AgencyRatingState();
}

class _AgencyRatingState extends State<AgencyRating> {
  double _rating = 0.0;
  String _review = '';

  void _onRatingChanged(double rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _onReviewChanged(String value) {
    setState(() {
      _review = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avis'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donnez une note à l\'agence:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    icon: Icon(
                      _rating >= i ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                    ),
                    onPressed: () => _onRatingChanged(i.toDouble()),
                  ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Note: $_rating',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 40.0),
            Text(
              'Donnez votre avis:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextField(
              onChanged: _onReviewChanged,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Saisissez votre avis...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final databaseManager = SqlDb();
                // Create an instance of the SqlDb class
                await databaseManager.initialDb(); // Open the database

                await databaseManager.insertRating(
                    _rating, _review); // Insert the rating into the database

                await databaseManager.closeDatabase(); // Close the database

                // Show a SnackBar to inform the user that the review has been successfully saved.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Votre avis a été enregistré avec succès!'),
                  ),
                );

                // Reset the rating and review values after saving.
                setState(() {
                  _rating = 0.0;
                  _review = '';
                });
              },
              child: Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }
}
