import 'package:flutter/material.dart';

import '../summary_page.dart';

void electricianBottomSheet(BuildContext context)
{
  var mQuery = MediaQuery.of(context);

  showModalBottomSheet(
      context: context,
      builder: (BuildContext context)
      {
        return Container(
          width: double.infinity,
          height: mQuery.size.height*0.36,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mQuery.size.height*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.06
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Choose Your AC Type",style: TextStyle(
                        color: Color(0xff0D7476),
                        fontSize: 16,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.032,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Home Appliances",style: TextStyle(
                            fontFamily: 'SatoshiMedium',
                            color: Color(0xff797979)
                        ),),
                        Icon(Icons.arrow_forward_ios,
                          color: Color(0xffE4E4E4),
                          size: mQuery.size.height*0.023,)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: mQuery.size.height*0.01,),
              Divider(color: Color(0xffDBDBDB),),
              SizedBox(height: mQuery.size.height*0.016,),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Wiring",style: TextStyle(
                            fontFamily: 'SatoshiMedium',
                            color: Color(0xff797979)
                        ),),
                        Icon(Icons.arrow_forward_ios,
                          color: Color(0xffE4E4E4),
                          size: mQuery.size.height*0.023,)
                      ],
                    )
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              GestureDetector(
                onTap: ()
                {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return SummaryPage();
                  }));
                },
                child: Container(
                  width: double.infinity,
                  height: mQuery.size.height*0.045,
                  margin: EdgeInsets.symmetric(
                      horizontal: mQuery.size.width*0.045
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black
                  ),
                  child: Center(
                    child: Text("Choose",style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'SatoshiBold'
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