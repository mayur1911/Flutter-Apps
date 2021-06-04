import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title':'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title':'Your Favorites',
    },
  ];
  /* final List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen(),
  ]; */
  int _selectedIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectTab,
          backgroundColor: Colors.pink[200], //Theme.of(context).primaryColor,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          elevation: 20,
          type: BottomNavigationBarType.fixed, // shifting is also available
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.pink[200],
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.pink[200],
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            ),
          ]),
    );
  }
}

/* 
return DefaultTabController(
      //initialIndex: 0,  NOT neede here, 1 for 2nd tab
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoritesScreen(),
        ]),
      ),
    ); */
