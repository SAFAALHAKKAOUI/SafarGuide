import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/category.dart';
import 'package:traveling_app/widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int itemsToShow = 8;
  bool showAllItems = false;

  void toggleShowAllItems() {
    setState(() {
      showAllItems = !showAllItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<category> displayedItems = showAllItems
        ? Categories_data
        : Categories_data.sublist(0, itemsToShow);

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: displayedItems.length,
            itemBuilder: (context, index) {
              final categoryData = displayedItems[index];
              return CategoryItem(
                  categoryData.id, categoryData.title, categoryData.imageUrl);
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: toggleShowAllItems,
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 243, 245, 247),
              ),
              child: Text(
                showAllItems ? "Afficher moins" : "En savoir plus",
                style: TextStyle(color: Color.fromARGB(255, 105, 157, 199)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
