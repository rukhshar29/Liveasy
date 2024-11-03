import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lliveeasyy/ProfilechoiceScreen.dart';
import 'package:lliveeasyy/phoneScreen.dart';
class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Profilechoicescreen();
            }else{return Phonescreen();}
          }),
    );
  }
}
