import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usc_project/DashBoard/Home/AC/addToCart.dart';

import '../../powerSaverAc.dart';
import '../ac_service.dart';

Widget acServiceAndRepairContent(BuildContext context)
{
  var mQuery = MediaQuery.of(context);
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Column(
        children: [
          SizedBox(height: 44,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 204,
                    padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width*0.045
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width * 0.045,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              dynamicDataList.length,
                                  (index) => Container(
                                width: mQuery.size.width * 0.6,
                                height: mQuery.size.height * 0.065,
                                padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                                margin : EdgeInsets.only(right: mQuery.size.width * 0.045),
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
                                            fontFamily: 'SatoshiBold',
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
                      ),
                      SizedBox(height: mQuery.size.height*0.023,),
                      Divider(
                        thickness: 9,
                        color: Color(0xffF6F6F6),
                      ),
                      SizedBox(height: mQuery.size.height*0.023,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width * 0.045,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset("assets/images/dashboard_images/home_images/service.png"),
                                  SizedBox(height: mQuery.size.height*0.01,),
                                  Text("Service",style: TextStyle(
                                      color: Color(0xff222222),
                                      fontFamily: 'SatoshiMedium',
                                      fontSize: 10
                                  ),)
                                ],
                              ),
                              SizedBox(width: mQuery.size.width*0.065,),
                              Column(
                                children: [
                                  Image.asset("assets/images/dashboard_images/home_images/rr.png"),
                                  SizedBox(height: mQuery.size.height*0.01,),
                                  Text("Repair &",style: TextStyle(
                                      color: Color(0xff222222),
                                      fontFamily: 'SatoshiMedium',
                                      fontSize: 10
                                  ),),
                                  Text("refill",style: TextStyle(
                                      color: Color(0xff222222),
                                      fontFamily: 'SatoshiMedium',
                                      fontSize: 10
                                  ),)
                                ],
                              ),
                              SizedBox(width: mQuery.size.width*0.065,),
                              Column(
                                children: [
                                  Image.asset("assets/images/dashboard_images/home_images/installing.png"),
                                  SizedBox(height: mQuery.size.height*0.01,),
                                  Text("Install &",style: TextStyle(
                                      color: Color(0xff222222),
                                      fontFamily: 'SatoshiMedium',
                                      fontSize: 10
                                  ),),
                                  Text("uninstall",style: TextStyle(
                                      color: Color(0xff222222),
                                      fontFamily: 'SatoshiMedium',
                                      fontSize: 10
                                  ),)
                                ],
                              ),
                              SizedBox(width: mQuery.size.width*0.065,),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius : BorderRadius.circular(8),
                                    child: Image.asset
                                      ("assets/images/dashboard_images/home_images/other.jpg",
                                      width : mQuery.size.width*0.14,
                                      height: mQuery.size.height*0.1,),
                                  ),
                                  SizedBox(height: mQuery.size.height*0.01,),
                                  Text("Others",style: TextStyle(
                                      color: Color(0xff222222),
                                      fontFamily: 'SatoshiMedium',
                                      fontSize: 10
                                  ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: mQuery.size.height*0.023,),
                      Divider(
                        thickness: 9,
                        color: Color(0xffF6F6F6),
                      ),
                      SizedBox(height: mQuery.size.height*0.023,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width * 0.045,
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap : ()
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return PowerSaverAc();
                                }));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        serviceDetails2['service1Name'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'SatoshiBold',
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: mQuery.size.height * 0.023),
                                      Text(
                                        serviceDetails2['service1Desc'],
                                        style: TextStyle(
                                            color: Color(0xff7E7E7E),
                                            fontFamily: 'SatoshiBold',
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: mQuery.size.height*0.01,),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            initialRating: serviceDetails2['service1Rating'],
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            itemSize: mQuery.size.height * 0.03,
                                            allowHalfRating: true,
                                            itemCount: 1,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.black,
                                            ),
                                            onRatingUpdate: (rating)
                                            {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(width: mQuery.size.width * 0.032),
                                          Text(
                                            "${serviceDetails2['service1Rating']} (${serviceDetails2['service1Reviews']})",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'SatoshiBold',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: mQuery.size.height * 0.016),
                                      Text(
                                        serviceDetails2['service1StartPrice'],
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'SatoshiBold',
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: mQuery.size.height * 0.016),
                                      Text("View details",style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'SatoshiBold'
                                      ),),
                                      SizedBox(height: mQuery.size.height * 0.016),
                                      Text("Price includes labor charges foe 1\n"
                                          "switchbox installation (15+ amp)",style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff4B4B4B),
                                          fontFamily: 'SatoshiMedium'
                                      ),)
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    width: 100,
                                    height: 150,
                                    child: Stack(
                                      children: [
                                        Image.asset("assets/images/dashboard_images/home_images/powerAc.png"),
                                        Positioned(
                                          top: 75, // Adjust this to position the container at the top of the image
                                          left: 6, // Adjust this to position the container horizontally
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.23,
                                            height: MediaQuery.of(context).size.height * 0.045,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: mQuery.size.width*0.03
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xff161616),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                    onTap : ()
                                                    {
                                                      setState(() {
                                                        if(value > 0)
                                                          value--;
                                                      });
                                                    },
                                                    child: Container(
                                                        width: MediaQuery.of(context).size.width * 0.05,
                                                        height: MediaQuery.of(context).size.height * 0.045,
                                                        child: Icon(Icons.remove,color: Colors.white,size: mQuery.size.height*0.025,))),
                                                Text("$value",style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'SatoshiMedium'
                                                ),),
                                                GestureDetector(
                                                    onTap : ()
                                                    {
                                                      setState(() {
                                                        value++;
                                                      });
                                                    },
                                                    child: Container(
                                                        width: MediaQuery.of(context).size.width * 0.05,
                                                        height: MediaQuery.of(context).size.height * 0.045,
                                                        child: Icon(Icons.add,color: Colors.white,size: mQuery.size.height*0.025,)))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                            SizedBox(height: mQuery.size.height*0.023,),
                            Divider(color: Color(0xffE1E1E1),),
                            SizedBox(height: mQuery.size.height*0.023,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      serviceDetails3['service1Name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'SatoshiBold',
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: mQuery.size.height * 0.023),
                                    Text(
                                      serviceDetails3['service1Desc'],
                                      style: TextStyle(
                                          color: Color(0xff7E7E7E),
                                          fontFamily: 'SatoshiBold',
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: mQuery.size.height*0.01,),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: serviceDetails2['service1Rating'],
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
                                        SizedBox(width: mQuery.size.width * 0.032),
                                        Text(
                                          "${serviceDetails3['service1Rating']} (${serviceDetails3['service1Reviews']})",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'SatoshiBold',
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: mQuery.size.height * 0.016),
                                    Text(
                                      serviceDetails3['service1StartPrice'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'SatoshiBold',
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: mQuery.size.height * 0.016),
                                    Text("View details",style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SatoshiBold'
                                    ),),
                                    SizedBox(height: mQuery.size.height * 0.016),
                                    Text("Price includes labor charges foe 1\n"
                                        "switchbox installation (15+ amp)",style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff4B4B4B),
                                        fontFamily: 'SatoshiMedium'
                                    ),)
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Container(
                                  width: 100,
                                  height: 150,
                                  child: Stack(
                                    children: [
                                      Image.asset("assets/images/dashboard_images/home_images/switchBoard.png"),
                                      Positioned(
                                        top: 75, // Adjust this to position the container at the top of the image
                                        left: 6, // Adjust this to position the container horizontally
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.23,
                                          height: MediaQuery.of(context).size.height * 0.045,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: mQuery.size.width*0.03
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xff161616),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                  onTap : ()
                                                  {
                                                    setState(() {
                                                      if(value2 > 0)
                                                        value2--;
                                                    });
                                                  },
                                                  child: Container(
                                                      width: MediaQuery.of(context).size.width * 0.05,
                                                      height: MediaQuery.of(context).size.height * 0.045,
                                                      child: Icon(Icons.remove,color: Colors.white,size: mQuery.size.height*0.025,))),
                                              Text("$value2",style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'SatoshiMedium'
                                              ),),
                                              GestureDetector(
                                                  onTap : ()
                                                  {
                                                    setState(() {
                                                      value2++;
                                                    });
                                                  },
                                                  child: Container(
                                                      width: MediaQuery.of(context).size.width * 0.05,
                                                      height: MediaQuery.of(context).size.height * 0.04,
                                                      child: Icon(Icons.add,color: Colors.white,size: mQuery.size.height*0.025,)))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: mQuery.size.height*0.023,),

                            Divider(color: Color(0xffE1E1E1),),
                            SizedBox(height: mQuery.size.height*0.023,),
                          ],
                        ),
                      )


                    ],
                  )
                ],
              ),
            ),
          ),

          (value2 == 0 && value == 0 ) ? Container() :  Container(
            width: double.infinity,
            height: mQuery.size.height*0.095,
            padding: EdgeInsets.symmetric(
                horizontal: mQuery.size.width*0.045
            ),
            color: Colors.black,
            child: Row(
              children: [
                Text("Total",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'SatoshiBold'
                ),),
                SizedBox(width: mQuery.size.width*0.023,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("QAR $totalQar",style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'SatoshiMedium'
                    ),),
                    SizedBox(height: mQuery.size.height*0.027,)
                  ],
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: ()
                  {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return AddToCart();
                    }));
                  },
                  child: Container(
                    width: mQuery.size.width*0.3,
                    height: mQuery.size.height*0.045,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Center(
                      child: Text("View Cart",style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'SatoshiBold'
                      ),),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    }
  );
}