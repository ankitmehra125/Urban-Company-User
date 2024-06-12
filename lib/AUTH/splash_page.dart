import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usc_project/AUTH/welcome_page.dart';

import '../DashBoard/BottomNav.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    // // Wait for 2 seconds and then navigate to the login page
    Timer(
      Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => WelcomePage()),
      ),
    );

    _checkFirstSeen();
  }

  void _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const BottomNav()),
      );
    } else {
      await prefs.setBool('seen', true);  // true here
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const WelcomePage()),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Hero(
        tag: 'logoTag',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/customer_images/Ss.jpg",)
                  ,fit: BoxFit.fill
            )
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: mQuery.size.width*0.26,
                  height: mQuery.size.height*0.11,
                  decoration: BoxDecoration(
                    color: const Color(0xff000000),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("USC",style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SatoshiBold',
                      fontSize: mQuery.size.height*0.036
                    ),),
                  ),
                ),
                SizedBox(width: mQuery.size.width*0.03,),
                const Text("United \nServices \nCompany",style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20,
                  fontFamily: 'SatoshiBold',
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



