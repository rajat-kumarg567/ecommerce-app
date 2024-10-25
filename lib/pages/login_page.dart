
import 'package:flutter/material.dart';
import 'package:food_delivery_app/componants/my_button.dart';
import 'package:food_delivery_app/componants/my_textfields.dart';

import '../auth/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {


  final void Function()? onTap;

   LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();


  void login() async {
    //
    final AuthService _authService = AuthService();
    try {
      await _authService.signInWithEmailAndPassword(
          emailController.text, passController.text);
    } catch (e) {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Text(e.toString()),
          ));
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .background,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(Icons.lock_open_rounded,
                  size: 100,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .inversePrimary,),

                const SizedBox(
                  height: 25,
                ),

                Text("Food Delivery App",
                    style: TextStyle(fontSize: 16,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .inversePrimary)),

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
                MyButton(text: "Sign In", onTap: login),

                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("not a member?",
                      style: TextStyle(color: Theme
                          .of(context)
                          .colorScheme
                          .inversePrimary),),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register Now",
                        style: TextStyle(color: Theme
                            .of(context)
                            .colorScheme
                            .inversePrimary,
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
//change1
