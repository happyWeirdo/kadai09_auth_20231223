import 'package:flutter/material.dart';

import '../models/content.dart';



// ignore: must_be_immutable
class ContentTile extends StatelessWidget {
  Content content;
  void Function()? onTap;
  ContentTile({super.key, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // content pic
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(content.imagePath)),

          // description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              content.description, 
              style: const TextStyle(color: Colors.deepOrange),
            ),
          ),

          // price + details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // content name
                    Text(
                      content.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
            
                    const SizedBox(height: 5),
            
                    // content price
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      '¥' + content.price,
                      style: const TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),

                // button to add to favorite
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
