import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_service.dart';

import '../componants/my_button.dart';
import '../componants/my_textfields.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

   RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController=TextEditingController();

  final TextEditingController passController=TextEditingController();

  final TextEditingController ConfirmpassController=TextEditingController();

   void register()async {
     final _authService = AuthService();
     if (passController.text == ConfirmpassController.text) {
       try {
         await _authService.signUpWithEmailAndPassword(
             emailController.text, passController.text);
       } catch (e) {
         showDialog(context: context, builder: (context) =>
             AlertDialog(
               title: Text(e.toString()),
             ));
       }
     }else{
       showDialog(context: context, builder: (context) =>
           AlertDialog(
             title: Text("Password do not match!"),
           ));
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //logo
            Icon(Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,),
      
          const SizedBox(
            height: 25,
          ),
      
          Text("Let's create an account for you",
              style: TextStyle(fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary)),
      
          const SizedBox(
            height: 25,
          ),
      
          MyTextfields(
              controller: emailController,
              hintText: "email..",
              obscureText: false),
      
          const SizedBox(
            height: 10,
          ),
      
          MyTextfields(
              controller: passController,
              hintText: "password",
              obscureText: true),
      
              const SizedBox(
                height: 10,
              ),
      
              MyTextfields(
                  controller: ConfirmpassController,
                  hintText: "confirm password",
                  obscureText: true),
      
      
              const SizedBox(
            height: 10,
          ),
          MyButton(text: "Sign Up", onTap: register),
      
          const SizedBox(
            height: 10,
          ),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Already have an account?",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
          const SizedBox(
            width: 4,
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Text(
              "Login Now",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold),
            ),
          ),
      
      
        ],
      )
      
      
      ],
      ),
      ),
      );

  }
}
