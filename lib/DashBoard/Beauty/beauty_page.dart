import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usc_project/DashBoard/Beauty/Components/bleachPage.dart';
import 'package:usc_project/DashBoard/Beauty/Components/facialCleanupPage.dart';
import 'package:usc_project/DashBoard/Beauty/Components/hairCarePage.dart';
import 'package:usc_project/DashBoard/Beauty/Components/manicurePage.dart';
import 'package:usc_project/DashBoard/Beauty/Components/pedicurePage.dart';
import 'package:usc_project/DashBoard/Beauty/Components/threadingPage.dart';
import 'package:usc_project/DashBoard/Beauty/Components/waxingPage.dart';

import '../Home/AC/ac_service.dart';
import '../Home/powerSaverAc.dart';
import 'Components/bestSellerPackages.dart';
import 'Components/makeYourPackages.dart';

Map<String, dynamic> serviceDetails = {
  'imagePath': "assets/images/dashboard_images/home_images/salonImage.jpg",
  'serviceName': "Salon Classic",
  'rating': 4.83,
  'bookingCount': "4.6 M bookings"
};

class BeautyPage extends StatefulWidget {
  const BeautyPage({super.key});

  @override
  State<BeautyPage> createState() => _BeautyPageState();
}

class _BeautyPageState extends State<BeautyPage> {

  bool isBestSellerPackages = true;   // By default it will be true
  bool isMakeYourPackages = false;
  bool isWaxing = false;
  bool isFacial = false;
  bool isManicure = false;
  bool isPedicure = false;
  bool isThreading = false;
  bool isBleach = false;
  bool isHairCare = false;

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mQuery.size.height*0.04,),
            Container(
              width: double.infinity,
              height: 204,
              padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                      image: AssetImage(serviceDetails['imagePath']))
              ),
              child: Column(
                children: [
                  SizedBox(height: mQuery.size.height*0.023,),
                  Row(
                    children: [
                      GestureDetector(
                          onTap : (){
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg")
                      ),
                      Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/images/profile_images/circularSearch.svg"),
                      SizedBox(width: mQuery.size.width*0.032,),
                      SvgPicture.asset("assets/images/profile_images/circlularShare.svg"),
                    ],
                  )
                ],
              ),
            ),
        
            SizedBox(height: mQuery.size.height * 0.023),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width * 0.045,
                  ),
                  child: Text(
                    serviceDetails['serviceName'],
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width * 0.045,
                  ),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        initialRating: serviceDetails['rating'],
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
                        "${serviceDetails['rating']} (${serviceDetails['bookingCount']})",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'SatoshiBold',
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(height: mQuery.size.height*0.016,),
        
                // from map
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      dynamicDataList.length,
                          (index) => Container(
                        width: mQuery.size.width * 0.6,
                        height: mQuery.size.height * 0.065,
                        margin: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width*0.045
                        ),
                        padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                        // margin : EdgeInsets.only(right: mQuery.size.width * 0.045),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffE2E2E2),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(dynamicDataList[index]['icon']!),
                            Expanded(child: SizedBox()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dynamicDataList[index]['text1']!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontFamily: 'SatoshiBold',
                                  ),
                                ),
                                Text(
                                  dynamicDataList[index]['text2']!,
                                  style: TextStyle(
                                    color: Color(0xff757575),
                                    fontSize: 11,
                                    fontFamily: 'SatoshiMedium',
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mQuery.size.height*0.023,),
                Divider(
                  thickness: 9,
                  color: Color(0xffF6F6F6),
                ),
                SizedBox(height: mQuery.size.height*0.023,),
                /// Gridview here
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // BestSeller Packages 
                          Column(
                            children: [
                              GestureDetector(
                                onTap : ()
                                {
                                  setState(() {
                                    isBestSellerPackages = true;   // By default it will be true
                                    isMakeYourPackages = false;
                                  });
                                },
                                child: Container(
                                  width: mQuery.size.width*0.24,
                                  height: mQuery.size.height*0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xfff5f5f5)
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset
                                      ("assets/images/beauty_images/orangeStar.svg",
                                      width: mQuery.size.width*0.1,),
                                  ),
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("Bestseller\nPackages",style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'SatoshiRegular',
                                color: Colors.black
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap : ()
                                {
                                  setState(() {
                                    isBestSellerPackages = false;
                                    isMakeYourPackages = true;
                                  });
                                },
                                child: Container(
                                  width: mQuery.size.width*0.24,
                                  height: mQuery.size.height*0.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xfff5f5f5)
                                  ),
                                  child: Center(
                                    child: Image.asset
                                      ("assets/images/beauty_images/shampoo.png",
                                      width: mQuery.size.width*0.13,),
                                  ),
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("Make your\nPackages",style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiRegular',
                                  color: Colors.black
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: mQuery.size.width*0.24,
                                height: mQuery.size.height*0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xfff5f5f5)
                                ),
                                child: Center(
                                  child: Image.asset
                                    ("assets/images/beauty_images/waxing.png",
                                    width: mQuery.size.width*0.16,),
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("Waxing",style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiRegular',
                                  color: Colors.black
                              ),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: mQuery.size.height*0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: mQuery.size.width*0.24,
                                height: mQuery.size.height*0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xfff5f5f5)
                                ),
                                child: Center(
                                  child: Image.asset
                                    ("assets/images/beauty_images/facial.png",
                                    width: mQuery.size.width*0.1,),
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("Facials &\ncleanups",style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiRegular',
                                  color: Colors.black
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: mQuery.size.width*0.24,
                                height: mQuery.size.height*0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xfff5f5f5)
                                ),
                                child: Center(
                                  child: Image.asset
                                    ("assets/images/beauty_images/manicure.png",
                                    width: mQuery.size.width*0.16,),
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("Manicure",style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiRegular',
                                  color: Colors.black
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: mQuery.size.width*0.24,
                                height: mQuery.size.height*0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xfff5f5f5)
                                ),
                                child: Center(
                                  child: Image.asset
                                    ("assets/images/beauty_images/pedicure.png",
                                    width: mQuery.size.width*0.1,),
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("Pedicure",style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiRegular',
                                  color: Colors.black
                              ),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: mQuery.size.height*0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: mQuery.size.width*0.24,
                                height: mQuery.size.height*0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xfff5f5f5)
                                ),
                                child: Center(
                                  child: Image.asset
                                    ("assets/images/beauty_images/threading.png",
                                    width: mQuery.size.width*0.09,),
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("Threading",style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiRegular',
                                  color: Colors.black
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: mQuery.size.width*0.24,
                                height: mQuery.size.height*0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xfff5f5f5)
                                ),
                                child: Center(
                                  child: Image.asset
                                    ("assets/images/beauty_images/bleach.png",
                                    width: mQuery.size.width*0.14,),
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("Bleach & detan",style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiRegular',
                                  color: Colors.black
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: mQuery.size.width*0.24,
                                height: mQuery.size.height*0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xfff5f5f5)
                                ),
                                child: Center(
                                  child: Image.asset
                                    ("assets/images/beauty_images/hairCare.png",
                                    width: mQuery.size.width*0.16,),
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Text("Hair care",style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiRegular',
                                  color: Colors.black
                              ),)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),

        
                SizedBox(height: mQuery.size.height*0.023,),
                Divider(
                  thickness: 9,
                  color: Color(0xffF5F5F5),
                ),
                SizedBox(height: mQuery.size.height*0.023,),

                /// BestSellerPackage content
                BestSellerPackagesPage(),
                Divider(
                  thickness: 9,
                  color: Color(0xfff5f5f5),
                ),
                SizedBox(height: mQuery.size.height*0.023,),

                /// MakeYourPackages content
                MakeYourPackagesPage(),
                Divider(
                  thickness: 9,
                  color: Color(0xfff5f5f5),
                ),
                SizedBox(height: mQuery.size.height*0.023,),


                // WaxingPage content
                WaxingPage(),
                Divider(
                  thickness: 9,
                  color: Color(0xfff5f5f5),
                ),
                SizedBox(height: mQuery.size.height*0.023,),


                // Facial & Cleanup content
                FacialCleanupPage(),
                Divider(
                  thickness: 9,
                  color: Color(0xfff5f5f5),
                ),
                SizedBox(height: mQuery.size.height*0.023,),

                // Manicure content
                ManicurePage(),
                Divider(
                  thickness: 9,
                  color: Color(0xfff5f5f5),
                ),
                SizedBox(height: mQuery.size.height*0.023,),

                // Pedicure content
                PedicurePage(),
                SizedBox(height: mQuery.size.height*0.045,),
                Divider(
                  thickness: 9,
                  color: Color(0xfff5f5f5),
                ),
                SizedBox(height: mQuery.size.height*0.023,),


                // Threading
                ThreadingPage(),SizedBox(height: mQuery.size.height*0.045,),
                Divider(
                  thickness: 9,
                  color: Color(0xfff5f5f5),
                ),
                SizedBox(height: mQuery.size.height*0.023,),


                // Bleach & Detan
                BleachPage(),
                Divider(
                  thickness: 9,
                  color: Color(0xfff5f5f5),
                ),
                SizedBox(height: mQuery.size.height*0.023,),


                // Hair care
                HairCarePage()







               ],
            )
          ],
        ),
      ),
    );
  }


}
