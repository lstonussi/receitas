import 'package:flutter/material.dart';
import 'package:receita/components/category_item.dart';
import 'package:receita/data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, //tamanho max de cada elemento
        childAspectRatio: 3 / 2, //proporção
        crossAxisSpacing: 20, //Espaçamento no eixo cruzado
        mainAxisSpacing: 20, //Espaçamento no eixo principal
      ),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoryItem(cat);
      }).toList(),
    );
  }
}
