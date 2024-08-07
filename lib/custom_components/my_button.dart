import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTapped;
  final String text; 
  const MyButton({
    super.key,
    required this.onTapped,
    required this.text
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}