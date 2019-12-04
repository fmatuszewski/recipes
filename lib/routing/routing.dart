import 'package:flutter/material.dart';
import 'package:recepie/model/item.dart';
import 'package:recepie/pages/recipe_details.dart';
import 'package:recepie/pages/recipes.dart';
import 'package:recepie/routing/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings){

  switch(settings.name){
    case RouteNames.recipes:
      return MaterialPageRoute(builder: (context)=> RecipesWidget());
    case RouteNames.recipe_details:
      Item item = settings.arguments;
      return MaterialPageRoute(builder: (context)=> RecipeDetailsWidget(item));
    default:
      return MaterialPageRoute(builder: (context)=> RecipesWidget());
  }
}