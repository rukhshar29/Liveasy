import 'package:flutter/material.dart';
import 'package:lliveeasyy/phoneScreen.dart';





class Languagescreen extends StatefulWidget {
  @override
  _LanguagescreenState createState() => _LanguagescreenState();
}

class _LanguagescreenState extends State<Languagescreen> {
  String _selectedLanguage = 'English';

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
              // Icon Placeholder
              Image.asset(
                'assets/galary.png', // Ensure the correct path to your image asset
                width: 34,
                height: 34,
              ),
              SizedBox(height: 20),
              // Language Selection Text
              Text(
                'Please select your Language',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              // Subtitle Text
              Text(
                'You can change the language\n at any time',textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              // Language Dropdown
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedLanguage,
                  icon: Icon(Icons.arrow_drop_down),
                  items: <String>['English', 'Hindi', 'Spanish', 'French']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLanguage = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              // Next Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350
                      , 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),

                  backgroundColor: Color(0xFF153A62),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Phonescreen()),
                  );
                },
                child: Text(
                  'NEXT',
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
              SizedBox(height: 40),
              // Bottom Wave Image Placeholder
              // Container(
              //   height: 50,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/wave.png'),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}