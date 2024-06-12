import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usc_project/DashBoard/Home/home_page.dart';

bool isHome = false;
bool isOther = false;

Map<String, dynamic> addressDetails = {
  "type": "Home",
  "address": "Plot no.209, Kavuri Hills, Madhapur, \nTelangana 500033",
  "phone": "+91234567890",
};

void addressBottomSheet(BuildContext context, Map<String, dynamic> addressDetails) {
  var mQuery = MediaQuery.of(context);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              width: double.infinity,
              height: mQuery.size.height * 0.45,
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mQuery.size.height * 0.07),
                  Text(
                    "Saved address",
                    style: TextStyle(fontSize: 18, fontFamily: 'SatoshiBold', color: Color(0xff161616)),
                  ),
                  SizedBox(height: mQuery.size.height * 0.023),
                  Row(
                    children: [
                      Icon(Icons.add, color: Color(0xff283891)),
                      SizedBox(width: mQuery.size.width * 0.023),
                      Text(
                        "Add new address",
                        style: TextStyle(fontSize: 15, fontFamily: 'SatoshiMedium', color: Color(0xff283891)),
                      ),
                      SizedBox(height: mQuery.size.height * 0.023),
                      Divider(
                        color: Color(0xffEBEBEB),
                      ),
                    ],
                  ),
                  SizedBox(height: mQuery.size.height * 0.023),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isHome = true;
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: mQuery.size.width * 0.065,
                          height: mQuery.size.height * 0.07,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isHome ? Colors.black : Colors.transparent,
                            border: Border.all(color: isHome ? Colors.transparent : Colors.black),
                          ),
                        ),
                        SizedBox(width: mQuery.size.width * 0.023),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              addressDetails["type"], // Access type dynamically from the map
                              style: TextStyle(fontSize: 16, color: Color(0xff161616), fontFamily: 'SatoshiBold'),
                            ),
                            Text(
                              addressDetails["address"], // Access address dynamically from the map
                              style: TextStyle(color: Color(0xff757575), fontFamily: 'SatoshiMedium'),
                            ),
                            Text(
                              addressDetails["phone"], // Access phone dynamically from the map
                              style: TextStyle(color: Color(0xff757575), fontFamily: 'SatoshiMedium'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height * 0.065,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        "Proceed",
                        style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'SatoshiBold'),
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.023)
                ],
              ),
            );
          }
      );
    },
  );
}

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController houseNoController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController searchController = TextEditingController();



  final Map<String, String> locationDetails = {
    'address': 'Madhapur, Hyderabad',
    'locality': 'Jubilee Hills',
    'postalCode': '500033',
    'phoneNumber': '+91234567890',
  };

  int _selectedDateIndex = -1;
  int _selectedTimeIndex = -1;



  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // WE have to remove this GestureDetecor , it is for
            // testing only
            GestureDetector(
              onTap: ()
              {
                homeBottomSheet(context);
              },
              child: Container(
                width: double.infinity,
                height: mQuery.size.height*1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/dashboard_images/home_images/mapBackground.jpg")
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(child: SizedBox()),
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height*0.62,
                      padding: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width*0.045
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: mQuery.size.height*0.023,),
                          Row(
                            children: [
                              Text.rich(
                                  TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${locationDetails['address']}",style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'SatoshiBold',
                                            color: Color(0xff161616)
                                        ),
                                        ),
                                        TextSpan(
                                          text: "\n${locationDetails['locality']} \n${locationDetails['postalCode']}\n",style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'SatoshiBold',
                                            color: Colors.black54
                                        ),
                                        ),

                                        TextSpan(
                                          text: "Ph: ${locationDetails['phoneNumber']}",style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'SatoshiBold',
                                            color: Colors.black54
                                        ),
                                        )
                                      ]
                                  )
                              ),

                              Expanded(child: SizedBox()),
                              GestureDetector(
                                onTap: ()
                                {
                                  locationBottomSheet(context);
                                },
                                child: Container(
                                  width: mQuery.size.width*0.23,
                                  height: mQuery.size.height*0.045,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Center(
                                    child: Text("Change",style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SatoshiBold'
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(color: Color(0xffEBEBEB),),
                          SizedBox(height: mQuery.size.height* 0.023),
                          Container(
                            width: double.infinity,
                            height: mQuery.size.height*0.065,
                            padding: EdgeInsets.symmetric(
                                horizontal: mQuery.size.width*0.045
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffE3E3E3)
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: TextField(
                                controller: houseNoController,
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "House/Flat Number *",
                                  hintStyle: TextStyle(
                                      fontFamily: 'SatoshiBold',
                                      color: Color(0xffABABAB)
                                  ),)
                            ),
                          ),
                          SizedBox(height: mQuery.size.height*0.023,),
                          Container(
                            width: double.infinity,
                            height: mQuery.size.height*0.065,
                            padding: EdgeInsets.symmetric(
                                horizontal: mQuery.size.width*0.045
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffE3E3E3)
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: TextField(
                                controller: landmarkController,
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Landmark (Optional)",
                                  hintStyle: TextStyle(
                                      fontFamily: 'SatoshiBold',
                                      color: Color(0xffABABAB)
                                  ),)
                            ),
                          ),

                          SizedBox(height: mQuery.size.height*0.023,),
                          Text("Save as",style: TextStyle(
                              color: Color(0xff757575),
                              fontFamily: 'SatoshiBold'
                          ),),
                          SizedBox(height: mQuery.size.height*0.016,),

                          Row(
                            children: [
                              GestureDetector(
                                onTap : ()
                                {
                                  setState(() {
                                    isHome = true;
                                    isOther = false;
                                    addressBottomSheet(context,addressDetails);
                                  });
                                },
                                child: Container(
                                  width: mQuery.size.width*0.2,
                                  height: mQuery.size.height*0.045,
                                  decoration: BoxDecoration(
                                      color: isHome ? Colors.black : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: isHome ? Colors.transparent : Color(0xffE3E3E3)
                                      )
                                  ),
                                  child: Center(
                                    child: Text("Home",style: TextStyle(
                                        fontFamily: 'SatoshiBold',
                                        color: isHome ? Colors.white : Colors.black
                                    ),),
                                  ),
                                ),
                              ),
                              SizedBox(width: mQuery.size.width*0.032,),
                              GestureDetector(
                                onTap: ()
                                {
                                  setState(() {
                                    isOther = true;
                                    isHome = false;
                                  });
                                },
                                child: Container(
                                  width: mQuery.size.width*0.2,
                                  height: mQuery.size.height*0.045,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: isOther ? Colors.black : Colors.transparent,
                                      border: Border.all(
                                          color: isOther ? Colors.transparent : Color(0xffE3E3E3)
                                      )
                                  ),
                                  child: Center(
                                    child: Text("Other",style: TextStyle(
                                        fontFamily: 'SatoshiBold',
                                        color: isOther ? Colors.white : Colors.black
                                    ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                            width: double.infinity,
                            height: mQuery.size.height*0.065,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffD8D8D8)
                            ),
                            child: Center(
                              child: Text("Save and Proceed to slots",style: TextStyle(
                                  color: Color(0xff858585),
                                  fontFamily: 'SatoshiBold'
                              ),),
                            ),
                          ),
                          SizedBox(height: mQuery.size.height*0.023,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void locationBottomSheet(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context)
        {
          return Container(
            width: double.infinity,
            height: mQuery.size.height*0.82,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)
                )
            ),
            child: Column(
              children: [
                SizedBox(height: mQuery.size.height*0.045,),

                Container(
                  width: double.infinity,
                  height: mQuery.size.height*0.05,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: mQuery.size.width*0.045
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: mQuery.size.width*0.023
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffededed),
                      ),
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: TextField(
                    controller: searchController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        border: InputBorder.none,
                        hintText: "Search for your location/society/apartment",
                        hintStyle: TextStyle(
                            height: 1.4,
                            fontFamily: 'SatoshiMedium',
                            color: Colors.black54
                        )
                    ),
                  ),
                ),
                SizedBox(height: mQuery.size.height*0.045,),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mQuery.size.width*0.045
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/dashboard_images/home_images/target.svg",
                        color: Color(0xff684bc2),
                        width: mQuery.size.width*0.07,),

                      SizedBox(width: mQuery.size.width*0.032,),
                      Text("Use current location",style: TextStyle(
                          color: Color(0xff684bc2),
                          fontFamily: 'SatoshiBold'
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: mQuery.size.height*0.032,),
                Divider(
                  color: Color(0xfff5f5f5),
                  thickness: 9,
                ),

                SizedBox(height: mQuery.size.height*0.1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("powered by",style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'SatoshiMedium',
                        color: Colors.grey
                    ),),
                    SizedBox(width: mQuery.size.width*0.023,),
                    SvgPicture.asset("assets/images/dashboard_images/home_images/google.svg",
                      width: mQuery.size.height*0.07,)
                  ],
                )
              ],
            ),
          );
        }
    );
  }



  void homeBottomSheet(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder: (context)
        {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  width: double.infinity,
                  height: mQuery.size.height*0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: mQuery.size.height*0.023,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mQuery.size.width*0.045
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/dashboard_images/home_images/homeIcon.png",
                              width: mQuery.size.width*0.047,
                            ),
                            SizedBox(width: mQuery.size.width*0.032,),
                            Text("Home",style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'SatoshiBold'
                            ),),
                            Text(" Ss, 72, General, Mahadev Singh Road...",style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontFamily: 'SatoshiMedium'
                            ),),
                            Expanded(child: SizedBox()),
                            Icon(CupertinoIcons.right_chevron)
                          ],
                        ),
                      ),
                      SizedBox(height: mQuery.size.height*0.023,),
                      Divider(color: Colors.black54,),
                      SizedBox(height: mQuery.size.height*0.023,),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mQuery.size.width*0.045
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("When should the professional arrive?",style: TextStyle(
                                color: Color(0xff161616),
                                fontFamily: 'SatoshiBold',
                                fontSize: 16
                            ),),
                            SizedBox(height: mQuery.size.height*0.01,),
                            Text("Your service will take approx. 45 mins",style: TextStyle(
                              color: Color(0xff757575),
                              fontFamily: 'SatoshiMedium',
                            ),),
                            SizedBox(height: mQuery.size.height*0.032),

                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDateIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    width: mQuery.size.height * 0.1,
                                    height: mQuery.size.height * 0.11,
                                    decoration: BoxDecoration(
                                      color: _selectedDateIndex == 0 ? Colors.black : Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      border: _selectedDateIndex == 0
                                          ? null
                                          : Border.all(
                                        color: Color(0xffE3E3E3),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Sat",
                                          style: TextStyle(
                                            color: _selectedDateIndex == 0 ? Colors.white : Color(0xff757575),
                                            fontFamily: 'SatoshiBold',
                                          ),
                                        ),
                                        Text(
                                          "10",
                                          style: TextStyle(
                                            color: _selectedDateIndex == 0 ? Colors.white : Color(0xff161616),
                                            fontFamily: 'SatoshiBold',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: mQuery.size.width * 0.045),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDateIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    width: mQuery.size.height * 0.1,
                                    height: mQuery.size.height * 0.11,
                                    decoration: BoxDecoration(
                                      color: _selectedDateIndex == 1 ? Colors.black : Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      border: _selectedDateIndex == 1
                                          ? null
                                          : Border.all(
                                        color: Color(0xffE3E3E3),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Sun",
                                          style: TextStyle(
                                            color: _selectedDateIndex == 1 ? Colors.white : Color(0xff757575),
                                            fontFamily: 'SatoshiBold',
                                          ),
                                        ),
                                        Text(
                                          "11",
                                          style: TextStyle(
                                            color: _selectedDateIndex == 1 ? Colors.white : Color(0xff161616),
                                            fontFamily: 'SatoshiBold',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: mQuery.size.width * 0.045),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDateIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    width: mQuery.size.height * 0.1,
                                    height: mQuery.size.height * 0.11,
                                    decoration: BoxDecoration(
                                      color: _selectedDateIndex == 2 ? Colors.black : Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      border: _selectedDateIndex == 2
                                          ? null
                                          : Border.all(
                                        color: Color(0xffE3E3E3),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Mon",
                                          style: TextStyle(
                                            color: _selectedDateIndex == 2 ? Colors.white : Color(0xff757575),
                                            fontFamily: 'SatoshiBold',
                                          ),
                                        ),
                                        Text(
                                          "12",
                                          style: TextStyle(
                                            color: _selectedDateIndex == 2 ? Colors.white : Color(0xff161616),
                                            fontFamily: 'SatoshiBold',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: mQuery.size.height*0.032,),
                            Text("Select start time of service",style: TextStyle(
                                color: Color(0xff161616),
                                fontFamily: 'SatoshiBold',
                                fontSize: 16
                            ),),
                            SizedBox(height: mQuery.size.height*0.016),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTimeIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    width: mQuery.size.width * 0.28,
                                    height: mQuery.size.height * 0.065,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      color: _selectedTimeIndex == 0 ? Colors.black : Colors.transparent,
                                      border: _selectedTimeIndex == 0
                                          ? null
                                          : Border.all(
                                        color: Color(0xffE3E3E3),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "06:30 PM",
                                        style: TextStyle(
                                          color: _selectedTimeIndex == 0 ? Colors.white : Color(0xff161616),
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTimeIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    width: mQuery.size.width * 0.28,
                                    height: mQuery.size.height * 0.065,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      color: _selectedTimeIndex == 1 ? Colors.black : Colors.transparent,
                                      border: _selectedTimeIndex == 1
                                          ? null
                                          : Border.all(
                                        color: Color(0xffE3E3E3),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "07:30 PM",
                                        style: TextStyle(
                                          color: _selectedTimeIndex == 1 ? Colors.white : Color(0xff161616),
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTimeIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    width: mQuery.size.width * 0.28,
                                    height: mQuery.size.height * 0.065,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      color: _selectedTimeIndex == 2 ? Colors.black : Colors.transparent,
                                      border: _selectedTimeIndex == 2
                                          ? null
                                          : Border.all(
                                        color: Color(0xffE3E3E3),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "08:00 PM",
                                        style: TextStyle(
                                          color: _selectedTimeIndex == 2 ? Colors.white : Color(0xff161616),
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: ()
                        {
                           if(_selectedDateIndex == -1 || _selectedTimeIndex == -1)
                             {
                                return null;
                             }
                           else
                             {
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                 return HomePage();
                               }));
                             }
                        },
                        child: Container(
                          width: double.infinity,
                          height: mQuery.size.height*0.065,
                          margin: EdgeInsets.symmetric(
                              horizontal: mQuery.size.width*0.045
                          ),
                          decoration: BoxDecoration(
                              color: (_selectedDateIndex == -1 || _selectedTimeIndex == -1) ? Color(0xffD8D8D8) : Colors.black,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text("Proceed to checkout",style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'SatoshiBold',
                                color: (_selectedDateIndex == -1 || _selectedTimeIndex == -1) ? Color(0xff858585) : Colors.white
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(height: mQuery.size.height*0.023,)

                    ],
                  ),
                );
              }
          );
        }
    );
  }

}
