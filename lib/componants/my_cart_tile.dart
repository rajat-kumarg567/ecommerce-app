import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/componants/cart_item.dart';
import 'package:food_delivery_app/componants/my_quantity_selector.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';



class MyCartTile extends StatelessWidget {
  final cartItem cartitem;
  const MyCartTile({super.key,required this.cartitem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:(context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)
        ),
      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //food image
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(cartitem.food.imagePath,
                height: 100,
                width: 100,),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food name
                  Text(cartitem.food.name),

                  //food price
                  Text("\$"+cartitem.food.price.toString()),

                  const SizedBox(
                    height: 10,
                  ),

                  //increment or decrement quantity
                  MyQuantitySelector(
                      quantity: cartitem.quantity,
                      food: cartitem.food,
                      onDecreament: (){
                        restaurant.removeFromCart(cartitem);
                      },
                      onIncreament: (){
                        restaurant.addToCart(cartitem.food, cartitem.selectedAddons);
                      })


                ],
              ),



            ],
          ),
        ),
          //Addons
          SizedBox(
            height: cartitem.selectedAddons.isEmpty?0:60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              children: cartitem.selectedAddons.map((addon)=>FilterChip(
                padding: EdgeInsets.only(right: 8.0),
                  label: Row(
                      children: [
                        //sddon name
                        Text(addon.name),
                        
                        //addon price
                        Text(" "+"\$"+addon.price.toString())
                      ],
                  ),
                  shape: StadiumBorder(side: BorderSide(
                    color: Theme.of(context).colorScheme.primary
                  )),
                  onSelected: (value){},
              backgroundColor: Theme.of(context).colorScheme.secondary,
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12
                  ),),

            ).toList()
            )
          )
        ],
      ),
    ),);
  }
}
