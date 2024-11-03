
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'verifyotpScreen.dart';

class Phonescreen extends StatefulWidget {
  const Phonescreen({super.key});

  @override
  State<Phonescreen> createState() => _PhonescreenState();
}

class _PhonescreenState extends State<Phonescreen> {
  final TextEditingController phoneController = TextEditingController();
  sendcode()async{
    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91' + phoneController.text,

          verificationCompleted: (PhoneAuthCredential credential){},
          verificationFailed: (FirebaseAuthException e){
          Get.snackbar('Error occured', e.code);
      },
    codeSent: (String vid,int? token){
          Get.to(Verifyotpscreen(vid:vid,phoneNumber: phoneController.text),);
    },
    codeAutoRetrievalTimeout: (vid){}
      );

    }on FirebaseAuthException catch(e){
      Get.snackbar('Error occured', e.code);

    }catch(e){
      Get.snackbar('Error occured', e.toString());
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please enter your mobile number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'You\'ll receive a 6 digit code\n to verify next.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/flag.png', // Ensure the correct path to your image asset
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '+91',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    if (phoneController.text.isNotEmpty) {

                      await sendcode();


                      Get.to(Verifyotpscreen(vid: 'dummy_vid', phoneNumber: phoneController.text));
                    } else {
                      Get.snackbar('Error', 'Please enter a valid phone number');
                    }
                  },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Color(0xFF153A62),
                ),
                child: Text(
                  'CONTINUE',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
