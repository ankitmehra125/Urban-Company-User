import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../DashBoard/BottomNav.dart';


class LocationPage extends StatefulWidget {
  const LocationPage({Key? key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/customer_images/Ss.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height*0.3,),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset("assets/images/customer_images/location.svg"),
                  SizedBox(height: mQuery.size.height*0.02,),
                  Text("Enable precise",style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'SatoshiMedium'
                  ),),
                  Text("location",style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'SatoshiMedium'
                  ),),
                  SizedBox(height: mQuery.size.height*0.02,),
                  Text("To search for the best nearby service,",style: TextStyle(
                      color: Color(0xff8E8E93),
                      fontFamily: 'SatoshiBold'
                  ),),
                  Text("we want to know your current",style: TextStyle(
                      color: Color(0xff8E8E93),
                      fontFamily: 'SatoshiBold'
                  ),),
                  Text("location",style: TextStyle(
                      color: Color(0xff8E8E93),
                      fontFamily: 'SatoshiBold'
                  ),),

                ],
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: mQuery.size.height*0.045,
                          vertical: mQuery.size.height*0.2
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage("assets/images/customer_images/map.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(height: mQuery.size.height*0.02,),
                              Text("Allow 'app' to use ",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'SatoshiBold'
                              )
                              ),
                              Text("your location?",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'SatoshiBold'
                              ),
                              ),
                              SizedBox(height: mQuery.size.height*0.005,),
                              Text("Your precise location is used to show",style: TextStyle(
                                  fontFamily: 'SatoshiRegular',
                                  fontSize: 14,
                                  color: Colors.black
                              ),),
                              Text("your position on the map, get",style: TextStyle(
                                  fontFamily: 'SatoshiRegular',
                                  fontSize: 14,
                                  color: Colors.black
                              ),),
                              Text("directions, estimate travel times and",style: TextStyle(
                                  fontFamily: 'SatoshiRegular',
                                  fontSize: 14,
                                  color: Colors.black
                              ),),
                              Text("improve search results",style: TextStyle(
                                  fontFamily: 'SatoshiRegular',
                                  fontSize: 14,
                                  color: Colors.black
                              ),),
                              Expanded(child: SizedBox()),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24
                                ),
                                child: Column(
                                  children: [
                                    Divider(),
                                    GestureDetector(
                                      onTap: ()
                                      {
                                        Navigator.pushAndRemoveUntil(context,
                                            _createRoute(), (route) => false);
                                      },
                                      child: Text("Allow Once",style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff007AFF),
                                          fontFamily: 'SatoshiMedium'
                                      ),),
                                    ),
                                    Divider(),
                                    Text("Allow While Using the App",style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff007AFF),
                                        fontFamily: 'SatoshiMedium'
                                    ),),
                                    Divider(),
                                    GestureDetector(
                                      onTap: ()
                                      {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Don’t Allow",style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff007AFF),
                                          fontFamily: 'SatoshiMedium'
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                height: mQuery.size.height*0.075,
                margin : EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffD9D9D9),
                    border: Border.all(
                        color: Color(0xff000000)
                    )
                ),
                child: const Center(
                  child: Text("Enable Location Services",style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'SatoshiBold'
                  ),),
                ),
              ),
            ),
            SizedBox(height: mQuery.size.height*0.02,),
            const Text("🔒 Magical secured text to make all",style: TextStyle(
                color: Color(0xff8E8E93),
                fontFamily: 'SatoshiMedium',
                fontSize: 12
            ),),
            const Text("security concerns go away.",style: TextStyle(
                color: Color(0xff8E8E93),
                fontFamily: 'SatoshiMedium',
                fontSize: 12
            ),),
            SizedBox(height: mQuery.size.height*0.032,)
          ],
        ),
      ),
    );
  }

  // Navigate to BottomNav with Animation
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const BottomNav(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
