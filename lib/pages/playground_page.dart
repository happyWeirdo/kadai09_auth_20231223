// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:my_favorite_app/models/favorites.dart';
import 'package:provider/provider.dart';

import '../components/content_tile.dart';
import '../models/content.dart';

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({super.key});

  @override
  State<PlaygroundPage> createState() => _PlayroundPageState();
}

class _PlayroundPageState extends State<PlaygroundPage> {
  // add content to favorites
  void addContentToFavorites(Content content) {
    Provider.of<Favorites>(context, listen: false).addItemToFavorites(content);

    // alert the user, content successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your favorites'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Favorites>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'We are here to help you find new you',
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),

          // hot picks, this is the main part of this entire app
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Hot Picks for you 🏕️',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // list of contents to enjoy
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get a content from playground list
                Content content = value.getContentList()[index];
                
                // Content content = Content(
                //     name: 'obungu',
                //     price: '0',
                //     description: 'cute fun healing short YouTube animation',
                //     imagePath: 'lib/images/obungu.png'
                // );

                // return the content
                return ContentTile(
                  content: content,
                  onTap: () => addContentToFavorites(content),
                );
              },
            ),
          ),

                const Padding(
                  padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                  child: Divider(
                    color: Colors.white,
                  ),
                )
              ],
            ));
  }
}
