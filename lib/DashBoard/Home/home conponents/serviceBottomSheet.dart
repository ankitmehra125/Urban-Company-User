import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../AC/ac_service.dart';
import '../home_page.dart';
import 'electricianBottomSheet.dart';

void serviceBottomSheet(BuildContext context)
{
  var mQuery = MediaQuery.of(context);
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context)
      {
        return Container(
          width: double.infinity,
          height: mQuery.size.height*0.5,
          padding: EdgeInsets.symmetric(
              horizontal: mQuery.size.width*0.045
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22)
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mQuery.size.height*0.032,),
              Text("Electrician",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'SatoshiBold'
              ),),
              SizedBox(height: mQuery.size.height*0.032,),
              Text("Appliance Repair",style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'SatoshiMedium'
              ),),
              SizedBox(height: mQuery.size.height*0.026,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: ()
                        {
                          services = "acRepair";
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return AcService();
                          }));
                        },
                        child: Container(
                          width: mQuery.size.width*0.25,
                          height: mQuery.size.height*0.09,
                          decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Image.asset
                              ("assets/images/dashboard_images/appliances_images/acIcon.png",
                              height: mQuery.size.height*0.058,),
                          ),
                        ),
                      ),
                      SizedBox(height: mQuery.size.height*0.005,),
                      Text("AC Repair &",style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium',
                          fontSize: 10
                      ),),
                      Text("Service",style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium',
                          fontSize: 10
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: ()
                        {
                          services = "refrigeratorRepair";
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return AcService();
                          }));
                        },
                        child: Container(
                          width: mQuery.size.width*0.25,
                          height: mQuery.size.height*0.09,
                          decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Image.asset
                              ("assets/images/dashboard_images/appliances_images/refrigeratorIcon.png",
                              height: mQuery.size.height*0.055,),
                          ),
                        ),
                      ),
                      SizedBox(height: mQuery.size.height*0.005,),
                      Text("Refrigerator",style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium',
                          fontSize: 10
                      ),),
                      Text("Repair",style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium',
                          fontSize: 10
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: ()
                        {
                          services = "FanRepair";
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return AcService();
                          }));
                        },
                        child: Container(
                          width: mQuery.size.width*0.25,
                          height: mQuery.size.height*0.09,
                          decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: SvgPicture.asset
                              ("assets/images/dashboard_images/home_images/fan.svg",color: Color(0xff649df3),height: mQuery.size.height*0.06),
                          ),
                        ),
                      ),
                      SizedBox(height: mQuery.size.height*0.005,),
                      Text("Fan",style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium',
                          fontSize: 10
                      ),),
                      Text("Repair",style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium',
                          fontSize: 10
                      ),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: mQuery.size.height*0.023,),
              Column(
                children: [
                  GestureDetector(
                    onTap: ()
                    {
                      electricianBottomSheet(context);
                    },
                    child: Container(
                      width: mQuery.size.width*0.25,
                      height: mQuery.size.height*0.09,
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: SvgPicture.asset
                          ("assets/images/dashboard_images/home_images"
                            "/electrician.svg",height: mQuery.size.height*0.06),
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.005,),
                  Text("Electrician",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SatoshiMedium',
                      fontSize: 10
                  ),),
                ],
              ),
            ],
          ),
        );
      }
  );
}