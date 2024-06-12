import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReferEarn extends StatefulWidget {
  const ReferEarn({super.key});

  @override
  State<ReferEarn> createState() => _ReferEarnState();
}

class _ReferEarnState extends State<ReferEarn> {

  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height * 0.043),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                    ),
                    Center(child: SvgPicture.asset("assets/images/profile_images/referImage.svg")),
                    Center(
                      child: Text("Earn Money",style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'SatoshiBold',
                        color: Colors.black
                      ),),
                    ),
                    Center(
                      child: Text("By Refer",style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'SatoshiBold',
                          color: Colors.black
                      ),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: mQuery.size.height*0.032,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: mQuery.size.height*0.023,
                left: mQuery.size.width*0.045,
                right: mQuery.size.width*0.045,
                bottom: mQuery.size.height*0.032
              ),
              margin : EdgeInsets.symmetric(
                horizontal: mQuery.size.width*0.045
              ),
              decoration: BoxDecoration(
                  color: Color(0xff9E9E9E),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("GIVE QAR 20, GET QAR20",style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'SatoshiBold'
                  ),),
                  SizedBox(height: mQuery.size.height*0.032,),
                  Text("Tell your friend to enter your code at the checkout:",style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: 'SatoshiMedium'
                  ),),
                  SizedBox(height: mQuery.size.height*0.023,),
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height*0.055,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      horizontal: mQuery.size.width*0.1
                    ),
                    child: DottedBorder(
                      radius: Radius.circular(8),
                      color: Colors.black,
                      strokeWidth: 1,
                      child: Row(
                        children: [
                          SizedBox(width: mQuery.size.width*0.18,),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontFamily: 'SatoshiBold'
                              ),
                              cursorColor: Colors.grey,
                              controller: codeController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
        
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/profile_images/copyIcon.svg"),
                      SizedBox(width: mQuery.size.width*0.01,),
                      Text("Copy code",style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'SatoshiMedium'
                      ),),
                      SizedBox(width: mQuery.size.width*0.07,),
                      SvgPicture.asset("assets/images/profile_images/editIcon.svg"),
                      SizedBox(width: mQuery.size.width*0.01,),
                      Text("Copy code",style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'SatoshiMedium'
                      ),)
                    ],
                  ),
                  SizedBox(height: mQuery.size.height*0.032,),
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height*0.06,
                    margin: EdgeInsets.symmetric(
                      horizontal: mQuery.size.width*0.1
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.black
                    ),
                    child: Center(
                      child: Text("Share",style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'SatoshiBold'
                      ),),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.032,),
                  Center(
                    child: Text('or use:',style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'SatoshiBold'
                    ),),
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/profile_images/attachment.svg"),
                    SizedBox(width: mQuery.size.width*0.032,),
                    SvgPicture.asset("assets/images/profile_images/facebook.svg"),
                    SizedBox(width: mQuery.size.width*0.032,),
                    SvgPicture.asset("assets/images/profile_images/messageIcon.svg"),
                    SizedBox(width: mQuery.size.width*0.032,),
                    SvgPicture.asset("assets/images/profile_images/cameraIcon.svg"),
                  ],
                ),
                  SizedBox(height: mQuery.size.height*0.032,),
                  Center(
                    child: Text("Terms & Conditions",style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontFamily: 'SatoshiBold'
                    ),),
                  )
                ],
              ),
            ),
            SizedBox(height: mQuery.size.height*0.032,)
          ],
        ),
      ),
    );
  }
}
