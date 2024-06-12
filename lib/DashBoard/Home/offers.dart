import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  TextEditingController searchController = TextEditingController();

  // Sample data - You should replace this with your actual data
  List<Map<String, dynamic>> offersList = [
    {"title": "Offer AC Service", "discount": "15%"},
    {"title": "Offer AC Service", "discount": "25%"},
    {"title": "Offer AC Service", "discount": "25%"},
  ];

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: mQuery.size.height * 0.025),
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
                Expanded(child: SizedBox()),
                Container(
                  width: mQuery.size.width * 0.75,
                  height: mQuery.size.height * 0.06,
                  padding: EdgeInsets.only(
                    right: mQuery.size.width*0.045
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE8E8E8)),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: TextField(
                    cursorColor: Colors.grey,
                    controller: searchController,
                    style: TextStyle(
                      fontFamily: 'SatoshiMedium'
                    ),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        height: 1.4,
                        fontFamily: 'SatoshiMedium',
                        color: Color(0xff818085)
                      ),
                      prefixIcon: Icon(CupertinoIcons.search,color: Color(0xff818085),),
                      border: InputBorder.none
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xfff4f4f4), // Placeholder color
              width: double.infinity,
              height: mQuery.size.height * 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                  child: Column(
                    children: [
                      SizedBox(height: mQuery.size.height * 0.023),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: offersList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            height: mQuery.size.height * 0.25,
                            margin: EdgeInsets.only(
                              bottom: mQuery.size.height*0.032
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xffEAF6EF), borderRadius: BorderRadius.circular(18)),
                            padding: EdgeInsets.only(left: mQuery.size.width * 0.045),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      offersList[index]["title"],
                                      style: TextStyle(
                                          color: Color(0xff33383F), fontSize: 16, fontFamily: 'SatoshiBold'),
                                    ),
                                    SizedBox(width: mQuery.size.width * 0.023),
                                    SvgPicture.asset("assets/images/dashboard_images/home_images/infoIcon.svg"),
                                  ],
                                ),
                                Text(
                                  "Get ${offersList[index]["discount"]}",
                                  style: TextStyle(
                                      fontSize: 62, color: Color(0xff1A1D1F), fontFamily: 'SatoshiBold'),
                                ),
                                Container(
                                  width: mQuery.size.width * 0.32,
                                  height: mQuery.size.height * 0.04,
                                  decoration: BoxDecoration(
                                      color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Grab Offer",
                                          style: TextStyle(color: Color(0xff6A9B7E), fontFamily: 'SatoshiMedium'),
                                        ),
                                        Icon(Icons.keyboard_arrow_right, color: Color(0xff6A9B7E)),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: mQuery.size.height * 0.032),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
