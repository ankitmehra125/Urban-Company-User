import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  Map<String, dynamic> orderData = {
    'providerName': 'Westinghouse',
    'providerType': 'Service provider',
    'deliveryTime': '25 Min',
    'deliveryAddress': '37 New line, Sunamganj',
    'orderID': '#175422',
  };

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: mQuery.size.height * 0.14,
                padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                color: Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                    ),
                    SizedBox(width: mQuery.size.width * 0.032),
                    Text(
                      "Track Order",
                      style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'SatoshiBold'),
                    ),
                    Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/images/dashboard_images/home_images/circleMenu.svg"),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: mQuery.size.height * 0.8,
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/dashboard_images/home_images/mapBackground.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: mQuery.size.height * 0.4, // Adjust height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: mQuery.size.height * 0.045),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.075),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/dashboard_images/home_images/Westinghouse.svg"),
                            Column(
                              children: [
                                Text(
                                  orderData['providerName'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff1A1D1F),
                                    fontFamily: 'SatoshiBold',
                                  ),
                                ),
                                Text(
                                  orderData['providerType'],
                                  style: TextStyle(fontSize: 12, fontFamily: 'SatoshiRegular', color: Color(0xff6F767E)),
                                ),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Container(
                              width: mQuery.size.height * 0.1,
                              height: mQuery.size.height * 0.055,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/dashboard_images/home_images/callIcon.svg"),
                                  SizedBox(width: mQuery.size.width * 0.007),
                                  Text(
                                    "Call",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontFamily: 'SatoshiMedium',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: mQuery.size.height * 0.023),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/dashboard_images/home_images/TimeCircle.svg"),
                            SizedBox(width: mQuery.size.width * 0.032),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery In",
                                  style: TextStyle(color: Color(0xff616A7D), fontFamily: 'SatoshiMedium'),
                                ),
                                Text(
                                  orderData['deliveryTime'],
                                  style: TextStyle(color: Colors.black, fontFamily: 'SatoshiMedium'),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: mQuery.size.height * 0.023),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/dashboard_images/home_images/Location.svg"),
                            SizedBox(width: mQuery.size.width * 0.032),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery Address",
                                  style: TextStyle(color: Color(0xff616A7D), fontFamily: 'SatoshiMedium'),
                                ),
                                Text(
                                  orderData['deliveryAddress'],
                                  style: TextStyle(color: Colors.black, fontFamily: 'SatoshiMedium'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height * 0.07,
                    margin: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.085),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/dashboard_images/home_images/orderIcon.svg"),
                        SizedBox(width: mQuery.size.width * 0.01),
                        Text(
                          "Order ID: ${orderData['orderID']}",
                          style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'SatoshiBold'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.016),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
