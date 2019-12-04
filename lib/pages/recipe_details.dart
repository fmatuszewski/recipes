import 'package:flutter/material.dart';
import 'package:recepie/model/item.dart';

class RecipeDetailsWidget extends StatefulWidget {
  Item _item;

  @override
  _RecipeDetailsWidgetState createState() => _RecipeDetailsWidgetState();

  RecipeDetailsWidget(this._item);
}

class _RecipeDetailsWidgetState extends State<RecipeDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        _buildHeader(widget._item),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0),
          child: Text('Ingredients',style:TextStyle(fontSize: 16),),
        ),
        SizedBox(
          height: 10,
        ),
//        _buildIngredients(widget._item)
      ]),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              Text(
                'Buy',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Container(
                height: 50,
                width: 200,
                padding: EdgeInsets.only(left: 30, right: 10),
                decoration: BoxDecoration(
                    color: Color(0xffFD9B09),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Start Cooking',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        iconSize: 20,
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                        color: Color(0xffFD9B09),
                        onPressed: () {
//                    TODO: implement cooking
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Item item) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40))),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(icon: Icon(Icons.keyboard_arrow_left),onPressed: (){
                  Navigator.of(context).pop();
                },),
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(top:12.0),
                  child: Text(item.title,style:TextStyle(fontSize:20)),
                )),
                IconButton(icon: Icon(Icons.favorite_border),onPressed: (){
//                  TODO: add implementation of adding to favourites
                },),




              ],
            ),
            Center(
              child: Image.asset(item.asset),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildInfo('${item?.info?.cookingTime??'??'} min', Icons.access_time),
                _buildInfo('${item?.stars?.toStringAsFixed(2)??'??'} rate', Icons.star_border),
                _buildInfo('${item?.info?.kcal??'??'} kcal', Icons.whatshot)
              ],
            )
          ],
        ));
  }

  Widget _buildIngredients(Item item) => ListView.builder(
      itemCount: item?.ingredients?.length ?? 0,
      itemBuilder: (context, index) =>
          _buildIngredientWidget(item.ingredients[index]));

  _buildIngredientWidget(Ingredient ingredient) => Container();

  Widget _buildInfo(String message, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 25,
          color: Color(0xff9C9C9C),
        ),
        Text(message, style: TextStyle(color: Color(0xff9C9C9C), fontSize: 15))
      ],
    );
  }
}
