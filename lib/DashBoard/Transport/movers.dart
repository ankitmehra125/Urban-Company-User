  import 'dart:ui';

import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:flutter/widgets.dart';
  import 'package:flutter_svg/flutter_svg.dart';
  import 'package:usc_project/DashBoard/Transport/orderSummary.dart';
  import 'package:usc_project/main.dart';
  
  class Movers extends StatefulWidget {
    const Movers({super.key});
  
    @override
    State<Movers> createState() => _MoversState();
  }
  
  class _MoversState extends State<Movers> {
  
    // For the PickUp Address
    TextEditingController senderNameController = TextEditingController();
    TextEditingController senderPhoneController = TextEditingController();
    TextEditingController senderAddressController = TextEditingController();
  
    // For the Delivery Address
    TextEditingController receiverNameController = TextEditingController();
    TextEditingController receiverPhoneController = TextEditingController();
    TextEditingController receiverAddressController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
  
    bool senderCheck = false;
    bool receiverCheck = false;
  
    // BY Default no Containers will be selected from the (Online and Offline)
    bool isOnline = false;
    bool isCash = false;

    String paymentType = '';

    late bool allFieldsFilled;

    @override
    void initState() {
      super.initState();
      allFieldsFilled = false; // Initialize allFieldsFilled to false initially
    }
  
  
    TextEditingController pickUpSearchController = TextEditingController();
    TextEditingController receiverSearchController = TextEditingController();
  
  
    @override
    Widget build(BuildContext context) {
  
      var mQuery = MediaQuery.of(context);
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: kToolbarHeight,),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Movers \nand packers",style: TextStyle(
                      fontSize: 34,
                      color: Colors.black,
                      fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.035,),
  
                    // PickUp Address
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
                    SizedBox(height: mQuery.size.height*0.023,),
                    Text("Name",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    buildTextField("Name", senderNameController),
                    Row(
                      children: [
                        Checkbox(
                          value: senderCheck,
                          activeColor: Colors.black,
                          onChanged: (value)
                          {
                            setState(() {
                              senderCheck = value!;
                            });
                          },
                        ),
                        Text("Use my contact for this booking",style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffABABAB),
                          fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
  
                    // Sender Number
                    SizedBox(height: mQuery.size.height*0.02,),
                    Text("Mobile Number ",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    buildTextField("Mobile Number", senderPhoneController),
  
  
                    SizedBox(height: mQuery.size.height*0.02,),
                    Text("Pickup Address",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    GestureDetector(
                      onTap: ()
                      {
                        pickUpAddressBottomSheet(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: mQuery.size.height*0.055,
                        padding: EdgeInsets.symmetric(
                            horizontal: mQuery.size.width*0.045
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Color(0xffE3E3E3)
                            )
                        ),
                        child: Text("Select Pickup Address",style: TextStyle(
                           height: 3,
                            fontSize: 13,
                            color: Color(0xffABABAB),
                            fontFamily: 'SatoshiMedium'
                        ),),
                        // child: TextField(
                        //   controller: senderAddressController,
                        //   cursorColor: Colors.grey,
                        //   style: TextStyle(
                        //       color: Colors.black,
                        //       fontFamily: 'SatoshiMedium'
                        //   ),
                        //   decoration: InputDecoration(
                        //       counter: SizedBox.shrink(),
                        //       border: InputBorder.none,
                        //       hintText: "Select Pickup Address",
                        //       hintStyle: TextStyle(
                        //           height: 1,
                        //           fontSize: 13,
                        //           color: Color(0xffABABAB),
                        //           fontFamily: 'SatoshiMedium'
                        //       )
                        //   ),
                        // ),
                      ),
                    ),
  
                    SizedBox(height: mQuery.size.height*0.045,),
  
  
  
                    /// Delivery Section
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
                    SizedBox(height: mQuery.size.height*0.023,),
                    Text("Name",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    buildTextField("Name", receiverNameController),
                    Row(
                      children: [
                        Checkbox(
                          value: receiverCheck,
                          activeColor: Colors.black,
                          onChanged: (value)
                          {
                            setState(() {
                              receiverCheck = value!;
                            });
                          },
                        ),
                        Text("Use my contact for this booking",style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffABABAB),
                            fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
  
                    // Sender Number
                    SizedBox(height: mQuery.size.height*0.02,),
                    Text("Mobile Number ",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    buildTextField("Mobile Number", receiverPhoneController),
  
  
                    SizedBox(height: mQuery.size.height*0.02,),
                    Text("Delivery Address",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    GestureDetector(
                      onTap: ()
                      {
                        receiverAddressBottomSheet(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: mQuery.size.height*0.055,
                        padding: EdgeInsets.symmetric(
                            horizontal: mQuery.size.width*0.045
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Color(0xffE3E3E3)
                            )
                        ),
                        child: Text("Select Delivery Address",style: TextStyle(
                            height: 3,
                            fontSize: 13,
                            color: Color(0xffABABAB),
                            fontFamily: 'SatoshiMedium'
                        ),),
                      ),
                    ),
  
  
                    SizedBox(height: mQuery.size.height*0.02,),
                    Text("Select Weight",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    Text("*Should accomodate on two wheeler",style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffABABAB),
                        fontFamily: 'SatoshiMedium'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height*0.055,
                      margin: EdgeInsets.only(
                        right: mQuery.size.width*0.4
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width*0.045
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Color(0xffE3E3E3)
                          )
                      ),
                      child: TextField(
                        controller: weightController,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SatoshiMedium'
                        ),
                        decoration: InputDecoration(
                            counter: SizedBox.shrink(),
                            border: InputBorder.none,
                            hintText: "1 KG",
                            hintStyle: TextStyle(
                                height: 1,
                                fontSize: 13,
                                color: Color(0xffABABAB),
                                fontFamily: 'SatoshiMedium'
                            )
                        ),
                      ),
                    ),
  
  
                    SizedBox(height: mQuery.size.height*0.02,),
                    Text("Item Type",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height*0.055,
                      padding: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width*0.045
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Color(0xffE3E3E3)
                          )
                      ),
                      child: TextField(
                        controller: categoryController,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SatoshiMedium'
                        ),
                        decoration: InputDecoration(
                            counter: SizedBox.shrink(),
                            border: InputBorder.none,
                            hintText: "E.g - Blanket, Clothes, Bags, etc.",
                            hintStyle: TextStyle(
                                height: 1,
                                fontSize: 13,
                                color: Color(0xffABABAB),
                                fontFamily: 'SatoshiMedium'
                            )
                        ),
                      ),
                    ),
  
                    SizedBox(height: mQuery.size.height*0.02,),
                    Text("Payment",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap : ()
                          {
                            setState(() {
                              isOnline = true;
                              isCash = false;
                              paymentType = "Online";
                            });
                          },
                          child: Container(
                            width: mQuery.size.width*0.43,
                            height: mQuery.size.height*0.055,
                            decoration: BoxDecoration(
                              color: isOnline ? Colors.black : Colors.transparent,
                              border: Border.all(
                                color: isOnline ? Colors.transparent : Colors.black
                              ),
                              borderRadius: BorderRadius.circular(17)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/transport_images/onlineIcon.svg"
                                 ,color: isOnline ? Colors.white : Colors.black,),
                                SizedBox(width: mQuery.size.width*0.016,),
                                Text("Online",style: TextStyle(
                                  color: isOnline ? Colors.white : Colors.black,
                                  fontFamily: 'SatoshiBold'
                                ),)
                              ],
                            ),
                          ),
                        ),
                         GestureDetector(
                           onTap: ()
                           {
                             setState(() {
                               isOnline = false;
                               isCash = true;
                               paymentType = "Cash";
                             });
                           },
                          child: Container(
                            width: mQuery.size.width*0.43,
                            height: mQuery.size.height*0.055,
                            decoration: BoxDecoration(
                              color: isCash ? Colors.black : Colors.transparent,
                              border: Border.all(
                                color: isCash ? Colors.transparent : Colors.black
                              ),
                              borderRadius: BorderRadius.circular(17)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset
                                  ("assets/images/transport_images/cashIcon.svg"
                                 ,color: isCash ? Colors.white :  Colors.black,),
                                SizedBox(width: mQuery.size.width*0.016,),
                                Text("Cash",style: TextStyle(
                                  color: isCash ? Colors.white : Colors.black,
                                  fontFamily: 'SatoshiBold'
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
  
                    SizedBox(height: mQuery.size.height*0.032,),
  
                    GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          allFieldsFilled = !allFieldsFilled;
                        });
                        navigateToOrderSummary(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: mQuery.size.height*0.055,
                        margin: EdgeInsets.symmetric(
                            horizontal: mQuery.size.width*0.055
                        ),
                        decoration: BoxDecoration(
                            color: allFieldsFilled ? Colors.black : Color(0xffD8D8D8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Proceed to checkout",style: TextStyle(
                            color: allFieldsFilled ? Colors.white : Color
                              (0xff858585),
                            fontSize: 16,
                            fontFamily: 'SatoshiBold'
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: mQuery.size.height*0.023,)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }




    void navigateToOrderSummary(BuildContext context) {
      // Update allFieldsFilled based on text field values
      allFieldsFilled = senderNameController.text.isNotEmpty &&
          senderPhoneController.text.isNotEmpty &&
          // senderAddressController.text.isNotEmpty &&  // it will uncomment after
          receiverNameController.text.isNotEmpty &&
          receiverPhoneController.text.isNotEmpty &&
          // receiverAddressController.text.isNotEmpty &&   // it will
          // uncomment after
          weightController.text.isNotEmpty &&
          categoryController.text.isNotEmpty;

      if (allFieldsFilled) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return OrderSummary(
            senderName: senderNameController.text,
            senderMobile: senderPhoneController.text,
            receiverName: receiverNameController.text,
            receiverMobile: receiverPhoneController.text,
            weight: weightController.text,
            category: categoryController.text,
            paymentType: paymentType,
          );
        }));
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Please fill in all the fields."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }



    Widget buildTextField(String labelText, TextEditingController controller,) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.055,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.045),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffE3E3E3)),
        ),
        child: TextField(
          controller: controller,
          cursorColor: Colors.grey,
          style: TextStyle(color: Colors.black, fontFamily: 'SatoshiMedium'),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter $labelText",
            hintStyle: TextStyle(
              height: 1.6,
              fontSize: 13,
              color: Color(0xffABABAB),
              fontFamily: 'SatoshiMedium',
            ),
          ),
        ),
      );
    }


    void receiverAddressBottomSheet(BuildContext context)
    {
      var mQuery = MediaQuery.of(context);

      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context)
          {
            return Container(
              width: double.infinity,
              height: mQuery.size.height*0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mQuery.size.height*0.035,),
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height*0.055,
                    margin: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width*0.045
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: TextField(
                      controller: receiverSearchController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          hintText: "Search for your location/society/apartment",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'SatoshiMedium'
                          ),
                          prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey,),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.023,),
                  Padding(
                    padding: EdgeInsets.only(
                        left: mQuery.size.width*0.045
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/transport_images/target.png",
                          color: Color(0xff6945dd),
                          width: mQuery.size.width*0.055,),
                        SizedBox(width: mQuery.size.width*0.023,),
                        Text("Use Current location",style: TextStyle(
                            color: Color(0xff6945dd),
                            fontFamily: 'SatoshiBold'
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.023,),
                  Divider(
                    color: Color(0xfff2f2f2),
                    thickness: 9,
                  ),
                  SizedBox(height: mQuery.size.height*0.045,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("powered by ",style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'SatoshiMedium',
                            color: Colors.grey
                        ),),
                        SizedBox(width: mQuery.size.width*0.005,),
                        Image.network("https://cdn-icons-png.flaticon"
                            ".com/512/5968/5968863.png",width: mQuery.size
                            .width*0.13,)
                      ],
                    ),
                  )
                ],
              ),
            );
          });


  }


    void pickUpAddressBottomSheet(BuildContext context)
    {
      var mQuery = MediaQuery.of(context);

      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context)
          {
            return Container(
              width: double.infinity,
              height: mQuery.size.height*0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mQuery.size.height*0.035,),
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height*0.055,
                    margin: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width*0.045
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: TextField(
                      controller: pickUpSearchController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          hintText: "Search for your location/society/apartment",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'SatoshiMedium'
                          ),
                          prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey,),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.023,),
                  Padding(
                    padding: EdgeInsets.only(
                        left: mQuery.size.width*0.045
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/transport_images/target.png",
                          color: Color(0xff6945dd),
                          width: mQuery.size.width*0.055,),
                        SizedBox(width: mQuery.size.width*0.023,),
                        Text("Use Current location",style: TextStyle(
                            color: Color(0xff6945dd),
                            fontFamily: 'SatoshiBold'
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.023,),
                  Divider(
                    color: Color(0xfff2f2f2),
                    thickness: 9,
                  ),
                  SizedBox(height: mQuery.size.height*0.045,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("powered by ",style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'SatoshiMedium',
                            color: Colors.grey
                        ),),
                        SizedBox(width: mQuery.size.width*0.005,),
                        Image.network("https://cdn-icons-png.flaticon"
                            ".com/512/5968/5968863.png",width: mQuery.size
                            .width*0.13,)
                      ],
                    ),
                  )
                ],
              ),
            );
          });


    }

  }
  
  
