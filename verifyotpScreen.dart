
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lliveeasyy/ProfilechoiceScreen.dart';
import 'package:lliveeasyy/wrapper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';


class Verifyotpscreen extends StatefulWidget {
  final String vid;
  final String phoneNumber;

  const Verifyotpscreen({super.key, required this.vid,required this.phoneNumber});

  @override
  State<Verifyotpscreen> createState() => _VerifyotpscreenState();
}

class _VerifyotpscreenState extends State<Verifyotpscreen> {
  var code= '';
  signIn()async{
    PhoneAuthCredential credential=PhoneAuthProvider.credential(
        verificationId: widget.vid,
        smsCode: code);
    try{
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        Get.offAll(() => Wrapper());
      });

  }on FirebaseAuthException catch(e){
    Get.snackbar('Error occured',e.code);
  }catch(e){
    Get.snackbar('Error occured',e.toString());
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
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
            children: <Widget>[
              Text(
                'Verify Phone',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Text(
                'Code is sent to ${widget.phoneNumber}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Form(

                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(2),
                    fieldHeight: 50,
                    fieldWidth: 50,

                    activeFillColor: Colors.blue,
                    inactiveFillColor: Colors.blue,
                    selectedFillColor: Colors.blue,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue,
                    selectedColor: Colors.blue,


                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onChanged: (value) {
                    setState(() {
                     code=value;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true; // Allow pasting
                  },
                ),
              ),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Didn\'t receive the code? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'Request Again',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Color(0xFF153A62),
                ),
                onPressed: (){
                 // signIn();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profilechoicescreen()),
                  );
                },
                child: Text(
                  'VERIFY AND CONTINUE',
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
