import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mQuery.size.height*0.043,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mQuery.size.width*0.045
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                ),
                SizedBox(width: mQuery.size.width*0.046,),
                Text("Help & Support",style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'SatoshiBold'
                ),),
                Expanded(child: SizedBox()),
                SvgPicture.asset("assets/images/profile_images/circularSearch.svg")
              ],
            ),
          ),
          Divider(color: Color(0xffDADADA),),
          SizedBox(height: mQuery.size.height*0.023,),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("How can we help you?",style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.016,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/images/profile_images/callSupport.svg",
                         width: mQuery.size.width*0.43,),
                        SvgPicture.asset("assets/images/profile_images/emailSupport.svg",
                          width: mQuery.size.width*0.43,),
                      ],
                    ),
                    SizedBox(height: mQuery.size.height*0.032,),
                    Row(
                      children: [
                        Text("Frequently ask Question",style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontFamily: 'SatoshiBold'
                        ),),
                        Expanded(child: SizedBox()),
                        Text("View all",style: TextStyle(
                          color: Color(0xff1573FE),
                          fontSize: 15,
                          fontFamily: 'SatoshiBold'
                        ),)
                      ],
                    ),
                    
                    SizedBox(height: mQuery.size.height*0.032,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: _isExpanded ? mQuery.size.height * 0.23 : mQuery.size.height * 0.1,
                        padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xffD9D9D9)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: mQuery.size.height * 0.023),
                              Row(
                                children: [
                                  Text(
                                    "How to create an account?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'SatoshiBold',
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(_isExpanded ? Icons.remove : Icons.add),
                                ],
                              ),
                              SizedBox(height: mQuery.size.height*0.016,),
                              _isExpanded
                                  ? Text(
                                    "Open the Tradebase app to get started and follow the steps. Tradebase doesn’t charge a fee to create or maintain your Tradebase account.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mQuery.size.height*0.032,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded2 = !_isExpanded2;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: _isExpanded2 ? mQuery.size.height * 0.23 : mQuery.size.height * 0.1,
                        padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xffD9D9D9)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: mQuery.size.height * 0.023),
                              Row(
                                children: [
                                  Text(
                                    "How to add a payment method by \nthis app?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'SatoshiBold',
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(_isExpanded2 ? Icons.remove : Icons.add),
                                ],
                              ),
                              SizedBox(height: mQuery.size.height*0.016,),
                              _isExpanded2
                                  ? Text(
                                "Open the Tradebase app to get started and follow the steps. Tradebase doesn’t charge a fee to create or maintain your Tradebase account.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mQuery.size.height*0.032,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded3 = !_isExpanded3;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: _isExpanded3 ? mQuery.size.height * 0.23 : mQuery.size.height * 0.1,
                        padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xffD9D9D9)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: mQuery.size.height * 0.023),
                              Row(
                                children: [
                                  Text(
                                    "What Time Does The Stock Market \nOpen?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'SatoshiBold',
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(_isExpanded3 ? Icons.remove : Icons.add),
                                ],
                              ),
                              SizedBox(height: mQuery.size.height*0.016,),
                              _isExpanded3
                                  ? Text(
                                "Open the Tradebase app to get started and follow the steps. Tradebase doesn’t charge a fee to create or maintain your Tradebase account.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mQuery.size.height*0.032,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded4 = !_isExpanded4;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: _isExpanded4 ? mQuery.size.height * 0.23 : mQuery.size.height * 0.1,
                        padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xffD9D9D9)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: mQuery.size.height * 0.023),
                              Row(
                                children: [
                                  Text(
                                    "Is The Stock Market Open On \nWeekends?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'SatoshiBold',
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(_isExpanded4 ? Icons.remove : Icons.add),
                                ],
                              ),
                              SizedBox(height: mQuery.size.height*0.016,),
                              _isExpanded4
                                  ? Text(
                                "Open the Tradebase app to get started and follow the steps. Tradebase doesn’t charge a fee to create or maintain your Tradebase account.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mQuery.size.height*0.032,)

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
