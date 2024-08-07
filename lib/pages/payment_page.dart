import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/custom_components/my_button.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false; 

  // user wants to pay
  void userTappedPay(){
    if(formKey.currentState!.validate()){
      // only show dialog if the form is valid
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          title: Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number : $cardNumber"),
                Text("Expiry Date : $expiryDate"),
                Text("Card Holder Name  : $cardHolderName"),
                Text("CVV : $cvvCode")
              ],
            ),
          ),
          actions: [
            // cancel button
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text("Cancel")),
            // yes button
            TextButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryProgresspage()));
              }, 
              child: Text("Yes"))
          ],
        )
      ); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // credit card
            CreditCardWidget(
              cardBgColor: Theme.of(context).colorScheme.inversePrimary,
              cardNumber: cardNumber, 
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName, 
              cvvCode: cvvCode, 
              showBackView: isCvvFocused, 
              onCreditCardWidgetChange: (p0) {},
            ),
        
            // credit card form
            CreditCardForm(
              cardNumber: cardNumber, 
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName, 
              cvvCode: cvvCode, 
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              }, 
              formKey: formKey
            ),
            SizedBox(height: 150,),
            MyButton(
              onTapped: ()=>userTappedPay(), 
              text: "Pay now"
            )
          ],
        ),
      ),
    );
  }
}