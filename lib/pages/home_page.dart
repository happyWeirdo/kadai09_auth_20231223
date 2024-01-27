import 'package:flutter/material.dart';
import 'package:my_favorite_app/components/bottom_nav_bar.dart';
import 'myfavorites_page.dart';
import 'playground_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // playground page
    const PlaygroundPage(),

    // my favorites page
    const MyFavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.deepOrange,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.deepOrange[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // logo
                  DrawerHeader(
                    child: Image.asset(
                      'lib/images/newfunnewme-logo.png',
                      // color: Colors.white,
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Divider(color: Colors.grey[800]),
                  // ),

                  // other pages
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.home, color: Colors.white),
                      title: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.info, color: Colors.white),
                      title: Text(
                        'About',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
      body: _pages[_selectedIndex],
    );
  }
}
