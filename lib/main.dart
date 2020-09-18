import 'package:flutter/material.dart';
import 'package:receita/screens/categories_meal_screen.dart';
import 'package:receita/screens/category_screen.dart';
import 'package:receita/screens/meal_detail_screen.dart';
import 'package:receita/screens/settings_screen.dart';
import 'package:receita/screens/tabs_screen.dart';
import 'package:receita/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (_) => TabScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealScreen(),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(),
        AppRoutes.SETTINGS: (_) => SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return CategoryScreen();
          },
        );
      },
    );
  }
}
