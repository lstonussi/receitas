import 'package:flutter/material.dart';
import 'package:receita/components/meal_item.dart';

import 'package:receita/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  const FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: favoriteMeal.isEmpty
          ? Center(
              child: Text('Sem Favorito'),
            )
          : ListView.builder(
              itemCount: favoriteMeal.length,
              itemBuilder: (_, index) {
                return MealItem(favoriteMeal[index]);
              }),
    );
  }
}
