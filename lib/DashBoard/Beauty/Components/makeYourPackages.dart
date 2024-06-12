import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MakeYourPackagesPage extends StatefulWidget {
  const MakeYourPackagesPage({super.key});

  @override
  State<MakeYourPackagesPage> createState() => _MakeYourPackagesPageState();
}

class _MakeYourPackagesPageState extends State<MakeYourPackagesPage> {
  final Map<String, dynamic> packageData = {
    'title': 'Make your packages',
    'subtitle': 'PACKAGE',
    'imagePath': 'assets/images/beauty_images/packageImage.png',
    'mainPackageTitle': 'Make your own \npackage',
    'buttonText': 'Add',
    'rating': 4.83,
    'reviews': '92k Reviews',
    'price': '₹1079',
    'oldPrice': '₹1,163',
    'duration': '2 hr 25 mins',
    'details': [
      {
        'title': 'Low-Control Threading:',
        'description': 'Eyebrow threading, Upper lip \n    threading',
      },
      {
        'title': 'Waxing:',
        'description': 'Honey full arms + underarms, Full legs honey',
      },
      {
        'title': 'Facial:',
        'description': 'Papaya nourishing cleanup',
      },
      {
        'title': 'Pediucure:',
        'description': 'Cut, file & polish - feet',
      },
      {
        'title': 'Manicure:',
        'description': 'Cut, file & polish - hands',
      },
    ],
    'editButtonText': 'Edit your package',
  };

  @override
  Widget build(BuildContext context) {
    return makeYourPackages(context);
  }

  Widget makeYourPackages(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: mQuery.size.width * 0.045
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(packageData['title'], style: TextStyle(
              fontFamily: 'SatoshiBold',
              color: Colors.black,
              fontSize: 20
          ),),
          SizedBox(height: mQuery.size.height * 0.032,),
          Row(
            children: [
              Image.asset(packageData['imagePath'],
                height: mQuery.size.height * 0.023,),
              SizedBox(width: mQuery.size.width * 0.023,),
              Text(packageData['subtitle'], style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SatoshiMedium',
                  color: Color(0xff2BBA60)
              ),)
            ],
          ),
          SizedBox(height: mQuery.size.height * 0.016),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(packageData['mainPackageTitle'], style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SatoshiBold',
                  ),),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((8)),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    )
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: mQuery.size.width * 0.045,
                    vertical: mQuery.size.height * 0.004
                ),
                child: Center(
                  child: Text(packageData['buttonText'], style: TextStyle(
                      color: Color(0xff7F00FF),
                      fontFamily: 'SatoshiBold'
                  ),),
                ),
              )
            ],
          ),
          SizedBox(height: mQuery.size.height * 0.01,),
          Row(
            children: [
              RatingBar.builder(
                initialRating: packageData['rating'],
                minRating: 1,
                direction: Axis.horizontal,
                itemSize: mQuery.size.height * 0.023,
                allowHalfRating: true,
                itemCount: 1,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(width: mQuery.size.width * 0.01,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${packageData['rating']} (${packageData['reviews']})", style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      fontFamily: 'SatoshiMedium'
                  ),),
                  Container(
                    width: mQuery.size.width * 0.3,
                    child: DottedLine(
                      dashColor: Colors.black54,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: mQuery.size.height * 0.01,),
          Row(
            children: [
              Text(packageData['price'], style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SatoshiBold',
                  fontSize: 12
              ),),
              SizedBox(width: mQuery.size.width * 0.032,),
              Text(packageData['oldPrice'], style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black54,
                  fontFamily: 'SatoshiMedium',
                  fontSize: 12
              ),),
              SizedBox(width: mQuery.size.width * 0.032,),
              Text("• ${packageData['duration']}", style: TextStyle(
                  fontFamily: 'SatoshiMedium',
                  color: Colors.black54,
                  fontSize: 12
              ),)
            ],
          ),
          SizedBox(height: mQuery.size.height * 0.016,),
          Container(
            width: double.infinity,
            child: DottedLine(
              dashColor: Colors.black12,
            ),
          ),
          SizedBox(height: mQuery.size.height * 0.016,),
          ...packageData['details'].map<Widget>((detail) =>
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                          text: "•  ${detail['title']}", style: TextStyle(
                            fontFamily: 'SatoshiBold',
                            color: Colors.black,
                            fontSize: 12
                        ),
                        ),
                        TextSpan(
                          text: " ${detail['description']}", style:
                        TextStyle(
                            fontFamily: 'SatoshiMedium',
                            color: Colors.black54,
                            fontSize: 11
                        ),
                        )
                      ]
                  )
              )
          ).toList(),
          SizedBox(height: mQuery.size.height * 0.023,),
          Container(
            width: mQuery.size.width * 0.36,
            padding: EdgeInsets.symmetric(
                vertical: mQuery.size.height * 0.01
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((8)),
                border: Border.all(
                  color: Colors.grey.shade200,
                )
            ),
            child: Center(
              child: Text(packageData['editButtonText'], style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'SatoshiBold',
                  color: Colors.black
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
