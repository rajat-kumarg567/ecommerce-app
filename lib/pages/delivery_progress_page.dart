import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/componants/my_receipt.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/services/database.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  FirestoreService db=FirestoreService();
  @override
  void initState() {
    super.initState();
    //if we get to this page,submit orders fireStore db
    String receipt=context.read<Restaurant>().displayCartReceipt();
    db.saveOrdeToDatabase(receipt);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          MyReceipt()
        ],
      ),


    );

  }


  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
          )
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          // profile pic of driver
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.person),
            ),
          ),
          const SizedBox(width: 10,),
          //driver details
          Column(

            children: [
              Text("Rajat ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
              Text("Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,

                ),),
            ],
          ),

          const Spacer(),
          Row(
            children: [

              //message button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.message,
                    color: Theme.of(context).colorScheme.primary,),
                ),
              ),
               SizedBox(
                width: 10,
              ),

              //call Button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.call,
                    color: Theme.of(context).colorScheme.primary,),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}

