import 'package:flutter/material.dart';
import 'package:recepie/pages/recipes.dart';
import 'package:recepie/routing/route_names.dart';
import 'package:recepie/routing/routing.dart' as routing;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          subtitle: TextStyle(fontSize: 22, fontWeight:  FontWeight.w300),
        ),
        primarySwatch: Colors.blue,
      ),
      home: RecipesWidget(),
      onGenerateRoute: routing.generateRoute,
      initialRoute: RouteNames.recipes,
    );
  }
}

