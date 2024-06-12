import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'AC/components/acTypebottomsheet.dart';

List<Map<String, dynamic>> yourDataList = [
  {
    'imageUrl': "https://cdn.dotpe.in/longtail/store-items/8209150/lmn1PsCO.jpeg",
    'title': "Switch/Socket Replacement",
    'price': 100,
  },
  {
    'imageUrl': "https://cdn.dotpe.in/longtail/store-items/8209150/lmn1PsCO.jpeg",
    'title': "Switch/Socket Replacement",
    'price': 200,
  },
  {
    'imageUrl': "https://cdn.dotpe.in/longtail/store-items/8209150/lmn1PsCO.jpeg",
    'title': "Switch/Socket Replacement",
    'price': 300,
  },
  // Add more items as needed following the same pattern
];

class PowerSaverAc extends StatefulWidget {
  const PowerSaverAc({super.key});

  @override
  State<PowerSaverAc> createState() => _PowerSaverAcState();
}

class _PowerSaverAcState extends State<PowerSaverAc> {

  var acType = "Split AC";
  var repairPrice = 49;

  var rating = 4.85;
  var reviews = "14K";

  bool showFullText = false;
  bool showExtraLine = false;

  bool isAnswerVisible = false;
  bool isAnswerVisible2 = false;
  bool isAnswerVisible3 = false;
  bool isAnswerVisible4 = false;
  bool isAnswerVisible5 = false;

  Map<String, dynamic> serviceDetails = {
    'imagePath': "assets/images/dashboard_images/home_images/acS.png",
    'serviceName': "Power Saver AC \nService",
    'rating': 4.84,
    'reviewCount': "31.9k reviews",
    'price': 49, // Ensure this value is set correctly
    'time': 10
  };





  List<Map<String, dynamic>> linearPercentIndicatorValues = [
    {"percent": 1.0, "trailing": "13k", "rating": "5"},
    {"percent": 0.05, "trailing": "303", "rating": "4"},
    {"percent": 0.025, "trailing": "118", "rating": "3"},
    {"percent": 0.0125, "trailing": "88", "rating": "2"},
    {"percent": 0.015, "trailing": "241", "rating": "1"},
  ];


  Map<String, dynamic> myMap = {
    'name': 'Ajay',
    'date': 'Mar 19, 2024  • For new 15+ Amp Switch \nBox',
    'rating': 1.0, // Initial rating (should be a double)
    'starCount': '5' // Number of stars (should be a string)
  };

  Map<String, dynamic> myMap2 = {
    'name': 'Arghya Deep Saha',
    'date': 'Mar 17, 2024  • For new 15+ Amp Switch \nBox',
    'rating': 1.0, // Initial rating (should be a double)
    'starCount': '5' // Number of stars (should be a string)
  };



  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(serviceDetails["serviceName"],style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'SatoshiBold'
                            ),),
                            SizedBox(height: mQuery.size.height*0.01,),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 1,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemSize: mQuery.size.height * 0.03,
                                  allowHalfRating: true,
                                  itemCount: 1,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.black,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(width: mQuery.size.width*0.032,),
                                Text(
                                  "${serviceDetails['rating']} (${serviceDetails['reviewCount']})",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'SatoshiBold',
                                      color: Colors.black),
                                )
                              ],
                            ),
                            SizedBox(height: mQuery.size.height*0.01,),
                            Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "QAR ${serviceDetails['price']}",style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'SatoshiMedium'
                                      )
                                      ),
                                      TextSpan(
                                          text: "  ${serviceDetails['time']}",style: TextStyle(
                                          color: Color(0xff4B4B4B),
                                          fontFamily: 'SatoshiMedium'
                                      )
                                      )
                                    ]
                                )
                            ),
                            SizedBox(height: mQuery.size.height*0.01,),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          width: mQuery.size.width*0.26,
                          height: mQuery.size.height*0.055,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.black                         )
                          ),
                          child: Center(
                            child: Text("Add",style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SatoshiBold'
                            ),),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: mQuery.size.height*0.023,),
                    GestureDetector(
                      onTap: ()
                      {
                        acTypeBottomSheet(context, (selectedType) {
                          setState(() {
                            acType = selectedType;
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: mQuery.size.height*0.075,
                        padding: EdgeInsets.symmetric(
                            horizontal: mQuery.size.width*0.045
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          children: [
                            Text("AC Type",style: TextStyle(
                                color: Color(0xff0D7476),
                                fontFamily: 'SatoshiBold'
                            ),),
                            Expanded(child: SizedBox()),
                            Text(acType,style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SatoshiMedium'
                            ),),
                            SizedBox(width: mQuery.size.width*0.023,),
                            Icon(Icons.arrow_forward_ios_outlined,size: mQuery.size.height*0.02,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.023,),
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.023,),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Frequently added together",style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff161616),
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),


                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          yourDataList.length,
                              (index) => Container(
                            width: mQuery.size.width * 0.34,
                            height: mQuery.size.height * 0.37,
                            margin: EdgeInsets.only(
                              right: mQuery.size.width*0.032,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffe5e5e5)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: mQuery.size.height * 0.16,
                                  child: Image.network(
                                    yourDataList[index]['imageUrl'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(height: mQuery.size.height * 0.016),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: mQuery.size.width * 0.023,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        yourDataList[index]['title'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'SatoshiBold',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: mQuery.size.height*0.01,),
                                      Text(
                                        '₹${yourDataList[index]['price']}',
                                        style: TextStyle(
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: mQuery.size.height * 0.023),
                                Center(
                                  child: Container(
                                    width: mQuery.size.width * 0.2,
                                    height: mQuery.size.height * 0.055,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: Color(0xffe8e8e8)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                          color: Color(0xff6c43df),
                                          fontFamily: 'SatoshiBold',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mQuery.size.height*0.023,),
                    Text("Overview",style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SatoshiBold',
                        color: Color(0xff161616)
                    ),),

                    SizedBox(height: mQuery.size.height*0.023,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/images/dashboard_images/home_images/trained.svg"),
                        SvgPicture.asset("assets/images/dashboard_images/home_images/bgVerified.svg"),
                        SvgPicture.asset("assets/images/dashboard_images/home_images/warrenty.svg"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.023,),
              Divider(
                  thickness: 9,
                  color: Color(0xffF5F5F5)
              ),
              SizedBox(height: mQuery.size.height*0.032,),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("How it work",style: TextStyle(
                      color: Color(0xff222222),
                      fontFamily: 'SatoshiBold',
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),

                    // part remain here

                    // Container(
                    //   width: double.infinity,
                    //   height: mQuery.size.height*0.3,
                    //   color: Colors.yellow,
                    // ),
                    //



                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.023,),
              Divider(
                color: Color(0xffF5F5F5),
                thickness: 9,
              ),
              SizedBox(height: mQuery.size.height*0.016,),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Included",style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff222222),
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),

                    Row(
                      children: [
                        Icon(Icons.check,color: Color(0xff777777),),
                        SizedBox(width: mQuery.size.width*0.04,),
                        Text("Lorem ipsum",style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 13,
                            fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.check,color: Color(0xff777777),),
                        SizedBox(width: mQuery.size.width*0.04,),
                        Text("Nullam condimentum mauris vitae quam",style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 13,
                            fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.check,color: Color(0xff777777),),
                        SizedBox(width: mQuery.size.width*0.04,),
                        Text("Sed et fermentum lectus, at vestibulum",style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 13,
                            fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
                    SizedBox(height: mQuery.size.height*0.023,),

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Excluded",style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff222222),
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.016,),

                    Row(
                      children: [
                        Icon(Icons.close,color: Color(0xff777777),),
                        SizedBox(width: mQuery.size.width*0.04,),
                        Text("Lorem ipsum",style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 13,
                            fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
                    SizedBox(height: mQuery.size.height*0.016,),

                  ],
                ),
              ),

              SizedBox(height: mQuery.size.height*0.01,),

              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.016,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width*0.045
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Please note",style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff222222),
                            fontFamily: 'SatoshiBold'
                        ),),
                        SizedBox(height: mQuery.size.height*0.023,),

                        Row(
                          children: [
                            SvgPicture.asset("assets/images/dashboard_images/home_images/infoIcon.svg"),
                            SizedBox(width: mQuery.size.width*0.04,),
                            Text("Sed et fermentum lectus, at vestibulum",style: TextStyle(
                                color: Color(0xff757575),
                                fontSize: 13,
                                fontFamily: 'SatoshiMedium'
                            ),)
                          ],
                        ),
                        SizedBox(height: mQuery.size.height*0.01,),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/dashboard_images/home_images/infoIcon.svg"),
                            SizedBox(width: mQuery.size.width*0.04,),
                            Text("Nullam condimentum mauris vitae quam",style: TextStyle(
                                color: Color(0xff757575),
                                fontSize: 13,
                                fontFamily: 'SatoshiMedium'
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.016,),

                  Divider(
                    thickness: 9,
                    color: Color(0xffF5F5F5),
                  ),
                  SizedBox(height: mQuery.size.height*0.016,),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width*0.045
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                      text: "USC",style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: 'SatoshiBold'
                                  )
                                  ),
                                  TextSpan(
                                      text: " COVER",style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff0D7476),
                                      fontFamily: 'SatoshiBold'
                                  )
                                  )
                                ]
                            )
                        ),

                        SizedBox(height: mQuery.size.height*0.01,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset("assets/images/dashboard_images/home_images/warrenty2.svg"),
                            SvgPicture.asset("assets/images/dashboard_images/home_images/noQuestion.svg"),
                          ],
                        ),
                        SizedBox(height: mQuery.size.height*0.032,),
                        Container(
                          width: double.infinity,
                          height: mQuery.size.height*0.075,
                          padding: EdgeInsets.symmetric(
                              horizontal: mQuery.size.width*0.045
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Row(
                            children: [
                              Text("Learn about claims process",style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'SatoshiMedium'
                              ),),
                              Expanded(child: SizedBox()),
                              Icon(Icons.arrow_forward_ios_outlined,size: mQuery.size.height*0.02,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: mQuery.size.height*0.032,),
                ],
              ),
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.016,),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width * 0.045,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Frequently asked question",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff222222),
                        fontFamily: 'SatoshiBold',
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.023),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAnswerVisible = !isAnswerVisible;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                "How do I schedule a service appointment?",
                                style: TextStyle(
                                  fontFamily: 'SatoshiBold',
                                  color: Colors.black,
                                  fontSize: 11,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              isAnswerVisible ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                        // Conditionally show the answer based on the visibility state
                        if (isAnswerVisible)
                          Text(
                            "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                      ],
                    ),
                    Divider(color: Colors.black,),

                    SizedBox(height: mQuery.size.height*0.01,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAnswerVisible2 = !isAnswerVisible2;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                "What types of electronic appliances do you repair?",
                                style: TextStyle(
                                  fontFamily: 'SatoshiBold',
                                  color: Colors.black,
                                  fontSize: 11,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              isAnswerVisible2 ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                        // Conditionally show the answer based on the visibility state
                        if (isAnswerVisible2)
                          Text(
                            "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                      ],
                    ),
                    Divider(color: Colors.black,),

                    SizedBox(height: mQuery.size.height*0.01,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAnswerVisible3 = !isAnswerVisible3;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                "Are your technicians certified and experienced?",
                                style: TextStyle(
                                  fontFamily: 'SatoshiBold',
                                  color: Colors.black,
                                  fontSize: 11,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              isAnswerVisible3 ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                        // Conditionally show the answer based on the visibility state
                        if (isAnswerVisible3)
                          Text(
                            "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                      ],
                    ),
                    Divider(color: Colors.black,),

                    SizedBox(height: mQuery.size.height*0.01,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAnswerVisible4 = !isAnswerVisible4;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                "How do I pay for the service?",
                                style: TextStyle(
                                  fontFamily: 'SatoshiBold',
                                  color: Colors.black,
                                  fontSize: 11,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              isAnswerVisible4 ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                        // Conditionally show the answer based on the visibility state
                        if (isAnswerVisible4)
                          Text(
                            "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                      ],
                    ),
                    Divider(color: Colors.black,),

                    SizedBox(height: mQuery.size.height*0.01,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAnswerVisible5 = !isAnswerVisible5;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                "Can I track the status of my service appointment?",
                                style: TextStyle(
                                  fontFamily: 'SatoshiBold',
                                  color: Colors.black,
                                  fontSize: 11,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              isAnswerVisible5 ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                        // Conditionally show the answer based on the visibility state
                        if (isAnswerVisible5)
                          Text(
                            "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                      ],
                    ),
                    Divider(color: Colors.black,),

                    SizedBox(height: mQuery.size.height*0.016,),
                  ],
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Share this service with your loved ones",style: TextStyle(
                        color: Color(0xff757575),
                        fontFamily: 'SatoshiMedium'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height*0.065,
                      margin: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width*0.12
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Share",style: TextStyle(
                              fontFamily: 'SatoshiBold',
                              color: Colors.white
                          ),),
                          SizedBox(width: mQuery.size.width*0.01,),
                          Icon(Icons.share,color: Colors.white,size: mQuery.size.height*0.03,)
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: mQuery.size.height*0.045,),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 1,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: mQuery.size.height * 0.03,
                          allowHalfRating: true,
                          itemCount: 1,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.black,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(width: mQuery.size.width*0.032,),
                        Text(
                          "$rating",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'SatoshiBold',
                              color: Colors.black),
                        )
                      ],
                    ),
                    Text("$reviews reviews",style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'SatoshiMedium'
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),

                    Row(
                      children: [
                        Container(
                          width: mQuery.size.width * 0.8,
                          child: Column(
                            children: List.generate(
                              linearPercentIndicatorValues.length,
                                  (index) => Column(
                                children: [
                                  LinearPercentIndicator(
                                    progressColor: Colors.black,
                                    lineHeight: 8,
                                    percent: linearPercentIndicatorValues[index]['percent'].toDouble(),
                                    trailing: Text(
                                      linearPercentIndicatorValues[index]['trailing'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SatoshiMedium',
                                      ),
                                    ),
                                    leading: Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 1,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemSize: mQuery.size.height * 0.025,
                                          allowHalfRating: true,
                                          itemCount: 1,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        Text(
                                          linearPercentIndicatorValues[index]['rating'],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'SatoshiBold',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: mQuery.size.height * 0.016),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.023,),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("All reviews",style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'SatoshiBold'
                        ),),
                        Expanded(child: SizedBox()),
                        Text('Filter',style: TextStyle(
                          fontFamily: 'SatoshiBold',
                          color: Color(0xff6c43df),
                        ),)
                      ],
                    ),
                    SizedBox(height: mQuery.size.height*0.023,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: mQuery.size.width*0.3,
                            height: mQuery.size.height*0.045,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: Color(0xffe5e5e5)
                                )
                            ),
                            child: Center(
                              child: Text("Most detailed",style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'SatoshiBold',
                                  color: Color(0xff737373)
                              ),),
                            ),
                          ),
                          SizedBox(width: mQuery.size.width*0.032),
                          Container(
                            width: mQuery.size.width*0.3,
                            height: mQuery.size.height*0.045,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: Color(0xffe5e5e5)
                                )
                            ),
                            child: Center(
                              child: Text("In my area",style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'SatoshiBold',
                                  color: Color(0xff737373)
                              ),),
                            ),
                          ),
                          SizedBox(width: mQuery.size.width*0.032),
                          Container(
                            width: mQuery.size.width*0.3,
                            height: mQuery.size.height*0.045,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: Color(0xffe5e5e5)
                                )
                            ),
                            child: Center(
                              child: Text("Frequent use",style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'SatoshiBold',
                                  color: Color(0xff737373)
                              ),),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height*0.032,),

                    // Review Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(myMap['name'], style: TextStyle(
                                    fontFamily: 'SatoshiBold',
                                    fontSize: 17,
                                    color: Colors.black
                                ),),
                                SizedBox(height: mQuery.size.height * 0.01,),
                                Text(myMap['date'], style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontFamily: 'SatoshiMedium'
                                ),)
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Container(
                              width: mQuery.size.width * 0.14,
                              height: mQuery.size.height * 0.04,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xff047b51)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    initialRating: myMap['rating'],
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    itemSize: mQuery.size.height * 0.023,
                                    allowHalfRating: true,
                                    itemCount: 1,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(width: mQuery.size.width * 0.012,),
                                  Text(myMap['starCount'], style: TextStyle(
                                      fontFamily: 'SatoshiBold',
                                      color: Colors.white,
                                      fontSize: 13
                                  ),)
                                ],
                              ),
                            )
                          ],
                        ),

                        Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Great electrician, Irfan was superb, polite and \nsuperfast. He even suggested some innovative solutions to our electrical issues.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'SatoshiMedium'
                                    ),
                                  ),
                                  if (showExtraLine) // Show extra line if showExtraLine is true
                                    TextSpan(
                                      text: " He showed exceptional problem-solving skills, ensuring our electrical system was not only functional but also optimized for efficiency.",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: 'SatoshiMedium'
                                      ),
                                    ),
                                  TextSpan(
                                    text: showExtraLine ? "   less" : "   read more", // Toggle text based on showExtraLine
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SatoshiBold'
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          showExtraLine = !showExtraLine; // Toggle showExtraLine on tap
                                        });
                                      },
                                  )
                                ]
                            )
                        )


                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.023,),

              Divider(),
              SizedBox(height: mQuery.size.height*0.023,),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(myMap2['name'], style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                fontSize: 17,
                                color: Colors.black
                            ),),
                            SizedBox(height: mQuery.size.height * 0.01,),
                            Text(myMap2['date'], style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                fontFamily: 'SatoshiMedium'
                            ),)
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          width: mQuery.size.width * 0.14,
                          height: mQuery.size.height * 0.04,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff047b51)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar.builder(
                                initialRating: myMap2['rating'],
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemSize: mQuery.size.height * 0.023,
                                allowHalfRating: true,
                                itemCount: 1,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(width: mQuery.size.width * 0.012,),
                              Text(myMap2['starCount'], style: TextStyle(
                                  fontFamily: 'SatoshiBold',
                                  color: Colors.white,
                                  fontSize: 13
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),

                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text: "Mr. Mitra was very polite man. He was very skilled and solution-oriented, addressing all our electrical concerns with precision.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'SatoshiMedium'
                                ),
                              ),
                              if (showExtraLine) // Show extra line if showExtraLine is true
                                TextSpan(
                                  text: " His attention to detail and dedication to excellence ensured that our electrical system not only met our needs but exceeded our expectations.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: 'SatoshiMedium'
                                  ),
                                ),
                              TextSpan(
                                text: showExtraLine ? "   less" : "   read more", // Toggle text based on showExtraLine
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SatoshiBold'
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      showExtraLine = !showExtraLine; // Toggle showExtraLine on tap
                                    });
                                  },
                              )
                            ]
                        )
                    )

                  ],
                ),
              ),

              SizedBox(height: mQuery.size.height*0.04,),
              Container(
                width: double.infinity,
                height: mQuery.size.height*0.065,
                margin: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                child: Center(
                  child: Text("Show more",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SatoshiMedium'
                  ),),
                ),
              ),



              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
