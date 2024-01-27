import 'package:flutter/material.dart';

import 'content.dart';

class Favorites extends ChangeNotifier {
  // list of contents for sale
  List<Content> contentPlayground = [
    Content(
      name: 'Obungu',
      price: '0',
      description: 'Cute healing funny YouTube short animations',
      imagePath: 'lib/images/obungu.png',
    ),
    Content(
      name: 'Artbio',
      price: '0',
      description: 'Art Biotop is a nurturing environment for art.',
      imagePath: 'lib/images/artbio.jpeg',
    ),
    Content(
      name: 'Komadeike',
      price: '7000',
      description: 'A beautiful lakeside camp filed in highland Nagano',
      imagePath: 'lib/images/camp.jpeg',
    ),
    Content(
      name: 'Neko Ryokan',
      price: '10000',
      description: 'Relaxing Ryokan with cats in Osaka',
      imagePath: 'lib/images/nekoryokan.jpeg',
    ),
  ];

  // list of items in user's My favorites
  List<Content> favorites = [];

  // get list of contents for sale
  List<Content> getContentList() {
    return contentPlayground;
  }

  // get my favorites
  List<Content> getFavorites() {
    return favorites;
  }

  // add items to favorites
  void addItemToFavorites(Content content) {
    favorites.add(content);
    notifyListeners();
  }

  // remove item from favorites
  void removeItemFromFavorites(Content content) {
    favorites.remove(content);
    notifyListeners();
  }
}
