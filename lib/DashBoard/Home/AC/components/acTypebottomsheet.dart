import 'package:flutter/material.dart';

void acTypeBottomSheet(BuildContext context, Function(String) onTypeSelected) {
  var acType = "Split AC";

  var mQuery = MediaQuery.of(context);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: mQuery.size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mQuery.size.height * 0.04),
            Padding(
              padding: EdgeInsets.only(left: mQuery.size.width * 0.065),
              child: Text(
                "Choose Your AC Type",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'SatoshiBold',
                  color: Color(0xff0D7476),
                ),
              ),
            ),
            SizedBox(height: mQuery.size.height * 0.045),
            Padding(
              padding: EdgeInsets.only(
                left: mQuery.size.width * 0.07,
                right: mQuery.size.width * 0.045,
              ),
              child: GestureDetector(
                onTap: () {
                  onTypeSelected("Split AC");
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Row(
                  children: [
                    Text(
                      "Split AC",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff797979),
                        fontFamily: 'SatoshiMedium',
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Icon(Icons.arrow_forward_ios, color: Color(0xffE4E4E4)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
              child: Divider(color: Color(0xffDBDBDB)),
            ),
            SizedBox(height: mQuery.size.height * 0.023),
            Padding(
              padding: EdgeInsets.only(
                left: mQuery.size.width * 0.07,
                right: mQuery.size.width * 0.045,
              ),
              child: GestureDetector(
                onTap: () {
                  onTypeSelected("Window AC");
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Row(
                  children: [
                    Text(
                      "Window AC",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff797979),
                        fontFamily: 'SatoshiMedium',
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Icon(Icons.arrow_forward_ios, color: Color(0xffE4E4E4)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
              child: Divider(color: Color(0xffDBDBDB)),
            ),
            Expanded(child: SizedBox()),
            Container(
              width: double.infinity,
              height: mQuery.size.height * 0.065,
              margin: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.065),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  "Choose",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SatoshiBold',
                  ),
                ),
              ),
            ),
            SizedBox(height: mQuery.size.height * 0.023),
          ],
        ),
      );
    },
  );
}