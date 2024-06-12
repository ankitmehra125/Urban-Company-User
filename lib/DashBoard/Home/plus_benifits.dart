import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlusBenifits extends StatefulWidget {
  const PlusBenifits({super.key});

  @override
  State<PlusBenifits> createState() => _PlusBenifitsState();
}

class _PlusBenifitsState extends State<PlusBenifits> {

  Map<String, String> priceData = {
    'duration': "6 months",
    'price': "₹199",
    'originalPrice': "₹699",
  };

  Map<String, String> priceData2 = {
    'duration': "12 months",
    'price': "₹249",
    'originalPrice': "₹999",
  };

  Map<String, dynamic> userData = {
    'profileImageUrl': 'https://media.licdn.com/dms/image/C4D03AQHHSwZyheu1UQ/profile-displayphoto-shrink_200_200/0/1662703260529?e=2147483647&v=beta&t=RjJFfjnHyXLAJqNSWsI74WKhklQeBIOqsBcr1LmkaIc',
    'name': 'Narendra Modi',
    'memberSince': 'Oct 2020',
    'savingsAmount': 1559,
    'savingsType': 'in Plus savings',
    'additionalText': 'Fully satisfied... Saved 1200+ till now.. I will recommend this service app to my friends.',
  };

  Map<String, dynamic> userData2 = {
    'profileImageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmewiP7ofvgFL_81_mLKnk6v6ZEvaIKMl0aPRThQQ5Dg&s',
    'name': 'Apala Mishra',
    'memberSince': 'Jan 2020',
    'savingsAmount': 1375,
    'savingsType': 'in Plus savings',
    'additionalText': 'Strongly recommend getting their subscription - one of the best value for money subscriptions.',
  };

  bool showFullText = false;
  bool showExtraLine = false;

  bool isAnswerVisible = false;
  bool isAnswerVisible2 = false;
  bool isAnswerVisible3 = false;
  bool isAnswerVisible4 = false;
  bool isAnswerVisible5 = false;

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap : (){
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg")
                    ),
                    Center(
                      child: Image.asset("assets/images/dashboard_images/home_images/circleStar.png",
                       width: mQuery.size.width*0.32,),
                    ),
                    SizedBox(height: mQuery.size.height*0.032,),
                    Center(
                      child: Text("Unlock Plus benifits!",style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'SatoshiBold',
                        color: Colors.black,
                      ),),
                    ),
                    SizedBox(height: mQuery.size.height*0.023,),
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height*0.13,
                      padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width*0.045
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Color(0xffededed)
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/dashboard_images/home_images/discountIcon.svg",
                               width: mQuery.size.width*0.1,),
                              SizedBox(width: mQuery.size.width*0.032,),
                              Text("10% off on all categories",style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SatoshiMedium'
                              ),)
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/dashboard_images/home_images/discountIcon.svg",
                               width: mQuery.size.width*0.1,),
                              SizedBox(width: mQuery.size.width*0.032,),
                              Text("Try a new category & get 15% off",style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SatoshiMedium'
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height*0.023,),
          
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height * 0.08,
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffededed),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: priceData['duration'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'SatoshiBold',
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: " • ${priceData['price']} ",
                                  style: TextStyle(
                                    fontFamily: 'SatoshiMedium',
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "${priceData['originalPrice']} ",
                                  style: TextStyle(
                                    fontFamily: 'SatoshiMedium',
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                            width: mQuery.size.width * 0.2,
                            height: mQuery.size.height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffededed),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Color(0xff754edf),
                                  fontFamily: 'SatoshiBold',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height * 0.08,
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffededed),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: priceData2['duration'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'SatoshiBold',
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: " • ${priceData2['price']} ",
                                  style: TextStyle(
                                    fontFamily: 'SatoshiMedium',
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "${priceData2['originalPrice']} ",
                                  style: TextStyle(
                                    fontFamily: 'SatoshiMedium',
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                            width: mQuery.size.width * 0.2,
                            height: mQuery.size.height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffededed),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Color(0xff754edf),
                                  fontFamily: 'SatoshiBold',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
          
                    SizedBox(height: mQuery.size.height*0.032,),
                    Center(
                      child: Text("Maybe later",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold',
                        fontSize: 16
                      ),),
                    )
                  ],
                ),
              ),
            SizedBox(height: mQuery.size.height*0.032,),
          
            // Divider here
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.032,),
          
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("All Plus benifits",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),
                    SvgPicture.asset("assets/images/dashboard_images/home_images/discountIcon.svg",
                      width: mQuery.size.width*0.1,
                    ),
                    SizedBox(height: mQuery.size.height*0.016,),
                    Text("Get 10% off on all categories",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text("Enjoy 10% discount on all bookings in any \ncategory",style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'SatoshiMedium'
                    ),),

                    SizedBox(height: mQuery.size.height*0.032,),
                    SvgPicture.asset("assets/images/dashboard_images/home_images/discountIcon.svg",
                      width: mQuery.size.width*0.1,
                    ),
                    SizedBox(height: mQuery.size.height*0.016,),
                    Text("Try a new category & get 15% off",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text("Enjoy 15% discount on trying a category for the \n first time",style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'SatoshiMedium'
                    ),),


                  ],
                ),
              ),

              SizedBox(height: mQuery.size.height*0.032,),

              // Divider here
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.032,),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("100% money back guarantee",style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'SatoshiBold'
                        ),),
                        SizedBox(height: mQuery.size.height*0.01,),
                        Text('If you save less the \n membership price, we refund you \n the difference!',style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/images/dashboard_images/home_images/yes.svg",
                    width: mQuery.size.width*0.16,)
                  ],
                ),
              ),

              SizedBox(height: mQuery.size.height*0.032,),
              
              // Divider here
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.032,),
              
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("FAQs",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SatoshiBold',
                      fontSize: 20
                    ),),
                    SizedBox(height: mQuery.size.height*0.045),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Frequently asked question",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff222222),
                            fontFamily: 'SatoshiBold',
                          ),
                        ),
                        SizedBox(height: mQuery.size.height * 0.023),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAnswerVisible = !isAnswerVisible;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "How do I schedule a service appointment?",
                                    style: TextStyle(
                                      fontFamily: 'SatoshiBold',
                                      color: Colors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  isAnswerVisible ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                            // Conditionally show the answer based on the visibility state
                            if (isAnswerVisible)
                              Text(
                                "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontFamily: 'SatoshiRegular',
                                ),
                              ),
                          ],
                        ),
                        Divider(color: Colors.black,),

                        SizedBox(height: mQuery.size.height*0.01,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAnswerVisible2 = !isAnswerVisible2;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "What types of electronic appliances do you repair?",
                                    style: TextStyle(
                                      fontFamily: 'SatoshiBold',
                                      color: Colors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  isAnswerVisible2 ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                            // Conditionally show the answer based on the visibility state
                            if (isAnswerVisible2)
                              Text(
                                "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontFamily: 'SatoshiRegular',
                                ),
                              ),
                          ],
                        ),
                        Divider(color: Colors.black,),

                        SizedBox(height: mQuery.size.height*0.01,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAnswerVisible3 = !isAnswerVisible3;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Are your technicians certified and experienced?",
                                    style: TextStyle(
                                      fontFamily: 'SatoshiBold',
                                      color: Colors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  isAnswerVisible3 ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                            // Conditionally show the answer based on the visibility state
                            if (isAnswerVisible3)
                              Text(
                                "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontFamily: 'SatoshiRegular',
                                ),
                              ),
                          ],
                        ),
                        Divider(color: Colors.black,),

                        SizedBox(height: mQuery.size.height*0.01,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAnswerVisible4 = !isAnswerVisible4;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "How do I pay for the service?",
                                    style: TextStyle(
                                      fontFamily: 'SatoshiBold',
                                      color: Colors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  isAnswerVisible4 ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                            // Conditionally show the answer based on the visibility state
                            if (isAnswerVisible4)
                              Text(
                                "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontFamily: 'SatoshiRegular',
                                ),
                              ),
                          ],
                        ),
                        Divider(color: Colors.black,),

                        SizedBox(height: mQuery.size.height*0.01,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAnswerVisible5 = !isAnswerVisible5;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Can I track the status of my service appointment?",
                                    style: TextStyle(
                                      fontFamily: 'SatoshiBold',
                                      color: Colors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  isAnswerVisible5 ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                            // Conditionally show the answer based on the visibility state
                            if (isAnswerVisible5)
                              Text(
                                "You can schedule a service appointment easily through our mobile app or website. Simply choose your desired service, select a convenient date and time, and provide your contact information. Our team will confirm the appointment shortly.",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontFamily: 'SatoshiRegular',
                                ),
                              ),
                          ],
                        ),
                        Divider(color: Colors.black,),

                        SizedBox(height: mQuery.size.height*0.016,),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.032,),
              

              // Divider here
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.032,),
              
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hear from happy Plus members",style: TextStyle(
                      fontFamily: 'SatoshiBold',
                      color: Colors.black,
                      fontSize: 20
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),
                    // from map
                    Row(
                      children: [
                        Container(
                          width: mQuery.size.width * 0.14,
                          height: mQuery.size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Image.network(
                              userData['profileImageUrl'],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: mQuery.size.width * 0.023),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userData['name'],
                              style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Member since ${userData['memberSince']}",
                              style: TextStyle(
                                fontFamily: 'SatoshiMedium',
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/dashboard_images/home_images/circleStar.png",
                                  width: mQuery.size.width * 0.06,
                                ),
                                Text(
                                  "₹${userData['savingsAmount']}",
                                  style: TextStyle(
                                    fontFamily: 'SatoshiBold',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${userData['savingsType']}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontFamily: 'SatoshiMedium',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text(
                      userData['additionalText'],
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'SatoshiMedium',
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: mQuery.size.height*0.023,),
              Divider(color: Colors.black,),

              SizedBox(height: mQuery.size.height*0.032,),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // from map
                    Row(
                      children: [
                        Container(
                          width: mQuery.size.width * 0.14,
                          height: mQuery.size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Image.network(
                              userData2['profileImageUrl'],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: mQuery.size.width * 0.023),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userData2['name'],
                              style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Member since ${userData2['memberSince']}",
                              style: TextStyle(
                                fontFamily: 'SatoshiMedium',
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/dashboard_images/home_images/circleStar.png",
                                  width: mQuery.size.width * 0.06,
                                ),
                                Text(
                                  "₹${userData2['savingsAmount']}",
                                  style: TextStyle(
                                    fontFamily: 'SatoshiBold',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${userData2['savingsType']}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontFamily: 'SatoshiMedium',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text(
                      userData2['additionalText'],
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'SatoshiMedium',
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: mQuery.size.height*0.023,),
              Divider(color: Colors.black,),
              SizedBox(height: mQuery.size.height*0.023,),
              Container(
                width: double.infinity,
                height: mQuery.size.height*0.055,
                margin: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.26
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                child: Center(
                  child: Text("Load more reviews",style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SatoshiMedium'
                  ),),
                ),
              ),



              SizedBox(height: mQuery.size.height*0.023,)
            ],
          ),
        ),
      ),
    );
  }
}
