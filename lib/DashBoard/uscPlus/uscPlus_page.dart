import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UscPlusPage extends StatefulWidget {
  const UscPlusPage({super.key});

  @override
  State<UscPlusPage> createState() => _UscPlusPageState();
}

class _UscPlusPageState extends State<UscPlusPage> {

  bool isMonthly = true;
  bool isAnnual = false;

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      // backgroundColor: Color(0xffF9F6EE),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: mQuery.size.height*0.04,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mQuery.size.width*0.045
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Subscribe to USC Premium",style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'SatoshiBold'
                ),)
              ],
            ),
          ),
          SizedBox(height: mQuery.size.height*0.032,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mQuery.size.width*0.045
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMonthly = true;
                            isAnnual = false;
                          });
                        },
                        child: Container(
                          width: mQuery.size.width*0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isMonthly ? Color(0xfff6edd8) : Colors.transparent,
                            border: Border.all(
                              color: isMonthly ? Colors.transparent : Color(0xffE9DCC9)
                            )
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: mQuery.size.width*0.023,
                            vertical: mQuery.size.height*0.02
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Monthly",style: TextStyle(
                                    fontFamily: 'SatoshiBold',
                                    color: Colors.black
                                  ),),
                                  isMonthly ? Image.asset
                                    ("assets/images/uscPlus_images/checkIcon.png", width: mQuery.size.width*0.04,)
                                      : Container()
                                ],
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("\$9.99",style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SatoshiBold'
                              ),),
                              SizedBox(height: mQuery.size.height*0.032,),
                              Text("Billed Monthly",style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'SatoshiBold'
                              ),)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMonthly = false;
                            isAnnual = true;
                          });
                        },
                        child: Container(
                          width: mQuery.size.width*0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isAnnual ? Color(0xfff6edd8) : Colors.transparent,
                            border: Border.all(
                              color: isAnnual ? Colors.transparent : Color(0xffE9DCC9)
                            )
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: mQuery.size.width*0.023,
                            vertical: mQuery.size.height*0.02
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Annual",style: TextStyle(
                                    fontFamily: 'SatoshiBold',
                                    color: Colors.black
                                  ),),
                                  isAnnual ? Image.asset
                                    ("assets/images/uscPlus_images/checkIcon.png", width: mQuery.size.width*0.04,)
                                      : Container()
                                ],
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("\$79.99",style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SatoshiBold'
                              ),),
                              SizedBox(height: mQuery.size.height*0.032,),
                              Text("Billed Annually",style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'SatoshiBold'
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mQuery.size.height*0.032,),
                  Row(
                    children: [
                      Icon(CupertinoIcons.check_mark,size: mQuery.size.width*0.04,),
                      SizedBox(width: mQuery.size.width*0.032,),
                      Text("Diverse range of workout programs.",style: TextStyle(
                          fontFamily: 'SatoshiMedium',
                          color: Colors.black
                      ),)
                    ],
                  ),
                  SizedBox(height: mQuery.size.height*0.01,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(CupertinoIcons.check_mark,size: mQuery.size.width*0.04,),
                      SizedBox(width: mQuery.size.width*0.032,),
                      Text("Personalized plans based on user goals\n and "
                          "fitness level.",style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                        color: Colors.black
                      ),)
                    ],
                  ),

                  SizedBox(height: mQuery.size.height*0.01,),
                  Row(
                    children: [
                      Icon(CupertinoIcons.check_mark,size: mQuery.size.width*0.04,),
                      SizedBox(width: mQuery.size.width*0.032,),
                      Text("Advanced tracking and analytics for \n detailed "
                          "progress monitoring.",style: TextStyle(
                          fontFamily: 'SatoshiMedium',
                          color: Colors.black
                      ),)
                    ],
                  ),
                  SizedBox(height: mQuery.size.height*0.01,),
                  Row(
                    children: [
                      Icon(CupertinoIcons.check_mark,size: mQuery.size.width*0.04,),
                      SizedBox(width: mQuery.size.width*0.032,),
                      Text("Ad-free experience.",style: TextStyle(
                          fontFamily: 'SatoshiMedium',
                          color: Colors.black
                      ),)
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height*0.065,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black
                    ),
                    child: Center(
                      child: Text("Subscribe Now",style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SatoshiBold',
                        fontSize: 16
                      ),),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.032,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
