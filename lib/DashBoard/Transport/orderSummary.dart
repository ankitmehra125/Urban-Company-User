import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderSummary extends StatefulWidget {
  final String senderMobile;
  final String senderName;
  final String receiverName;
  final String receiverMobile;
  final String weight;
  final String category;
  final String paymentType;

  const OrderSummary({
    Key? key,
    required this.senderMobile,
    required this.senderName,
    required this.receiverName,
    required this.receiverMobile,
    required this.weight,
    required this.category,
    required this.paymentType
  }) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kToolbarHeight,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mQuery.size.width*0.045
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                    ),
                    SizedBox(width: mQuery.size.width * 0.045),
                    Text("Order Summary",
                      style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'SatoshiBold'),
                    )
                  ],
                ),
                SizedBox(height: mQuery.size.height*0.032,),
                Text("06 Mar 2024, 11:99",style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'SatoshiBold'
                ),),
              ],
            ),
          ),
          Divider(thickness: 2,),
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
                    Text("Pickup Address",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(width: mQuery.size.width*0.032,),
                    SvgPicture.asset("assets/images/transport_images/truckIcon.svg")
                  ],
                ),
                SizedBox(height: mQuery.size.height*0.01,),
                Text("Name : ${widget.senderName}", style: TextStyle(color: Colors.black, fontSize: 13, fontFamily: 'SatoshiBold')),
                Text("Mobile Number : ${widget.senderMobile}", style: TextStyle(color: Colors.black, fontSize: 13, fontFamily: 'SatoshiBold')),
              ],
            ),
          ),
          SizedBox(height: mQuery.size.height*0.055,),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mQuery.size.width*0.045
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Delivery Address",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(width: mQuery.size.width*0.032,),
                    SvgPicture.asset("assets/images/transport_images/deliveryIcon.svg")
                  ],
                ),
                SizedBox(height: mQuery.size.height*0.01,),
                Text("Name : ${widget.receiverName}", style: TextStyle(color: Colors
                    .black, fontSize: 13, fontFamily: 'SatoshiBold')),
                Text("Mobile Number : ${widget.receiverMobile}", style: TextStyle(color:
                Colors.black, fontSize: 13, fontFamily: 'SatoshiBold')),
              ],
            ),
          ),
          SizedBox(height: mQuery.size.height*0.032,),
          Divider(thickness: 2,),
          SizedBox(height: mQuery.size.height*0.023,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mQuery.size.width*0.045
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Weight : ${widget.weight}", style: TextStyle(color: Colors
                    .black, fontSize: 13, fontFamily: 'SatoshiBold')),
                Text("Category : ${widget.category}", style: TextStyle(color: Colors
                    .black, fontSize: 13, fontFamily: 'SatoshiBold')),
                Text("Payment Type : ${widget.paymentType}", style: TextStyle
                  (color: Colors
                    .black, fontSize: 13, fontFamily: 'SatoshiBold')),
              ],
            ),
          ),
          SizedBox(height: mQuery.size.height*0.032,),
          Divider(thickness: 2,),
          SizedBox(height: mQuery.size.height*0.023,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mQuery.size.width*0.045
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Fare",style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'SatoshiBold'
                ),),
                Text("QAR500",style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'SatoshiBold'
                ),),
              ],
            ),
          ),
          SizedBox(height: mQuery.size.height*0.016,),
          Divider(thickness: 2,),
          SizedBox(height: mQuery.size.height*0.023,),
          Container(
            width: double.infinity,
            height: mQuery.size.height*0.055,
            margin: EdgeInsets.symmetric(
              horizontal: mQuery.size.width*0.045
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black
            ),
            child: Center(
              child: Text("Proceed to pay",style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'SatoshiBold'
              ),),
            ),
          ),
          SizedBox(height: mQuery.size.height*0.01,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mQuery.size.width*0.045
            ),
            child: Text("By proceeding, you agreee to our T&C, Privacy and Cancellation policy.",style: TextStyle(
              color: Colors.grey,
              fontSize: 12
            ),),
          )
        ],
      ),
    );
  }
}
