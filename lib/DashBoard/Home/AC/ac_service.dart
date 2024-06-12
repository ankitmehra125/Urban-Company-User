import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usc_project/DashBoard/Home/home_page.dart';
import 'package:usc_project/DashBoard/Home/powerSaverAc.dart';

import 'components/acServiceAndRepairContent.dart';
import 'components/fanRepairContent.dart';
import 'components/inverterContent.dart';
import 'components/refrigeratorRepairContent.dart';
import 'components/wiringContent.dart';

var totalQar = 150;

Map<String, dynamic> serviceDetails = {
  'imagePath': "assets/images/dashboard_images/home_images/acS.png",
  'serviceName': "AC Service and Repair",
  'rating': 4.84,
  'bookingCount': "3.7 M bookings"
};

List<Map<String, String>> dynamicDataList = [
  {
    'icon': "assets/images/dashboard_images/home_images/purpleIcon.svg",
    'text1': "Save 15% on your booking",
    'text2': "Get Plus now",
  },
  {
    'icon': "assets/images/dashboard_images/home_images/greenIcon.svg",
    'text1': "CRED cashback up to",
    'text2': "Cashback up to QAR500 via",
  },
  // Add more items as needed
];

Map<String, dynamic> serviceDetails2 = {
  'service1Name': "Power Saver AC Service",
  'service1Desc': "Switch box installation",
  'service1Rating': 4.84,
  'service1Reviews': "14k reviews",
  'service1StartPrice': "Starts at QAR 90"
};

Map<String, dynamic> serviceDetails3 = {
  'service1Name': "Anti-rust deep clean \nAC Service",
  'service1Desc': "Switch box installation",
  'service1Rating': 4.84,
  'service1Reviews': "14k reviews",
  'service1StartPrice': "Starts at QAR 90"
};

var value = 0;
var value2 = 0;

class AcService extends StatefulWidget {
  const AcService({Key? key}) : super(key: key);

  @override
  State<AcService> createState() => _AcServiceState();
}

class _AcServiceState extends State<AcService> {
  // Sample map containing dynamic values



  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context)
          {
            if(services == "acRepair")
            {
              return acServiceAndRepairContent(context);
            }
            else if(services == "refrigeratorRepair")
            {
              return  refrigeratorRepairContent(context);
            }
            else if(services == "FanRepair")
            {
              return fanRepairContent(context);
            }
            else if(services == "Wiring")
            {
              return wiringContent(context);
            }
            else if(services == "inverter")
            {
              return inverterContent(context);
            }
            else {
              return Container();
            }
          },
        )
    );
  }
}
