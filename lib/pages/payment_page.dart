import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/componants/my_button.dart';

import 'delivery_progress_page.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  String  cardNumber='';
  String  expiryDate='';
  String  cardHolderName='';
  String cvvCode='';

  bool  isCvvFocused=false;

  void userTappedPay(){
    if(formkey.currentState!.validate()){
      //only show dialog if form is valid
      showDialog(context: context, builder: (Context)=>AlertDialog(
        title: const Text("Confirm Payment"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("cardNumber: $cardNumber"),
              Text("expiryDate:$expiryDate"),
              Text("card Holder Name:$cardHolderName"),
              Text("CCV:$cvvCode"),
            ],
          ),
        ),
        actions: [
          //cancel button
          TextButton(
              onPressed: ()=>Navigator.pop(context),
              child: const Text("cancel")),
          //Yes Button
          TextButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(context,
    MaterialPageRoute(builder: (context)=>DeliveryProgressPage()));
    },
              child: const Text("Yes")),


        ],
      ));
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Checkout"),
      ),
      body: Column(
        children: [
          //credit card
           CreditCardWidget(
             cardHolderName:cardHolderName ,
             cardNumber: cardNumber,
             expiryDate: expiryDate,
             cvvCode: cvvCode,
             showBackView: isCvvFocused,
             onCreditCardWidgetChange: ( p0) {  }
             ,),

          //Credit CardForm
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data){
                setState(() {
                  cardNumber=data.cardNumber;
                  expiryDate=data.expiryDate;
                  cardHolderName=data.cardHolderName;
                  cvvCode=data.cvvCode;
                });
              },
              formKey: formkey),

          const Spacer(),

          //pay button
          MyButton(text: "Pay now", onTap:userTappedPay ),
            const SizedBox(
              height: 25,
            )

        ],
      ),
    );
  }
}
