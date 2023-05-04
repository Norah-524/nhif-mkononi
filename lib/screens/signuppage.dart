// import 'package:flutter/material.dart';
// import 'package:nhif_app/screens/loginpage.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   bool passwordVisible = false;
//   @override
//   void initState() {
//     super.initState();
//     passwordVisible = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 110.0, left: 15, right: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Register',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//               ),
//               SizedBox(
//                 height: 9,
//               ),
//               Text('Sign up to get started',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w200,
//                     fontSize: 15,
//                   )),
//               Center(
//                 child: Container(
//                   width: 300,
//                   height: 700,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 9,
//                       ),
//                       TextFormField(
//                           keyboardType: TextInputType.name,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20.0)),
//                             ),
//                             hintText: "Full name",
//                             fillColor: Colors.grey[200],
//                             filled: true,
//                           )),

//                       SizedBox(
//                         height: 30,
//                       ),

//                       TextFormField(
//                           keyboardType: TextInputType.name,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.card_membership),
//                             border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20.0)),
//                             ),
//                             hintText: "Card number",
//                             fillColor: Colors.grey[200],
//                             filled: true,
//                           )),

//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text('Password',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           )),

//                       SizedBox(
//                         height: 9,
//                       ),
//                       TextFormField(
//                           obscureText: passwordVisible,
//                           keyboardType: TextInputType.visiblePassword,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.lock),
//                             suffixIcon: IconButton(
//                               icon: Icon(passwordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off),
//                               onPressed: () {
//                                 setState(
//                                   () {
//                                     passwordVisible = !passwordVisible;
//                                   },
//                                 );
//                               },
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20.0)),
//                             ),
//                             hintText: "*****",
//                             fillColor: Colors.grey[200],
//                             filled: true,
//                           )),

//                       SizedBox(
//                         height: 30,
//                       ),

//                       const Text('Confirm Password',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           )),
//                       SizedBox(
//                         height: 9,
//                       ),
//                       TextFormField(
//                           obscureText: true,
//                           keyboardType: TextInputType.visiblePassword,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   style: BorderStyle.none,
//                                   color: Colors.white,
//                                   width: 0),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20.0)),
//                             ),
//                             hintText: "*****",
//                             fillColor: Colors.grey[200],
//                             filled: true,
//                           )), //

//                       SizedBox(
//                         height: 70,
//                       ), //
//                       Center(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                                 width: 200,
//                                 height: 40,
//                                 child: ElevatedButton(
//                                     onPressed: () {},
//                                     style: ButtonStyle(
//                                       shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                           side: BorderSide.none,
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                         ),
//                                       ),
//                                     ),
//                                     child: Text(
//                                       'Sign in',
//                                       style: TextStyle(color: Colors.white),
//                                     ))),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             InkWell(
//                               child: Text('Already have account?'),
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => JobPosting()));
//                               },
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
