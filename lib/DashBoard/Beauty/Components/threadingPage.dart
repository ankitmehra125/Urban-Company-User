import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ThreadingPage extends StatefulWidget {
  const ThreadingPage({super.key});

  @override
  State<ThreadingPage> createState() => _ThreadingPageState();
}

class _ThreadingPageState extends State<ThreadingPage> {
  final Map<String, dynamic> waxingData = {
    'title': 'Threading',
    'services': [
      {
        'name': 'Threading',
        'rating': 4.83,
        'reviews': '37.3k Reviews',
        'price': 'Starts at ₹29',
        'description': 'Desired eyebrow shape with good\nquality thread',
      },
      {
        'name': 'Full face threading',
        'rating': 4.81,
        'reviews': '10k Reviews',
        'price': '₹149',
        'description': 'Desired eyebrow shape with good\nquality thread',
      }
    ],
    'addButtonText': 'Add',
    'viewDetailsText': 'View Details',
  };

  @override
  Widget build(BuildContext context) {
    return waxing(context);
  }

  Widget waxing(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            waxingData['title'],
            style: TextStyle(
              fontFamily: 'SatoshiBold',
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: mQuery.size.height * 0.032),
          ...waxingData['services'].map<Widget>((service) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          service['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SatoshiBold',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((8)),
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width * 0.045,
                        vertical: mQuery.size.height * 0.004,
                      ),
                      child: Center(
                        child: Text(
                          waxingData['addButtonText'],
                          style: TextStyle(
                            color: Color(0xff7F00FF),
                            fontFamily: 'SatoshiBold',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: mQuery.size.height * 0.01),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: service['rating'],
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
                    SizedBox(width: mQuery.size.width * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${service['rating']} (${service['reviews']})",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                            fontFamily: 'SatoshiMedium',
                          ),
                        ),
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
                SizedBox(height: mQuery.size.height * 0.01),
                Text(
                  service['price'],
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SatoshiBold',
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: mQuery.size.height * 0.016),
                Container(
                  width: double.infinity,
                  child: DottedLine(
                    dashColor: Colors.black12,
                  ),
                ),
                SizedBox(height: mQuery.size.height * 0.01),
                Text(
                  service['description'],
                  style: TextStyle(
                    fontFamily: 'SatoshiMedium',
                    color: Colors.black54,
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: mQuery.size.height * 0.023),
                Text(
                  waxingData['viewDetailsText'],
                  style: TextStyle(
                    color: Color(0xff7F00FF),
                    fontFamily: 'SatoshiBold',
                  ),
                ),
                SizedBox(height: mQuery.size.height * 0.023),
                Divider(thickness: 0.8, color: Colors.black12),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
