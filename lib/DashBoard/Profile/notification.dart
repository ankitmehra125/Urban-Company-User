import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  bool gNotification = false;
  bool sound = false;
  bool appUpdates = false;
  bool billReminder = false;
  bool promotion = false;
  bool discountAvailable = false;


  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: mQuery.size.height * 0.06),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                ),
                SizedBox(width: mQuery.size.width * 0.045),
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'SatoshiBold'),
                )
              ],
            ),
          ),
          SizedBox(height: mQuery.size.height * 0.023),
          Divider(
            color: Color(0xffDADADA),
          ),
          SizedBox(height: mQuery.size.height * 0.01),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Common",style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'SatoshiBold',
                    color: Color(0xff000000)
                  ),),
                  SizedBox(height: mQuery.size.height*0.023,),
                  Row(
                    children: [
                      Text("General Notification",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'SatoshiMedium'
                      ),),
                      Expanded(child: SizedBox()),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: gNotification,
                          onChanged: (value)
                          {
                            setState(() {
                              gNotification = value!;
                            });
                          },
                          activeTrackColor: Colors.black,
                          trackOutlineColor: MaterialStatePropertyAll(
                            Colors.transparent
                          ),
                          inactiveTrackColor: Color(0xffD9D9D9),
                          thumbColor: MaterialStatePropertyAll(
                            Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Sound",style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'SatoshiMedium'
                      ),),
                      Expanded(child: SizedBox()),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: sound,
                          onChanged: (value)
                          {
                            setState(() {
                              sound = value!;
                            });
                          },
                          activeTrackColor: Colors.black,
                          trackOutlineColor: MaterialStatePropertyAll(
                              Colors.transparent
                          ),
                          inactiveTrackColor: Color(0xffD9D9D9),
                          thumbColor: MaterialStatePropertyAll(
                              Colors.white
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: mQuery.size.height*0.016,),
                  Divider(
                    color: Color(0xffEEEEEE),
                  ),
                  SizedBox(height: mQuery.size.height*0.016,),
                  Text("System & services update",style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'SatoshiBold',
                      color: Color(0xff000000)
                  ),),
                  SizedBox(height: mQuery.size.height*0.023,),
                  Row(
                    children: [
                      Text("App updates",style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'SatoshiMedium'
                      ),),
                      Expanded(child: SizedBox()),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: appUpdates,
                          onChanged: (value)
                          {
                            setState(() {
                              appUpdates = value!;
                            });
                          },
                          activeTrackColor: Colors.black,
                          trackOutlineColor: MaterialStatePropertyAll(
                              Colors.transparent
                          ),
                          inactiveTrackColor: Color(0xffD9D9D9),
                          thumbColor: MaterialStatePropertyAll(
                              Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Bill Reminder",style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'SatoshiMedium'
                      ),),
                      Expanded(child: SizedBox()),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: billReminder,
                          onChanged: (value)
                          {
                            setState(() {
                              billReminder = value!;
                            });
                          },
                          activeTrackColor: Colors.black,
                          trackOutlineColor: MaterialStatePropertyAll(
                              Colors.transparent
                          ),
                          inactiveTrackColor: Color(0xffD9D9D9),
                          thumbColor: MaterialStatePropertyAll(
                              Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Promotion",style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'SatoshiMedium'
                      ),),
                      Expanded(child: SizedBox()),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: promotion,
                          onChanged: (value)
                          {
                            setState(() {
                              promotion = value!;
                            });
                          },
                          activeTrackColor: Colors.black,
                          trackOutlineColor: MaterialStatePropertyAll(
                              Colors.transparent
                          ),
                          inactiveTrackColor: Color(0xffD9D9D9),
                          thumbColor: MaterialStatePropertyAll(
                              Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Discount Avaiable",style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'SatoshiMedium'
                      ),),
                      Expanded(child: SizedBox()),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: discountAvailable,
                          onChanged: (value)
                          {
                            setState(() {
                              discountAvailable = value!;
                            });
                          },
                          activeTrackColor: Colors.black,
                          trackOutlineColor: MaterialStatePropertyAll(
                              Colors.transparent
                          ),
                          inactiveTrackColor: Color(0xffD9D9D9),
                          thumbColor: MaterialStatePropertyAll(
                              Colors.white
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: mQuery.size.height*0.016,),
                  Divider(
                    color: Color(0xffEEEEEE),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


