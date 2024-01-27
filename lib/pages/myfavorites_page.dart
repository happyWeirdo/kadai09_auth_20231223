import "package:flutter/material.dart";
import "package:my_favorite_app/models/favorites.dart";
import "package:provider/provider.dart";
import "../components/favorites_item.dart";
import "../models/content.dart";

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Favorites>(
      builder: (context, value, child) => Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            const Text(
              'My Favorites',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: value.getFavorites().length,
                itemBuilder: (context, index) {
                  // get indivudual content
                  Content individualContent = value.getFavorites()[index];

                  // return the favorites item
                  return FavoritesItem(content: individualContent,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
