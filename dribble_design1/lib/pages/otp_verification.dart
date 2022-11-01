import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.shade100,
            ),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
                ),
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                  /// Company Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Text("Businer",
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                  /// Title Text
                  const Text("enter your\n mobile number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 20)),

                  /// SubTitle Text
                  const Text("You will receive a 4 digit code to verify next",
                      style: TextStyle(
                        color: Colors.white70,
                      )),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 30)),

                  /// Phone Number field
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: '|',
                        border: OutlineInputBorder(
                          //borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      initialCountryCode: 'GH',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                  // Send otp button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade800,
                    ),
                    child: ListTile(
                      title: const Text("Send OTP",  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      trailing: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade600,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// // Send otp button
// Container(
// width: MediaQuery.of(context).size.width * 0.44,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(30),
// color: Colors.blue.shade800,
// ),
// child: ListTile(
// title: const Text("Send OTP",  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
// trailing: Container(
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: Colors.blue.shade600,
// ),
// child: IconButton(
// onPressed: () {},
// icon: const Icon(Icons.arrow_forward_ios_rounded),
// ),
// ),
// ),
// ),

// Container(
//   height: MediaQuery.of(context).size.height * 0.55,
//   color: Colors.blue,
//   child: Column(
//     children: [
//       const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//       /// Company Name
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const[
//           Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//           Text("Businer", style: TextStyle(fontSize: 48, color: Colors.white,))
//         ],
//       ),
//       const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//       /// Title Text
//       const Text(
//           "enter your\n mobile number",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w500)
//       ),
//       const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
//       /// SubTitle Text
//       const Text("You will receive a 4 digit code to verify next", style: TextStyle(color: Colors.white70,)),
//       const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
//       /// Phone Number field
//       SizedBox(
//         width: MediaQuery.of(context).size.width * 0.9,
//         height: MediaQuery.of(context).size.height * 0.1,
//         child: IntlPhoneField(
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.white,
//             labelText: '|',
//             border: OutlineInputBorder(
//               //borderSide: const BorderSide(),
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           initialCountryCode: 'GH',
//           onChanged: (phone) {
//             print(phone.completeNumber);
//           },
//         ),
//       ),

// body: SafeArea(
//   minimum: const EdgeInsets.symmetric(horizontal: 0),
//   child: SizedBox(
//     height: MediaQuery.of(context).size.height ,
//     width: MediaQuery.of(context).size.width * 1.4,
//     //color: Colors.black,
//     child: Container(
//       height: MediaQuery.of(context).size.height,
//       color: Colors.blue,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               children: [
//                 const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//                 const Text("Businer", style: TextStyle(fontSize: 48, color: Colors.white,)),
//                 /// Title Text
//                 const Text(
//                     "enter your\n mobile number",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w500)
//                 ),
//                 /// SubTitle Text
//                 const Text("You will receive a 4 digit code to verify next", style: TextStyle(color: Colors.white70,)),
//                 /// Phone Field
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   height: MediaQuery.of(context).size.height * 0.1,
//                   child: IntlPhoneField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelText: '|',
//                       border: OutlineInputBorder(
//                         //borderSide: const BorderSide(),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     initialCountryCode: 'GH',
//                     onChanged: (phone) {
//                       print(phone.completeNumber);
//                     },
//                   ),
//                 ),
//                 // Send otp button
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.44,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.blue.shade800,
//                   ),
//                   child: ListTile(
//                     title: const Text("Send OTP",  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
//                     trailing: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.blue.shade600,
//                       ),
//                       child: IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.arrow_forward_ios_rounded),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Positioned(
//             top: 400,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 color: Colors.white,
//               ),
//               child: NumericKeyboard(
//                   textStyle: const TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.black
//                   ),
//                   leftButtonFn: () {
//                     setState(() {
//                       // text = text.substring(0, text.length - 1);
//                     });
//                   },
//                   leftIcon: const Icon(Icons.backspace, color: Colors.black,),
//                   rightButtonFn: () {
//                     print('left button clicked');
//                   },
//                   rightIcon: const Icon(Icons.check, color: Colors.black,),
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 onKeyboardTap: (String text) {  },
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
//   ),
