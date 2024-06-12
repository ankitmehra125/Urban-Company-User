import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancellationCompleted extends StatefulWidget {
  const CancellationCompleted({Key? key}) : super(key: key);

  @override
  State<CancellationCompleted> createState() => _CancellationCompletedState();
}

class _CancellationCompletedState extends State<CancellationCompleted> {

  // Define your variable to store the value
  String orderNumber = "#571224";

  bool isCancel = false;
  bool isCompleted = false;

  var initialRating = 4;

  TextEditingController feedbackController = TextEditingController();

  // Define your map with values
  Map<String, Map<String, dynamic>> cancellationDetails = {
    "device1": {
      "name": "Device Name",
      "description": "Problem type Description 1",
      "price": "QAR 168",
    },
    "device2": {
      "name": "Door Seal Replacement",
      "description": "Suited for repair or replacement ",
      "price": "QAR 29",
    },
    // Add more devices as needed
  };

  Map<String, String> dataMap = {
    "id": "#524587",
    "name": "Fahad",
    "company": "Right Joy Pvt. Ltd.",
    "address": "!534 Single Street.,Qatar",
  };

  Map<String, String> paymentSummaryMap = {
    "title": "Payment Summary",
    "totalItems": "Total Items (2)",
    "totalItemsValue": "QAR 197",
    "serviceFee": "Service Fee",
    "serviceFeeValue": "QAR 10",
    "discount": "Discount",
    "discountValue": "3%",
    "total": "Total",
    "totalValue": "QAR 194",
  };

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: mQuery.size.height * 0.053,
              ),
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                          "assets/images/dashboard_images/home_images/circleBack.svg"),
                    ),
                    SizedBox(width: mQuery.size.width * 0.033),
                    Text(
                      orderNumber, // Use the variable here
                      style: TextStyle(fontSize: 24, fontFamily: 'SatoshiBold'),
                    ),
                    Expanded(child: SizedBox()),
                    isCancel
                        ? SizedBox()
                        : Container(
                            width: mQuery.size.height * 0.1,
                            height: mQuery.size.height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    "assets/images/dashboard_images/home_images/callIcon.svg"),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: cancellationDetails.entries.map((entry) {
                      String key = entry.key;
                      Map<String, dynamic> device = entry.value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: mQuery.size.height * 0.023,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mQuery.size.width * 0.045),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      device["name"] ?? "",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'SatoshiBold',
                                          color: Colors.black),
                                    ),
                                    Text(
                                      device["description"] ?? "",
                                      style: TextStyle(
                                          color: Color(0xff808082),
                                          fontFamily: 'SatoshiBold'),
                                    )
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  device["price"] ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'SatoshiBold',
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: mQuery.size.height * 0.023,
                          ),
                          Divider(
                            color: Color(0xffDADADA),
                          ),
                          SizedBox(
                            height: mQuery.size.height * 0.023,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width * 0.055),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: mQuery.size.height * 0.13,
                          padding: EdgeInsets.symmetric(
                              horizontal: mQuery.size.width * 0.045),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 2, color: Color(0xfff3f3f3))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dataMap['id']!,
                                    style: TextStyle(
                                        color: Color(0xff017AFF),
                                        fontFamily: 'SatoshiBold'),
                                  ),
                                  Text(
                                    dataMap['name']!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SatoshiBold'),
                                  ),
                                  Text(
                                    dataMap['company']!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'SatoshiMedium'),
                                  ),
                                  Text(
                                    dataMap['address']!,
                                    style: TextStyle(
                                        color: Color(0xffB5B5B5),
                                        fontSize: 12,
                                        fontFamily: 'SatoshiMedium'),
                                  )
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Column(
                                children: [
                                  SizedBox(
                                    height: mQuery.size.height * 0.023,
                                  ),
                                  isCancel
                                      ? Container(
                                          width: mQuery.size.width * 0.25,
                                          height: mQuery.size.height * 0.035,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xffCA3939)),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xffFF2120),
                                                fontFamily: 'SatoshiMedium',
                                              ),
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isCompleted = !isCompleted;
                                            });
                                          },
                                          child: Container(
                                            width: mQuery.size.width * 0.25,
                                            height: mQuery.size.height * 0.035,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: isCompleted ? Color(0xffF5D9FF) : Color(0xffD9EBFF)),
                                            child: Center(
                                              child: Text(
                                                isCompleted ? "Completed": "Accepted",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'SatoshiMedium',
                                                    color: isCompleted ? Color(0xffC61BFF) : Color(0xff3B79B3)),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.023,
                        ),
                        isCancel
                            ? Container(
                                width: double.infinity,
                                height: mQuery.size.height * 0.12,
                                padding: EdgeInsets.symmetric(
                                    horizontal: mQuery.size.width * 0.045),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 2, color: Color(0xfff3f3f3))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Your Rating",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'SatoshiBold',
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          unratedColor: Color(0xffDADADA),
                                          initialRating:
                                              initialRating.toDouble(),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemSize: mQuery.size.height * 0.045,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Color(0xffFFCB45),
                                          ),
                                          onRatingUpdate: (rating) {
                                            setState(() {
                                              initialRating = rating.toInt();
                                            });
                                          },
                                        ),
                                        Expanded(child: SizedBox()),
                                        Container(
                                          width: mQuery.size.width * 0.16,
                                          height: mQuery.size.height * 0.04,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Color(0xffDADADA))),
                                          child: Center(
                                            child: Text(
                                              initialRating.toStringAsFixed(1),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'SatoshiBold',
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : isCompleted
                                ? Container(
                                    width: double.infinity,
                                    height: mQuery.size.height * 0.34,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Color(0xffDADADA)
                                        )
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Feedback",style: TextStyle(
                                              color: Color(0xff1F2937),
                                              fontSize: 20,
                                              fontFamily: 'SatoshiBold'
                                            ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Please rate your experience below",style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'SatoshiMedium',
                                              color: Color(0xff4B5563)
                                            ),),
                                          ],
                                        ),
                                        SizedBox(height: mQuery.size.height*0.01,),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: mQuery.size.width*0.075
                                          ),
                                          child: Row(
                                            children: [
                                              RatingBar.builder(
                                                unratedColor: Color(0xffDADADA),
                                                initialRating:
                                                initialRating.toDouble(),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                itemSize: mQuery.size.height * 0.045,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Color(0xffFFCB45),
                                                ),
                                                onRatingUpdate: (rating) {
                                                  setState(() {
                                                    initialRating = rating.toInt();
                                                  });
                                                },
                                              ),
                                              Expanded(child: SizedBox()),
                                              Text("$initialRating/5 stars",style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff6B7280),
                                                fontFamily: 'SatoshiMedium'
                                              ),)
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: mQuery.size.height*0.023,),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: mQuery.size.width*0.06
                                          ),
                                          child: Text("Additional feedback",style: TextStyle(
                                            color: Color(0xff6B7280),
                                            fontSize: 13,
                                            fontFamily: 'SatoshiMedium'
                                          ),),
                                        ),
                                        SizedBox(height: mQuery.size.height*0.005,),
                                        Container(
                                          width: double.infinity,
                                          height: mQuery.size.height*0.12,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: mQuery.size.width*0.045
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            horizontal: mQuery.size.width*0.03
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                            border: Border.all(
                                              color: Color(0xffD1D5DB),
                                            )
                                          ),
                                          child: TextField(
                                            controller: feedbackController,
                                            cursorColor: Colors.grey,
                                            maxLines: null,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'SatoshiMedium',
                                              color: Color(0xff4B5563)
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "My feedback!!",
                                              hintStyle: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'SatoshiMedium',
                                                color: Color(0xff4B5563)
                                              ),
                                              border: InputBorder.none
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: Color(0xffFF2120),
                                    radius: Radius.circular(15),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      child: Container(
                                        width: double.infinity,
                                        height: mQuery.size.height * 0.12,
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                mQuery.size.width * 0.025),
                                        decoration: BoxDecoration(
                                            color: Color(0xffFFF2F2)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Cancellation Policy",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'SatoshiBold'),
                                            ),
                                            Text(
                                              "If you cancel less than 24 hourse before your "
                                              "booking you may be charged a cancellation fee up to the full amount of the services booked.",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff818183),
                                                  fontFamily: 'SatoshiMedium'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mQuery.size.height * 0.023,
                  ),
                  Divider(
                    color: Color(0xffDADADA),
                  ),
                  SizedBox(
                    height: mQuery.size.height * 0.016,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mQuery.size.width * 0.045,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          paymentSummaryMap["title"]!,
                          style: TextStyle(
                            color: Color(0xff101010),
                            fontSize: 20,
                            fontFamily: 'SatoshiBold',
                          ),
                        ),
                        SizedBox(height: mQuery.size.height * 0.01),
                        Row(
                          children: [
                            Text(
                              paymentSummaryMap["totalItems"]!,
                              style: TextStyle(
                                color: Color(0xff797575),
                                fontSize: 16,
                                fontFamily: 'SatoshiMedium',
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              paymentSummaryMap["totalItemsValue"]!,
                              style: TextStyle(
                                color: Color(0xff101010),
                                fontFamily: 'SatoshiBold',
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: mQuery.size.height * 0.01),
                        Row(
                          children: [
                            Text(
                              paymentSummaryMap["serviceFee"]!,
                              style: TextStyle(
                                color: Color(0xff797575),
                                fontSize: 16,
                                fontFamily: 'SatoshiMedium',
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              paymentSummaryMap["serviceFeeValue"]!,
                              style: TextStyle(
                                color: Color(0xff101010),
                                fontFamily: 'SatoshiBold',
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: mQuery.size.height * 0.01),
                        Row(
                          children: [
                            Text(
                              paymentSummaryMap["discount"]!,
                              style: TextStyle(
                                color: Color(0xff797575),
                                fontSize: 16,
                                fontFamily: 'SatoshiMedium',
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              paymentSummaryMap["discountValue"]!,
                              style: TextStyle(
                                color: Color(0xffFE8C00),
                                fontFamily: 'SatoshiBold',
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: mQuery.size.height * 0.01),
                        Row(
                          children: [
                            Text(
                              paymentSummaryMap["total"]!,
                              style: TextStyle(
                                color: Color(0xff797575),
                                fontSize: 16,
                                fontFamily: 'SatoshiMedium',
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              paymentSummaryMap["totalValue"]!,
                              style: TextStyle(
                                color: Color(0xff101010),
                                fontFamily: 'SatoshiBold',
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.023,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isCancel = !isCancel;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: mQuery.size.height * 0.07,
                            decoration: BoxDecoration(
                                color: Color(0xffE9E9E9),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0xff000000))),
                            child: Center(
                              child: Text(
                                isCancel ? "Give Feedback" : "cancel",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SatoshiBold',
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mQuery.size.height * 0.023,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
