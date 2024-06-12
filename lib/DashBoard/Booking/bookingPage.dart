import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<Map<String, dynamic>> activeBookingDataList = [
    {
      'product': "Refrigerator",
      'code': "#571224",
      'qar1': 49,
      'qar2': 197,
      'zone': "Mar 23, 2024 10:00 AM",
      'time': "45 min",
      'status': "Accepted",
    },
    {
      'product': "Water Chillers",
      'code': "#571225",
      'qar1': 59,
      'qar2': 207,
      'zone': "Mar 24, 2024 11:00 AM",
      'time': "50 min",
      'status': "In process",
    },
  ];

  List<Map<String, dynamic>> successBookingDataList = [
    {
      'product': "Cooling System R...",
      'code': "#571224",
      'qar1': 49,
      'qar2': 197,
      'zone': "Mar 23, 2024 10:00 AM",
      'time': "45 min",
      'status': "Completed",
    },
    {
      'product': "Door Seal Replacem...",
      'code': "#571225",
      'qar1': 59,
      'qar2': 207,
      'zone': "Mar 24, 2024 11:00 AM",
      'time': "50 min",
      'status': "Completed",
    },
  ];

  bool isActive = true;
  bool isSuccess = false;
  bool isCancelled = false;

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: mQuery.size.height*0.053,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                    ),
                    SizedBox(width: mQuery.size.width * 0.033),
                    Text(
                      "Booking",
                      style: TextStyle(fontSize: 24, fontFamily: 'SatoshiBold'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: mQuery.size.height * 0.02),
          Divider(
            color: Color(0xffDADADA),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height*0.055,
                    margin : EdgeInsets.symmetric(
                      horizontal: mQuery.size.width*0.045
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: mQuery.size.width*0.02
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffF1F1F1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap : ()
                          {
                            setState(() {
                              isActive = true;
                              isSuccess = false;
                              isCancelled = false;
                            });
                          },
                          child: Container(
                            width: mQuery.size.width*0.25,
                            height: mQuery.size.height*0.04,
                            decoration: BoxDecoration(
                              color: isActive ? Colors.black : Color(0xffF1F1F1),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text("Active",style: TextStyle(
                                color: isActive ? Colors.white : Colors.black,
                                fontSize: 12,
                                fontFamily: 'SatoshiBold'
                              ),),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: ()
                          {
                            setState(() {
                              isActive = false;
                              isSuccess = true;
                              isCancelled = false;
                            });
                          },
                          child: Container(
                            width: mQuery.size.width*0.25,
                            height: mQuery.size.height*0.04,
                            decoration: BoxDecoration(
                                color: isSuccess ? Colors.black : Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text("Success",style: TextStyle(
                                  color: isSuccess ? Colors.white : Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'SatoshiBold'
                              ),),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: ()
                          {
                            setState(() {
                              isActive = false;
                              isSuccess = false;
                              isCancelled = true;
                            });
                          },
                          child: Container(
                            width: mQuery.size.width*0.25,
                            height: mQuery.size.height*0.04,
                            decoration: BoxDecoration(
                                color: isCancelled ? Colors.black : Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text("Cancelled",style: TextStyle(
                                  color: isCancelled ? Colors.white : Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'SatoshiBold'
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              
              
                  if(isActive)
                    activeContainerWidgets(context)
                  else if(isSuccess)
                  successContainerWidgets(context)
                  else
                    cancelledContainerWidgets(context),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget activeContainerWidgets(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);
    return Container(
      width : double.infinity,
      height: mQuery.size.height*0.9,
      child: ListView.builder(
        itemCount: activeBookingDataList.length,
        itemBuilder: (context, index) {
          var bookingData = activeBookingDataList[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045, vertical: mQuery.size.height * 0.014),
            child: Container(
              width: double.infinity,
              height: mQuery.size.height * 0.34,
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.3)
                      , spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(0, 0)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mQuery.size.height * 0.016),
                  Row(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff000000)),
                        child: Center(
                          child: SvgPicture.asset("assets/images/dashboard_images/home_images/highfive.svg"),
                        ),
                      ),
                      SizedBox(width: mQuery.size.width * 0.025),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${bookingData['product']}",
                            style: TextStyle(fontFamily: 'SatoshiBold'),
                          ),
                          Text(
                            "${bookingData['code']}",
                            style: TextStyle(color: Color(0xff6F767E), fontFamily: 'SatoshiRegular', fontSize: 13),
                          ),
                          Text(
                            "${bookingData['zone']}",
                            style: TextStyle(fontFamily: 'SatoshiBold', fontSize: 13),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "QAR ${bookingData['qar1']}",
                        style: TextStyle(fontFamily: 'SatoshiBold'),
                      ),
                    ],
                  ),
                  SizedBox(height: mQuery.size.height * 0.01),
                  Container(
                    width: mQuery.size.width * 0.2,
                    height: mQuery.size.height * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: bookingData['status'] == 'Accepted' ? Color(0xffD9EBFF) : Color(0xffFFEFD8),
                    ),
                    child: Center(
                      child: Text(
                        bookingData['status'],
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'SatoshiMedium',
                          color: bookingData['status'] == 'Accepted' ? Color(0xff3B79B3) : Color(0xffFF9000),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.007),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/dashboard_images/home_images/Westinghouse.svg"),
                      Column(
                        children: [
                          Text(
                            "Westinghouse",
                            style: TextStyle(fontFamily: 'SatoshiBold'),
                          ),
                          Text(
                            "Service provider",
                            style: TextStyle(fontSize: 12, fontFamily: 'SatoshiRegular', color: Color(0xff6F767E)),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Column(
                        children: [
                          Container(
                            width: mQuery.size.height * 0.13,
                            height: mQuery.size.height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff777777),
                            ),
                            child: Center(
                              child: Text(
                                "Track Order",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'SatoshiMedium',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.01),
                          Container(
                            width: mQuery.size.height * 0.13,
                            height: mQuery.size.height * 0.045,
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
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      // Handle cancel booking
                    },
                    child: Container(
                      width: double.infinity,
                      height: mQuery.size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(color: Color(0xffFF2120)),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel Booking",
                          style: TextStyle(color: Color(0xffFF2120), fontFamily: 'SatoshiBold'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.02),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget successContainerWidgets(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);
    return Container(
      width : double.infinity,
      height: mQuery.size.height*0.7,
      child: ListView.builder(
        itemCount: successBookingDataList.length,
        itemBuilder: (context, index) {
          var bookingData = successBookingDataList[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045, vertical: mQuery.size.height * 0.014),
            child: Container(
              width: double.infinity,
              height: mQuery.size.height * 0.3,
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.3)
                      , spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(0, 0)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mQuery.size.height * 0.016),
                  Row(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff000000)),
                        child: Center(
                          child: SvgPicture.asset("assets/images/dashboard_images/home_images/highfive.svg"),
                        ),
                      ),
                      SizedBox(width: mQuery.size.width * 0.025),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${bookingData['product']}",
                            style: TextStyle(fontFamily: 'SatoshiBold'),
                          ),
                          Text(
                            "${bookingData['code']}",
                            style: TextStyle(color: Color(0xff6F767E), fontFamily: 'SatoshiRegular', fontSize: 13),
                          ),
                          Text(
                            "${bookingData['zone']}",
                            style: TextStyle(fontFamily: 'SatoshiBold', fontSize: 13),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "QAR ${bookingData['qar1']}",
                        style: TextStyle(fontFamily: 'SatoshiBold'),
                      ),
                    ],
                  ),
                  SizedBox(height: mQuery.size.height * 0.01),
                  Container(
                    width: mQuery.size.width * 0.2,
                    height: mQuery.size.height * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: bookingData['status'] == 'Completed' ? Color(0xffF5D9FF) : Color(0xffFFEFD8),
                    ),
                    child: Center(
                      child: Text(
                        bookingData['status'],
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'SatoshiMedium',
                          color: bookingData['status'] == 'Completed' ? Color(0xffC61BFF) : Color(0xffFF9000),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.007),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/dashboard_images/home_images/Westinghouse.svg"),
                      Column(
                        children: [
                          Text(
                            "Westinghouse",
                            style: TextStyle(
                                color: Color(0xff1A1D1F),
                                fontFamily: 'SatoshiBold'),
                          ),
                          Text(
                            "Service provider",
                            style: TextStyle(fontSize: 12,
                                fontFamily: 'SatoshiRegular', color: Color(0xff6F767E)),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        width: mQuery.size.height * 0.13,
                        height: mQuery.size.height * 0.045,
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
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      // Handle cancel booking
                    },
                    child: Container(
                      width: double.infinity,
                      height: mQuery.size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(color: Color(0xff1029AD)),
                      ),
                      child: Center(
                        child: Text(
                          "Reorder",
                          style: TextStyle(color: Color(0xff1029AD), fontFamily: 'SatoshiBold'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.02),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget cancelledContainerWidgets(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);
    return Column(
      children: [
        SizedBox(height: mQuery.size.height*0.3,),
        Center(
          child: Text("Cancelled Bookings here",style: TextStyle(
              fontFamily: 'SatoshiBold'
          ),),
        ),
      ],
    );
  }
}


// SizedBox(height: mQuery.size.height*0.053,),