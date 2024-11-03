import 'package:flutter/material.dart';
class Profilechoicescreen extends StatefulWidget {
  const Profilechoicescreen({super.key});

  @override
  State<Profilechoicescreen> createState() => _ProfilechoicescreenState();
}

class _ProfilechoicescreenState extends State<Profilechoicescreen> {
  String? selectedProfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Please Select your profile',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      buildProfileOption(
        profileName: 'Shipper',
        profileDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
        profileValue: 'shipper',
        imagePath: 'assets/shipper.png',

      ),
      SizedBox(height: 10),
      buildProfileOption(
        profileName: 'Transporter',
        profileDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
        profileValue: 'transporter',
        imagePath: 'assets/trasport.png', // Replace with your actual icon data
      ),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed:(){
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


    ],)
        )
      ),
    );
  }
  Widget buildProfileOption({
    required String profileName,
    required String profileDescription,
    required String profileValue,
    required String imagePath,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Radio<String>(
            value: profileValue,
            groupValue: selectedProfile,
            onChanged: (String? value) {
              setState(() {
                selectedProfile = value;
              });
            },
            activeColor: Color(0xFF153A62),
          ),
          SizedBox(width: 10),
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profileName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  profileDescription,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
