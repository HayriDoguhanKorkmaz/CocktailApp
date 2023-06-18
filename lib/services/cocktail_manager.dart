//kokteyllerin kendi özelliklerinin olduğu class

import 'package:coctailapp/services/Ingredient.dart';

class CocktailManager {
  //required hatası alıyordum devam edebilmek için nullable olabiliceği ifade eden ? koydum
  String name;
  String category;
  String alcoholic;
  String glassType;
  String pictureUrl;
  String instructions;
  List<Ingredient> ingredients;

  CocktailManager(
      {
        required this.name,
        required this.category,
        required this.alcoholic,
        required this.glassType,
        required this.pictureUrl,
        required this.instructions,
        required this.ingredients
      }
    );
}
