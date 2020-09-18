import 'package:flutter/material.dart';

import 'package:receita/models/meal.dart';
import 'package:receita/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(
    this.meal,
  );

  @override
  Widget build(BuildContext context) {
    _selectMeal() {
      Navigator.of(context)
          .pushNamed(
        AppRoutes.MEAL_DETAIL,
        arguments: meal,
      )
          .then((result) {
        if (result == null) {
          print('Sem resultado');
        } else {
          print('O nome da refeição é $result');
        }
      });
    }

    return Container(
      child: InkWell(
        onTap: () => _selectMeal(),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 5,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(
                        meal.title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${meal.duration} min')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(meal.complexitText)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(
                          width: 6,
                        ),
                        Text(meal.costText)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
