import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_components/my_receipt.dart';
import 'package:food_delivery_app/model/restaurent.dart';
import 'package:food_delivery_app/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgresspage extends StatefulWidget {
  const DeliveryProgresspage({super.key});

  @override
  State<DeliveryProgresspage> createState() => _DeliveryProgresspageState();
}

class _DeliveryProgresspageState extends State<DeliveryProgresspage> {

  // get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    // if we got this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt()
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // Custom Bottom Navigation Bar - Message / Call delivery driver
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          // Profile picture of the driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.person)),
          ),
          SizedBox(width: 10,),
          // driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Wick",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary
                ),  
              ),
              Text(
                "Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
                ),  
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
            // message button
             Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.message,color: Theme.of(context).colorScheme.primary,)),
            ),
            SizedBox(width: 10,),
            // call button
             Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.call,color: Colors.green,)),
            ),
            ],
          )
        ],
      ),
    );
  }
}