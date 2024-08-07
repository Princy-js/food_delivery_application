import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/custom_components/my_button.dart';
import 'package:food_delivery_app/custom_components/my_text_field.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/services/authentication/auth_services.dart';

class Loginpage extends StatefulWidget {
  final void Function()? onTap;
  const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Login method
  void login() async{
   // get instance of auth service
   final _authService = AuthService();

   // try sign in
   try {
    await _authService.signInWithEmailPassword(emailController.text, passwordController.text,);
   }

   // display any errors
   catch(e) {
    showDialog(
      // ignore: use_build_context_synchronously
      context: context, 
      builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      )
    );
   }
  }

  // forgot password
  // void forgotPw() {
  //   showDialog(
  //     context: context, 
  //     builder: (context)=> AlertDialog(
  //       backgroundColor: Theme.of(context).colorScheme.background,
  //       title: Text("User tapped forgot password"),
  //     )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            SizedBox(
              height: 25,
            ),
            //message,app slogan
            Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false),
            SizedBox(
              height: 15,
            ),
            MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true),
            SizedBox(
              height: 25,
            ),
            MyButton(
             onTapped: login,
             text: 'Sign In'),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a User?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
