import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:usc_project/DashBoard/Home/AC/ac_service.dart';
import 'package:usc_project/DashBoard/Home/AC/addToCart.dart';
import 'package:usc_project/DashBoard/Home/address_page.dart';
import 'package:usc_project/DashBoard/Home/summary_page.dart';

import '../../Animation/animations.dart';
import 'home conponents/serviceBottomSheet.dart';


String services = "";  // to hold the services that will reflect in ACRepair
// page

final authentication = GetStorage();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  var itemNo = 2;
  var mainAddress = "General Mahadev Singh Rd";
  var placeAddress = "Ballupur Chowk-Mohit Nagar-Dehradun";

  List<Map<String, dynamic>> myDataList = [
    {
      'image': "assets/images/dashboard_images/home_images/epRepairing.png",
      'title': "Electrical Board",
      'subtitle': "Repairing",
    },
    {
      'image': "assets/images/dashboard_images/home_images/mwRepairing.png",
      'title': "Microwave",
      'subtitle': "Repairing",
    },
    {
      'image': "assets/images/dashboard_images/home_images/acRepairing.png",
      'title': "AC Servicing",
      'subtitle': "& Repairing",
    },
    // Add more items as needed
  ];

  List<Map<String, dynamic>> repairList = [
    {
      'image': "assets/images/dashboard_images/home_images/repair1.png",
      'text': "Powering up your \nappliances, one \nrepair at a time!",
    },
    {
      'image': "assets/images/dashboard_images/home_images/repair2.png",
      'text': "Powering up your \nappliances, one \nrepair at a time!",
    },
    // Add more items as needed
  ];

  List<Map<String, dynamic>> serviceDataList = [
    {
      'image': "assets/images/dashboard_images/home_images/electrician.svg",
      'text1': "Electrician, Plumber",
      'text2': "& Carpenter",
    },
    {
      'image': "assets/images/dashboard_images/home_images/fan.svg",
      'text1': "Fan",
      'text2': "",
    },
    {
      'image': "assets/images/dashboard_images/home_images/wire.svg",
      'text1': "Wiring",
      'text2': "",
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async
      {
        SystemNavigator.pop();
        // Return false to prevent default back button behavior
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: mQuery.size.height*0.04,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  bottom: mQuery.size.height*0.013
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: mQuery.size.height*0.1,
                        child: SvgPicture.asset("assets/images/dashboard_images/home_images/banner.svg")
                    ),
                    SizedBox(height: mQuery.size.height*0.005,),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("$mainAddress",style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'SatoshiBold'
                              ),),
                              GestureDetector(
                                onTap: ()
                                {
                                  addressBottomSheet(context, addressDetails);
                                },
                                child: Row(
                                  children: [
                                    Text("$placeAddress",style: TextStyle(
                                        fontSize: 11.5,
                                        color: Colors.black54,
                                        fontFamily: 'SatoshiRegular'
                                    ),),
                                    SizedBox(width: mQuery.size.width*0.016,),
                                    Icon(CupertinoIcons.chevron_down,size:
                                    mQuery.size.height*0.02, )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, createRouteAddToCart());
                            },
                            child: badges.Badge(
                              badgeContent: Text("$itemNo",style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'SatoshiMedium',
                                  color: Colors.white
                              ),),
                              child: Container(
                                width: mQuery.size.width*0.1,
                                height: mQuery.size.height*0.073,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 0,
                                        blurRadius: 2,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    border: Border.all(
                                        color: Colors.grey.shade300
                                    )
                                ),
                                child: Center(
                                  child: SvgPicture.asset("assets/images/dashboard_images/home_images/shopping-cart-icon.svg",
                                      width: mQuery.size.width*0.04),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height*0.012,),



                    Container(
                      width: double.infinity,
                      height: mQuery.size.height * 0.055,
                      margin: EdgeInsets.only(
                          left: mQuery.size.width*0.045,
                          right: mQuery.size.width*0.045,
                          bottom: mQuery.size.height*0.01
                      ),
                      padding: EdgeInsets.only(right: 16,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.grey.shade200
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 0.5,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: AnimatedTextField(
                        animationType: Animationtype.typer,
                        cursorColor: Colors.grey,
                        controller: searchController,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.3,
                          fontFamily: 'SatoshiMedium',
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: null, // Remove default hint text
                          hintStyle: TextStyle(
                            fontFamily: 'SatoshiMedium',
                            color: Colors.grey,
                            height: 1.9,
                            fontSize: 13,
                          ),
                          prefixIcon: Icon(CupertinoIcons.search),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              bottom: mQuery.size.height*0.021
                          ),
                        ),
                        hintTextStyle: TextStyle(
                            fontSize: 13,
                            height: 1.9,
                            color: Colors.black54,
                            fontFamily: 'SatoshiRegular'
                        ),
                        hintTexts: [
                          'Search for "AC Service"',
                          'Search for "Fan Service"',
                          'Search for "Beauty Service"',
                          'Search for "Wiring Service"',
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: mQuery.size.height*0.0,),

            // authentication.read("Authentication") == "Guest"

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height*0.12,
                      padding: EdgeInsets.only(
                          left: 16
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff764BA2),
                                Color((0xff667EEA))
                              ]
                          )
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Let’s make a package just for \nyou, Manvi!",style: TextStyle(
                                  fontFamily: 'SatoshiBold',
                                  color: Colors.white,
                                  fontSize: 15
                              ),),
                              SizedBox(height: mQuery.size.height*0.005,),
                              Row(
                                children: [
                                  Text("Beauty Essentials",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'SatoshiMedium'
                                  ),),
                                  SizedBox(width: mQuery.size.width*0.03,),
                                  Icon(Icons.arrow_forward,color: Colors.white,),
                                  SizedBox(width: mQuery.size.width*0.04,),
                                  Text("Coming Soon",style: TextStyle(
                                    fontFamily: 'SatoshiBold',
                                    color: Colors.white,
                                  ),),
                                ],
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Image.asset("assets/images/dashboard_images/home_images/girlImage.png")
                        ],
                      ),
                    ),

                    SizedBox(height: mQuery.size.height*0.023,),

                    //
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              serviceDataList.length,
                                  (index) {
                                bool isTargetService = serviceDataList[index]['text1'] == "Electrician, Plumber";
                                bool isFanService = serviceDataList[index]['text1'] == "Fan";
                                bool isWiringService = serviceDataList[index]['text1'] == "Wiring";

                                final item = serviceDataList[index];

                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (isTargetService) {
                                          serviceBottomSheet(context);
                                        } else if (isFanService) {
                                          services = "FanRepair";
                                          Navigator.push(context, createRouteAcService());
                                        } else if (isWiringService) {
                                          services = "Wiring";
                                          Navigator.push(context, createRouteAcService());
                                        }
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 69,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF5F5F5),
                                          borderRadius: BorderRadius.circular(13),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(item['image'],
                                              color: isFanService
                                                  ? Color(0xff649df3)
                                                  : isWiringService
                                                  ? Colors.red
                                                  : null,
                                              height:  isWiringService ? mQuery.size
                                                  .height*0.052 : mQuery.size
                                                  .height*0.06),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: mQuery.size.height * 0.006),
                                    Text(
                                      serviceDataList[index]['text1'],
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'SatoshiMedium',
                                        color: Color(0xff222222),
                                      ),
                                    ),
                                    Text(
                                      serviceDataList[index]['text2'],
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'SatoshiMedium',
                                        color: Color(0xff222222),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: ()
                                {
                                  services = "inverter";
                                  Navigator.push(context, createRouteAcService());
                                },
                                child: Container(
                                  width: mQuery.size.width * 0.43,
                                  padding: EdgeInsets.symmetric(
                                      vertical: mQuery.size.height*0.023
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF5F5F5),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Inverter and \nStabilizer",
                                        style: TextStyle(
                                          color: Color(0xff222222),
                                          fontSize: 11,
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                      SizedBox(width: mQuery.size.width*0.02),
                                      Image.asset
                                        ("assets/images/dashboard_images/home_images/stablizer.png",
                                        height: mQuery.size.height*0.049,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: mQuery.size.width * 0.43,
                                padding: EdgeInsets.symmetric(
                                    vertical: mQuery.size.height*0.023
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F5F5),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Looking for \nsomething else",
                                      style: TextStyle(
                                        color: Color(0xff222222),
                                        fontSize: 11,
                                        fontFamily: 'SatoshiMedium',
                                      ),
                                    ),
                                    SizedBox(width: mQuery.size.width*0.02),
                                    Image.asset
                                      ("assets/images/dashboard_images/home_images/men.png",
                                      height: mQuery.size.height*0.05,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: mQuery.size.height*0.023,),
                    Divider(
                      color: Color(0xffF5F5F5),
                      thickness: 9,
                    ),

                    SizedBox(height: mQuery.size.height*0.023,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Thoughtful curations",style: TextStyle(
                              color: Color(0xff6B72D9),
                              fontSize: 19,
                              fontFamily: 'SatoshiBold'
                          ),),
                          Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Of our",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'SatoshiMedium'
                                    )
                                    ),
                                    TextSpan(
                                        text: " finest",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontFamily: 'Rochester'
                                    )
                                    ),
                                    TextSpan(
                                        text: " experiences",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'SatoshiMedium'
                                    )
                                    )
                                  ]
                              )
                          ),
                          SizedBox(height: mQuery.size.height*0.03,),
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          myDataList.length,
                              (index) => Container(
                            width: mQuery.size.width * 0.34,
                            height: mQuery.size.height * 0.27,
                            margin: EdgeInsets.only(
                              left: mQuery.size.width*0.045,
                              right: mQuery.size.width*0.01,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(myDataList[index]['image']),
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(child: SizedBox()),
                                Text(
                                  myDataList[index]['title'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'SatoshiBold',
                                  ),
                                ),
                                Text(
                                  myDataList[index]['subtitle'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'SatoshiBold',
                                  ),
                                ),
                                SizedBox(height: mQuery.size.height * 0.014),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mQuery.size.height*0.023,),
                    Divider(
                      color: Color(0xffF5F5F5),
                      thickness: 9,
                    ),
                    SizedBox(height: mQuery.size.height*0.023,),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          repairList.length,
                              (index) => Container(
                            width: mQuery.size.width * 0.8,
                            height: mQuery.size.height * 0.2,
                            padding: EdgeInsets.only(left: 16),
                            margin: EdgeInsets.only(
                                left: mQuery.size.width*0.045,
                                right: mQuery.size.width*0.01
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(repairList[index]['image']),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: SizedBox()),
                                Text(
                                  repairList[index]['text'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'SatoshiBold',
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: mQuery.size.height * 0.012),
                                Container(
                                  width: mQuery.size.width * 0.3,
                                  height: mQuery.size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'SatoshiBold',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: mQuery.size.height * 0.023),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mQuery.size.height*0.023,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}






