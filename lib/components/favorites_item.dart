import 'package:flutter/material.dart';
import 'package:my_favorite_app/models/favorites.dart';
import 'package:provider/provider.dart';
import '../models/content.dart';

// ignore: must_be_immutable
class FavoritesItem extends StatefulWidget {
  Content content;
  FavoritesItem({
    super.key,
    required this.content,
  });

  @override
  State<FavoritesItem> createState() => _FavoritesItemState();
}

class _FavoritesItemState extends State<FavoritesItem> {
  // remove item from favorites
  void removeItemFromFavorites() {
    Provider.of<Favorites>(context, listen: false).removeItemFromFavorites(widget.content);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.content.imagePath),
        title: Text(widget.content.name),
        subtitle: Text(widget.content.price),
        trailing: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(Icons.delete),
          onPressed: removeItemFromFavorites,
        ),
      ),
    );
  }
}
