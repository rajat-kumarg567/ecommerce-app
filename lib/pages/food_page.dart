import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/componants/my_button.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon,bool> selectedAddons={};
  FoodPage({super.key,
  required this.food}){
   for(Addon addon in food.availableAddons){
     selectedAddons[addon]=false;
   }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //function to add cart
void addToCart(Food food,Map<Addon,bool> selectedAddons){
  //close to current food page
  Navigator.pop(context);
  //format the selected addon
  List<Addon> currentlySelectedAddons=[];
  for(Addon addon in widget.food.availableAddons){
    if(widget.selectedAddons[addon]==true){
      currentlySelectedAddons.add(addon);
    }
  }
  //add to cart
  context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(

              children: [
                //food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.food.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),

                      Text("\$"+widget.food.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),

                      //food description
                      Text(widget.food.description
                        ,style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                        ),),

                      const SizedBox(
                        height: 10,
                      ),

                      Text("Addons ",style: TextStyle(fontWeight: FontWeight.bold),),

                      //addons
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context,index){
                              Addon addon=widget.food.availableAddons[index];
                              return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Text("\$"+addon.price.toString()),
                                  value: widget.selectedAddons[addon],
                                  onChanged: (bool? value){
                                    setState(() {

                                      widget.selectedAddons[addon]=value!;
                                    });

                                  });
                            }),
                      )
                    ],
                  ),
                ),
                //button->Add to cart
                MyButton(text: "Add to cart", onTap: ()=>addToCart(widget.food,widget.selectedAddons)),
                const SizedBox(
                  height: 25,
                )


              ],
            ),
          ),
        ),

        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: ()=>Navigator.pop(context),
              ),
            ),
          ),
        )
      ],


    );
  }
}
