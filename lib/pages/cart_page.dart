import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/componants/my_button.dart';
import 'package:food_delivery_app/componants/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart=restaurant.cart;
      return Scaffold(
        appBar: AppBar(title: Text("Cart"),
          backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context,
                builder: (context)=>AlertDialog(
                  title: const Text("Are you sure you want to clear the cart"),
                  actions: [
                    //cancel button
                    TextButton(
                        onPressed: ()=>Navigator.pop(context),
                        child: Text("cancel"),),


                    //yes button
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                        restaurant.clearCart();
                      },
                      child: Text("yes"),),
                  ],
                ));
          }, icon: Icon(Icons.delete))
        ],),

        body: Column(
          
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty? const Expanded(
                      child: Center(
                          child: Text("cart is empty..")))
                      :Expanded(child: ListView.builder(
                    itemCount: userCart.length,
                      itemBuilder: (context,index){
                      final cartItem=userCart[index];
                      return MyCartTile(
                          cartitem: cartItem);
                      }
              
              
              ),
                  )
                ],
              ),
            ),
            MyButton(text: "Go to Checkout", onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>PaymentPage()));
            }),
            SizedBox(
              height: 25,
            )
          ],
        ),


      );
    },);
  }
}
