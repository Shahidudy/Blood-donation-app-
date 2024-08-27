import 'package:blood_donation/pages/all_records.dart';
import 'package:blood_donation/pages/donate_page.dart';
import 'package:blood_donation/pages/recieve_page.dart';
import 'package:flutter/material.dart';

class SplashTwo extends StatelessWidget {
  const SplashTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/bd8.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DonatePage()));
                },
                child: myButton(
                  buttonText: 'Donate',
                  buttonColor: Colors.red,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecievePage()));
                },
                child: myButton(
                  buttonText: 'Recieve',
                  buttonColor: Colors.green,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllRecords()));
                },
                child: myButton(
                  buttonText: 'View All',
                  buttonColor: Colors.blue,
                ),
              ),

              //LEARN MORE, SKIP NOW BUTTON
              // learn_and_skip_btn(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget myButton({
    required String buttonText,
    required Color buttonColor,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: Text(
        buttonText,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )),
    );
  }

  // Container learn_and_skip_btn(context) {
  //   return Container(
  //     margin: EdgeInsets.only(left: 24, right: 24, top: 15),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  // Text(
  //   'Learn More',
  //   style: TextStyle(color: Colors.red),
  // ),
  // InkWell(
  //   onTap: () {
  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //       return ProfilePage();
  //     }));
  //   },
  //   child: Text(
  //     'Go to Profile',
  //     style: TextStyle(color: Colors.red),
  //   ),
  // ),
  //     ],
  //   ),
  // );
  // }
}
