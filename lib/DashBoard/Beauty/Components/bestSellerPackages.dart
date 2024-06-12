import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BestSellerPackagesPage extends StatefulWidget {
  const BestSellerPackagesPage({super.key});

  @override
  State<BestSellerPackagesPage> createState() => _BestSellerPackagesPageState();
}

class _BestSellerPackagesPageState extends State<BestSellerPackagesPage> {
  late var videoURL = "https://www.youtube.com/watch?v=UwI71cKFR6g";

  late YoutubePlayerController _controller;

  final List<Map<String, dynamic>> packages = [
    {
      "image": "assets/images/beauty_images/packageImage.png",
      "title": "Glow getter",
      "price": "₹669",
      "duration": "1 hr 20 mins",
      "rating": 4.83,
      "reviews": "92k",
      "details": [
        {
          "type": "Facial",
          "description": "Crave beauty hydrating banana facial"
        },
        {
          "type": "Threading",
          "description": "Eyebrow threading, Upper lip threading"
        }
      ]
    },
    {
      "image": "assets/images/beauty_images/packageImage.png",
      "title": "Wax & glow",
      "price": "₹519",
      "duration": "1 hr 10 mins",
      "rating": 4.83,
      "reviews": "92k",
      "details": [
        {
          "type": "Waxing",
          "description": "Honey full arms + underarms, Full legs honey"
        },
        {
          "type": "Threading",
          "description": "Eyebrow threading, Upper lip threading"
        }
      ]
    }
  ];

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL)!;

    _controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BestSellerPackages(context);
  }

  Widget BestSellerPackages(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mQuery.size.width * 0.045,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bestseller Packages",
            style: TextStyle(
              fontFamily: 'SatoshiBold',
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: mQuery.size.height * 0.032),
          for (var package in packages) ...[
            buildPackage(mQuery, package),
            SizedBox(height: mQuery.size.height * 0.023),
            Divider(thickness: 0.8, color: Colors.black12),
            SizedBox(height: mQuery.size.height * 0.023),
          ],
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPackage(MediaQueryData mQuery, Map<String, dynamic> package) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              package["image"],
              height: mQuery.size.height * 0.023,
            ),
            SizedBox(width: mQuery.size.width * 0.023),
            Text(
              "PACKAGE",
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'SatoshiMedium',
                color: Color(0xff2BBA60),
              ),
            ),
          ],
        ),
        SizedBox(height: mQuery.size.height * 0.016),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              package["title"],
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SatoshiBold',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
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
                  "Add",
                  style: TextStyle(
                    color: Color(0xff7F00FF),
                    fontFamily: 'SatoshiBold',
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: mQuery.size.height * 0.01),
        Row(
          children: [
            RatingBar.builder(
              initialRating: package["rating"],
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
                  "${package["rating"]} (${package["reviews"]} Reviews)",
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
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: mQuery.size.height * 0.01),
        Row(
          children: [
            Text(
              package["price"],
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SatoshiBold',
                fontSize: 12,
              ),
            ),
            SizedBox(width: mQuery.size.width * 0.032),
            Text(
              "• ${package["duration"]}",
              style: TextStyle(
                fontFamily: 'SatoshiMedium',
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: mQuery.size.height * 0.016),
        Container(
          width: double.infinity,
          child: DottedLine(
            dashColor: Colors.black12,
          ),
        ),
        SizedBox(height: mQuery.size.height * 0.016),
        for (var detail in package["details"]) ...[
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "• ${detail["type"]}:",
                  style: TextStyle(
                    fontFamily: 'SatoshiBold',
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: " ${detail["description"]}",
                  style: TextStyle(
                    fontFamily: 'SatoshiMedium',
                    color: Colors.black54,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
        SizedBox(height: mQuery.size.height * 0.023),
        Container(
          width: mQuery.size.width * 0.36,
          padding: EdgeInsets.symmetric(
            vertical: mQuery.size.height * 0.01,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),
          child: Center(
            child: Text(
              "Edit your package",
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'SatoshiBold',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
