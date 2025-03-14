

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/componants/my_current_location.dart';
import 'package:food_delivery_app/componants/my_description.dart';
import 'package:food_delivery_app/componants/my_food_tile.dart';
import 'package:food_delivery_app/componants/my_silver_app_bar.dart';
import 'package:food_delivery_app/componants/my_tabar.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/food_page.dart';
import 'package:provider/provider.dart';

import '../componants/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController=TabController(length:FoodCategory.values.length, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  //sort out and list of all the items that belongs to its specific category
  List<Food> _filterMenuByCategory(FoodCategory category,List<Food> fullMenu){
    return fullMenu.where((food)=>food.category==category).toList();
  }
  // return list of given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){
      List<Food> categoryMenu=_filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context,index){
          final food=categoryMenu[index];
          return FoodTile(
            onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>FoodPage(food: food))),
            food: food,);
          });
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                drawer: MyDrawer(),
                body: NestedScrollView(
                  headerSliverBuilder: (context,innerBoxIsScolled)=>[
                    MySliverAppBar(
                        title: MyTabBar(tabController: _tabController,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      //current location
                      MyCurrentLocation(),

                      MyDescriptionBox(),
                  ],
                ),

                    )
                  ],
                  body: Consumer<Restaurant>(
                    builder: (context,restaurant,child)=>
                        TabBarView(
                          controller: _tabController,
                            children:getFoodInThisCategory(restaurant.menu)),),






              ),
        );





  }
}
