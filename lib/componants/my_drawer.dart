import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/componants/my_drawer_tile.dart';

import '../auth/auth_service.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logOut() async{
    final AuthService _authService = AuthService();
    _authService.SignOut();
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(Icons.lock_open_rounded,
            size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,),
          ),
          
          Padding(padding: EdgeInsets.all(25),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),),

          MyDrawerTile(onTap: ()=>Navigator.pop(context), text: "H O M E", icon: Icons.home),

          MyDrawerTile(onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
          }, text: "S E T T I N G S", icon: Icons.settings),

          const Spacer(),

          MyDrawerTile(onTap: logOut, text: "L O G O U T", icon: Icons.logout),

          const SizedBox(
            height: 25,
          )


        ],
      ),
    );
  }
}
