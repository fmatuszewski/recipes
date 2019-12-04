class Ingredient {
  final String name;
  final double weight;

  Ingredient({this.name, this.weight});
}

class Info {
  int cookingTime;
  int kcal;
  Info({this.cookingTime,this.kcal});
}

class Item {
  final String asset;
  final String title;
  final double stars;
  final Info info;

  final List<Ingredient> ingredients;

  Item(
      {this.asset,
      this.title,
      this.stars,
      this.info,
      this.ingredients = const []});
}
