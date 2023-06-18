import 'package:coctailapp/constant.dart';
import 'package:coctailapp/services/Ingredient.dart';
import 'package:coctailapp/ui_compenents/ingredient_widget.dart';
import 'package:coctailapp/ui_compenents/instruction_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';




class ResultWindow extends StatelessWidget {
    final String ?name;
    final String ?category;
    final String ?alcoholic;
    final String ?glassType;
    final String ?pictureUrl;
    final String ?instructions;
    final List<Ingredient> ?ingredients;

   ResultWindow({
     this.name,
     this.category,
     this.alcoholic,
     this.glassType,
     this.pictureUrl,
     this.instructions,
     this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Kokteyl adi
            Center(
              child: Text(
                name.toString(),
                style: kHeaderTextStyle,
              ),
            ),

            //Kokteyl detaylari alani
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              decoration: BoxDecoration(
                color: kGroupBackgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(category.toString()),
                  Text("-"),
                  Text(alcoholic.toString()),
                  Text('-'),
                  Text(glassType.toString()),
                ],
              ),
            ),

            //Kokteyl Resim
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(pictureUrl.toString()), //json null geliyor
                ),
              ),
            ),

            //Kokteyl Icindekiler
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 150,
              decoration: kBoxDecorationStyle,
              child: IngredientWidget(ingredientList: ingredients!,),
            ),

            //Kokteyl Talimatlar
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 150,
              decoration: kBoxDecorationStyle,
              child: InstructionWidget(
                instructions: instructions.toString(),
              ),
            ),

            //Geri don button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Turn Back"),
                style: ElevatedButton.styleFrom(
                    primary: kComponentColor,
                    minimumSize: kButtonMinSize,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('category', category));
  }
}
