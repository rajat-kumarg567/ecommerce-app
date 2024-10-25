import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/pages/login_page.dart';
import 'package:food_delivery_app/pages/register_page.dart';

class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  State<RegisterOrLogin> createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  bool ShowLogInPage = true;

  void togglePage(){
    setState(() {
      ShowLogInPage=!ShowLogInPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(ShowLogInPage){
      return LoginPage(onTap: togglePage);
    }else{
      return RegisterPage(onTap: togglePage);
    }
  }
}
