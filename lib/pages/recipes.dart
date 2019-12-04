import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recepie/icons/food_icons.dart';
import 'package:recepie/model/item.dart';
import 'package:recepie/routing/route_names.dart';

class RecipesWidget extends StatefulWidget {
  @override
  _RecipesWidgetState createState() => _RecipesWidgetState();
}

class _RecipesWidgetState extends State<RecipesWidget> {
  static const double _globalPadding = 15;

  var _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff137345),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    )),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      _getTitleWidget(),
                      SizedBox(
                        height: _globalPadding,
                      ),
                      _getSearchWidget(),
                      SizedBox(
                        height: _globalPadding,
                      ),
                      _getCategoryPickerWidget(),
                      SizedBox(
                        height: _globalPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: _globalPadding),
                        child: Text(
                          'Trending',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: _globalPadding,
                      ),
                      _getTrendingDishes(),
                    ])),
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: <Widget>[],
              ),
            )
          ],
        ));
  }

  Widget _getTitleWidget() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: _globalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text('Search',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.title),
            SizedBox(
              height: 5,
            ),
            Text('for recipes', style: Theme.of(context).textTheme.subtitle)
          ],
        ),
      );

  Widget _getSearchWidget() => Padding(
        padding: const EdgeInsets.only(left: _globalPadding),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F1),
                    //Color.fromARGB( 0 ,244,244,241 ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.search),
                            hintText: ('dish name'),
                            border: InputBorder.none),
                      ),
                    ),
                  )),
            ),
            SizedBox(width: _globalPadding),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffF94B61), //Color.fromARGB( 0 ,244,244,241 ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25))),
              height: 50,
              width: 50 + 5.0,
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.remove, color: Color(0xffFDE5E9)),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      );

//  CATEGORY PICKER

  List _categories = [];

  Widget _getCategoryPickerWidget() => SizedBox(
        height: 75,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          _buildCategoryWidget('Thai', FoodIcons.fish, true),
          _buildCategoryWidget('Italian', FoodIcons.pizza),
          _buildCategoryWidget('American', FoodIcons.burger),
          _buildCategoryWidget('Japan', FoodIcons.dish),
          _buildCategoryWidget('Mexican', FoodIcons.jamaican_jerk_chicken),
        ]),
      );

  _buildCategoryWidget(String subtitle, IconData icon,
          [bool isActive = false]) =>
      SizedBox(
        width: MediaQuery.of(context).size.width / 3.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 25,
                color: isActive ? Color(0xffF94B61) : Color(0xff9C9C9C),
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  color: isActive ? Color(0xffF94B61) : Color(0xff9C9C9C),
                  fontSize: 15),
            )
          ],
        ),
      );

  List<Item> _items = [
    Item(
        asset: "assets/images/food.png",
        title: "Royal Paddington \nThai Salad",
        stars: 9.0,
        info: Info(cookingTime: 45, kcal: 215),
        ingredients: [
          Ingredient(name: 'Noodles', weight: 450),
          Ingredient(name: 'Butter', weight: 200),
          Ingredient(name: 'Lemon', weight: 10),
        ]),
    Item(
        asset: "assets/images/food.png",
        title: "Noodles with \nchicken",
        stars: 8.5,
        info: Info(cookingTime: 30, kcal: 200),
        ingredients: [
          Ingredient(name: 'Noodles', weight: 450),
          Ingredient(name: 'Butter', weight: 200),
          Ingredient(name: 'Lemon', weight: 10),
        ]),
    Item(
        asset: "assets/images/food.png",
        title: "Fresh Shrimps \nsalad",
        stars: 8.0,
        info: Info(cookingTime: 25, kcal: 198),
        ingredients: [
          Ingredient(name: 'Noodles', weight: 450),
          Ingredient(name: 'Butter', weight: 200),
          Ingredient(name: 'Lemon', weight: 10),
        ]),
  ];

  List<Color> _itemColors = [
    Color(0xffFEC16B),
    Color(0xffE2D0D2),
    Color(0xff409672)
  ];

//  TRENDING DISHES
  Widget _getTrendingDishes() => SizedBox(
        height: 220,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _items.length,
            itemBuilder: (context, index) => _buildItem(
                _items[index], _itemColors[index % _itemColors.length])),
      );

  Widget _buildItem(Item item, Color backgroundColor) => Container(
      width: 140,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(25)),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RouteNames.recipe_details, arguments: item);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(item.asset),
            ),
            Expanded(
              child: Text(
                item.title,
                maxLines: 2,
                style: TextStyle(fontSize: 12),
              ),
            ),
            Container(
                width: 55,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Color(0xffFD9B09),
                      size: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        item.stars.toStringAsFixed(1),
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ));
}
