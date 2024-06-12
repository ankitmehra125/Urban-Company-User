import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usc_project/DashBoard/Home/powerSaverAc.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  var value = 0;
  bool isCheck = false;

  Map<String, dynamic> switchBoxData = {
    "title": "Switch box installation \n(15+ amp)",
    "price": "QAR239",
  };

  Map<String, String> paymentSummaryData = {
    "itemTotal": "QAR239",
    "taxesAndFee": "QAR39",
    "visitationFee": "QAR79",
  };

  int selectedIndex = -1;

  void selectContainer(int index) {
    setState(() {
      selectedIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {

    // Compute the Total value based on the sum of itemTotal, taxesAndFee, and visitationFee
    String totalValue = (int.parse(paymentSummaryData["itemTotal"]!.replaceAll("QAR", "")) +
        int.parse(paymentSummaryData["taxesAndFee"]!.replaceAll("QAR", "")) +
        int.parse(paymentSummaryData["visitationFee"]!.replaceAll("QAR", ""))).toString();

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
                    Row(
                      children: [
                        GestureDetector(
                            onTap : (){
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg")
                        ),
                        SizedBox(width: mQuery.size.width*0.032,),
                        Text("Summary",style: TextStyle(
                            fontFamily: 'SatoshiBold',
                            fontSize: 24,
                            color: Colors.black
                        ),)
                      ],
                    ),
                    SizedBox(height: mQuery.size.height*0.023,),
                    Row(
                      children: [
                        Text(
                          switchBoxData["title"],
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SatoshiMedium'
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          width: mQuery.size.width * 0.23,
                          height: mQuery.size.height * 0.05,
                          padding: EdgeInsets.symmetric(
                              horizontal: mQuery.size.width * 0.016
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffc3c3c3),
                              border: Border.all(
                                  color: Colors.black
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (value != 0) value--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: mQuery.size.height * 0.023,
                                ),
                              ),
                              Text(
                                "$value",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontFamily: 'SatoshiBold'
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    value++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: mQuery.size.height * 0.023,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: mQuery.size.width * 0.023),
                        Text(
                          switchBoxData["price"],
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontFamily: 'SatoshiBold'
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.032,),
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Frequently added together",style: TextStyle(
                      color: Color(0xff161616),
                      fontSize: 20,
                      fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),
          
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          yourDataList.length,
                              (index) => Container(
                            width: mQuery.size.width * 0.34,
                            height: mQuery.size.height * 0.37,
                            margin: EdgeInsets.only(
                              right: mQuery.size.width*0.032,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffe5e5e5)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: mQuery.size.height * 0.16,
                                  child: Image.network(
                                    yourDataList[index]['imageUrl'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(height: mQuery.size.height * 0.016),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: mQuery.size.width * 0.023,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        yourDataList[index]['title'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'SatoshiBold',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: mQuery.size.height*0.01,),
                                      Text(
                                        '₹${yourDataList[index]['price']}',
                                        style: TextStyle(
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: mQuery.size.height * 0.023),
                                Center(
                                  child: Container(
                                    width: mQuery.size.width * 0.2,
                                    height: mQuery.size.height * 0.055,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: Color(0xffe8e8e8)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                          color: Color(0xff6c43df),
                                          fontFamily: 'SatoshiBold',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.032,),
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.023,),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Service Preferences",style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff161616),
                      fontFamily: 'SatoshiBold'
                    ),),
                    Row(
                      children: [
                        Checkbox(
                          value: isCheck,
                          checkColor: Colors.white,
                          activeColor: Colors.black,
                          onChanged: (value)
                          {
                            setState(() {
                              isCheck = value!;
                            });
                          },
                        ),
                        Text("Avoid calling before reaching the location",style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'SatoshiMedium',
                          color: Colors.black
                        ),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.023,),
          
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.023,),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.045,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Summary",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff161616),
                        fontFamily: 'SatoshiBold',
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                    Row(
                      children: [
                        Text(
                          "Item Total",
                          style: TextStyle(
                            color: Color(0xff161616),
                            fontFamily: 'SatoshiMedium',
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          paymentSummaryData["itemTotal"]!,
                          style: TextStyle(
                            fontFamily: 'SatoshiBold',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      children: [
                        Text(
                          "Taxes and Fee",
                          style: TextStyle(
                            color: Color(0xff161616),
                            fontFamily: 'SatoshiMedium',
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          paymentSummaryData["taxesAndFee"]!,
                          style: TextStyle(
                            fontFamily: 'SatoshiBold',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      children: [
                        Text(
                          "Visitation Fee",
                          style: TextStyle(
                            color: Color(0xff161616),
                            fontFamily: 'SatoshiMedium',
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          paymentSummaryData["visitationFee"]!,
                          style: TextStyle(
                            fontFamily: 'SatoshiBold',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: Color(0xffEDEDED),),
              SizedBox(height: mQuery.size.height*0.023,),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.045,
                ),
                child: Row(
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Color(0xff161616),
                        fontFamily: 'SatoshiBold',
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "QAR$totalValue",
                      style: TextStyle(
                        fontFamily: 'SatoshiBold',
                        color: Colors.black,
                      ),
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

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cancellation & reschedule policy",style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SatoshiBold',
                      color: Color(0xff161616)
                    ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text("Free cancellations/reschedule if done more that 3hrs before the service or if a professional isn’t assigned. A fee will be charged otherwise.",style: TextStyle(
                      color: Colors.black,
                      fontSize: 11
                    ),
                    ),
                    SizedBox(height: mQuery.size.height*0.02,),
                    Text("Learn more",style: TextStyle(
                      color: Color(0xff161616),
                      fontFamily: 'SatoshiBold',
                      decoration: TextDecoration.underline
                    ),)
                  ],
                ),
              ),

              SizedBox(height: mQuery.size.height*0.023,),
              Divider(
                thickness: 9,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: mQuery.size.height*0.023,),
              
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add a trip to thank the professional",style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff161616),
                      fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return GestureDetector(
                          onTap: () {
                            selectContainer(index);
                          },
                          child: Container(
                            width: mQuery.size.width * 0.2,
                            height: mQuery.size.height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: index == selectedIndex ? Colors.black : Color(0xffBFBFBF),
                              ),
                              color: index == selectedIndex ? Colors.black : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "QAR ${(index + 1) * 10}",
                                style: TextStyle(
                                  fontFamily: 'SatoshiMedium',
                                  color: index == selectedIndex ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),


                    SizedBox(height: mQuery.size.height * 0.023),
                    GestureDetector(
                      onTap: () {
                        selectContainer(-1); // Deselect when tapping "Custom"
                      },
                      child: Container(
                        width: mQuery.size.width * 0.2,
                        height: mQuery.size.height * 0.045,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Color(0xffBFBFBF),
                          ),
                          color: selectedIndex == -1 ? Colors.black : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            "Custom",
                            style: TextStyle(
                              fontFamily: 'SatoshiMedium',
                              color: selectedIndex == -1 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text("100% of the tip goes to the professional.",style: TextStyle(
                      color: Color(0xff757575),
                      fontSize: 8,
                      fontFamily: 'SatoshiMedium'
                    ),)
                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.032,),
              Container(
                width: double.infinity,
                height: mQuery.size.height*0.065,
                margin: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.045
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black
                ),
                child: Center(
                  child: Text("Add Address and slot",style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'SatoshiBold'
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
