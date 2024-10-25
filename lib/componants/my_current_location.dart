import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("your location"),
          content: TextField(
            decoration: const InputDecoration(
              hintText: "Search Address"
            ),

          ),
          actions: [
            MaterialButton(onPressed: ()=>Navigator.pop(context),
                child: Text("cancel"),
            ),
            MaterialButton(onPressed:()=>Navigator.pop(context),
              child: Text("Save"),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("deliver now",style: TextStyle(
            color: Theme.of(context).colorScheme.primary
          ),),
          GestureDetector(
            onTap: ()=> openLocationSearchBox(context),
            child: Row(
              children: [
                Text("6901 Hollywood Blv",style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),),
                Icon(
                  Icons.keyboard_arrow_down_rounded
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
