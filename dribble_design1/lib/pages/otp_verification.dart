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
              onPressed: ()=> Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                color: Colors.blue,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const[
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Text("Businer", style: TextStyle(fontSize: 48, color: Colors.white,))
                      ],
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    const Text(
                        "enter your\n mobile number",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w500)
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                    const Text("You will receive a 4 digit code to verify next", style: TextStyle(color: Colors.white70,)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
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
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}










