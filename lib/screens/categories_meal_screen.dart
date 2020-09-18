import 'package:flutter/material.dart';
import 'package:receita/components/meal_item.dart';
import 'package:receita/data/dummy_data.dart';
import 'package:receita/models/category.dart';

class CategoriesMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeal = DUMMY_MEALS
        .where((element) => element.categories.contains(category.id))
        .toList();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: categoryMeal.length,
              itemBuilder: (_, index) {
                return MealItem(categoryMeal[index]);
              }),
        ),
      ),
    );
  }
}
