import 'dart:convert';
import 'package:coctailapp/constant.dart';
import 'package:coctailapp/services/Ingredient.dart';
import 'package:coctailapp/services/cocktail_manager.dart';
import 'package:coctailapp/ui_windows/result_window.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SearchWindow extends StatefulWidget {
  const SearchWindow({super.key});

  @override
  State<SearchWindow> createState() => _SearchWindowState();
}

class _SearchWindowState extends State<SearchWindow> {
  late String cocktailName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // klavye açılınca pixel yetersizliği oluyordu onu fixleyen kod
      body: SafeArea(
        //yazıları güvenli yere çekiyor
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //logo yazısı buraya şekilli logo yapılır :D
              SizedBox(
                height: 90,
              ),
              Center(
                child: Text(
                  "Mixster",
                  style: TextStyle(fontSize: 70),
                ),
              ),

              SizedBox(height: 100),

              // Text Input
              TextField(
                onChanged: (value) {
                  cocktailName = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Enter a cocktail name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: kBorderSide,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: kBorderSide,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Search Button
              ElevatedButton(
                onPressed: () async {
                  // null değer gelirse program patlamasın
                  if (cocktailName == null) return;

                  cocktailName.toLowerCase().replaceAll(' ', '_');

                  CocktailManager cm = CocktailManager(
                      name: "",
                      category: "",
                      alcoholic: "",
                      glassType: "",
                      pictureUrl: "",
                      instructions: "",
                      ingredients: List.empty());

                  var network = await get(
                      Uri.parse(kMainUrl + cocktailName)); //apiye gitme

                  var json =
                      jsonDecode(network.body); //json dosyası decode etme

                  cm.name = json['drinks'][0]['strDrink'];
                  cm.alcoholic = json['drinks'][0]['strAlcoholic'];
                  cm.glassType = json['drinks'][0]['strGlass'];
                  cm.pictureUrl = json['drinks'][0]['strDrinkThumb'];
                  cm.category = json['drinks'][0]['strCategory'];
                  cm.instructions = json['drinks'][0][
                      'strInstructions']; //cocktail managerdaki propların verilerini çekiyoruz

                  String strIngredientName, strIngredientMeasure;
                  List<Ingredient> ingrdientList = [];

                  for (int i = 1; i < 16; i++) {
                    //max 15 malzeme var o yüzden count 15 0-15 1-16
                    strIngredientName = 'strIngredient' + i.toString();
                    strIngredientMeasure = 'strMeasure' + i.toString();

                    ingrdientList.add(
                      Ingredient(
                        name: json['drinks'][0][strIngredientName],
                        measure: json['drinks'][0][strIngredientMeasure],
                      ),
                    );
                  }

                  ingrdientList.removeWhere((element) =>
                      element.name == null && element.measure == null);

                  ingrdientList.forEach((element) {
                    if (element.measure == null) {
                      element.measure = ' ';
                    }
                  });

                  cm.ingredients = ingrdientList;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ResultWindow(
                          name: cm.name,
                          category: cm.category,
                          alcoholic: cm.alcoholic,
                          glassType: cm.glassType,
                          pictureUrl: cm.pictureUrl,
                          instructions: cm.instructions,
                          ingredients: cm.ingredients);
                    }),
                  );
                },
                child: Text("Search"),
                style: ElevatedButton.styleFrom(
                  primary: kComponentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: kButtonMinSize,
                ),
              ),

              SizedBox(height: 20),

              // Random Button
              ElevatedButton(
                onPressed: () async {
                  CocktailManager cm = CocktailManager(
                      name: "",
                      category: "",
                      alcoholic: "",
                      glassType: "",
                      pictureUrl: "",
                      instructions: "",
                      ingredients: List.empty());

                  var network = await get(Uri.parse(kRandomUrl));

                  var json = jsonDecode(network.body);

                  cm.name = json['drinks'][0]['strDrink'];
                  cm.alcoholic = json['drinks'][0]['strAlcoholic'];
                  cm.glassType = json['drinks'][0]['strGlass'];
                  cm.pictureUrl = json['drinks'][0]['strDrinkThumb'];
                  cm.category = json['drinks'][0]['strCategory'];
                  cm.instructions = json['drinks'][0]['strInstructions'];

                  String strIngredientName, strIngredientMeasure;
                  List<Ingredient> ingrdientList = [];

                  for (int i = 1; i < 16; i++) {
                    strIngredientName = 'strIngredient' + i.toString();
                    strIngredientMeasure = 'strMeasure' + i.toString();

                    ingrdientList.add(
                      Ingredient(
                        name: json['drinks'][0][strIngredientName],
                        measure: json['drinks'][0][strIngredientMeasure],
                      ),
                    );
                  }

                  ingrdientList.removeWhere((element) =>
                      element.name == null && element.measure == null);

                  ingrdientList.forEach((element) {
                    if (element.measure == null) {
                      element.measure = ' ';
                    }
                  });

                  cm.ingredients = ingrdientList;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ResultWindow(
                          name: cm.name,
                          category: cm.category,
                          alcoholic: cm.alcoholic,
                          glassType: cm.glassType,
                          pictureUrl: cm.pictureUrl,
                          instructions: cm.instructions,
                          ingredients: cm.ingredients);
                    }),
                  );
                },
                child: Text("Random"),
                style: ElevatedButton.styleFrom(
                  primary: kComponentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: kButtonMinSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
