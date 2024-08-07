

// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/custom_components/my_button.dart';
// import 'package:food_delivery_app/custom_components/my_text_field.dart';
// import 'package:food_delivery_app/services/authentication/auth_services.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class RegisterPage extends StatefulWidget {
//   final void Function()? onTap;
//   const RegisterPage({super.key, required this.onTap});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Ensure Firebase is initialized
//     initializeFirebase();
//   }

//   void initializeFirebase() async {
//     await Firebase.initializeApp();
//   }

//   // Register method
//   void register() async {
//     // Get the auth service
//     final _authService = AuthService();
//     // Check if the passwords match -> create user
//     if (passwordController.text == confirmPasswordController.text) {
//       // Try creating user
//       try {
//         await _authService.signUpWithEmailPassword(
//           emailController.text,
//           passwordController.text,
//         );
//         // Navigate to the next page or show success message
//       } on FirebaseAuthException catch (e) {
//         String message;
//         switch (e.code) {
//           case 'weak-password':
//             message = 'The password provided is too weak.';
//             break;
//           case 'email-already-in-use':
//             message = 'The account already exists for that email.';
//             break;
//           case 'invalid-email':
//             message = 'The email address is not valid.';
//             break;
//           case 'operation-not-allowed':
//             message = 'Operation not allowed. Please contact support.';
//             break;
//           default:
//             message = 'An unknown error occurred. Please try again later.';
//         }
//         showErrorDialog(message);
//       } catch (e) {
//         showErrorDialog(e.toString());
//       }
//     } else {
//       // If passwords don't match -> show error
//       showErrorDialog("Passwords do not match!");
//     }
//   }

//   void showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Error"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Logo
//               Icon(
//                 Icons.lock_open_rounded,
//                 size: 100,
//                 color: Theme.of(context).colorScheme.inversePrimary,
//               ),
//               SizedBox(height: 25),
//               // Message, app slogan
//               Text(
//                 "Let's create an account",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Theme.of(context).colorScheme.inversePrimary,
//                 ),
//               ),
//               SizedBox(height: 25),
//               MyTextField(
//                 controller: emailController,
//                 hintText: 'Email',
//                 obscureText: false,
//               ),
//               SizedBox(height: 15),
//               MyTextField(
//                 controller: passwordController,
//                 hintText: 'Password',
//                 obscureText: true,
//               ),
//               SizedBox(height: 15),
//               MyTextField(
//                 controller: confirmPasswordController,
//                 hintText: 'Confirm Password',
//                 obscureText: true,
//               ),
//               SizedBox(height: 25),
//               MyButton(
//                 onTapped: register,
//                 text: 'Sign Up',
//               ),
//               SizedBox(height: 25),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Already have an account?",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   GestureDetector(
//                     onTap: widget.onTap,
//                     child: Text(
//                       "Login Now",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.inversePrimary,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/custom_components/my_button.dart';
import 'package:food_delivery_app/custom_components/my_text_field.dart';
import 'package:food_delivery_app/services/authentication/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // register method
  void register() async{
    // get the auth service
    final _authService = AuthService();
    // check if the passwords match -> create user
    if (passwordController.text == confirmPasswordController.text){
      // try creating user
      try {
        await _authService.signUpWithEmailPassword(emailController.text, passwordController.text,);
      }

      // display any errors
      catch(e) {
        showDialog(
          context: context, 
          builder: (context)=> AlertDialog(
            title: Text(e.toString()),
          )
        );
      }
    }
    // if passwords don't match -> show error
    else{
      showDialog(
        context: context, 
        builder: (context)=> AlertDialog(
          title: Text("Passwords not match!"),
        )
      ); 
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
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
              ),
        
              SizedBox(height: 25,),
            //message,app slogan
            Text(
              "Let's create an account" ,
              style: TextStyle( 
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ) ,
            SizedBox(height: 25,),
            MyTextField(
              controller: emailController, 
              hintText: 'Email', 
              obscureText: false
            ),
             SizedBox(height: 15,), 
            MyTextField(
              controller: passwordController, 
              hintText: 'Password', 
              obscureText: true
            ),
             SizedBox(height: 15,), 
            MyTextField(
              controller: confirmPasswordController, 
              hintText: 'Confirm Password', 
              obscureText: true
            ),
            SizedBox(height: 25,),
            MyButton(
              onTapped: register, 
              text: 'Sign Up'),
             SizedBox(height: 25,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
                ),
                SizedBox(width: 5,),
                GestureDetector(
                   onTap: widget.onTap,
                  child: Text("Login Now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                  ),),
                )
              ],
             )
          ],
        ),
      ),
    );
  }
}
