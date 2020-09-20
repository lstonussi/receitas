import 'package:flutter/material.dart';
import 'package:receita/components/main_drawer.dart';
import 'package:receita/models/meal.dart';
import 'package:receita/screens/category_screen.dart';
import 'package:receita/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  const TabScreen(this.favoriteMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectScreenIndex = 0;

/*
 Antes, dessa forma dava problema no widget: The instance member 'widget' can't be accessed in an initializer.
 para resolver foi preciso inicializar o map no initstate, declarando o _screens antes 
  final List<Map<String, Object>> _screens = [
    {'title': 'Categorias', 'screen': CategoryScreen()},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen(widget.favoriteMeal)},
  ];
*/

  List<Map<String, Object>> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Categorias', 'screen': CategoryScreen()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeal)
      },
    ];
  }

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
