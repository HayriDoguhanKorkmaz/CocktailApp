import 'package:coctailapp/constant.dart';
import 'package:coctailapp/services/Ingredient.dart';
import 'package:flutter/material.dart';

class IngredientWidget extends StatelessWidget {
  IngredientWidget({required this.ingredientList});
  final List<Ingredient> ingredientList;

  Widget createTable() {
    List<TableRow> rows = [];

    for (int i = 0; i < ingredientList.length; i++) {
      rows.add(
        TableRow(
          children: [
            Center(
              child: Text(ingredientList[i].name!),
            ),
            Center(
              child: Text(ingredientList[i].measure!),
            ),
          ],
        ),
      );
    }

    return Table(children: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ingredient",
          style: kTableTextStyle,
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: createTable(),
          ),
        ),
      ],
    );
  }
}
