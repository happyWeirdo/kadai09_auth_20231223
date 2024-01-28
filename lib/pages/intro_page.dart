// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'lib/images/newfunnewme-logo.png',
                  height: 240,
                ),
              ),
          
              // some empty space
              const SizedBox(height: 48),
          
              // title
              const Text(
                'We are here for a new you',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurple,
                ),
              ),
          
              const SizedBox(height: 24),
          
              // sub title
              const Text(
                'Explore new fun, and become new you!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.pink,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),
          
              // start now button
              GestureDetector(
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Explore Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),  
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
