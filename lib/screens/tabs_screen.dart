import 'package:flutter/material.dart';
import 'package:receita/components/main_drawer.dart';
import 'package:receita/screens/category_screen.dart';
import 'package:receita/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectScreenIndex = 0;

  final List<Map<String, Object>> _screens = [
    {'title': 'Categorias', 'screen': CategoryScreen()},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen()},
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectScreenIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _screens[_selectScreenIndex]['screen'],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categorias'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favoritos '),
            ),
          ],
          onTap: _selectScreen,
        ),
      ),
    );
  }
}
